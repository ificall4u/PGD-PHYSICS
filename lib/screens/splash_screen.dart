import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/widgets/app_mark.dart';
import 'package:pgd_physics/screens/home_screen.dart';
import 'package:pgd_physics/screens/onboarding_screen.dart';
import 'package:pgd_physics/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2300), _goHome);
  }

  void _goHome() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => StorageService.hasCompletedOnboarding()
            ? const HomeScreen()
            : const OnboardingScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 650),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppMark(size: 92)
                .animate()
                .fadeIn(duration: 520.ms, curve: Curves.easeOut)
                .scale(
                  begin: const Offset(0.88, 0.88),
                  end: const Offset(1, 1),
                  duration: 620.ms,
                  curve: Curves.easeOutBack,
                ),
            const SizedBox(height: 28),
            Text(
              'PGD Physics',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                letterSpacing: -0.6,
              ),
            )
                .animate()
                .fadeIn(delay: 280.ms, duration: 500.ms)
                .slideY(begin: 0.18, end: 0, delay: 280.ms, duration: 500.ms),
            const SizedBox(height: 8),
            Text(
              'ABUAD  ·  Learn with Nova',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppTheme.textMuted,
                letterSpacing: 0.25,
              ),
            )
                .animate()
                .fadeIn(delay: 480.ms, duration: 500.ms),
            const SizedBox(height: 52),
            SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.2,
                color: AppMark.brandPurple.withOpacity(0.75),
                backgroundColor: AppTheme.surfaceElevated,
              ),
            )
                .animate()
                .fadeIn(delay: 750.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}
