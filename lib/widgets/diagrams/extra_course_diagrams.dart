import 'package:flutter/material.dart';

/// Extra offline teaching diagrams for Nova chat (not auto-injected into lesson pages).

class SimpleAxesDiagram extends StatelessWidget {
  const SimpleAxesDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 160), painter: _AxesPainter());
  }
}

class _AxesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final ink = Paint()
      ..color = const Color(0xFF94A3B8)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final bold = Paint()
      ..color = const Color(0xFFA78BFA)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final ox = 36.0, oy = size.height - 28;
    canvas.drawLine(Offset(ox, oy), Offset(size.width - 16, oy), ink);
    canvas.drawLine(Offset(ox, oy), Offset(ox, 16), ink);
    // sample curve y = x^2 style
    final path = Path()..moveTo(ox, oy);
    for (double x = 0; x <= size.width - 60; x += 4) {
      final y = oy - (x * x) / (size.width * 1.2);
      path.lineTo(ox + x, y.clamp(20, oy));
    }
    canvas.drawPath(path, bold);
    _label(canvas, 'x', Offset(size.width - 22, oy + 4));
    _label(canvas, 'y', Offset(ox - 14, 18));
  }

  void _label(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Vector2DDiagram extends StatelessWidget {
  const Vector2DDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 150), painter: _VectorPainter());
  }
}

class _VectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final ink = Paint()
      ..color = const Color(0xFF94A3B8)
      ..strokeWidth = 1.2;
    final v = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final ox = 40.0, oy = size.height - 30;
    canvas.drawLine(Offset(ox, oy), Offset(size.width - 20, oy), ink);
    canvas.drawLine(Offset(ox, oy), Offset(ox, 16), ink);
    final tip = Offset(ox + size.width * 0.45, oy - size.height * 0.55);
    canvas.drawLine(Offset(ox, oy), tip, v);
    // arrow head
    final path = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(tip.dx - 10, tip.dy + 6)
      ..lineTo(tip.dx - 4, tip.dy + 10)
      ..close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF38BDF8));
    // components
    final dash = Paint()
      ..color = const Color(0xFF64748B)
      ..strokeWidth = 1;
    canvas.drawLine(Offset(ox, oy), Offset(tip.dx, oy), dash);
    canvas.drawLine(Offset(tip.dx, oy), tip, dash);
    _t(canvas, 'A⃗', tip + const Offset(6, -8));
    _t(canvas, 'Ax', Offset((ox + tip.dx) / 2, oy + 4));
    _t(canvas, 'Ay', Offset(tip.dx + 4, (oy + tip.dy) / 2));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 11, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WaveDiagram extends StatelessWidget {
  const WaveDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 140), painter: _WavePainter());
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = const Color(0xFF64748B)
      ..strokeWidth = 1;
    final wave = Paint()
      ..color = const Color(0xFF34D399)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final mid = size.height / 2;
    canvas.drawLine(Offset(12, mid), Offset(size.width - 12, mid), axis);
    final path = Path();
    for (double x = 12; x < size.width - 12; x++) {
      final y = mid - 40 * (1.0 * (x / 28).remainder(6.28) - 3.14).abs().clamp(0, 1);
      // sine
      final ys = mid - 36 * _sin((x - 12) / 22);
      if (x == 12) {
        path.moveTo(x, ys);
      } else {
        path.lineTo(x, ys);
      }
    }
    canvas.drawPath(path, wave);
    _t(canvas, 'λ', Offset(size.width * 0.35, mid + 8));
    _t(canvas, 'A', Offset(20, mid - 44));
  }

  double _sin(double x) {
    // approx via dart math free - use series-ish or import
    return _approxSin(x);
  }

  double _approxSin(double x) {
    // normalize
    const pi = 3.14159265;
    x = x % (2 * pi);
    if (x < 0) x += 2 * pi;
    // Taylor-ish limited
    final z = x > pi ? x - 2 * pi : x;
    final z2 = z * z;
    return z * (1 - z2 / 6 + z2 * z2 / 120);
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RlcSeriesDiagram extends StatelessWidget {
  const RlcSeriesDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 100), painter: _RlcPainter());
  }
}

