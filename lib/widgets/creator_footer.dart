import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// App footer: copyright + WhatsApp creator handle → premium profile card.
class CreatorFooter extends StatelessWidget {
  const CreatorFooter({super.key});

  void _openProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => const _CreatorProfileCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      child: Column(
        children: [
          Divider(color: AppTheme.divider, height: 1),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime.now().year} Tochukwu Victor, BSc',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.textMuted,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _openProfile(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Creator  ·  ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                  ),
                ),
                Text(
                  '@iam_tochi',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryLight,
                    decoration: TextDecoration.underline,
                    decorationColor: AppTheme.primary.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 13,
                  color: AppTheme.primaryLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreatorProfileCard extends StatelessWidget {
  const _CreatorProfileCard();

  Future<void> _copyHandle(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: '@iam_tochi'));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('WhatsApp handle copied: @iam_tochi'),
          backgroundColor: AppTheme.surfaceElevated,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _openWhatsApp(BuildContext context) async {
    // wa.me works with phone numbers; for username-style handles users
    // often share the @ name — copy + try generic WhatsApp open.
    final uri = Uri.parse('https://wa.me/');
    try {
      await Clipboard.setData(const ClipboardData(text: '@iam_tochi'));
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Handle copied — paste in WhatsApp to find @iam_tochi'),
            backgroundColor: AppTheme.surfaceElevated,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      await _copyHandle(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 22),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppTheme.cardBorder),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.12),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.cardBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),

          // Spinning atom avatar
          const _SpinningAtomAvatar(size: 88),
          const SizedBox(height: 16),

          Text(
            'Tochukwu Victor',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'BSc Physics and Astronomy',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryLight,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'University of Nigeria, Nsukka',
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.cardBorder),
            ),
            child: Text(
              'Contact on WhatsApp for consultations — projects, physics tutoring, and related guidance.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Copiable handle
          Material(
            color: AppTheme.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () => _copyHandle(context),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.copy_rounded,
                        size: 16, color: AppTheme.primaryLight),
                    const SizedBox(width: 8),
                    Text(
                      '@iam_tochi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openWhatsApp(context),
              icon: Icon(Icons.chat_rounded, size: 18),
              label: Text('Open WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpinningAtomAvatar extends StatefulWidget {
  final double size;
  const _SpinningAtomAvatar({required this.size});

  @override
  State<_SpinningAtomAvatar> createState() => _SpinningAtomAvatarState();
}

class _SpinningAtomAvatarState extends State<_SpinningAtomAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppTheme.primary.withOpacity(0.25),
              AppTheme.accent.withOpacity(0.15),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: AppTheme.primary.withOpacity(0.45),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: CustomPaint(
          painter: _AtomPainter(),
        ),
      ),
    );
  }
}

class _AtomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final nucleus = Paint()..color = const Color(0xFF7C5CFC);
    final orbit = Paint()
      ..color = const Color(0xFFA78BFA).withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final electron = Paint()..color = const Color(0xFF2EE6D6);

    canvas.drawCircle(c, 6, nucleus);

    for (final angle in [0.0, 1.05, 2.1]) {
      canvas.save();
      canvas.translate(c.dx, c.dy);
      canvas.rotate(angle);
      final rect = Rect.fromCenter(
        center: Offset.zero,
        width: size.width * 0.72,
        height: size.height * 0.32,
      );
      canvas.drawOval(rect, orbit);
      // electron on orbit
      canvas.drawCircle(Offset(size.width * 0.36, 0), 3.2, electron);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
