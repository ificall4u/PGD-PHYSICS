import 'package:pgd_physics/models/course.dart';

/// PHY 704 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY704/
Course buildPhy704() {
  return Course(
    id: 'phy-704',
    code: 'PHY 704',
    title: 'Quantum Mechanics',
    description: 'Wave mechanics and operators — content shells.',
    semester: 'Second Semester',
    units: 3,
    icon: 'ℏ',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy-704-m1',
        title: 'Quantum motivation',
        summary: 'Why classical physics is not enough.',
        units: [
          skeletonUnit(id: 'phy-704-m1-u1', title: 'Photoelectric & waves of matter'),
          skeletonUnit(id: 'phy-704-m1-u2', title: 'Wave function idea'),
          skeletonUnit(id: 'phy-704-m1-u3', title: 'Probability interpretation'),
        ],
      ),
      skeletonModule(
        id: 'phy-704-m2',
        title: 'Schrödinger equation',
        summary: 'How quantum states evolve.',
        units: [
          skeletonUnit(id: 'phy-704-m2-u1', title: 'Time-dependent idea'),
          skeletonUnit(id: 'phy-704-m2-u2', title: 'Stationary states'),
          skeletonUnit(id: 'phy-704-m2-u3', title: 'Infinite well'),
        ],
      ),
      skeletonModule(
        id: 'phy-704-m3',
        title: 'Operators & observables',
        summary: 'Measuring in quantum language.',
        units: [
          skeletonUnit(id: 'phy-704-m3-u1', title: 'Operators as measurements'),
          skeletonUnit(id: 'phy-704-m3-u2', title: 'Uncertainty idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-704-m4',
        title: 'Hydrogen & angular momentum',
        summary: 'Real atoms as the target.',
        units: [
          skeletonUnit(id: 'phy-704-m4-u1', title: 'Angular momentum intuition'),
          skeletonUnit(id: 'phy-704-m4-u2', title: 'Hydrogen roadmap'),
        ],
      ),
      skeletonModule(
        id: 'phy-704-m5',
        title: 'Approximation methods (preview)',
        summary: 'Perturbation and variational ideas.',
        units: [
          skeletonUnit(id: 'phy-704-m5-u1', title: 'Why we approximate'),
          skeletonUnit(id: 'phy-704-m5-u2', title: 'Perturbation sketch'),
        ],
      ),
    ],
  );
}
