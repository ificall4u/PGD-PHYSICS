import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_aware.dart';
import 'package:pgd_physics/theme/theme_controller.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/services/persona_catalog.dart';
import 'package:pgd_physics/services/notification_service.dart';
import 'package:pgd_physics/services/ai_providers.dart';
import 'package:pgd_physics/widgets/creator_footer.dart';
import 'package:pgd_physics/widgets/persona_unlock_dialog.dart';

class SettingsScreen extends StatefulWidget {
  /// When true, scroll toward AI providers after open (e.g. from onboarding).
  final bool openAiSection;
  const SettingsScreen({super.key, this.openAiSection = false});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with ThemeAware {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aiSectionKey = GlobalKey();
  bool _didScrollToAi = false;
  final TextEditingController _nickController = TextEditingController();
  final Map<String, TextEditingController> _keyControllers = {};
  final Map<String, bool> _keyVisible = {};
  final Map<String, bool> _guideOpen = {};
  String _preferredProvider = 'auto';

  @override
  void initState() {
    super.initState();
    _nickController.text = StorageService.getNickname();
    _preferredProvider = StorageService.getPreferredProvider();
    for (final p in AiProviders.all) {
      _keyControllers[p.id.name] = TextEditingController(
        text: StorageService.getProviderKey(p.id.name) ?? '',
      );
      _keyVisible[p.id.name] = false;
      _guideOpen[p.id.name] = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _nickController.dispose();
    for (final c in _keyControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.openAiSection && !_didScrollToAi) {
      _didScrollToAi = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        if (!mounted) return;
        final ctx = _aiSectionKey.currentContext;
        if (ctx != null) {
          await Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            alignment: 0.02,
          );
        }
      });
    }
  }

  Future<void> _saveKeys() async {
    for (final p in AiProviders.all) {
      await StorageService.saveProviderKey(
        p.id.name,
        _keyControllers[p.id.name]?.text ?? '',
      );
    }
    await StorageService.setPreferredProvider(_preferredProvider);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Saved, ${StorageService.getNickname()}. Nova can use your keys now.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeController.instance;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: AnimatedBuilder(
        animation: theme,
        builder: (context, _) {
          return ListView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
            children: [
              // Appearance
              _sectionLabel('Appearance'),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.cardBorder),
                ),
                child: Row(
                  children: [
                    _ModeChip(
                      label: 'System',
                      icon: Icons.brightness_auto_rounded,
                      selected: theme.mode == 'system',
                      onTap: () => theme.setMode('system'),
                    ),
                    _ModeChip(
                      label: 'Light',
                      icon: Icons.light_mode_rounded,
                      selected: theme.mode == 'light',
                      onTap: () => theme.setMode('light'),
                    ),
                    _ModeChip(
                      label: 'Dark',
                      icon: Icons.dark_mode_rounded,
                      selected: theme.mode == 'dark',
                      onTap: () => theme.setMode('dark'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                theme.mode == 'system'
                    ? 'Following your phone. Battery saver or schedule dark mode will follow — unless you force Light or Dark.'
                    : 'Forced ${theme.label} mode. Tap System to follow the phone again.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.textMuted,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 28),
              _sectionLabel('Your profile'),
              const SizedBox(height: 10),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nickController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(labelText: 'Nickname'),
                      onSubmitted: (v) async {
                        if (v.trim().isEmpty) return;
                        await StorageService.setNickname(v.trim());
                        if (mounted) setState(() {});
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final e in [
                          ('female', 'Female'),
                          ('male', 'Male'),
                          ('unspecified', 'Prefer not to say'),
                        ])
                          ChoiceChip(
                            label: Text(e.$2),
                            selected: StorageService.getUserGender() == e.$1,
                            onSelected: (_) async {
                              await StorageService.setUserGender(e.$1);
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Tutor gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final e in [
                          ('female', 'Female'),
                          ('male', 'Male'),
                          ('neutral', 'Neutral'),
                        ])
                          ChoiceChip(
                            label: Text(e.$2),
                            selected: StorageService.getAiGender() == e.$1,
                            onSelected: (_) async {
                              await StorageService.setAiGender(e.$1);
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Tutor personality (all named Nova)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...PersonaCatalog.all.map((persona) {
                      final sel =
                          StorageService.getAiPersonalityId() == persona.id;
                      final locked = persona.isLocked &&
                          !StorageService.isPersonaUnlocked(persona.id);
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          locked
                              ? 'Nova · ${persona.shortLabel}  🔒'
                              : 'Nova · ${persona.shortLabel}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          locked
                              ? 'Protected style — requires access code'
                              : persona.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textMuted,
                          ),
                        ),
                        trailing: Icon(
                          sel
                              ? Icons.check_circle_rounded
                              : locked
                                  ? Icons.lock_outline_rounded
                                  : Icons.circle_outlined,
                          color: sel
                              ? AppTheme.primaryLight
                              : AppTheme.textMuted,
                          size: 20,
                        ),
                        onTap: () async {
                          final allowed =
                              await showPersonaUnlockDialog(context, persona);
                          if (!allowed) return;
                          await StorageService.setAiPersonalityId(persona.id);
                          if (mounted) setState(() {});
                        },
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              _sectionLabel('Study reminders'),
              const SizedBox(height: 10),
              _card(
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Gentle daily nudge',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    'Around 7 PM — continue a lesson or say hi to Nova. Easy to turn off.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                      height: 1.35,
                    ),
                  ),
                  value: StorageService.notificationsEnabled(),
                  activeColor: AppTheme.primary,
                  onChanged: (v) async {
                    await NotificationService.setEnabled(v);
                    setState(() {});
                  },
                ),
              ),

              const SizedBox(height: 28),
              KeyedSubtree(key: _aiSectionKey, child: _sectionLabel('AI providers (BYOK)')),
              const SizedBox(height: 8),
              Text(
                'Keys stay on this phone. Requests go straight to the provider — no app server. '
                'If one key hits a limit, Nova tries the next automatically.',
                style: TextStyle(
                  fontSize: 12.5,
                  color: AppTheme.textSecondary,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 12),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferred provider',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _preferredProvider,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'auto', child: Text('Auto (smart fallback)')),
                        DropdownMenuItem(
                            value: 'gemini', child: Text('Google Gemini first')),
                        DropdownMenuItem(
                            value: 'groq', child: Text('Groq first')),
                        DropdownMenuItem(
                            value: 'openrouter',
                            child: Text('OpenRouter first')),
                        DropdownMenuItem(
                            value: 'cerebras', child: Text('Cerebras first')),
                      ],
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => _preferredProvider = v);
                      },
                    ),
                    const SizedBox(height: 16),
                    ...AiProviders.all.map(_providerKeyTile),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saveKeys,
                        child: Text('Save AI keys'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              _sectionLabel('About'),
              const SizedBox(height: 10),
              _card(
                child: Text(
                  'PGD Physics\nABUAD Postgraduate Diploma companion.\n'
                  'Your AI tutor knows the page you\'re on and follows your chosen Nova personality.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    height: 1.55,
                    fontSize: 13.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CreatorFooter(),
            ],
          );
        },
      ),
    );
  }

  Widget _providerKeyTile(AiProviderInfo p) {
    final id = p.id.name;
    final open = _guideOpen[id] ?? false;
    final visible = _keyVisible[id] ?? false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p.displayName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _keyControllers[id],
            obscureText: !visible,
            decoration: InputDecoration(
              labelText: 'API key',
              hintText: 'Paste key',
              suffixIcon: IconButton(
                tooltip: visible ? 'Hide' : 'Show',
                icon: Icon(
                  visible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                ),
                onPressed: () =>
                    setState(() => _keyVisible[id] = !visible),
              ),
            ),
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: () => setState(() => _guideOpen[id] = !open),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(
                    open ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                    color: AppTheme.primaryLight,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'How to get your key?',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (open)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.surfaceElevated,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < p.howToSteps.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        '${i + 1}. ${p.howToSteps[i]}',
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.4,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  const SizedBox(height: 4),
                  TextButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(p.docsUrl);
                      try {
                        final ok = await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                        if (!ok && mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not open ${p.docsUrl}'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      } catch (_) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not open browser. Visit: ${p.docsUrl}'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                    icon: Icon(Icons.open_in_new, size: 16),
                    label: Text('Open site'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppTheme.textMuted,
          letterSpacing: 0.3,
        ),
      );

  Widget _card({required Widget child}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.cardBorder),
        ),
        child: child,
      );
}

class _ModeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ModeChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: selected
            ? AppTheme.primary.withOpacity(0.18)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(11),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(11),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: selected
                      ? AppTheme.primaryLight
                      : AppTheme.textMuted,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? AppTheme.textPrimary
                        : AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