class _RlcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFA78BFA)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final y = size.height / 2;
    double x = 20;
    // battery symbol
    canvas.drawLine(Offset(x, y - 14), Offset(x, y + 14), p);
    canvas.drawLine(Offset(x + 8, y - 8), Offset(x + 8, y + 8), p);
    x += 20;
    canvas.drawLine(Offset(x - 12, y), Offset(x, y), p);
    // R zigzag
    final zig = Path()..moveTo(x, y);
    for (int i = 0; i < 4; i++) {
      zig.lineTo(x + 8, y - 10);
      zig.lineTo(x + 16, y + 10);
      x += 16;
    }
    zig.lineTo(x, y);
    canvas.drawPath(zig, p);
    _t(canvas, 'R', Offset(x - 40, y - 22));
    // L coil
    canvas.drawLine(Offset(x, y), Offset(x + 8, y), p);
    x += 8;
    for (int i = 0; i < 3; i++) {
      canvas.drawArc(Rect.fromLTWH(x, y - 10, 16, 20), 3.14, -3.14, false, p);
      x += 12;
    }
    _t(canvas, 'L', Offset(x - 28, y - 22));
    // C parallel plates
    canvas.drawLine(Offset(x, y), Offset(x + 10, y), p);
    x += 10;
    canvas.drawLine(Offset(x, y - 14), Offset(x, y + 14), p);
    canvas.drawLine(Offset(x + 10, y - 14), Offset(x + 10, y + 14), p);
    _t(canvas, 'C', Offset(x - 2, y - 22));
    canvas.drawLine(Offset(x + 10, y), Offset(size.width - 20, y), p);
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFE2E8F0), fontWeight: FontWeight.w600)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CapacitorResistorDiagram extends StatelessWidget {
  const CapacitorResistorDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 90), painter: _RcPainter());
  }
}

class _RcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final y = size.height / 2;
    double x = 24;
    canvas.drawLine(Offset(x, y), Offset(x + 30, y), p);
    x += 30;
    // R
    final zig = Path()..moveTo(x, y);
    for (int i = 0; i < 3; i++) {
      zig.lineTo(x + 7, y - 9);
      zig.lineTo(x + 14, y + 9);
      x += 14;
    }
    canvas.drawPath(zig, p);
    _t(canvas, 'R', Offset(x - 30, y - 20));
    canvas.drawLine(Offset(x, y), Offset(x + 20, y), p);
    x += 20;
    canvas.drawLine(Offset(x, y - 14), Offset(x, y + 14), p);
    canvas.drawLine(Offset(x + 12, y - 14), Offset(x + 12, y + 14), p);
    _t(canvas, 'C', Offset(x - 2, y - 20));
    canvas.drawLine(Offset(x + 12, y), Offset(size.width - 24, y), p);
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BohrAtomDiagram extends StatelessWidget {
  const BohrAtomDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 160), painter: _BohrPainter());
  }
}

class _BohrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final nucleus = Paint()..color = const Color(0xFFF472B6);
    canvas.drawCircle(c, 8, nucleus);
    final orbit = Paint()
      ..color = const Color(0xFF64748B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final e = Paint()..color = const Color(0xFF38BDF8);
    for (final r in [28.0, 48.0, 68.0]) {
      canvas.drawCircle(c, r, orbit);
    }
    canvas.drawCircle(c + const Offset(28, 0), 4, e);
    canvas.drawCircle(c + const Offset(0, -48), 4, e);
    canvas.drawCircle(c + const Offset(-48, 20), 4, e);
    _t(canvas, 'n=1', c + const Offset(32, -4));
    _t(canvas, 'n=2', c + const Offset(52, -8));
    _t(canvas, 'n=3', c + const Offset(72, -8));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 10, color: Color(0xFFCBD5E1))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PhotoelectricDiagram extends StatelessWidget {
  const PhotoelectricDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 140), painter: _PhotoPainter());
  }
}

class _PhotoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final metal = Paint()..color = const Color(0xFF334155);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(20, 50, 90, 70), const Radius.circular(6)),
      metal,
    );
    _t(canvas, 'metal', const Offset(42, 120));
    // photon
    final photon = Paint()
      ..color = const Color(0xFFFBBF24)
      ..strokeWidth = 2;
    canvas.drawLine(const Offset(160, 30), const Offset(110, 70), photon);
    _t(canvas, 'photon hν', const Offset(120, 24));
    // electron out
    final e = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2;
    canvas.drawLine(const Offset(110, 80), const Offset(180, 50), e);
    canvas.drawCircle(const Offset(180, 50), 4, Paint()..color = const Color(0xFF38BDF8));
    _t(canvas, 'e⁻', const Offset(186, 44));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 11, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PotentialWellDiagram extends StatelessWidget {
  const PotentialWellDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 140), painter: _WellPainter());
  }
}

