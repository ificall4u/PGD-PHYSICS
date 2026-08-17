import 'package:flutter/material.dart';
import 'package:pgd_physics/models/course.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/widgets/theme_toggle.dart';

class QuizScreen extends StatefulWidget {
  final Course course;
  final Topic topic;
  final Unit unit;

  const QuizScreen({
    super.key,
    required this.course,
    required this.topic,
    required this.unit,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;
  int? _selected;
  bool _revealed = false;
  int _correct = 0;

  QuizQuestion get _q => widget.unit.quiz[_current];
  bool get _isLast => _current >= widget.unit.quiz.length - 1;

  void _check() {
    if (_selected == null) return;
    if (_selected == _q.correctIndex) _correct++;
    setState(() => _revealed = true);
  }

  void _next() {
    if (_isLast) {
      _showSummary();
      return;
    }
    setState(() {
      _current++;
      _selected = null;
      _revealed = false;
    });
  }

  void _showSummary() {
    final total = widget.unit.quiz.length;
    final ok = _correct == total;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ok ? Icons.celebration_rounded : Icons.emoji_events_outlined,
              size: 40,
              color: ok ? AppTheme.success : AppTheme.warning,
            ),
            const SizedBox(height: 12),
            Text(
              ok ? 'Perfect, ${StorageService.getNickname()}!' : 'Good effort, ${StorageService.getNickname()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'You got $_correct of $total',
              style: TextStyle(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Back to lesson'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.unit.quiz.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quick check')),
        body: const Center(
          child: Text('No questions for this lesson yet.',
              style: TextStyle(color: AppTheme.textMuted)),
        ),
      );
    }

    final color = AppTheme.courseColor(widget.course.colorHint);
    final progress = (_current + 1) / widget.unit.quiz.length;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        actions: const [ThemeToggle()],
        title: const Text('Quick check'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 3,
            backgroundColor: AppTheme.surfaceElevated,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_current + 1} of ${widget.unit.quiz.length}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _q.question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(_q.options.length, (i) {
              final selected = _selected == i;
              final isCorrect = i == _q.correctIndex;
              Color border = AppTheme.cardBorder;
              Color bg = AppTheme.surface;
              if (_revealed) {
                if (isCorrect) {
                  border = AppTheme.success;
                  bg = AppTheme.success.withOpacity(0.12);
                } else if (selected) {
                  border = AppTheme.error;
                  bg = AppTheme.error.withOpacity(0.1);
                }
              } else if (selected) {
                border = color;
                bg = color.withOpacity(0.12);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  color: bg,
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: _revealed
                        ? null
                        : () => setState(() => _selected = i),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: border),
                      ),
                      child: Text(
                        _q.options[i],
                        style: TextStyle(
                          fontSize: 15,
                          color: AppTheme.textPrimary,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            if (_revealed) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _q.explanation,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: AppTheme.textSecondary,
                    height: 1.45,
                  ),
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _revealed
                    ? _next
                    : (_selected == null ? null : _check),
                child: Text(_revealed
                    ? (_isLast ? 'See result' : 'Next')
                    : 'Check'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
