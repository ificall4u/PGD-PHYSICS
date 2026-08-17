import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class LogicGateDiagram extends StatelessWidget {
  const LogicGateDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Gate(label: 'AND', symbol: '&', subtitle: 'all HIGH'),
          _Gate(label: 'OR', symbol: '≥1', subtitle: 'any HIGH'),
          _Gate(label: 'NOT', symbol: '1', subtitle: 'flips', invert: true),
          _Gate(label: 'XOR', symbol: '=1', subtitle: 'different'),
        ],
      ),
    );
  }
}

class _Gate extends StatelessWidget {
  final String label;
  final String symbol;
  final String subtitle;
  final bool invert;

  const _Gate({
    required this.label,
    required this.symbol,
    required this.subtitle,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: const Size(56, 48),
          painter: _GateShapePainter(invert: invert),
          child: SizedBox(
            width: 56,
            height: 48,
            child: Center(
              child: Text(
                symbol,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.primaryLight,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
        ),
      ],
    );
  }
}

class _GateShapePainter extends CustomPainter {
  final bool invert;
  _GateShapePainter({this.invert = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary.withOpacity(0.35)
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = AppTheme.primaryLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    // Simple distinctive gate body
    path.moveTo(4, 4);
    path.lineTo(size.width * 0.55, 4);
    path.quadraticBezierTo(size.width - 4, size.height / 2, size.width * 0.55, size.height - 4);
    path.lineTo(4, size.height - 4);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, stroke);

    // Input stubs
    canvas.drawLine(const Offset(0, 14), const Offset(4, 14), stroke);
    canvas.drawLine(Offset(0, size.height - 14), Offset(4, size.height - 14), stroke);
    // Output stub
    canvas.drawLine(
      Offset(size.width * 0.72, size.height / 2),
      Offset(size.width - 2, size.height / 2),
      stroke,
    );

    if (invert) {
      canvas.drawCircle(
        Offset(size.width * 0.78, size.height / 2),
        3.5,
        Paint()..color = AppTheme.background,
      );
      canvas.drawCircle(
        Offset(size.width * 0.78, size.height / 2),
        3.5,
        stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
