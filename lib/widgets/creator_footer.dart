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

class _CreatorProfileCard extends StatefulWidget {
  const _CreatorProfileCard();

  @override
  State<_CreatorProfileCard> createState() => _CreatorProfileCardState();
}

class _CreatorProfileCardState extends State<_CreatorProfileCard> {
  String? _banner;

  Future<void> _copyHandle() async {
    await Clipboard.setData(const ClipboardData(text: '@iam_tochi'));
    if (!mounted) return;
    setState(() => _banner = 'Copied  @iam_tochi');
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _banner = null);
    });
  }

  Future<void> _openWhatsApp() async {
    await Clipboard.setData(const ClipboardData(text: '@iam_tochi'));
    final uri = Uri.parse('https://wa.me/');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
    if (!mounted) return;
    setState(() => _banner = 'Handle copied — paste in WhatsApp to find @iam_tochi');
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _banner = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.c.brightness == Brightness.dark;
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
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.cardBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          if (_banner != null) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isDark
                    ? AppTheme.success.withOpacity(0.2)
                    : const Color(0xFFE6F7EF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? AppTheme.success.withOpacity(0.45)
                      : const Color(0xFF86D4B0),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded,
                      size: 18,
                      color: isDark ? AppTheme.success : const Color(0xFF0F9F6E)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _banner!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppTheme.textPrimary
                            : const Color(0xFF0B3D2E),
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
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
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Contact on WhatsApp for consultations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Material(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              onTap: _copyHandle,
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '@iam_tochi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                    Icon(Icons.copy_rounded, size: 18, color: AppTheme.primaryLight),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _openWhatsApp,
              icon: const Icon(Icons.chat_rounded, size: 18),
              label: const Text('Open WhatsApp'),
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: AppTheme.textOnPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
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
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return Transform.rotate(
          angle: _c.value * 2 * math.pi,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.primary.withOpacity(0.25),
                  AppTheme.surfaceElevated,
                ],
              ),
              border: Border.all(color: AppTheme.primary.withOpacity(0.35)),
            ),
            child: Icon(Icons.hub_rounded, size: widget.size * 0.42, color: AppTheme.primaryLight),
          ),
        );
      },
    );
  }
}
