import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgd_physics/models/course.dart';

/// Design tokens — dark and light are designed separately, not inverted copies.
class AppColors {
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceHighlight;
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color accent;
  final Color accentSoft;
  final Color success;
  final Color warning;
  final Color error;
  final Color love;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textOnPrimary;
  final Color border;
  final Color cardBorder;
  final Color divider;
  final Brightness brightness;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceHighlight,
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.accent,
    required this.accentSoft,
    required this.success,
    required this.warning,
    required this.error,
    required this.love,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textOnPrimary,
    required this.border,
    required this.cardBorder,
    required this.divider,
    required this.brightness,
  });

  /// Dark: deep navy-black, soft violet, high comfort for long night sessions.
  static const dark = AppColors(
    background: Color(0xFF080B12),
    surface: Color(0xFF0F141F),
    surfaceElevated: Color(0xFF171D2B),
    surfaceHighlight: Color(0xFF1F2740),
    primary: Color(0xFF7C5CFC),
    primaryLight: Color(0xFFA78BFA),
    primaryDark: Color(0xFF6D4AE8),
    accent: Color(0xFF2EE6D6),
    accentSoft: Color(0xFF7AF0E6),
    success: Color(0xFF3DDB9A),
    warning: Color(0xFFFFC14D),
    error: Color(0xFFFF6B7A),
    love: Color(0xFFFF7AB8),
    textPrimary: Color(0xFFF4F6FB),
    textSecondary: Color(0xFF9AA3B5),
    textMuted: Color(0xFF6B7385),
    textOnPrimary: Color(0xFFFFFFFF),
    border: Color(0xFF1A2030),
    cardBorder: Color(0xFF252D40),
    divider: Color(0xFF1A2030),
    brightness: Brightness.dark,
  );

  /// Light: warm paper white, deeper violet for contrast, crisp academic feel.
  static const light = AppColors(
    background: Color(0xFFF7F5FB),
    surface: Color(0xFFFFFFFF),
    surfaceElevated: Color(0xFFF0ECF8),
    surfaceHighlight: Color(0xFFE6E0F4),
    primary: Color(0xFF5B35D5),
    primaryLight: Color(0xFF7C5CFC),
    primaryDark: Color(0xFF4520B0),
    accent: Color(0xFF0D9B8F),
    accentSoft: Color(0xFF14B8A6),
    success: Color(0xFF0F9F6E),
    warning: Color(0xFFD97706),
    error: Color(0xFFDC2646),
    love: Color(0xFFDB2777),
    textPrimary: Color(0xFF14121F),
    textSecondary: Color(0xFF5C5670),
    textMuted: Color(0xFF8B849C),
    textOnPrimary: Color(0xFFFFFFFF),
    border: Color(0xFFE5E0EF),
    cardBorder: Color(0xFFDDD6EB),
    divider: Color(0xFFEAE6F2),
    brightness: Brightness.light,
  );

  Color courseColor(ColorHint hint) {
    if (brightness == Brightness.dark) {
      switch (hint) {
        case ColorHint.purple:
          return const Color(0xFF7C5CFC);
        case ColorHint.cyan:
          return const Color(0xFF2EE6D6);
        case ColorHint.green:
          return const Color(0xFF3DDB9A);
        case ColorHint.orange:
          return const Color(0xFFFF9F43);
        case ColorHint.pink:
          return const Color(0xFFFF7AB8);
      }
    } else {
      // Light mode: deeper, inkier accents so they stay readable on white
      switch (hint) {
        case ColorHint.purple:
          return const Color(0xFF5B35D5);
        case ColorHint.cyan:
          return const Color(0xFF0D9B8F);
        case ColorHint.green:
          return const Color(0xFF0F9F6E);
        case ColorHint.orange:
          return const Color(0xFFC2410C);
        case ColorHint.pink:
          return const Color(0xFFDB2777);
      }
    }
  }
}

/// Runtime theme access + ThemeData builders.
class AppTheme {
  /// Active palette — updated when user toggles mode.
  static AppColors c = AppColors.dark;

  // Convenience getters so existing `AppTheme.primary` calls keep working
  static Color get background => c.background;
  static Color get surface => c.surface;
  static Color get surfaceElevated => c.surfaceElevated;
  static Color get surfaceHighlight => c.surfaceHighlight;
  static Color get primary => c.primary;
  static Color get primaryLight => c.primaryLight;
  static Color get primaryDark => c.primaryDark;
  static Color get accent => c.accent;
  static Color get accentSoft => c.accentSoft;
  static Color get success => c.success;
  static Color get warning => c.warning;
  static Color get error => c.error;
  static Color get love => c.love;
  static Color get textPrimary => c.textPrimary;
  static Color get textSecondary => c.textSecondary;
  static Color get textMuted => c.textMuted;
  static Color get textOnPrimary => c.textOnPrimary;
  static Color get border => c.border;
  static Color get cardBorder => c.cardBorder;
  static Color get divider => c.divider;

