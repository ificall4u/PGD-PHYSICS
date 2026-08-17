class Course {
  final String id;
  final String code; // e.g. PHY 701
  final String title;
  final String description;
  final String semester; // "First Semester" | "Second Semester"
  final int units;
  final List<Topic> topics;
  final String icon; // emoji or asset key
  final ColorHint colorHint;

  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.semester,
    required this.units,
    required this.topics,
    this.icon = '📘',
    this.colorHint = ColorHint.purple,
  });

  int get totalTopics => topics.length;
  int get completedTopics => topics.where((t) => t.isCompleted).length;
  double get progress => totalTopics == 0 ? 0.0 : completedTopics / totalTopics;
}

enum ColorHint { purple, cyan, green, orange, pink }

class Topic {
  final String id;
  final String title;
  final String summary;
  final List<Unit> units;
  bool isCompleted;
  bool isLocked;

  Topic({
    required this.id,
    required this.title,
    required this.summary,
    required this.units,
    this.isCompleted = false,
    this.isLocked = false,
  });

  int get totalUnits => units.length;
  int get completedUnits => units.where((u) => u.isCompleted).length;
  double get progress => totalUnits == 0 ? 0.0 : completedUnits / totalUnits;
}

class Unit {
  final String id;
  final String title;
  final String content; // Markdown + LaTeX friendly
  final List<QuizQuestion> quiz;
  final List<String> keyTakeaways;
  bool isCompleted;
  bool isMastered;

  Unit({
    required this.id,
    required this.title,
    required this.content,
    this.quiz = const [],
    this.keyTakeaways = const [],
    this.isCompleted = false,
    this.isMastered = false,
  });
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}
