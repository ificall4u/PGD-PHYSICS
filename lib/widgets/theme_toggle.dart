import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_controller.dart';

/// Tiny accessible theme control — cycles System → Light → Dark.
class ThemeToggle extends StatelessWidget {
  final bool compact;
  const ThemeToggle({super.key, this.compact = true});

  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.instance;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IconButton(
          tooltip: 'Theme: ${controller.label} (tap to change)',
          onPressed: () async {
            await controller.cycle();
            final messenger = ScaffoldMessenger.maybeOf(context);
            messenger?.hideCurrentSnackBar();
            messenger?.showSnackBar(
              SnackBar(
                content: Text('Theme: ${controller.label}'),
                duration: const Duration(milliseconds: 900),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          icon: Icon(
            controller.icon,
            size: compact ? 20 : 22,
            color: AppTheme.textSecondary,
          ),
          style: IconButton.styleFrom(
            backgroundColor: AppTheme.surfaceElevated,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            minimumSize: const Size(40, 40),
          ),
        );
      },
    );
  }
}
