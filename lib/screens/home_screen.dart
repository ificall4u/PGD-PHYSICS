import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/theme/theme_aware.dart';
import 'package:pgd_physics/utils/page_transitions.dart';
import 'package:pgd_physics/widgets/theme_toggle.dart';
import 'package:pgd_physics/widgets/app_mark.dart';
import 'package:pgd_physics/widgets/creator_footer.dart';
import 'package:pgd_physics/data/sample_courses.dart';
import 'package:pgd_physics/data/program_registry.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:pgd_physics/models/course.dart';
import 'package:pgd_physics/screens/course_detail_screen.dart';
import 'package:pgd_physics/screens/nova_chat_screen.dart';
import 'package:pgd_physics/screens/settings_screen.dart';
import 'package:pgd_physics/screens/unit_screen.dart';
import 'package:pgd_physics/widgets/course_card.dart';
import 'package:pgd_physics/widgets/stats_row.dart';
import 'package:pgd_physics/widgets/streak_banner.dart';

class HomeScreen extends StatefulWidget {
  final bool openSettings;
  const HomeScreen({super.key, this.openSettings = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with ThemeAware {
  @override
  void initState() {
    super.initState();
    if (widget.openSettings) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.of(context).push(
          AppPageRoute(page: const SettingsScreen(openAiSection: true)),
        );
      });
    }
  }

  List<Course> get courses => ProgramRegistry.active.courses;

  @override
  Widget build(BuildContext context) {
    final firstSemester =
        courses.where((c) => c.semester == 'First Semester').toList();
    final secondSemester =
        courses.where((c) => c.semester == 'Second Semester').toList();
    final project =
        courses.where((c) => c.semester == 'Project').toList();

    final totalTopics =
        courses.fold<int>(0, (sum, c) => sum + c.totalTopics);
    final totalUnits = courses.fold<int>(
        0, (sum, c) => sum + c.topics.fold(0, (s, t) => s + t.totalUnits));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            // ── Top bar ──────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 12, 4),
                child: Row(
                  children: [
                    const AppMark(size: 42, showShadow: false),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PGD Physics',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'ABUAD  ·  Learn with Nova',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThemeToggle(),
                    const SizedBox(width: 6),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        AppPageRoute(
                            page: const SettingsScreen()),
                      ),
                      icon: Icon(Icons.settings_outlined,
                          color: AppTheme.textSecondary, size: 22),
                      style: IconButton.styleFrom(
                        backgroundColor: AppTheme.surfaceElevated,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Greeting + smart actions ──────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _greetingTitle(),
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _greetingSubtitle(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _ActionChips(
                      courses: courses,
                      onContinue: _openContinue,
                      onNova: () => Navigator.push(
                        context,
                        AppPageRoute(
                          page: const NovaChatScreen(currentPage: 'Home'),
                        ),
                      ),
                      onBrowse: () {
                        // scroll is natural; chips already list courses below
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ── Streak + stats ───────────────────────────────────────
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: StreakBanner(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: StatsRow(
                  totalCourses: courses.length,
                  totalTopics: totalTopics,
                  totalUnits: totalUnits,
                  completedUnits: StorageService.completedUnitCount(),
                ),
              ),
            ),

            // ── Nova quick access ────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                child: _NovaCard(
                  onTap: () => Navigator.push(
                    context,
                    AppPageRoute(
                      page: const NovaChatScreen(
                        currentPage: 'Home',
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── First Semester ───────────────────────────────────────
            _sectionHeader('First Semester', firstSemester.length),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = firstSemester[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CourseCard(
                        course: course,
                        onTap: () => Navigator.push(
                          context,
                          AppPageRoute(
                            page: CourseDetailScreen(course: course),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: firstSemester.length,
                ),
              ),
            ),

            // ── Second Semester ──────────────────────────────────────
            _sectionHeader('Second Semester', secondSemester.length),
           SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = secondSemester[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CourseCard(
                        course: course,
                        onTap: () => Navigator.push(
                          context,
                          AppPageRoute(
                            page: CourseDetailScreen(course: course),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: secondSemester.length,
                ),
              ),
            ),

            // ── Project ──────────────────────────────────────────────
            if (project.isNotEmpty) _sectionHeader('Research Project', project.length),
            if (project.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final course = project[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CourseCard(
                          course: course,
                          onTap: () => Navigator.push(
                            context,
                            AppPageRoute(
                              page: CourseDetailScreen(course: course),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: project.length,
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: CreatorFooter()),
          ],
        ),
      ),
    );
  }


  String _greetingTitle() {
    final hour = DateTime.now().hour;
    final name = StorageService.getNickname();
    if (hour < 12) return 'Good morning, $name';
    if (hour < 17) return 'Good afternoon, $name';
    return 'Good evening, $name';
  }

  String _greetingSubtitle() {
    final last = StorageService.getLastLesson();
    final streak = StorageService.getStreak();
    if (last != null) {
      return 'Want to continue ${last['unitTitle']}, or try something else?';
    }
    if (streak > 0) {
      return "You're on a $streak-day streak. What feels good today?";
    }
    return "What would you like to do? Your tutor is ready when you are.";
  }

  void _openContinue() {
    final last = StorageService.getLastLesson();
    if (last == null) return;
    Course? course;
    Topic? topic;
    Unit? unit;
    for (final c in courses) {
      if (c.id == last['courseId']) {
        course = c;
        for (final tp in c.topics) {
          if (tp.id == last['topicId']) {
            topic = tp;
            for (final u in tp.units) {
              if (u.id == last['unitId']) {
                unit = u;
                break;
              }
            }
            break;
          }
        }
        break;
      }
    }
    if (course != null && topic != null && unit != null) {
      Navigator.push(
        context,
        AppLessonRoute(
          page: UnitScreen(course: course!, topic: topic!, unit: unit!),
        ),
      );
    }
  }

  Widget _sectionHeader(String title, int count) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$count courses',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NovaCard extends StatelessWidget {
  final VoidCallback onTap;
  const _NovaCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashFactory: InkSplash.splashFactory,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primary.withOpacity(0.18),
                AppTheme.love.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text('💜', style: TextStyle(fontSize: 24)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study with Nova',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Stuck on a step? Nova explains it softly — right here',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: AppTheme.primaryLight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _ActionChips extends StatelessWidget {
  final List<Course> courses;
  final VoidCallback onContinue;
  final VoidCallback onNova;
  final VoidCallback onBrowse;

  const _ActionChips({
    required this.courses,
    required this.onContinue,
    required this.onNova,
    required this.onBrowse,
  });

  @override
  Widget build(BuildContext context) {
    final last = StorageService.getLastLesson();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (last != null)
          _Chip(
            icon: Icons.play_arrow_rounded,
            label: 'Continue',
            primary: true,
            onTap: onContinue,
          ),
        _Chip(
          icon: Icons.auto_awesome_rounded,
          label: 'Study with Nova',
          primary: last == null,
          onTap: onNova,
        ),
        _Chip(
          icon: Icons.menu_book_rounded,
          label: 'Browse courses',
          primary: false,
          onTap: onBrowse,
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool primary;
  final VoidCallback onTap;

  const _Chip({
    required this.icon,
    required this.label,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primary
          ? AppTheme.primary.withOpacity(0.18)
          : AppTheme.surface,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: primary
                  ? AppTheme.primary.withOpacity(0.35)
                  : AppTheme.cardBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: primary ? AppTheme.primaryLight : AppTheme.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primary ? AppTheme.textPrimary : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
