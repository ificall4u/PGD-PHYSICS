import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'dart:math' as math;

class DecayCurveDiagram extends StatelessWidget {
  const DecayCurveDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 150),
      painter: _DecayPainter(),
      child: const SizedBox(height: 150, width: double.infinity),
    );
  }
}

class _DecayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final left = 36.0;
    final right = w - 16;
    final top = 16.0;
    final bot = h - 28;

    final axis = Paint()
      ..color = AppTheme.textMuted
      ..strokeWidth = 1;
    canvas.drawLine(Offset(left, top), Offset(left, bot), axis);
    canvas.drawLine(Offset(left, bot), Offset(right, bot), axis);

    // Exponential decay curve
    final curve = Paint()
      ..color = AppTheme.primaryLight
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    for (var i = 0; i <= 60; i++) {
      final t = i / 60.0;
      final x = left + t * (right - left);
      final y = bot - (bot - top) * math.exp(-2.2 * t);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, curve);

    // Half-life markers
    final mark = Paint()
      ..color = AppTheme.warning
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // N0/2 line
    final halfY = bot - (bot - top) * 0.5;
    canvas.drawLine(
      Offset(left, halfY),
      Offset(left + (right - left) * 0.32, halfY),
      mark..color = AppTheme.warning.withOpacity(0.5),
    );
    canvas.drawLine(
      Offset(left + (right - left) * 0.32, halfY),
      Offset(left + (right - left) * 0.32, bot),
      mark,
    );

    final tp = TextPainter(textDirection: TextDirection.ltr);
    void label(String s, Offset o, {Color c = AppTheme.textMuted, double fs = 10}) {
      tp.text = TextSpan(
          text: s,
          style: TextStyle(color: c, fontSize: fs, fontWeight: FontWeight.w600));
      tp.layout();
      tp.paint(canvas, o);
    }

    label('N', Offset(8, top), c: AppTheme.textSecondary);
    label('time', Offset(right - 28, bot + 6));
    label('N₀', Offset(left + 4, top + 2), c: AppTheme.primaryLight);
    label('N₀/2', Offset(left + 4, halfY - 12), c: AppTheme.warning);
    label('T½', Offset(left + (right - left) * 0.32 - 8, bot + 6),
        c: AppTheme.warning);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
