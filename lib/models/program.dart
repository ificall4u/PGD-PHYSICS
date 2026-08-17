import 'package:pgd_physics/models/course.dart';

/// A degree / diploma track (e.g. PGD, MSc, PhD).
/// Design is program-agnostic: add new programs by registering Course lists.
class Program {
  final String id;
  final String title;
  final String shortTitle;
  final String institution;
  final String description;
  final bool isAvailable;
  final List<Course> Function() coursesBuilder;

  const Program({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.institution,
    required this.description,
    required this.isAvailable,
    required this.coursesBuilder,
  });

  List<Course> get courses => coursesBuilder();
}
