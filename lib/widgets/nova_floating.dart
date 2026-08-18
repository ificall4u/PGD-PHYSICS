import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/services/ai_service.dart';
import 'package:pgd_physics/widgets/nova_message_body.dart';
import 'package:pgd_physics/screens/nova_chat_screen.dart';
import 'package:pgd_physics/utils/page_transitions.dart';

/// Global page context for floating Nova (updated by screens optionally).
class NovaContext {
  static String currentPage = 'Home';
  static String? courseTitle;
  static String? moduleTitle;
  static String? unitTitle;

  static void set({
    String? page,
    String? course,
    String? module,
    String? unit,
  }) {
    if (page != null) currentPage = page;
    courseTitle = course ?? courseTitle;
    moduleTitle = module ?? moduleTitle;
    unitTitle = unit ?? unitTitle;
  }

  static void clearLesson() {
    courseTitle = null;
    moduleTitle = null;
    unitTitle = null;
    currentPage = 'Home';
  }
}

/// Wraps the navigator so a floating Nova bubble + mini chat can appear above routes.
class NovaFloatingHost extends StatefulWidget {
  final Widget child;
  const NovaFloatingHost({super.key, required this.child});

  @override
  State<NovaFloatingHost> createState() => _NovaFloatingHostState();
}

class _NovaFloatingHostState extends State<NovaFloatingHost> {
  bool _enabled = true;
  bool _panelOpen = false;
  bool _expanded = false;
  Offset _bubblePos = const Offset(-1, -1); // -1 → place default after layout

  @override
  void initState() {
    super.initState();
    _enabled = StorageService.floatingNovaEnabled();
    StorageService.floatingNovaListenable.addListener(_onPref);
  }

  void _onPref() {
    if (!mounted) return;
    setState(() => _enabled = StorageService.floatingNovaEnabled());
  }

  @override
  void dispose() {
    StorageService.floatingNovaListenable.removeListener(_onPref);
    super.dispose();
  }

  void _openPanel({bool expanded = false}) {
    setState(() {
      _panelOpen = true;
      _expanded = expanded;
    });
  }

  void _closePanel() {
    setState(() {
      _panelOpen = false;
      _expanded = false;
    });
  }

