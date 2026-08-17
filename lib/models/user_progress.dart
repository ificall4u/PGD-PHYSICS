class UserProgress {
  final String userName;
  int currentStreak;
  int longestStreak;
  DateTime? lastStudyDate;
  int totalUnitsCompleted;
  int totalQuizzesPassed;
  Map<String, UnitProgress> unitProgress; // unitId -> progress
  Set<String> unlockedAchievements;
  String? preferredAiModel; // 'gemini' | 'groq'
  String? apiKey;

  UserProgress({
    this.userName = 'Friend',
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastStudyDate,
    this.totalUnitsCompleted = 0,
    this.totalQuizzesPassed = 0,
    Map<String, UnitProgress>? unitProgress,
    Set<String>? unlockedAchievements,
    this.preferredAiModel = 'gemini',
    this.apiKey,
  })  : unitProgress = unitProgress ?? {},
        unlockedAchievements = unlockedAchievements ?? {};

  void markUnitCompleted(String unitId) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (lastStudyDate == null) {
      currentStreak = 1;
    } else {
      final last = DateTime(
        lastStudyDate!.year,
        lastStudyDate!.month,
        lastStudyDate!.day,
      );
      final difference = today.difference(last).inDays;
      if (difference == 1) {
        currentStreak += 1;
      } else if (difference > 1) {
        currentStreak = 1;
      }
      // same day → streak stays
    }

    if (currentStreak > longestStreak) {
      longestStreak = currentStreak;
    }

    lastStudyDate = now;
    totalUnitsCompleted += 1;

    unitProgress[unitId] = UnitProgress(
      unitId: unitId,
      isCompleted: true,
      completedAt: now,
      quizScore: unitProgress[unitId]?.quizScore,
    );
  }

  void markQuizPassed(String unitId, double score) {
    totalQuizzesPassed += 1;
    final existing = unitProgress[unitId];
    unitProgress[unitId] = UnitProgress(
      unitId: unitId,
      isCompleted: existing?.isCompleted ?? false,
      completedAt: existing?.completedAt,
      quizScore: score,
      isMastered: score >= 0.8,
    );
  }
}

class UnitProgress {
  final String unitId;
  final bool isCompleted;
  final DateTime? completedAt;
  final double? quizScore;
  final bool isMastered;

  UnitProgress({
    required this.unitId,
    this.isCompleted = false,
    this.completedAt,
    this.quizScore,
    this.isMastered = false,
  });
}
