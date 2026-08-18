import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/services/persona_catalog.dart';
import 'package:pgd_physics/services/ai_providers.dart';
import 'package:pgd_physics/widgets/diagrams/chat_diagram_catalog.dart';

/// Client-side multi-provider BYOK engine with automatic fallback.
/// Tuned for low latency: short history, modest max tokens, tight timeouts.
class AiService {
  static const _perProviderTimeout = Duration(seconds: 28);
  static const _maxHistoryTurns = 10; // user+assistant pairs roughly
  static const _maxOutputTokens = 1024;

  static String _buildSystemPrompt({
    required String currentPage,
    String? courseTitle,
    String? moduleTitle,
    String? unitTitle,
    String? problemOrQuestion,
  }) {
    final nickname = StorageService.getNickname();
    final userGender = StorageService.getUserGender();
    final aiGender = StorageService.getAiGender();
    var personaId = StorageService.getAiPersonalityId();
    final lockedTry = PersonaCatalog.byId(personaId);
    if (lockedTry.isLocked && !StorageService.isPersonaUnlocked(personaId)) {
      personaId = 'patient_professor';
    }
    final persona = PersonaCatalog.byId(personaId);

    final genderLine = switch (aiGender) {
      'female' => 'Present yourself as female.',
      'male' => 'Present yourself as male.',
      _ => 'Present yourself in a gender-neutral way.',
    };

    // Always keep student gender in mind for natural, respectful personalization
    final userLine = switch (userGender) {
      'female' =>
        'The student is female. Use natural, respectful language consistent with that. '
            'Do not be awkward or over-emphasize gender; just personalize tone and examples when it helps.',
      'male' =>
        'The student is male. Use natural, respectful language consistent with that. '
            'Do not be awkward or over-emphasize gender; just personalize tone and examples when it helps.',
      _ =>
        'The student did not specify gender. Use neutral language. Address them as $nickname only.',
    };

    final buffer = StringBuffer();
    buffer.writeln('Your name is Nova (never “Nova AI”).');
    buffer.writeln(persona.systemFlavor);
    buffer.writeln(genderLine);
    buffer.writeln(userLine);
    buffer.writeln(
        'Always address the student as **$nickname**. Never invent a different name.');
    buffer.writeln('');
    buffer.writeln('=== RESPONSE STYLE (important) ===');
    buffer.writeln(
        '1) Default: give a concise, intelligent answer first — clear, correct, easy to read.');
    buffer.writeln(
        '2) After the core answer, offer a short soft prompt so $nickname can go deeper if they want, e.g.');
    buffer.writeln(
        '   “Want a step-by-step walkthrough?” / “Want an everyday analogy?” / “Want a quick practice check?”');
    buffer.writeln(
        '3) Do not dump a textbook chapter unless they ask to go deeper.');
    buffer.writeln(
        '4) Conversation mode: if $nickname is chatting, venting, greeting, or not asking a study question, '
        'reply as Nova in the chosen personality — warm and human. You may gently connect back to studying only when it feels natural, never pushy.');
    buffer.writeln(
        '5) Study mode: if they ask about physics, a lesson, a formula, or confusion on this page, teach with intuition first.');
    buffer.writeln(
        '6) Formatting: light Markdown only; prefer Unicode for powers/indices (x², H₂O, v₀). No raw junk markers.');
    buffer.writeln(
        '7) Diagrams: the app draws vector diagrams offline. When the student asks for a diagram/figure/sketch of a supported topic, '
        'include exactly one tag on its own line: [[diagram:ID]]');
    buffer.writeln('Supported diagram IDs: ${ChatDiagramCatalog.allowedIdsForPrompt}');
    buffer.writeln('Example line: [[diagram:pn_junction]]');
    buffer.writeln(
        'Still give a short verbal explanation. If no ID fits, describe the diagram in words only.');
    buffer.writeln(
        'If no vector diagram ID fits, still explain clearly in words. '
        'The app may separately try a free-tier image diagram when the student asked for a figure.');
    buffer.writeln('');
    buffer.writeln('=== CONTEXT ===');
    buffer.writeln('Page: $currentPage');
    if (courseTitle != null) buffer.writeln('Course: $courseTitle');
    if (moduleTitle != null) buffer.writeln('Module: $moduleTitle');
    if (unitTitle != null) buffer.writeln('Unit: $unitTitle');
    if (problemOrQuestion != null && problemOrQuestion.isNotEmpty) {
      final clip = problemOrQuestion.length > 1200
          ? '${problemOrQuestion.substring(0, 1200)}…'
          : problemOrQuestion;
      buffer.writeln('What $nickname may be looking at:\n$clip');
    }
    buffer.writeln('Stay in character as Nova.');
    return buffer.toString();
  }