  void _toggleExpand() {
    setState(() => _expanded = !_expanded);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        if (_bubblePos.dx < 0) {
          _bubblePos = Offset(w - 72, h - 120);
        }
        // Clamp bubble
        final bx = _bubblePos.dx.clamp(8.0, w - 64);
        final by = _bubblePos.dy.clamp(48.0, h - 88);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            widget.child,
            if (_enabled && !_panelOpen &&
                NovaContext.currentPage != 'Splash' &&
                NovaContext.currentPage != 'Onboarding')
              Positioned(
                left: bx,
                top: by,
                child: _NovaBubble(
                  onTap: () => _openPanel(expanded: false),
                  onPan: (delta) {
                    setState(() {
                      _bubblePos = Offset(
                        (_bubblePos.dx + delta.dx).clamp(8.0, w - 64),
                        (_bubblePos.dy + delta.dy).clamp(48.0, h - 88),
                      );
                    });
                  },
                ),
              ),
            if (_enabled && _panelOpen)
              Positioned.fill(
                child: _NovaFloatingPanel(
                  expanded: _expanded,
                  onClose: _closePanel,
                  onToggleExpand: _toggleExpand,
                  onOpenFullScreen: () {
                    _closePanel();
                    final nav = Navigator.of(context);
                    nav.push(
                      AppPageRoute(
                        page: NovaChatScreen(
                          currentPage: NovaContext.currentPage,
                          courseTitle: NovaContext.courseTitle,
                          moduleTitle: NovaContext.moduleTitle,
                          unitTitle: NovaContext.unitTitle,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

class _NovaBubble extends StatelessWidget {
  final VoidCallback onTap;
  final void Function(Offset delta) onPan;

  const _NovaBubble({required this.onTap, required this.onPan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onPanUpdate: (d) => onPan(d.delta),
      child: Material(
        elevation: 6,
        shadowColor: AppTheme.primary.withOpacity(0.35),
        shape: const CircleBorder(),
        color: AppTheme.primary,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.auto_awesome_rounded,
              color: AppTheme.textOnPrimary,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}

class _NovaFloatingPanel extends StatefulWidget {
  final bool expanded;
  final VoidCallback onClose;
  final VoidCallback onToggleExpand;
  final VoidCallback onOpenFullScreen;

  const _NovaFloatingPanel({
    required this.expanded,
    required this.onClose,
    required this.onToggleExpand,
    required this.onOpenFullScreen,
  });

  @override
  State<_NovaFloatingPanel> createState() => _NovaFloatingPanelState();
}

class _NovaFloatingPanelState extends State<_NovaFloatingPanel> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();
  final List<Map<String, String>> _messages = [];
  bool _loading = false;

  String get _threadKey {
    final parts = [
      NovaContext.courseTitle,
      NovaContext.moduleTitle,
      NovaContext.unitTitle,
      'float',
    ].where((e) => e != null && e.isNotEmpty).join('|');
    return parts.isEmpty ? 'float-home' : parts;
  }

  @override
  void initState() {
    super.initState();
    final saved = StorageService.loadChatThread(_threadKey);
    if (saved.isNotEmpty) {
      _messages.addAll(saved);
    } else {
      final name = StorageService.getNickname();
      _messages.add({
        'role': 'assistant',
        'content':
            'Hi $name — I\'m Nova. Ask anything about your lesson, or just chat.',
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _loading) return;
    setState(() {
      _messages.add({'role': 'user', 'content': text});
      _loading = true;
      _controller.clear();
    });
    StorageService.saveChatThread(_threadKey, _messages);
    try {
      final history = _messages
          .where((m) => m['role'] == 'user' || m['role'] == 'assistant')
          .map((m) => {'role': m['role']!, 'content': m['content'] ?? ''})
          .toList();
      final reply = await AiService.askNova(
        userMessage: text,
        currentPage: NovaContext.currentPage,
        courseTitle: NovaContext.courseTitle,
        moduleTitle: NovaContext.moduleTitle,
        unitTitle: NovaContext.unitTitle,
        conversationHistory: history,
      );
      if (!mounted) return;
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': reply.text,
          if (reply.poweredByLabel.isNotEmpty) 'poweredBy': reply.poweredByLabel,
        });
        _loading = false;
      });
      StorageService.saveChatThread(_threadKey, _messages);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': 'Something went wrong. Try again in a moment.',
        });
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = widget.expanded
        ? media.size.height - media.padding.top - 8
        : media.size.height * 0.52;

    return Material(
      color: Colors.black54,
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            height: height,
            margin: EdgeInsets.fromLTRB(
              widget.expanded ? 0 : 10,
              0,
              widget.expanded ? 0 : 10,
              widget.expanded ? 0 : 10,
            ),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(widget.expanded ? 0 : 18),
              border: Border.all(color: AppTheme.cardBorder),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 24,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Handle / toolbar
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 4, 4),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(Icons.auto_awesome_rounded,
                          color: AppTheme.primaryLight, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Nova',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: widget.expanded ? 'Shrink' : 'Expand',
                        onPressed: widget.onToggleExpand,
                        icon: Icon(
                          widget.expanded
                              ? Icons.fullscreen_exit_rounded
                              : Icons.fullscreen_rounded,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Full screen page',
                        onPressed: widget.onOpenFullScreen,
                        icon: Icon(Icons.open_in_new_rounded,
                            color: AppTheme.textSecondary),
                      ),
                      IconButton(
                        tooltip: 'Close',
                        onPressed: widget.onClose,
                        icon: Icon(Icons.close_rounded,
                            color: AppTheme.textSecondary),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: AppTheme.divider),
                Expanded(
                  child: ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    itemCount: _messages.length + (_loading ? 1 : 0),
                    itemBuilder: (context, i) {
                      if (_loading && i == _messages.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Nova is thinking…',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 13,
                            ),
                          ),
                        );
                      }
                      final m = _messages[i];
                      final isUser = m['role'] == 'user';
                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          constraints: BoxConstraints(
                            maxWidth: media.size.width * 0.85,
                          ),
                          decoration: BoxDecoration(
                            color: isUser
                                ? AppTheme.primary
                                : AppTheme.surfaceElevated,
                            borderRadius: BorderRadius.circular(14),
                            border: isUser
                                ? null
                                : Border.all(color: AppTheme.cardBorder),
                          ),
                          child: NovaMessageBody(
                            text: m['content'] ?? '',
                            isUser: isUser,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    10,
                    6,
                    10,
                    10 + media.viewInsets.bottom,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 4,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _send(),
                          decoration: InputDecoration(
                            hintText: 'Message Nova…',
                            filled: true,
                            fillColor: AppTheme.surfaceElevated,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: AppTheme.cardBorder),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: AppTheme.cardBorder),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton.filled(
                        onPressed: _loading ? null : _send,
                        style: IconButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: AppTheme.textOnPrimary,
                        ),
                        icon: const Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
