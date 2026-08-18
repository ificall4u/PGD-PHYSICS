import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_controller.dart';
import 'package:pgd_physics/screens/splash_screen.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await StorageService.init();
  await ThemeController.instance.load();
  // Local notifications only if user already opted in
  if (StorageService.notificationsEnabled()) {
    await NotificationService.init();
    await NotificationService.scheduleDailyStudyReminder();
  }
  _syncSystemUi(ThemeController.instance.isEffectivelyDark);

  runApp(
    const ProviderScope(
      child: PgdPhysicsApp(),
    ),
  );
}

void _syncSystemUi(bool dark) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          dark ? AppColors.dark.background : AppColors.light.background,
      systemNavigationBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
    ),
  );
}

class PgdPhysicsApp extends StatefulWidget {
  const PgdPhysicsApp({super.key});

  @override
  State<PgdPhysicsApp> createState() => _PgdPhysicsAppState();
}

class _PgdPhysicsAppState extends State<PgdPhysicsApp>
    with WidgetsBindingObserver {
  final _theme = ThemeController.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _theme.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _theme.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    _syncSystemUi(_theme.isEffectivelyDark);
    setState(() {});
  }

  @override
  void didChangePlatformBrightness() {
    // Battery saver / scheduled dark mode / OS theme change
    _theme.onPlatformBrightnessChanged();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild every theme change so screens using AppTheme.* static colors refresh immediately
    return ListenableBuilder(
      listenable: _theme,
      builder: (context, _) {
        final dark = _theme.isEffectivelyDark;
        AppTheme.apply(dark);
        return MaterialApp(
          title: 'PGD Physics',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _theme.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
