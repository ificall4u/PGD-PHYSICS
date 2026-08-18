import 'package:pgd_physics/models/course.dart';

/// PHY 710 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY710/
Course buildPhy710() {
  return Course(
    id: 'phy-710',
    code: 'PHY 710',
    title: 'Computational / Applied Physics Methods',
    description: 'Numerical and applied methods — shells.',
    semester: 'Second Semester',
    units: 3,
    icon: '💻',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy-710-m1',
        title: 'Computing for physics',
        summary: 'Models on a machine.',
        units: [
          skeletonUnit(id: 'phy-710-m1-u1', title: 'Why compute'),
          skeletonUnit(id: 'phy-710-m1-u2', title: 'Discretization idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-710-m2',
        title: 'Numerical ODEs',
        summary: 'Integrating equations of motion.',
        units: [
          skeletonUnit(id: 'phy-710-m2-u1', title: 'Euler idea'),
          skeletonUnit(id: 'phy-710-m2-u2', title: 'Better steppers'),
        ],
      ),
      skeletonModule(
        id: 'phy-710-m3',
        title: 'Data & visualization',
        summary: 'Seeing results.',
        units: [
          skeletonUnit(id: 'phy-710-m3-u1', title: 'Plots that teach'),
          skeletonUnit(id: 'phy-710-m3-u2', title: 'Fitting sketch'),
        ],
      ),
      skeletonModule(
        id: 'phy-710-m4',
        title: 'Project habits',
        summary: 'Reproducible work.',
        units: [
          skeletonUnit(id: 'phy-710-m4-u1', title: 'Notebooks & scripts'),
          skeletonUnit(id: 'phy-710-m4-u2', title: 'Error checking'),
        ],
      ),
    ],
  );
}
