import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_aware.dart';
import 'package:pgd_physics/widgets/theme_toggle.dart';
import 'package:pgd_physics/services/ai_service.dart';
import 'package:pgd_physics/screens/settings_screen.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/widgets/nova_message_body.dart';
import 'package:pgd_physics/widgets/diagrams/chat_diagram_catalog.dart';
import 'package:pgd_physics/services/image_generation_service.dart';
import 'dart:convert';

class NovaChatScreen extends StatefulWidget {
  final String currentPage;
  final String? courseTitle;
  final String? moduleTitle;
  final String? unitTitle;
  final String? problemOrQuestion;
  final String? initialUserMessage;

  const NovaChatScreen({
    super.key,
    required this.currentPage,
    this.courseTitle,
    this.moduleTitle,
    this.unitTitle,
    this.problemOrQuestion,
    this.initialUserMessage,
  });

  @override
  State<NovaChatScreen> createState() => _NovaChatScreenState();
}

class _NovaChatScreenState extends State<NovaChatScreen> with ThemeAware {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  bool _editingLast = false;

  String get _threadKey {
    final parts = [
      widget.courseTitle,
      widget.moduleTitle,
      widget.unitTitle,
      widget.currentPage,
    ].where((e) => e != null && e.isNotEmpty).join('|');
    return parts.isEmpty ? 'home' : parts;
  }

  void _persist() => StorageService.saveChatThread(_threadKey, _messages);

  int get _lastUserIndex {
    for (var i = _messages.length - 1; i >= 0; i--) {
      if (_messages[i]['role'] == 'user') return i;
    }
    return -1;
  }

  bool _isEditableUserIndex(int index) {
    if (_isLoading || _editingLast) return false;
    return index == _lastUserIndex && index >= 0;
  }

