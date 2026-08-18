import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:pgd_physics/models/course.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_aware.dart';
import 'package:pgd_physics/utils/math_plain.dart';
import 'package:pgd_physics/widgets/theme_toggle.dart';
import 'package:pgd_physics/utils/page_transitions.dart';
import 'package:pgd_physics/screens/nova_chat_screen.dart';
import 'package:pgd_physics/screens/quiz_screen.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/widgets/diagrams/diagram_registry.dart';

class UnitScreen extends StatefulWidget {
  final Course course;
  final Module module;
  final Unit unit;

  const UnitScreen({
    super.key,
    required this.course,
    required this.module,
    required this.unit,
  });

  @override
  State<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> with ThemeAware {
  bool _completed = false;
  String? _selection;

  @override
  void initState() {
    super.initState();
    _completed = StorageService.isUnitComplete(widget.unit.id);
    StorageService.setLastLesson(
      courseId: widget.course.id,
      topicId: widget.module.id,
      unitId: widget.unit.id,
      courseTitle: widget.course.title,
      moduleTitle: widget.module.title,
      unitTitle: widget.unit.title,
    );
  }

  Future<void> _markComplete() async {
    await StorageService.markUnitComplete(widget.unit.id);
    setState(() => _completed = true);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nice work, ${StorageService.getNickname()}. Lesson marked complete ✨'),
          backgroundColor: AppTheme.surfaceElevated,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _askNovaAboutSelection() {
    final text = _selection?.trim();
    if (text == null || text.isEmpty) return;
    Navigator.push(
      context,
      AppPageRoute(
        page: NovaChatScreen(
          currentPage: 'Unit: ${widget.unit.title}',
          courseTitle: widget.course.title,
          moduleTitle: widget.module.title,
          unitTitle: widget.unit.title,
          problemOrQuestion:
              '${StorageService.getNickname()} highlighted this from the lesson and wants help with it:\n\n"$text"',
          initialUserMessage:
              'Please explain this part to me in a simple way:\n\n"$text"',
        ),
      ),
    );
  }

  void _askNovaGeneral() {
    Navigator.push(
      context,
      AppPageRoute(
        page: NovaChatScreen(
          currentPage: 'Unit: ${widget.unit.title}',
          courseTitle: widget.course.title,
          moduleTitle: widget.module.title,
          unitTitle: widget.unit.title,
          problemOrQuestion: widget.unit.content.length > 400
              ? '${widget.unit.content.substring(0, 400)}…'
              : widget.unit.content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.courseColor(widget.course.colorHint);
    final hasSelection = _selection != null && _selection!.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(
          widget.unit.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        actions: [
          const ThemeToggle(),
          IconButton(
            icon: Icon(Icons.auto_awesome_rounded, size: 22),
            tooltip: 'Ask Nova about this lesson',
            onPressed: _askNovaGeneral,
          ),
        ],
      ),
      body: Column(
        children: [
          // Selection → Ask Nova bar
          if (hasSelection)
            Material(
              color: AppTheme.primary.withOpacity(0.12),
              child: InkWell(
                onTap: _askNovaAboutSelection,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.auto_awesome_rounded,
                          size: 18, color: AppTheme.primaryLight),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Ask Nova about selected text',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryLight,
                          ),
                        ),
                      ),
                      Text(
                        _selection!.trim().length > 40
                            ? '"${_selection!.trim().substring(0, 40)}…"'
                            : '"${_selection!.trim()}"',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 12, color: AppTheme.primaryLight),
                    ],
                  ),
                ),
              ),
            ),

          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.course.code}  ·  ${widget.module.title}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.unit.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      height: 1.3,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tip: highlight any sentence, then tap “Ask Nova” above.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Visual diagram when available for this unit
                  if (DiagramRegistry.forUnit(widget.unit.id) != null) ...[
                    DiagramRegistry.forUnit(widget.unit.id)!,
                  ],

                  SelectionArea(
                    onSelectionChanged: (selection) {
                      final t = selection?.plainText;
                      setState(() {
                        _selection =
                            (t != null && t.trim().isNotEmpty) ? t : null;
                      });
                    },
                    child: MarkdownBody(
                      data: mathToPlain(widget.unit.content.replaceAll('Tochi', StorageService.getNickname())),
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          fontSize: 16,
                          height: 1.7,
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                        h1: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                          height: 1.35,
                        ),
                        h2: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                          height: 1.4,
                        ),
                        h3: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryLight,
                          height: 1.4,
                        ),
                        strong: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                        em: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppTheme.textSecondary,
                        ),
                        listBullet: TextStyle(
                          color: AppTheme.primaryLight,
                          fontSize: 16,
                        ),
                        listIndent: 24,
                        blockSpacing: 14,
                        h1Padding: const EdgeInsets.only(top: 8, bottom: 6),
                        h2Padding: const EdgeInsets.only(top: 14, bottom: 6),
                        h3Padding: const EdgeInsets.only(top: 12, bottom: 4),
                        pPadding: const EdgeInsets.only(bottom: 4),
                        blockquote: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 15,
                          height: 1.55,
                        ),
                        blockquoteDecoration: BoxDecoration(
                          color: color.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(color: color, width: 3),
                          ),
                        ),
                        blockquotePadding:
                            const EdgeInsets.fromLTRB(14, 10, 12, 10),
                        code: TextStyle(
                          backgroundColor: AppTheme.surfaceElevated,
                          color: AppTheme.accentSoft,
                          fontSize: 14,
                          fontFamily: 'monospace',
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: AppTheme.surfaceElevated,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.cardBorder),
                        ),
                        codeblockPadding: const EdgeInsets.all(14),
                      ),
                    ),
                  ),

                  if (widget.unit.keyTakeaways.isNotEmpty) ...[
                    const SizedBox(height: 28),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.cardBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lightbulb_outline_rounded,
                                  size: 18, color: AppTheme.warning),
                              SizedBox(width: 8),
                              Text(
                                'Key takeaways',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ...widget.unit.keyTakeaways.map(
                            (t) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Icon(Icons.circle,
                                        size: 6, color: AppTheme.primaryLight),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      t,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.5,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  if (widget.unit.quiz.isNotEmpty)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            AppPageRoute(
                              page: QuizScreen(
                                course: widget.course,
                                module: widget.module,
                                unit: widget.unit,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.quiz_outlined, size: 18),
                        label: Text('Quick check'),
                      ),
                    ),
                  if (widget.unit.quiz.isNotEmpty) const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _completed ? null : _markComplete,
                      icon: Icon(
                        _completed
                            ? Icons.check_circle_rounded
                            : Icons.check_rounded,
                        size: 18,
                      ),
                      label: Text(_completed ? 'Completed' : 'Mark done'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _completed ? AppTheme.success : AppTheme.primary,
                        disabledBackgroundColor:
                            AppTheme.success.withOpacity(0.7),
                        disabledForegroundColor: Colors.white,
                      ),
                    ),
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