  /// History without duplicating the current user message; trimmed for speed.
  static List<Map<String, String>> _trimHistory(
    List<Map<String, String>>? history,
    String currentUserMessage,
  ) {
    if (history == null || history.isEmpty) return [];
    final cleaned = <Map<String, String>>[];
    for (final m in history) {
      final role = m['role'];
      final content = m['content'];
      if (role == null || content == null) continue;
      if (role != 'user' && role != 'assistant' && role != 'model') continue;
      cleaned.add({'role': role == 'model' ? 'assistant' : role, 'content': content});
    }
    // Drop trailing user message if it matches the one we are about to send
    if (cleaned.isNotEmpty &&
        cleaned.last['role'] == 'user' &&
        cleaned.last['content'] == currentUserMessage) {
      cleaned.removeLast();
    }
    if (cleaned.length > _maxHistoryTurns) {
      return cleaned.sublist(cleaned.length - _maxHistoryTurns);
    }
    return cleaned;
  }

  static List<AiProviderInfo> _providersWithKeys() {
    final preferred = StorageService.getPreferredProvider();
    final withKeys = <AiProviderInfo>[];
    for (final p in AiProviders.all) {
      final key = StorageService.getProviderKey(p.id.name);
      if (key != null && key.isNotEmpty) withKeys.add(p);
    }
    if (withKeys.isEmpty) return [];

    if (preferred != 'auto') {
      withKeys.sort((a, b) {
        if (a.id.name == preferred) return -1;
        if (b.id.name == preferred) return 1;
        return 0;
      });
    } else {
      withKeys.sort((a, b) {
        final ia = AiProviders.defaultOrder.indexOf(a.id);
        final ib = AiProviders.defaultOrder.indexOf(b.id);
        return ia.compareTo(ib);
      });
    }
    return withKeys;
  }

  static Future<AiReply> askNova({
    required String userMessage,
    required String currentPage,
    String? courseTitle,
    String? moduleTitle,
    String? unitTitle,
    String? problemOrQuestion,
    List<Map<String, String>>? conversationHistory,
  }) async {
    final nickname = StorageService.getNickname();
    final providers = _providersWithKeys();

    if (providers.isEmpty) {
      return AiReply(
        text:
            'Hey $nickname 👋\n\nI need at least one free API key to chat with you.\n\n'
            'Tap **Open AI settings** below (or go to Settings → AI providers), add a key — Gemini is usually easiest — then come back.

[Open AI settings](pgd://settings/ai)',
        providerId: AiProviderId.gemini,
        poweredByLabel: '',
      );
    }

    final systemPrompt = _buildSystemPrompt(
      currentPage: currentPage,
      courseTitle: courseTitle,
      moduleTitle: moduleTitle,
      unitTitle: unitTitle,
      problemOrQuestion: problemOrQuestion,
    );
    final history = _trimHistory(conversationHistory, userMessage);
    final errors = <String>[];

    for (final provider in providers) {
      final key = StorageService.getProviderKey(provider.id.name)!;
      try {
        final text = await _callProvider(
          provider: provider,
          apiKey: key,
          systemPrompt: systemPrompt,
          userMessage: userMessage,
          history: history,
        );
        if (text.trim().isNotEmpty) {
          return AiReply(
            text: text.trim(),
            providerId: provider.id,
            poweredByLabel: provider.poweredByLabel,
          );
        }
        errors.add('${provider.displayName}: empty reply');
      } on _ProviderException catch (e) {
        errors.add('${provider.displayName}: ${e.message}');
        continue;
      } catch (e) {
        final msg = e.toString().toLowerCase();
        final offline = msg.contains('socket') ||
            msg.contains('network') ||
            msg.contains('failed host') ||
            msg.contains('connection') ||
            msg.contains('timed out') ||
            msg.contains('timeout');
        if (offline && providers.length == 1) {
          return AiReply(
            text:
                'Hey $nickname… I can\'t reach the cloud right now.\n\n'
                '**Good news:** lessons, diagrams, and quizzes work fully offline.\n\n'
                'Try Nova again when you have a connection.',
            providerId: provider.id,
            poweredByLabel: '',
          );
        }
        errors.add(
            '${provider.displayName}: ${offline ? 'timeout/network' : 'error'}');
        continue;
      }
    }

    final allNetwork = errors.every((e) =>
        e.contains('timeout') ||
        e.contains('network') ||
        e.contains('socket'));
    if (allNetwork) {
      return AiReply(
        text:
            'Hey $nickname… I couldn\'t reach any AI provider.\n\n'
            'Check your connection and try again. Your study content still works offline.',
        providerId: providers.first.id,
        poweredByLabel: '',
      );
    }

    return AiReply(
      text:
          'I tried every key you saved, $nickname, but none answered successfully.\n\n'
          '${errors.map((e) => '• $e').join('\n')}\n\n'
          'Check keys in [Open AI settings](pgd://settings/ai), or wait a minute if you hit a free-tier limit.',
      providerId: providers.first.id,
      poweredByLabel: '',
    );
  }

  static Future<String> _callProvider({
    required AiProviderInfo provider,
    required String apiKey,
    required String systemPrompt,
    required String userMessage,
    required List<Map<String, String>> history,
  }) async {
    switch (provider.id) {
      case AiProviderId.gemini:
        return _callGemini(apiKey, systemPrompt, userMessage, history);
      case AiProviderId.groq:
      case AiProviderId.openrouter:
      case AiProviderId.cerebras:
        return _callOpenAiCompatible(
          provider: provider,
          apiKey: apiKey,
          systemPrompt: systemPrompt,
          userMessage: userMessage,
          history: history,
        );
    }
  }

  static Future<String> _callGemini(
    String apiKey,
    String systemPrompt,
    String userMessage,
    List<Map<String, String>> history,
  ) async {
    // Prefer fast Flash; fall back if model id unavailable
    final models = ['gemini-2.0-flash', 'gemini-1.5-flash'];
    _ProviderException? lastErr;
    for (final model in models) {
      try {
        return await _callGeminiModel(
          model: model,
          apiKey: apiKey,
          systemPrompt: systemPrompt,
          userMessage: userMessage,
          history: history,
        );
      } on _ProviderException catch (e) {
        lastErr = e;
        if (e.message.contains('invalid API key') ||
            e.message.contains('rate limit')) {
          rethrow;
        }
        // try next model
      }
    }
    throw lastErr ?? _ProviderException('Gemini failed');
  }

  static Future<String> _callGeminiModel({
    required String model,
    required String apiKey,
    required String systemPrompt,
    required String userMessage,
    required List<Map<String, String>> history,
  }) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey',
    );

