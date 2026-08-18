/// Curriculum model for PGD Physics.
/// Hierarchy: Course → Module → Unit (lesson) → QuizQuestion
class Course {
  final String id;
  final String code; // e.g. PHY 701
  final String title;
  final String description;
  final String semester; // "First Semester" | "Second Semester" | "Project"
  final int units; // credit units
  final List<Module> modules;
  final String icon;
  final ColorHint colorHint;

  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.semester,
    required this.units,
    required this.modules,
    this.icon = '📘',
    this.colorHint = ColorHint.purple,
  });

  /// Backward-friendly alias used in a few call sites during migration.
  List<Module> get topics => modules;

  int get totalModules => modules.length;
  int get totalTopics => totalModules;
  int get completedModules => modules.where((m) => m.isCompleted).length;
  int get completedTopics => completedModules;
  double get progress =>
      totalModules == 0 ? 0.0 : completedModules / totalModules;
}

enum ColorHint { purple, cyan, green, orange, pink }

class Module {
  final String id;
  final String title;
  final String summary;
  final List<Unit> units;
  bool isCompleted;
  bool isLocked;

  Module({
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

/// Placeholder until full postgraduate content is authored from prompts.
const kContentPlaceholder = '''
## Content in progress

This lesson shell is ready for the new postgraduate content.

When the course prompt set is written into this unit, you will see:

- Clear learning goals
- Intuitive explanations (why before how)
- Worked ideas and checks
- Key takeaways
- A short quiz

Until then, you can still open **Nova** for conversation and study support.
''';

class Unit {
  final String id;
  final String title;
  final String content; // Markdown; use mathToPlain on display
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
    this.explanation = '',
  });
}

/// Build a ready-to-fill unit shell.
Unit skeletonUnit({
  required String id,
  required String title,
  String? content,
  List<String> takeaways = const [],
}) {
  return Unit(
    id: id,
    title: title,
    content: content ?? kContentPlaceholder,
    keyTakeaways: takeaways.isEmpty
        ? const ['Full notes will appear here after content authoring.']
        : takeaways,
    quiz: const [],
  );
}

Module skeletonModule({
  required String id,
  required String title,
  required String summary,
  required List<Unit> units,
}) {
  return Module(
    id: id,
    title: title,
    summary: summary,
    units: units,
  );
}
