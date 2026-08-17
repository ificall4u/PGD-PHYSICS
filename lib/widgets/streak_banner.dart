import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/services/storage_service.dart';

class StreakBanner extends StatelessWidget {
  const StreakBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final streak = StorageService.getStreak();
    final hasStreak = streak > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: hasStreak
              ? [
                  AppTheme.warning.withOpacity(0.18),
                  AppTheme.primary.withOpacity(0.10),
                ]
              : [
                  AppTheme.surfaceElevated,
                  AppTheme.surfaceElevated,
                ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasStreak
              ? AppTheme.warning.withOpacity(0.35)
              : AppTheme.cardBorder,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: hasStreak
                  ? AppTheme.warning.withOpacity(0.2)
                  : AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                hasStreak ? '🔥' : '🌱',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasStreak ? '$streak day streak' : 'Start your streak today',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: hasStreak ? AppTheme.warning : AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  hasStreak
                      ? 'Show up again tomorrow — small sessions win degrees.'
                      : 'Open one lesson today. Momentum starts tiny.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