class _WellPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFA78BFA)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(16, 30)
      ..lineTo(size.width * 0.28, 30)
      ..lineTo(size.width * 0.28, size.height - 30)
      ..lineTo(size.width * 0.72, size.height - 30)
      ..lineTo(size.width * 0.72, 30)
      ..lineTo(size.width - 16, 30);
    canvas.drawPath(path, p);
    _t(canvas, 'V=∞', Offset(size.width * 0.12, 20));
    _t(canvas, 'V=0', Offset(size.width * 0.45, size.height - 22));
    _t(canvas, 'V=∞', Offset(size.width * 0.78, 20));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TransformerDiagram extends StatelessWidget {
  const TransformerDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 120), painter: _XfmrPainter());
  }
}

class _XfmrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFF34D399)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // core
    canvas.drawRect(Rect.fromLTWH(size.width * 0.35, 20, size.width * 0.3, 80), p);
    // coils
    for (int i = 0; i < 4; i++) {
      canvas.drawArc(
        Rect.fromLTWH(size.width * 0.22, 28.0 + i * 16, 40, 18),
        -1.2,
        2.4,
        false,
        p,
      );
      canvas.drawArc(
        Rect.fromLTWH(size.width * 0.62, 28.0 + i * 16, 40, 18),
        1.2,
        2.4,
        false,
        p,
      );
    }
    _t(canvas, 'Np', Offset(size.width * 0.18, 100));
    _t(canvas, 'Ns', Offset(size.width * 0.78, 100));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OpAmpDiagram extends StatelessWidget {
  const OpAmpDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 120), painter: _OpAmpPainter());
  }
}

class _OpAmpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFFB7185)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(size.width * 0.3, 20)
      ..lineTo(size.width * 0.7, size.height / 2)
      ..lineTo(size.width * 0.3, size.height - 20)
      ..close();
    canvas.drawPath(path, p);
    canvas.drawLine(Offset(20, size.height * 0.35), Offset(size.width * 0.3, size.height * 0.35), p);
    canvas.drawLine(Offset(20, size.height * 0.65), Offset(size.width * 0.3, size.height * 0.65), p);
    canvas.drawLine(Offset(size.width * 0.7, size.height / 2), Offset(size.width - 20, size.height / 2), p);
    _t(canvas, '−', Offset(size.width * 0.32, size.height * 0.32));
    _t(canvas, '+', Offset(size.width * 0.32, size.height * 0.62));
    _t(canvas, 'out', Offset(size.width - 40, size.height / 2 - 16));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 14, color: Color(0xFFE2E8F0), fontWeight: FontWeight.w700)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FissionDiagram extends StatelessWidget {
  const FissionDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 130), painter: _FissionPainter());
  }
}

class _FissionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final n = Paint()..color = const Color(0xFF38BDF8);
    final heavy = Paint()..color = const Color(0xFFA78BFA);
    final frag = Paint()..color = const Color(0xFFF472B6);
    canvas.drawCircle(const Offset(40, 65), 6, n);
    _t(canvas, 'n', const Offset(34, 40));
    canvas.drawCircle(const Offset(100, 65), 22, heavy);
    _t(canvas, 'U', const Offset(94, 60));
    // arrow
    final a = Paint()
      ..color = const Color(0xFF94A3B8)
      ..strokeWidth = 2;
    canvas.drawLine(const Offset(130, 65), const Offset(160, 65), a);
    canvas.drawCircle(const Offset(200, 40), 14, frag);
    canvas.drawCircle(const Offset(210, 95), 16, frag);
    canvas.drawCircle(const Offset(250, 50), 5, n);
    canvas.drawCircle(const Offset(255, 90), 5, n);
    _t(canvas, 'fragments + neutrons', const Offset(170, 115));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 11, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LensRayDiagram extends StatelessWidget {
  const LensRayDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 140), painter: _LensPainter());
  }
}

