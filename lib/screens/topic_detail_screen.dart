import 'package:flutter/material.dart';
import 'package:pgd_physics/models/course.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/widgets/theme_toggle.dart';
import 'package:pgd_physics/utils/page_transitions.dart';
import 'package:pgd_physics/screens/unit_screen.dart';
import 'package:pgd_physics/screens/nova_chat_screen.dart';
import 'package:pgd_physics/services/storage_service.dart';

class TopicDetailScreen extends StatelessWidget {
  final Course course;
  final Topic topic;

  const TopicDetailScreen({
    super.key,
    required this.course,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.courseColor(course.colorHint);

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(
          topic.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          const ThemeToggle(),
          IconButton(
            icon: const Icon(Icons.auto_awesome_rounded),
            onPressed: () {
              Navigator.push(
                context,
                AppPageRoute(
                  page: NovaChatScreen(
                    currentPage: 'Topic: ${topic.title}',
                    courseTitle: course.title,
                    topicTitle: topic.title,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            course.code,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            topic.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              height: 1.25,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            topic.summary,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Lessons',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...topic.units.asMap().entries.map((entry) {
            final i = entry.key;
            final unit = entry.value;
            final done = StorageService.isUnitComplete(unit.id);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.push(
                      context,
                      AppLessonRoute(
                        page: UnitScreen(
                          course: course,
                          topic: topic,
                          unit: unit,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: done
                            ? AppTheme.success.withOpacity(0.35)
                            : AppTheme.cardBorder,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: done
                                ? AppTheme.success.withOpacity(0.18)
                                : color.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Center(
                            child: done
                                ? Icon(Icons.check_rounded,
                                    size: 16, color: AppTheme.success)
                                : Text(
                                    '${i + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: color,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            unit.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: done
                                  ? AppTheme.textSecondary
                                  : AppTheme.textPrimary,
                              height: 1.3,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 18,
                          color: done
                              ? AppTheme.success.withOpacity(0.7)
                              : AppTheme.textMuted,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
