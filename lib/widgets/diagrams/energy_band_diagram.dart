import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';

class EnergyBandDiagram extends StatelessWidget {
  const EnergyBandDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 170,
      child: Row(
        children: [
          Expanded(child: _BandColumn(title: 'Metal', gap: 0, fillTop: true)),
          Expanded(child: _BandColumn(title: 'Semiconductor', gap: 28)),
          Expanded(child: _BandColumn(title: 'Insulator', gap: 56)),
        ],
      ),
    );
  }
}

class _BandColumn extends StatelessWidget {
  final String title;
  final double gap;
  final bool fillTop;

  const _BandColumn({
    required this.title,
    required this.gap,
    this.fillTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: CustomPaint(
              painter: _BandPainter(gap: gap, fillTop: fillTop),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BandPainter extends CustomPainter {
  final double gap;
  final bool fillTop;

  _BandPainter({required this.gap, this.fillTop = false});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final valenceH = (h - gap) / 2;
    final condTop = valenceH + gap;

    final valence = Paint()..color = const Color(0xFF3B82F6).withOpacity(0.45);
    final conduction = Paint()..color = const Color(0xFF34D399).withOpacity(0.4);
    final gapPaint = Paint()..color = AppTheme.warning.withOpacity(0.15);

    // Valence band
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(4, h - valenceH, w - 4, h - 2),
        const Radius.circular(4),
      ),
      valence,
    );

    // Gap
    if (gap > 4) {
      canvas.drawRect(Rect.fromLTRB(4, valenceH, w - 4, condTop), gapPaint);
    }

    // Conduction band
    if (fillTop || gap < h * 0.4) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(4, 2, w - 4, condTop > 2 ? condTop : h * 0.45),
          const Radius.circular(4),
        ),
        conduction,
      );
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(4, 2, w - 4, valenceH * 0.7),
          const Radius.circular(4),
        ),
        conduction,
      );
    }

    final tp = TextPainter(textDirection: TextDirection.ltr);
    if (gap > 20) {
      tp.text = TextSpan(
        text: 'gap',
        style: TextStyle(color: AppTheme.warning.withOpacity(0.9), fontSize: 9),
      );
      tp.layout();
      tp.paint(canvas, Offset((w - tp.width) / 2, valenceH + gap / 2 - 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
