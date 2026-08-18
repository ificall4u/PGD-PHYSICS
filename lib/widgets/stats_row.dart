import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class StatsRow extends StatelessWidget {
  final int totalCourses;
  final int totalModules;
  final int totalUnits;
  final int completedUnits;

  const StatsRow({
    super.key,
    required this.totalCourses,
    required this.totalModules,
    required this.totalUnits,
    this.completedUnits = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatChip(
          label: 'Courses',
          value: '$totalCourses',
          color: AppTheme.primary,
        ),
        const SizedBox(width: 10),
        _StatChip(
          label: 'Modules',
          value: '$totalModules',
          color: AppTheme.accent,
        ),
        const SizedBox(width: 10),
        _StatChip(
          label: completedUnits > 0 ? 'Done' : 'Lessons',
          value: completedUnits > 0 ? '$completedUnits' : '$totalUnits',
          color: AppTheme.success,
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.cardBorder),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppTheme.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
