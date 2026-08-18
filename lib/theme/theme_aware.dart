import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/theme_controller.dart';
import 'package:pgd_physics/theme/app_theme.dart';

/// Mix into State classes so AppTheme.* static colors refresh immediately on toggle.
mixin ThemeAware<T extends StatefulWidget> on State<T> {
  void _onTheme() {
    if (!mounted) return;
    AppTheme.apply(ThemeController.instance.isEffectivelyDark);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ThemeController.instance.addListener(_onTheme);
  }

  @override
  void dispose() {
    ThemeController.instance.removeListener(_onTheme);
    super.dispose();
  }
}

/// Wrap StatelessWidget builds so they repaint with theme.
class ThemeAwareBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const ThemeAwareBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        AppTheme.apply(ThemeController.instance.isEffectivelyDark);
        return builder(context);
      },
    );
  }
}
