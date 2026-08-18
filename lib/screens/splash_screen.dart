import 'package:flutter/material.dart';
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
    // Short splash so the app feels ready quickly
    Future.delayed(const Duration(milliseconds: 700), _goHome);
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
        transitionDuration: const Duration(milliseconds: 180),
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
            const AppMark(size: 92),
            const SizedBox(height: 28),
            Text(
              'PGD Physics',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ABUAD  ·  Learn with Nova',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppTheme.textMuted,
                letterSpacing: 0.25,
              ),
            ),
            const SizedBox(height: 52),
            SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.2,
                color: AppMark.brandPurple.withOpacity(0.75),
                backgroundColor: AppTheme.surfaceElevated,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
