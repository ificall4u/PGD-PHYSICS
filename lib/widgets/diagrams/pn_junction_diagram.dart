import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class PnJunctionDiagram extends StatelessWidget {
  const PnJunctionDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 160),
      painter: _PnPainter(),
      child: const SizedBox(height: 160, width: double.infinity),
    );
  }
}

class _PnPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final mid = w * 0.5;
    final top = 28.0;
    final bot = h - 36;

    // p-side background
    final pPaint = Paint()..color = const Color(0xFF3B82F6).withOpacity(0.25);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(12, top, mid - 2, bot),
        const Radius.circular(10),
      ),
      pPaint,
    );

    // n-side background
    final nPaint = Paint()..color = const Color(0xFFEF4444).withOpacity(0.22);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(mid + 2, top, w - 12, bot),
        const Radius.circular(10),
      ),
      nPaint,
    );

    // Depletion region
    final depPaint = Paint()..color = const Color(0xFFFBBF24).withOpacity(0.35);
    canvas.drawRect(Rect.fromLTRB(mid - 18, top, mid + 18, bot), depPaint);

    // Depletion border lines
    final line = Paint()
      ..color = AppTheme.warning
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(mid - 18, top), Offset(mid - 18, bot), line);
    canvas.drawLine(Offset(mid + 18, top), Offset(mid + 18, bot), line);

    // Labels
    final tp = TextPainter(textDirection: TextDirection.ltr);

    void label(String text, Offset pos, Color c, {double size = 13}) {
      tp.text = TextSpan(
        text: text,
        style: TextStyle(
          color: c,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
      );
      tp.layout();
      tp.paint(canvas, pos);
    }

    label('p-type', Offset(w * 0.18, top + 12), const Color(0xFF93C5FD));
    label('holes (+)', Offset(w * 0.15, top + 32), AppTheme.textMuted, size: 11);

    label('n-type', Offset(w * 0.68, top + 12), const Color(0xFFFCA5A5));
    label('electrons (−)', Offset(w * 0.62, top + 32), AppTheme.textMuted, size: 11);

    label('depletion', Offset(mid - 28, bot - 22), AppTheme.warning, size: 11);
    label('region', Offset(mid - 18, bot - 10), AppTheme.warning, size: 11);

    // Built-in field arrow
    final arrowPaint = Paint()
      ..color = AppTheme.accent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final ay = h * 0.55;
    canvas.drawLine(Offset(mid + 40, ay), Offset(mid - 40, ay), arrowPaint);
    // arrow head
    canvas.drawLine(Offset(mid - 40, ay), Offset(mid - 30, ay - 6), arrowPaint);
    canvas.drawLine(Offset(mid - 40, ay), Offset(mid - 30, ay + 6), arrowPaint);
    label('E field', Offset(mid - 18, ay - 18), AppTheme.accent, size: 10);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
