import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/widgets/nova_floating.dart';
import 'package:pgd_physics/theme/theme_aware.dart';
import 'package:pgd_physics/widgets/app_mark.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/services/persona_catalog.dart';
import 'package:pgd_physics/screens/home_screen.dart';
import 'package:pgd_physics/screens/settings_screen.dart';
import 'package:pgd_physics/widgets/persona_unlock_dialog.dart';
import 'package:pgd_physics/utils/page_transitions.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with ThemeAware {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  int _page = 0;

  String _userGender = 'unspecified';
  String _aiGender = 'female';
  String _personalityId = 'patient_professor';

  Future<void> _next() async {
    if (_page == 0) {
      final name = _nameController.text.trim();
      if (name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a nickname to continue'),
            backgroundColor: AppTheme.surfaceElevated,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }
    if (_page < 4) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
      );
    } else {
      await _finish(goToSettings: false);
    }
  }

  Future<void> _finish({required bool goToSettings}) async {
    await StorageService.saveOnboarding(
      nickname: _nameController.text.trim(),
      userGender: _userGender,
      aiGender: _aiGender,
      personalityId: _personalityId,
    );
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      AppPageRoute(
        page: HomeScreen(openSettings: goToSettings),
      ),
      (route) => false,
    );
  }


  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NovaContext.currentPage = 'Onboarding';
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  const AppMark(size: 36, showShadow: false),
                  const SizedBox(width: 12),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${_page + 1} / 5',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (_page + 1) / 5,
                  minHeight: 4,
                  backgroundColor: AppTheme.surfaceElevated,
                  valueColor:
                      const AlwaysStoppedAnimation(AppMark.brandPurple),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  _NicknamePage(controller: _nameController),
                  _GenderPage(
                    title: 'About you',
                    subtitle: 'This helps the app speak to you more naturally.',
                    value: _userGender,
                    onChanged: (v) => setState(() => _userGender = v),
                    options: const [
                      ('female', 'Female'),
                      ('male', 'Male'),
                      ('unspecified', 'Prefer not to say'),
                    ],
                  ),
                  _GenderPage(
                    title: 'Your AI tutor',
                    subtitle:
                        'What gender should your study assistant present as?',
                    value: _aiGender,
                    onChanged: (v) => setState(() => _aiGender = v),
                    options: const [
                      ('female', 'Female'),
                      ('male', 'Male'),
                      ('neutral', 'Neutral'),
                    ],
                  ),
                  _PersonalityPage(
                    selectedId: _personalityId,
                    onSelected: (id) async {
                      final persona = PersonaCatalog.byId(id);
                      final allowed = await showPersonaUnlockDialog(context, persona);
                      if (allowed) setState(() => _personalityId = id);
                    },
                  ),
                  _ReadyPage(
                    nickname: _nameController.text.trim().isEmpty
                        ? 'friend'
                        : _nameController.text.trim(),
                    onLater: () => _finish(goToSettings: false),
                    onCompleteNow: () => _finish(goToSettings: true),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Column(
                children: [
                  if (_page == 3)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'You can change name, gender, and personality anytime in Settings.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textMuted,
                          height: 1.4,
                        ),
                      ),
                    ),
                  if (_page < 4) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _next,
                        child: Text(_page == 3 ? 'Almost done' : 'Continue'),
                      ),
                    ),
                    if (_page > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Text('Back'),
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NicknamePage extends StatelessWidget {
  final TextEditingController controller;
  const _NicknamePage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      children: [
        Text(
          'What should we call you?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your nickname appears in greetings and when your AI tutor talks to you.',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 28),
        TextField(
          controller: controller,
          textCapitalization: TextCapitalization.words,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Nickname',
            hintText: 'e.g. Tochi',
          ),
          onSubmitted: (_) {},
        ),
      ],
    );
  }
}

class _GenderPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final ValueChanged<String> onChanged;
  final List<(String, String)> options;

  const _GenderPage({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        ...options.map((o) {
          final selected = value == o.$1;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: selected
                  ? AppTheme.primary.withOpacity(0.15)
                  : AppTheme.surface,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                onTap: () => onChanged(o.$1),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? AppTheme.primary.withOpacity(0.45)
                          : AppTheme.cardBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selected
                            ? Icons.check_circle_rounded
                            : Icons.circle_outlined,
                        size: 20,
                        color: selected
                            ? AppTheme.primaryLight
                            : AppTheme.textMuted,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        o.$2,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _PersonalityPage extends StatelessWidget {
  final String selectedId;
  final ValueChanged<String> onSelected;

  const _PersonalityPage({
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      children: [
        Text(
          'Tutor personality',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Pick the vibe that helps you study best. You can change this later.',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        ...PersonaCatalog.all.map((p) {
          final selected = selectedId == p.id;
          final locked = p.isLocked && !StorageService.isPersonaUnlocked(p.id);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: selected
                  ? AppTheme.primary.withOpacity(0.14)
                  : AppTheme.surface,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                onTap: () => onSelected(p.id),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? AppTheme.primary.withOpacity(0.45)
                          : AppTheme.cardBorder,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selected
                            ? Icons.check_circle_rounded
                            : locked
                                ? Icons.lock_outline_rounded
                                : Icons.circle_outlined,
                        size: 20,
                        color: selected
                            ? AppTheme.primaryLight
                            : AppTheme.textMuted,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              locked
                                  ? '${p.shortLabel}  · locked'
                                  : p.shortLabel,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              locked
                                  ? 'Protected style — enter access code to unlock'
                                  : p.description,
                              style: TextStyle(
                                fontSize: 12.5,
                                height: 1.4,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}


class _ReadyPage extends StatelessWidget {
  final String nickname;
  final VoidCallback onLater;
  final VoidCallback onCompleteNow;

  const _ReadyPage({
    required this.nickname,
    required this.onLater,
    required this.onCompleteNow,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      children: [
        Text(
          'A few more settings…',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Your own personalized Nova is ready for you, $nickname.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryLight,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'To chat with Nova you will add at least one free API key (from Google, Groq, or similar). '
          'That only takes a minute. You can do it now, or skip and set it up later.',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'You can always change keys, personality, and other preferences in Settings.',
          style: TextStyle(
            fontSize: 13,
            color: AppTheme.textMuted,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onCompleteNow,
            child: Text('Complete AI settings now'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onLater,
            child: Text('I\'ll do this later'),
          ),
        ),
      ],
    );
  }
}
