import 'package:pgd_physics/models/course.dart';

/// PHY 701 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY701/
Course buildPhy701() {
  return Course(
    id: 'phy-701',
    code: 'PHY 701',
    title: 'Mathematical Methods in Physics',
    description: 'Core mathematical tools for postgraduate physics — structure ready for new content.',
    semester: 'First Semester',
    units: 3,
    icon: '∫',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy-701-m1',
        title: 'Foundations & notation',
        summary: 'Symbols, functions, and how physicists write math.',
        units: [
          skeletonUnit(id: 'phy-701-m1-u1', title: 'What this course is for'),
          skeletonUnit(id: 'phy-701-m1-u2', title: 'Functions and physical meaning'),
          skeletonUnit(id: 'phy-701-m1-u3', title: 'Limits and continuity in practice'),
        ],
      ),
      skeletonModule(
        id: 'phy-701-m2',
        title: 'Complex numbers & analysis tools',
        summary: 'Working in the complex plane for physics problems.',
        units: [
          skeletonUnit(id: 'phy-701-m2-u1', title: 'Complex numbers as tools'),
          skeletonUnit(id: 'phy-701-m2-u2', title: 'Euler’s formula in physics'),
          skeletonUnit(id: 'phy-701-m2-u3', title: 'Contour ideas (preview)'),
        ],
      ),
      skeletonModule(
        id: 'phy-701-m3',
        title: 'Series & approximations',
        summary: 'Taylor tools and useful expansions.',
        units: [
          skeletonUnit(id: 'phy-701-m3-u1', title: 'Why series appear in physics'),
          skeletonUnit(id: 'phy-701-m3-u2', title: 'Taylor idea without fear'),
          skeletonUnit(id: 'phy-701-m3-u3', title: 'When to approximate'),
        ],
      ),
      skeletonModule(
        id: 'phy-701-m4',
        title: 'Differential equations (physics view)',
        summary: 'Equations that describe change.',
        units: [
          skeletonUnit(id: 'phy-701-m4-u1', title: 'What a differential equation is'),
          skeletonUnit(id: 'phy-701-m4-u2', title: 'First-order intuition'),
          skeletonUnit(id: 'phy-701-m4-u3', title: 'Second-order & oscillations'),
        ],
      ),
      skeletonModule(
        id: 'phy-701-m5',
        title: 'Fourier & transform thinking',
        summary: 'Breaking signals and solutions into pieces.',
        units: [
          skeletonUnit(id: 'phy-701-m5-u1', title: 'Waves as sums of pieces'),
          skeletonUnit(id: 'phy-701-m5-u2', title: 'Fourier idea'),
          skeletonUnit(id: 'phy-701-m5-u3', title: 'Laplace as a cousin (preview)'),
        ],
      ),
      skeletonModule(
        id: 'phy-701-m6',
        title: 'Special functions (roadmap)',
        summary: 'Functions that show up in real problems.',
        units: [
          skeletonUnit(id: 'phy-701-m6-u1', title: 'Why special functions exist'),
          skeletonUnit(id: 'phy-701-m6-u2', title: 'Where they appear in PHY courses'),
        ],
      ),
    ],
  );
}
