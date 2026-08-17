import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

/// Simple, calm field picture — only what helps understanding.
class FieldLinesDiagram extends StatelessWidget {
  const FieldLinesDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 130),
      painter: _FieldPainter(),
      child: const SizedBox(height: 130, width: double.infinity),
    );
  }
}

class _FieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w * 0.28;
    final cy = h * 0.45;
    final cx2 = w * 0.72;

    final posPaint = Paint()..color = const Color(0xFF34D399);
    final negPaint = Paint()..color = const Color(0xFFF472B6);
    final linePaint = Paint()
      ..color = AppTheme.accent.withOpacity(0.55)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(cx, cy), 14, posPaint);
    canvas.drawCircle(Offset(cx2, cy), 14, negPaint);

    final tp = TextPainter(textDirection: TextDirection.ltr);
    void t(String s, Offset o, Color c) {
      tp.text = TextSpan(
        text: s,
        style: TextStyle(color: c, fontSize: 13, fontWeight: FontWeight.w700),
      );
      tp.layout();
      tp.paint(canvas, Offset(o.dx - tp.width / 2, o.dy - tp.height / 2));
    }

    t('+', Offset(cx, cy), Colors.white);
    t('−', Offset(cx2, cy), Colors.white);

    // Only 3 clear curves — less visual noise
    for (final i in [-1.0, 0.0, 1.0]) {
      final path = Path();
      path.moveTo(cx + 16, cy + i * 10);
      path.cubicTo(
        w * 0.42, cy + i * 28,
        w * 0.58, cy + i * 28,
        cx2 - 16, cy + i * 10,
      );
      canvas.drawPath(path, linePaint);
    }

    tp.text = TextSpan(
      text: 'Lines leave + and enter −',
      style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
    );
    tp.layout();
    tp.paint(canvas, Offset((w - tp.width) / 2, h - 16));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
