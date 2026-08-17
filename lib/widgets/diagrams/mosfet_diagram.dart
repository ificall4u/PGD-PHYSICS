import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class MosfetDiagram extends StatelessWidget {
  const MosfetDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 150),
      painter: _MosfetPainter(),
      child: const SizedBox(height: 150, width: double.infinity),
    );
  }
}

class _MosfetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final metal = Paint()..color = const Color(0xFF94A3B8).withOpacity(0.5);
    final oxide = Paint()..color = AppTheme.warning.withOpacity(0.35);
    final silicon = Paint()..color = const Color(0xFF3B82F6).withOpacity(0.25);
    final sourceDrain = Paint()..color = const Color(0xFFEF4444).withOpacity(0.35);
    final stroke = Paint()
      ..color = AppTheme.textMuted
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Substrate
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(20, h * 0.55, w - 20, h - 28),
        const Radius.circular(6),
      ),
      silicon,
    );

    // Source / drain regions
    canvas.drawRect(Rect.fromLTRB(28, h * 0.55, w * 0.28, h * 0.72), sourceDrain);
    canvas.drawRect(Rect.fromLTRB(w * 0.72, h * 0.55, w - 28, h * 0.72), sourceDrain);

    // Gate oxide
    canvas.drawRect(Rect.fromLTRB(w * 0.32, h * 0.42, w * 0.68, h * 0.55), oxide);

    // Gate electrode
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(w * 0.36, h * 0.22, w * 0.64, h * 0.42),
        const Radius.circular(4),
      ),
      metal,
    );

    // Channel indicator
    final ch = Paint()
      ..color = AppTheme.accent
      ..strokeWidth = 2;
    canvas.drawLine(Offset(w * 0.30, h * 0.58), Offset(w * 0.70, h * 0.58), ch);

    final tp = TextPainter(textDirection: TextDirection.ltr);
    void label(String s, Offset o, Color c) {
      tp.text = TextSpan(
        text: s,
        style: TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.w600),
      );
      tp.layout();
      tp.paint(canvas, o);
    }

    label('Gate', Offset(w * 0.42, h * 0.26), AppTheme.textPrimary);
    label('oxide', Offset(w * 0.40, h * 0.45), AppTheme.warning);
    label('S', Offset(40, h * 0.58), const Color(0xFFFCA5A5));
    label('D', Offset(w - 48, h * 0.58), const Color(0xFFFCA5A5));
    label('channel', Offset(w * 0.42, h * 0.62), AppTheme.accent);
    label('p-type substrate', Offset(w * 0.35, h - 22), AppTheme.textMuted);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
