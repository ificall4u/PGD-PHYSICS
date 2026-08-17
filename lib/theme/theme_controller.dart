import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/theme/app_theme.dart';

/// Holds theme preference and resolves effective brightness.
/// Default is system; user can force light or dark.
class ThemeController extends ChangeNotifier {
  ThemeController._();
  static final ThemeController instance = ThemeController._();

  /// "system" | "light" | "dark"
  String _mode = 'system';

  String get mode => _mode;

  ThemeMode get themeMode {
    switch (_mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  bool get isEffectivelyDark {
    if (_mode == 'dark') return true;
    if (_mode == 'light') return false;
    // system
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  Future<void> load() async {
    _mode = StorageService.getThemeMode();
    AppTheme.apply(isEffectivelyDark);
    notifyListeners();
  }

  Future<void> setMode(String mode) async {
    _mode = mode;
    await StorageService.setThemeMode(mode);
    AppTheme.apply(isEffectivelyDark);
    notifyListeners();
  }

  /// Cycle: system → light → dark → system
  Future<void> cycle() async {
    const order = ['system', 'light', 'dark'];
    final i = order.indexOf(_mode);
    await setMode(order[(i + 1) % order.length]);
  }

  /// Called when platform brightness changes (battery saver, schedule, etc.)
  void onPlatformBrightnessChanged() {
    if (_mode == 'system') {
      AppTheme.apply(isEffectivelyDark);
      notifyListeners();
    }
  }

  IconData get icon {
    switch (_mode) {
      case 'light':
        return Icons.light_mode_rounded;
      case 'dark':
        return Icons.dark_mode_rounded;
      default:
        return Icons.brightness_auto_rounded;
    }
  }

  String get label {
    switch (_mode) {
      case 'light':
        return 'Light';
      case 'dark':
        return 'Dark';
      default:
        return 'System';
    }
  }
}
