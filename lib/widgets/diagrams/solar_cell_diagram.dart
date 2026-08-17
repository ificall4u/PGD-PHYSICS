import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class SolarCellDiagram extends StatelessWidget {
  const SolarCellDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 150),
      painter: _SolarPainter(),
      child: const SizedBox(height: 150, width: double.infinity),
    );
  }
}

class _SolarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Sun rays
    final ray = Paint()
      ..color = AppTheme.warning.withOpacity(0.7)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 5; i++) {
      final x = w * 0.2 + i * 12;
      canvas.drawLine(Offset(x, 8), Offset(x + 6, 28), ray);
    }

    // Cell body
    final pSide = Paint()..color = const Color(0xFF3B82F6).withOpacity(0.35);
    final nSide = Paint()..color = const Color(0xFFEF4444).withOpacity(0.3);

    final cellTop = 36.0;
    final cellBot = h - 40;
    final mid = cellTop + (cellBot - cellTop) * 0.4;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(w * 0.15, cellTop, w * 0.85, mid),
        const Radius.circular(6),
      ),
      nSide,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(w * 0.15, mid, w * 0.85, cellBot),
        const Radius.circular(6),
      ),
      pSide,
    );

    // Junction line
    final j = Paint()
      ..color = AppTheme.warning
      ..strokeWidth = 2;
    canvas.drawLine(Offset(w * 0.15, mid), Offset(w * 0.85, mid), j);

    // Electron / hole arrows
    final ePaint = Paint()
      ..color = AppTheme.accent
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    // electron up
    canvas.drawLine(Offset(w * 0.35, mid + 16), Offset(w * 0.35, mid - 16), ePaint);
    canvas.drawLine(Offset(w * 0.35, mid - 16), Offset(w * 0.35 - 5, mid - 8), ePaint);
    canvas.drawLine(Offset(w * 0.35, mid - 16), Offset(w * 0.35 + 5, mid - 8), ePaint);

    // hole down
    final hPaint = Paint()
      ..color = const Color(0xFFF472B6)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(w * 0.65, mid - 16), Offset(w * 0.65, mid + 16), hPaint);
    canvas.drawLine(Offset(w * 0.65, mid + 16), Offset(w * 0.65 - 5, mid + 8), hPaint);
    canvas.drawLine(Offset(w * 0.65, mid + 16), Offset(w * 0.65 + 5, mid + 8), hPaint);

    final tp = TextPainter(textDirection: TextDirection.ltr);
    void label(String s, Offset o, Color c, {double fs = 11}) {
      tp.text = TextSpan(
          text: s,
          style: TextStyle(color: c, fontSize: fs, fontWeight: FontWeight.w600));
      tp.layout();
      tp.paint(canvas, o);
    }

    label('light', Offset(w * 0.2 + 50, 10), AppTheme.warning);
    label('n', Offset(w * 0.18, cellTop + 8), const Color(0xFFFCA5A5));
    label('p', Offset(w * 0.18, cellBot - 18), const Color(0xFF93C5FD));
    label('e−', Offset(w * 0.35 + 8, mid - 20), AppTheme.accent, fs: 10);
    label('hole', Offset(w * 0.65 + 8, mid + 8), const Color(0xFFF472B6), fs: 10);
    label('Built-in field separates charges → current', Offset(w * 0.15, h - 22),
        AppTheme.textMuted, fs: 10);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
