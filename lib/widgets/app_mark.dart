import 'package:flutter/material.dart';

/// Canonical PGD Physics mark — purple tile + graduation cap.
/// Used on splash, home header, and anywhere the brand appears.
class AppMark extends StatelessWidget {
  final double size;
  final bool showShadow;

  const AppMark({
    super.key,
    this.size = 88,
    this.showShadow = true,
  });

  /// Exact brand purple (aligned with Base44 identity)
  static const Color brandPurple = Color(0xFF7C5CFC);
  static const Color brandPurpleDeep = Color(0xFF6D4AE8);

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.25; // continuous ~25% corner
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [brandPurple, brandPurpleDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: brandPurple.withOpacity(0.35),
                  blurRadius: size * 0.28,
                  offset: Offset(0, size * 0.1),
                ),
              ]
            : null,
      ),
      child: Icon(
        Icons.school_rounded,
        size: size * 0.48,
        color: Colors.white,
      ),
    );
  }
}