    final contents = <Map<String, dynamic>>[];
    for (final msg in history) {
      contents.add({
        'role': msg['role'] == 'user' ? 'user' : 'model',
        'parts': [
          {'text': msg['content'] ?? ''}
        ],
      });
    }
    contents.add({
      'role': 'user',
      'parts': [
        {'text': userMessage}
      ],
    });

    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'systemInstruction': {
              'parts': [
                {'text': systemPrompt}
              ]
            },
            'contents': contents,
            'generationConfig': {
              'temperature': 0.7,
              'maxOutputTokens': _maxOutputTokens,
            },
          }),
        )
        .timeout(_perProviderTimeout);

    return _parseGemini(response);
  }

  static String _parseGemini(http.Response response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data['candidates'] as List?;
      if (candidates != null && candidates.isNotEmpty) {
        final content = candidates[0]['content'];
        if (content is Map) {
          final parts = content['parts'] as List?;
          if (parts != null && parts.isNotEmpty) {
            final text = parts[0]['text'];
            if (text is String && text.trim().isNotEmpty) return text;
          }
        }
      }
      throw _ProviderException('empty or blocked response');
    }
    if (response.statusCode == 429) {
      throw _ProviderException('rate limit');
    }
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw _ProviderException('invalid API key');
    }
    // 404 model not found → try next model
    if (response.statusCode == 404) {
      throw _ProviderException('model unavailable');
    }
    throw _ProviderException('HTTP ${response.statusCode}');
  }

  static Future<String> _callOpenAiCompatible({
    required AiProviderInfo provider,
    required String apiKey,
    required String systemPrompt,
    required String userMessage,
    required List<Map<String, String>> history,
  }) async {
    final Uri url;
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    switch (provider.id) {
      case AiProviderId.groq:
        url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
        break;
      case AiProviderId.openrouter:
        url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');
        headers['HTTP-Referer'] = 'https://pgd-physics.app';
        headers['X-Title'] = 'PGD Physics';
        break;
      case AiProviderId.cerebras:
        url = Uri.parse('https://api.cerebras.ai/v1/chat/completions');
        break;
      case AiProviderId.gemini:
        throw StateError('Gemini uses a different path');
    }

    final messages = <Map<String, String>>[
      {'role': 'system', 'content': systemPrompt},
    ];
    for (final msg in history) {
      messages.add({
        'role': msg['role'] == 'user' ? 'user' : 'assistant',
        'content': msg['content'] ?? '',
      });
    }
    messages.add({'role': 'user', 'content': userMessage});

    final response = await http
        .post(
          url,
          headers: headers,
          body: jsonEncode({
            'model': provider.defaultModel,
            'messages': messages,
            'temperature': 0.7,
            'max_tokens': _maxOutputTokens,
          }),
        )
        .timeout(_perProviderTimeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final choices = data['choices'] as List?;
      if (choices != null && choices.isNotEmpty) {
        final message = choices[0]['message'];
        if (message is Map && message['content'] is String) {
          return message['content'] as String;
        }
      }
      throw _ProviderException('empty response');
    }
    if (response.statusCode == 429) {
      throw _ProviderException('rate limit');
    }
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw _ProviderException('invalid API key');
    }
    throw _ProviderException('HTTP ${response.statusCode}');
  }
}

class _ProviderException implements Exception {
  final String message;
  _ProviderException(this.message);
}