  static Color courseColor(ColorHint hint) => c.courseColor(hint);

  static void apply(bool isDark) {
    c = isDark ? AppColors.dark : AppColors.light;
  }

  static ThemeData get darkTheme => _build(AppColors.dark);
  static ThemeData get lightTheme => _build(AppColors.light);

  static ThemeData _build(AppColors colors) {
    final isDark = colors.brightness == Brightness.dark;

    // Dark: slightly larger body + more line height for night reading comfort
    // Light: slightly tighter, inkier — paper-like academic density
    final bodySize = isDark ? 16.0 : 15.5;
    final bodyHeight = isDark ? 1.7 : 1.65;
    final titleWeight = isDark ? FontWeight.w700 : FontWeight.w700;

    TextStyle jakarta({
      double size = 14,
      FontWeight weight = FontWeight.w400,
      Color? color,
      double height = 1.4,
      double letterSpacing = 0,
    }) {
      return GoogleFonts.plusJakartaSans(
        fontSize: size,
        fontWeight: weight == FontWeight.w700 ? FontWeight.w700 : weight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      );
    }

    return ThemeData(
      useMaterial3: true,
      brightness: colors.brightness,
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      colorScheme: ColorScheme(
        brightness: colors.brightness,
        primary: colors.primary,
        onPrimary: colors.textOnPrimary,
        secondary: colors.accent,
        onSecondary: isDark ? Colors.black : Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        error: colors.error,
        onError: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: jakarta(
          size: isDark ? 32 : 30,
          weight: FontWeight.w700,
          color: colors.textPrimary,
          height: 1.15,
          letterSpacing: -0.7,
        ),
        displayMedium: jakarta(
          size: isDark ? 26 : 24,
          weight: FontWeight.w700,
          color: colors.textPrimary,
          height: 1.2,
          letterSpacing: -0.5,
        ),
        headlineMedium: jakarta(
          size: 20,
          weight: FontWeight.w600,
          color: colors.textPrimary,
          height: 1.25,
          letterSpacing: -0.3,
        ),
        titleLarge: jakarta(
          size: 17,
          weight: FontWeight.w600,
          color: colors.textPrimary,
          height: 1.3,
        ),
        titleMedium: jakarta(
          size: 15,
          weight: FontWeight.w600,
          color: colors.textPrimary,
          height: 1.3,
        ),
        titleSmall: jakarta(
          size: 13,
          weight: FontWeight.w600,
          color: colors.textSecondary,
          height: 1.3,
        ),
        bodyLarge: jakarta(
          size: bodySize,
          weight: FontWeight.w400,
          color: colors.textPrimary,
          height: bodyHeight,
        ),
        bodyMedium: jakarta(
          size: 14,
          weight: FontWeight.w400,
          color: colors.textSecondary,
          height: isDark ? 1.6 : 1.55,
        ),
        bodySmall: jakarta(
          size: 12.5,
          weight: FontWeight.w400,
          color: colors.textMuted,
          height: 1.5,
        ),
        labelLarge: jakarta(
          size: 14,
          weight: FontWeight.w600,
          color: colors.textPrimary,
        ),
        labelMedium: jakarta(
          size: 12,
          weight: FontWeight.w500,
          color: colors.textSecondary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: jakarta(
          size: 17,
          weight: FontWeight.w600,
          color: colors.textPrimary,
        ),
        iconTheme: IconThemeData(color: colors.textPrimary, size: 22),
      ),
      cardTheme: CardTheme(
        color: colors.surface,
        elevation: isDark ? 0 : 0.5,
        shadowColor: isDark ? Colors.transparent : colors.primary.withOpacity(0.06),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colors.cardBorder, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.textOnPrimary,
          elevation: isDark ? 0 : 1,
          shadowColor: colors.primary.withOpacity(isDark ? 0 : 0.25),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: jakarta(size: 14, weight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          side: BorderSide(color: colors.cardBorder),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: jakarta(size: 14, weight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primaryLight,
          textStyle: jakarta(size: 14, weight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: jakarta(size: 14, color: colors.textMuted),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceElevated,
        selectedColor: colors.primary.withOpacity(isDark ? 0.22 : 0.14),
        labelStyle: jakarta(size: 12, weight: FontWeight.w500, color: colors.textSecondary),
        side: BorderSide(color: colors.cardBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      dividerTheme: DividerThemeData(color: colors.divider, thickness: 1, space: 1),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? colors.surfaceElevated : colors.textPrimary,
        contentTextStyle: jakarta(
          color: isDark ? colors.textPrimary : colors.surface,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.surfaceElevated,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.primary;
          return colors.textMuted;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary.withOpacity(0.35);
          }
          return colors.surfaceElevated;
        }),
      ),
    );
  }
}
