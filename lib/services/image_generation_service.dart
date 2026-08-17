import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pgd_physics/services/storage_service.dart';

class GeneratedImage {
  final List<int> bytes;
  final String mimeType;
  final String sourceLabel; // e.g. Powered by Gemini (image)

  const GeneratedImage({
    required this.bytes,
    required this.mimeType,
    required this.sourceLabel,
  });
}

/// Free-tier image generation for on-demand diagrams when no local vector exists.
/// Primary: Gemini image models (user's Gemini key).
/// Fallback: Pollinations public endpoint (no key; best-effort, rate-limited).
class ImageGenerationService {
  static const _timeout = Duration(seconds: 55);

  static const _geminiModels = [
    'gemini-2.5-flash-image',
    'gemini-3.1-flash-image-preview',
    'gemini-2.0-flash-preview-image-generation',
  ];

  static bool userAskedForVisual(String text) {
    final l = text.toLowerCase();
    return l.contains('diagram') ||
        l.contains('draw') ||
        l.contains('sketch') ||
        l.contains('figure') ||
        l.contains('illustrat') ||
        l.contains('show me a picture') ||
        l.contains('generate an image') ||
        l.contains('image of');
  }

  static String _teachingImagePrompt(String userRequest) {
    return '''
Create a clean educational physics diagram for a university student.
Request: $userRequest

Style rules:
- White or very light background
- Simple black/blue line art, clear labels
- No photorealism, no clutter, no watermarks, no decorative people
- Textbook / lecture-slide quality schematic
- Label important parts with short readable text
''';
  }

  /// Returns null if no image could be produced.
  static Future<GeneratedImage?> generateEducationalDiagram(
    String userRequest,
  ) async {
    final geminiKey = StorageService.getProviderKey('gemini');
    if (geminiKey != null && geminiKey.isNotEmpty) {
      final fromGemini = await _tryGemini(geminiKey, userRequest);
      if (fromGemini != null) return fromGemini;
    }

    // Key-free best-effort fallback (public free endpoint; may be rate-limited)
    final fromPollinations = await _tryPollinations(userRequest);
    return fromPollinations;
  }

  static Future<GeneratedImage?> _tryGemini(
    String apiKey,
    String userRequest,
  ) async {
    final prompt = _teachingImagePrompt(userRequest);
    for (final model in _geminiModels) {
      try {
        final url = Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey',
        );
        final response = await http
            .post(
              url,
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'contents': [
                  {
                    'parts': [
                      {'text': prompt}
                    ]
                  }
                ],
                'generationConfig': {
                  'responseModalities': ['TEXT', 'IMAGE'],
                },
              }),
            )
            .timeout(_timeout);

        if (response.statusCode != 200) {
          if (response.statusCode == 404 || response.statusCode == 400) {
            continue; // try next model id
          }
          continue;
        }

        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final candidates = data['candidates'] as List?;
        if (candidates == null || candidates.isEmpty) continue;

        final content = candidates[0]['content'];
        if (content is! Map) continue;
        final parts = content['parts'] as List?;
        if (parts == null) continue;

        for (final part in parts) {
          if (part is! Map) continue;
          final inline = part['inlineData'] ?? part['inline_data'];
          if (inline is Map) {
            final mime = (inline['mimeType'] ?? inline['mime_type'] ?? 'image/png')
                .toString();
            final b64 = inline['data']?.toString();
            if (b64 != null && b64.isNotEmpty) {
              return GeneratedImage(
                bytes: base64Decode(b64),
                mimeType: mime,
                sourceLabel: 'Powered by Gemini (image)',
              );
            }
          }
        }
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  static Future<GeneratedImage?> _tryPollinations(String userRequest) async {
    try {
      final prompt = Uri.encodeComponent(
        'clean educational physics textbook diagram, simple labeled schematic, white background: $userRequest',
      );
      final url = Uri.parse(
        'https://image.pollinations.ai/prompt/$prompt?width=1024&height=768&nologo=true',
      );
      final response = await http.get(url).timeout(_timeout);
      if (response.statusCode == 200 &&
          response.bodyBytes.isNotEmpty &&
          response.bodyBytes.length > 500) {
        final mime = response.headers['content-type'] ?? 'image/jpeg';
        return GeneratedImage(
          bytes: response.bodyBytes,
          mimeType: mime.split(';').first,
          sourceLabel: 'Powered by free image fallback',
        );
      }
    } catch (_) {}
    return null;
  }
}
