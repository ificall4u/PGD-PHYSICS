import 'package:pgd_physics/models/course.dart';

/// PHY 703 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY703/
Course buildPhy703() {
  return Course(
    id: 'phy-703',
    code: 'PHY 703',
    title: 'Electromagnetism',
    description: 'Fields, potentials, and Maxwell structure — shells only.',
    semester: 'First Semester',
    units: 3,
    icon: '⚡',
    colorHint: ColorHint.orange,
    modules: [
      skeletonModule(
        id: 'phy-703-m1',
        title: 'Electrostatics',
        summary: 'Charges and static fields.',
        units: [
          skeletonUnit(id: 'phy-703-m1-u1', title: 'Electric field idea'),
          skeletonUnit(id: 'phy-703-m1-u2', title: 'Gauss’s law intuition'),
          skeletonUnit(id: 'phy-703-m1-u3', title: 'Potential'),
        ],
      ),
      skeletonModule(
        id: 'phy-703-m2',
        title: 'Magnetostatics',
        summary: 'Steady currents and magnetic field.',
        units: [
          skeletonUnit(id: 'phy-703-m2-u1', title: 'Magnetic field idea'),
          skeletonUnit(id: 'phy-703-m2-u2', title: 'Ampère’s law intuition'),
          skeletonUnit(id: 'phy-703-m2-u3', title: 'Vector potential preview'),
        ],
      ),
      skeletonModule(
        id: 'phy-703-m3',
        title: 'Time-varying fields',
        summary: 'Induction and Maxwell’s correction.',
        units: [
          skeletonUnit(id: 'phy-703-m3-u1', title: 'Faraday induction'),
          skeletonUnit(id: 'phy-703-m3-u2', title: 'Displacement current idea'),
          skeletonUnit(id: 'phy-703-m3-u3', title: 'Maxwell equations overview'),
        ],
      ),
      skeletonModule(
        id: 'phy-703-m4',
        title: 'Electromagnetic waves',
        summary: 'Light as a field wave.',
        units: [
          skeletonUnit(id: 'phy-703-m4-u1', title: 'Wave equation from Maxwell'),
          skeletonUnit(id: 'phy-703-m4-u2', title: 'Energy flow (Poynting idea)'),
        ],
      ),
      skeletonModule(
        id: 'phy-703-m5',
        title: 'Potentials & gauges (roadmap)',
        summary: 'Tools for advanced work.',
        units: [
          skeletonUnit(id: 'phy-703-m5-u1', title: 'Scalar and vector potentials'),
          skeletonUnit(id: 'phy-703-m5-u2', title: 'Why gauges appear'),
        ],
      ),
    ],
  );
}