  @override
  void initState() {
    super.initState();
    final saved = StorageService.loadChatThread(_threadKey);
    if (saved.isNotEmpty) {
      _messages.addAll(saved);
    } else {
      _messages.add({'role': 'assistant', 'content': _welcomeText()});
    }
    final initial = widget.initialUserMessage?.trim();
    if (initial != null && initial.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _controller.text = initial;
        _send();
      });
    }
  }

  String _welcomeText() {
    final name = StorageService.getNickname();
    final where = StringBuffer(widget.currentPage);
    if (widget.courseTitle != null) where.write(' — ${widget.courseTitle}');
    if (widget.moduleTitle != null) where.write(' → ${widget.moduleTitle}');
    if (widget.unitTitle != null) where.write(' → ${widget.unitTitle}');
    return 'Hey $name…\n\n'
        'I’m **Nova**, right here with you. I can see you’re on **$where**.\n\n'
        'Ask me anything — a derivation, a confusing step, or just “explain it softer”. '
        'I’ll go as slowly as you need.';
  }

  Future<void> _send({String? overrideText}) async {
    final text = (overrideText ?? _controller.text).trim();
    if (text.isEmpty || _isLoading) return;

    setState(() {
      _messages.add({'role': 'user', 'content': text});
      if (overrideText == null) _controller.clear();
      _isLoading = true;
      _editingLast = false;
    });
    _persist();
    _scrollToBottom();
    await _requestReply(text);
  }

  /// Long-press on most recent user message → edit.
  /// Removes that message and any Nova reply after it, loads text into composer.
  void _beginEditLastUserMessage() {
    final i = _lastUserIndex;
    if (i < 0 || _isLoading) return;
    final previous = _messages[i]['content'] ?? '';
    setState(() {
      _messages.removeRange(i, _messages.length);
      _controller.text = previous;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      _editingLast = true;
    });
    _persist();
  }

  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 800),
        backgroundColor: AppTheme.surfaceElevated,
      ),
    );
  }

  Future<void> _onLongPressMessage({
    required int index,
    required bool isUser,
    required String text,
  }) async {
    final canEdit = isUser && _isEditableUserIndex(index);
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 20),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.cardBorder),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.cardBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.copy_rounded, color: AppTheme.textSecondary),
                  title: Text(
                    'Copy',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    _copyText(text);
                  },
                ),
                if (canEdit)
                  ListTile(
                    leading: Icon(Icons.edit_outlined, color: AppTheme.primaryLight),
                    title: Text(
                      'Edit',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Removes Nova’s reply and regenerates after you send',
                      style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      _beginEditLastUserMessage();
                    },
                  ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _requestReply(String userText) async {
    try {
      final history = _messages
          .where((m) => m['role'] == 'user' || m['role'] == 'assistant')
          .map((m) => {
                'role': m['role']!,
                'content': m['content'] ?? '',
              })
          .toList();

      // Local vector diagrams first (offline, precise)
      final detected = ChatDiagramCatalog.detectIds(userText);
      final wantsVisual = ImageGenerationService.userAskedForVisual(userText);

      final reply = await AiService.askNova(
        userMessage: userText,
        currentPage: widget.currentPage,
        courseTitle: widget.courseTitle,
        moduleTitle: widget.moduleTitle,
        unitTitle: widget.unitTitle,
        problemOrQuestion: widget.problemOrQuestion,
        conversationHistory: history,
      );

      if (!mounted) return;

      final parsed = ChatDiagramCatalog.parseAssistantText(reply.text);
      final diagramIds = <String>{...parsed.$2, ...detected}.toList();

      String? imageB64;
      String? imageMime;
      String powered = reply.poweredByLabel;
      var content = parsed.$1.isNotEmpty ? parsed.$1 : reply.text;

      // No built-in vector match → try free-tier image API
      if (diagramIds.isEmpty && wantsVisual) {
        final img =
            await ImageGenerationService.generateEducationalDiagram(userText);
        if (img != null) {
          imageB64 = base64Encode(img.bytes);
          imageMime = img.mimeType;
          if (powered.isEmpty) {
            powered = img.sourceLabel;
          } else {
            powered = '$powered · ${img.sourceLabel}';
          }
          if (!content.toLowerCase().contains('diagram') &&
              content.length < 40) {
            content =
                '$content\n\nHere is a generated educational diagram for your request.';
          }
        } else if (content.trim().isNotEmpty) {
          content = '$content\n\n'
              'I could not generate a figure online right now '
              '(needs a Gemini key and network, or the free image service was busy). '
              'I explained it in words above.';
        }
      }

      if (!mounted) return;
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': content,
          if (powered.isNotEmpty) 'poweredBy': powered,
          if (diagramIds.isNotEmpty) 'diagramIds': diagramIds.join(','),
          if (imageB64 != null) 'imageBase64': imageB64,
          if (imageMime != null) 'imageMime': imageMime!,
        });
      });
      _persist();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': 'Something unexpected went wrong. Please try again in a moment.',
        });
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
        _scrollToBottom();
      }
    }
  }

  Future<void> _clearChat() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surface,
        title: Text('Clear this chat?', style: TextStyle(color: AppTheme.textPrimary)),
        content: Text(
          'Messages in this conversation will be removed from this device.',
          style: TextStyle(color: AppTheme.textSecondary, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Clear', style: TextStyle(color: AppTheme.error)),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;

    await StorageService.clearChatThread(_threadKey);
    setState(() {
      _messages
        ..clear()
        ..add({'role': 'assistant', 'content': _welcomeText()});
      _editingLast = false;
      _controller.clear();
    });
    _persist();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _submitComposer() {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;
    if (_editingLast) {
      _controller.clear();
      _send(overrideText: text);
    } else {
      _send();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.auto_awesome_rounded, size: 20, color: AppTheme.primaryLight),
            const SizedBox(width: 8),
            Text('Nova'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Clear chat',
            onPressed: _isLoading ? null : _clearChat,
            icon: Icon(Icons.refresh_rounded, color: AppTheme.textSecondary, size: 22),
          ),
          const ThemeToggle(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.currentPage,
                style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isLoading && index == _messages.length) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceElevated,
                        borderRadius: BorderRadius.circular(16).copyWith(
                          bottomLeft: const Radius.circular(4),
                        ),
                        border: Border.all(color: AppTheme.cardBorder),
                      ),
                      child: Text(
                        'Nova is thinking…',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                }

                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                final content = msg['content'] ?? '';
                final poweredBy = msg['poweredBy'];

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: GestureDetector(
                    onLongPress: () => _onLongPressMessage(
                      index: index,
                      isUser: isUser,
                      text: content,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.82,
                      ),
                      decoration: BoxDecoration(
                        color: isUser
                            ? AppTheme.primary
                            : AppTheme.surfaceElevated,
                        borderRadius: BorderRadius.circular(16).copyWith(
                          bottomRight:
                              isUser ? const Radius.circular(4) : null,
                          bottomLeft:
                              !isUser ? const Radius.circular(4) : null,
                        ),
                        border: isUser
                            ? null
                            : Border.all(color: AppTheme.cardBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NovaMessageBody(text: content, isUser: isUser),
                          if (!isUser &&
                              (content.contains('pgd://settings/ai') ||
                                  content.toLowerCase().contains(
                                      'settings → ai') ||
                                  content.toLowerCase().contains(
                                      'settings -> ai') ||
                                  content.toLowerCase().contains(
                                      'add a key'))) ...[
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: FilledButton.tonalIcon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    AppPageRoute(
                                      page: const SettingsScreen(
                                          openAiSection: true),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.vpn_key_rounded, size: 18),
                                label: const Text('Open AI settings'),
                              ),
                            ),
                          ],
                          if (!isUser &&
                              (msg['diagramIds'] ?? '').isNotEmpty)
                            ...msg['diagramIds']!
                                .split(',')
                                .where((id) => id.trim().isNotEmpty)
                                .map((id) => ChatDiagramCatalog.buildCard(id.trim())),
                          if (!isUser &&
                              (msg['imageBase64'] ?? '').isNotEmpty) ...[
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                base64Decode(msg['imageBase64']!),
                                fit: BoxFit.contain,
                                gaplessPlayback: true,
                                errorBuilder: (_, __, ___) => Text(
                                  'Image could not be displayed.',
                                  style: TextStyle(
                                    color: AppTheme.textMuted,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          if (!isUser &&
                              poweredBy != null &&
                              poweredBy.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Text(
                              poweredBy,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppTheme.textMuted,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_editingLast)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
              child: Text(
                'Editing — send to get a new reply from Nova',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.primaryLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _submitComposer(),
                      decoration: InputDecoration(
                        hintText: _editingLast
                            ? 'Edit message…'
                            : 'Message Nova…',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: _isLoading ? null : _submitComposer,
                    style: IconButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