class _LensPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = const Color(0xFF64748B)
      ..strokeWidth = 1;
    final lens = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final ray = Paint()
      ..color = const Color(0xFFFBBF24)
      ..strokeWidth = 1.8;
    final midY = size.height / 2;
    final lx = size.width * 0.5;
    canvas.drawLine(Offset(12, midY), Offset(size.width - 12, midY), axis);
    // lens
    canvas.drawArc(Rect.fromLTWH(lx - 12, 20, 24, size.height - 40), -1.4, 2.8, false, lens);
    canvas.drawArc(Rect.fromLTWH(lx - 12, 20, 24, size.height - 40), 1.74, 2.8, false, lens);
    // rays
    canvas.drawLine(Offset(20, midY - 40), Offset(lx, midY - 40), ray);
    canvas.drawLine(Offset(lx, midY - 40), Offset(size.width - 24, midY + 30), ray);
    canvas.drawLine(Offset(20, midY - 40), Offset(lx, midY), ray);
    canvas.drawLine(Offset(lx, midY), Offset(size.width - 24, midY + 30), ray);
    _t(canvas, 'F', Offset(lx + 30, midY + 6));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BinaryWaveDiagram extends StatelessWidget {
  const BinaryWaveDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 100), painter: _BinaryPainter());
  }
}

class _BinaryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFF34D399)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final bits = [1, 0, 1, 1, 0, 1, 0, 0];
    final w = (size.width - 24) / bits.length;
    final high = 24.0, low = size.height - 24;
    final path = Path()..moveTo(12, bits[0] == 1 ? high : low);
    double x = 12;
    for (final b in bits) {
      final y = b == 1 ? high : low;
      path.lineTo(x, y);
      path.lineTo(x + w, y);
      x += w;
    }
    canvas.drawPath(path, p);
    _t(canvas, '1 0 1 1 0 1 0 0', Offset(12, size.height - 14));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CoordinateSphericalDiagram extends StatelessWidget {
  const CoordinateSphericalDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 150), painter: _SphericalPainter());
  }
}

class _SphericalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width * 0.45, size.height * 0.55);
    final p = Paint()
      ..color = const Color(0xFF64748B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final r = Paint()
      ..color = const Color(0xFFA78BFA)
      ..strokeWidth = 2;
    canvas.drawOval(Rect.fromCenter(center: c, width: 120, height: 70), p);
    canvas.drawLine(c + const Offset(0, -60), c + const Offset(0, 50), p);
    canvas.drawLine(c, c + const Offset(70, -35), r);
    canvas.drawCircle(c + const Offset(70, -35), 3, Paint()..color = const Color(0xFFA78BFA));
    _t(canvas, 'r', c + const Offset(40, -30));
    _t(canvas, 'θ', c + const Offset(12, -18));
    _t(canvas, 'φ', c + const Offset(28, 8));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 13, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HydrogenFuelCellDiagram extends StatelessWidget {
  const HydrogenFuelCellDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 130), painter: _FuelCellPainter());
  }
}

class _FuelCellPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final box = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.25, 30, size.width * 0.5, 70),
        const Radius.circular(8),
      ),
      box,
    );
    _t(canvas, 'H₂ →', Offset(12, 55));
    _t(canvas, '← O₂', Offset(size.width - 50, 55));
    _t(canvas, 'electrolyte', Offset(size.width * 0.38, 58));
    _t(canvas, 'H₂O + electricity', Offset(size.width * 0.32, 110));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 11, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FreeBodyDiagram extends StatelessWidget {
  const FreeBodyDiagram({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(double.infinity, 150), painter: _FbdPainter());
  }
}

class _FbdPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final block = Paint()..color = const Color(0xFF475569);
    final c = Offset(size.width / 2, size.height / 2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(center: c, width: 50, height: 36), const Radius.circular(4)),
      block,
    );
    final f = Paint()
      ..color = const Color(0xFF38BDF8)
      ..strokeWidth = 2.5;
    // weight
    canvas.drawLine(c, c + const Offset(0, 50), f);
    // normal
    canvas.drawLine(c, c + const Offset(0, -50), f);
    // applied
    canvas.drawLine(c, c + const Offset(60, 0), f);
    _t(canvas, 'mg', c + const Offset(6, 40));
    _t(canvas, 'N', c + const Offset(6, -48));
    _t(canvas, 'F', c + const Offset(50, -12));
  }

  void _t(Canvas c, String t, Offset o) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: const TextStyle(fontSize: 12, color: Color(0xFFE2E8F0))),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
