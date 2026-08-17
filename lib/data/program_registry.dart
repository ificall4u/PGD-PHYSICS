import 'package:pgd_physics/models/program.dart';
import 'package:pgd_physics/data/sample_courses.dart';
import 'package:pgd_physics/services/storage_service.dart';

/// Central registry of academic programs.
///
/// To add Masters / PhD later:
/// 1. Create content files under lib/data/ (e.g. msc_phy801_content.dart)
/// 2. Add a builder list similar to getSampleCourses()
/// 3. Register a new Program here with isAvailable: true
/// 4. Home / navigation already filter by selected program id
///
/// Keep isAvailable: false until content is ready so UI can show “Coming soon”.
class ProgramRegistry {
  static const String defaultProgramId = 'pgd_physics_abuad';

  static final List<Program> all = [
    Program(
      id: defaultProgramId,
      title: 'Postgraduate Diploma in Physics',
      shortTitle: 'PGD Physics',
      institution: 'ABUAD',
      description:
          'ABUAD PGD Physics (Electronics) — full taught courses plus project guidance.',
      isAvailable: true,
      coursesBuilder: getSampleCourses,
    ),
    Program(
      id: 'msc_physics_abuad',
      title: 'Master of Science in Physics',
      shortTitle: 'MSc Physics',
      institution: 'ABUAD',
      description: 'Masters-level physics track. Content can be added later.',
      isAvailable: false,
      coursesBuilder: () => const [],
    ),
    Program(
      id: 'phd_physics_abuad',
      title: 'Doctor of Philosophy in Physics',
      shortTitle: 'PhD Physics',
      institution: 'ABUAD',
      description: 'Doctoral track. Content can be added later.',
      isAvailable: false,
      coursesBuilder: () => const [],
    ),
  ];

  static Program byId(String id) {
    return all.firstWhere(
      (p) => p.id == id,
      orElse: () => all.first,
    );
  }

  static Program get active {
    return byId(StorageService.getSelectedProgramId());
  }

  static List<Program> get available =>
      all.where((p) => p.isAvailable).toList();
}
