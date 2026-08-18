import 'package:pgd_physics/models/course.dart';

/// PHY 702 — Electromagnetism
/// Structure from content_prompts/PHY702 (placeholder lesson bodies only).
Course buildPhy702() {
  return Course(
    id: 'phy-702',
    code: 'PHY 702',
    title: 'Electromagnetism',
    description: 'Electrostatics through Maxwell equations and electromagnetic waves — module shells for postgraduate rewrite.',
    semester: 'Second Semester',
    units: 3,
    icon: '⚡',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy702-m1',
        title: 'Coulomb\'s Law and Electrostatic Forces',
        summary: 'Coulomb\'s Law and Electrostatic Forces',
        units: [
          skeletonUnit(id: 'phy702-m1-u1', title: 'Physical Intuition of Electric Charge'),
          skeletonUnit(id: 'phy702-m1-u2', title: 'Coulomb\'s Law Intuition'),
          skeletonUnit(id: 'phy702-m1-u3', title: 'Derivation and Translation of Coulomb\'s Law Equation'),
          skeletonUnit(id: 'phy702-m1-u4', title: 'Vector Direction of Forces'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m2',
        title: 'Electric Fields and Gauss\' Law',
        summary: 'Electric Fields and Gauss\' Law',
        units: [
          skeletonUnit(id: 'phy702-m2-u1', title: 'Electric Field $E$ Concept'),
          skeletonUnit(id: 'phy702-m2-u2', title: 'Electric Flux Intuition'),
          skeletonUnit(id: 'phy702-m2-u3', title: 'Gauss\' Law'),
          skeletonUnit(id: 'phy702-m2-u4', title: 'Applications of Gauss\' Law'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m3',
        title: 'Electric Potential, Poisson, and Laplace Equations',
        summary: 'Electric Potential, Poisson, and Laplace Equations',
        units: [
          skeletonUnit(id: 'phy702-m3-u1', title: 'Electric Potential (Voltage)'),
          skeletonUnit(id: 'phy702-m3-u2', title: 'Relationship Between Electric Field and Potential'),
          skeletonUnit(id: 'phy702-m3-u3', title: 'Poisson and Laplace Equations'),
          skeletonUnit(id: 'phy702-m3-u4', title: 'Boundary Value Problems'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m4',
        title: 'Magnetostatics and Magnetic Fields',
        summary: 'Magnetostatics and Magnetic Fields',
        units: [
          skeletonUnit(id: 'phy702-m4-u1', title: 'Permanent Magnets vs. Moving Charges'),
          skeletonUnit(id: 'phy702-m4-u2', title: 'Biot-Savart Law'),
          skeletonUnit(id: 'phy702-m4-u3', title: 'Ampere\'s Law'),
          skeletonUnit(id: 'phy702-m4-u4', title: 'Magnetic Fields in Matter'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m5',
        title: 'Electric and Magnetic Energy Storage',
        summary: 'Electric and Magnetic Energy Storage',
        units: [
          skeletonUnit(id: 'phy702-m5-u1', title: 'Energy Stored in Electric Fields'),
          skeletonUnit(id: 'phy702-m5-u2', title: 'Energy Stored in Magnetic Fields'),
          skeletonUnit(id: 'phy702-m5-u3', title: 'Energy Density in Fields'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m6',
        title: 'Faraday\'s Law of Induction & Lenz\'s Law',
        summary: 'Faraday\'s Law of Induction & Lenz\'s Law',
        units: [
          skeletonUnit(id: 'phy702-m6-u1', title: 'Electromagnetic Induction Discovery'),
          skeletonUnit(id: 'phy702-m6-u2', title: 'Faraday\'s Law'),
          skeletonUnit(id: 'phy702-m6-u3', title: 'Lenz\'s Law (Nature\'s Inertia)'),
          skeletonUnit(id: 'phy702-m6-u4', title: 'Practical Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m7',
        title: 'Motion of Charges in Electric and Magnetic Fields',
        summary: 'Motion of Charges in Electric and Magnetic Fields',
        units: [
          skeletonUnit(id: 'phy702-m7-u1', title: 'Lorentz Force Law'),
          skeletonUnit(id: 'phy702-m7-u2', title: 'Motion in Pure Electric Field'),
          skeletonUnit(id: 'phy702-m7-u3', title: 'Motion in Pure Magnetic Field'),
          skeletonUnit(id: 'phy702-m7-u4', title: 'Velocity Selector & Mass Spectrometer Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m8',
        title: 'Maxwell\'s Equations and Spherical Wave Propagation',
        summary: 'Maxwell\'s Equations and Spherical Wave Propagation',
        units: [
          skeletonUnit(id: 'phy702-m8-u1', title: 'The Missing Link'),
          skeletonUnit(id: 'phy702-m8-u2', title: 'The Four Maxwell Equations Unified'),
          skeletonUnit(id: 'phy702-m8-u3', title: 'Electromagnetic Waves'),
          skeletonUnit(id: 'phy702-m8-u4', title: 'Introduction to Spherical Waves'),
        ],
      ),
    ],
  );
}
