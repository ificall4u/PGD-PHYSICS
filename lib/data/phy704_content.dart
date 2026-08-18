import 'package:pgd_physics/models/course.dart';

/// PHY 704 — Quantum Mechanics
/// Structure from content_prompts/PHY704 (placeholder lesson bodies only).
Course buildPhy704() {
  return Course(
    id: 'phy-704',
    code: 'PHY 704',
    title: 'Quantum Physics',
    description: 'State vectors, angular momentum, perturbation theory, scattering and selected applications.',
    semester: 'Second Semester',
    units: 3,
    icon: 'ℏ',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy704-m1',
        title: 'Mathematical Formulation of Quantum Mechanics',
        summary: 'Mathematical Formulation of Quantum Mechanics',
        units: [
          skeletonUnit(id: 'phy704-m1-u1', title: 'Quantum State Vectors (|psi>)'),
          skeletonUnit(id: 'phy704-m1-u2', title: 'Linear Operators as Actions'),
          skeletonUnit(id: 'phy704-m1-u3', title: 'The Wavefunction psi(x)'),
          skeletonUnit(id: 'phy704-m1-u4', title: 'The Schrödinger Equation'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m2',
        title: 'Quantum Angular Momentum & Intrinsic Spin',
        summary: 'Quantum Angular Momentum & Intrinsic Spin',
        units: [
          skeletonUnit(id: 'phy704-m2-u1', title: 'Orbital Angular Momentum'),
          skeletonUnit(id: 'phy704-m2-u2', title: 'Quantum Spin (Intrinsic Angular Momentum)'),
          skeletonUnit(id: 'phy704-m2-u3', title: 'Addition of Angular Momentum'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m3',
        title: 'Quantum Perturbation Theory',
        summary: 'Quantum Perturbation Theory',
        units: [
          skeletonUnit(id: 'phy704-m3-u1', title: 'The Concept of Perturbation'),
          skeletonUnit(id: 'phy704-m3-u2', title: 'Time-Independent Perturbation Theory (Non-Degenerate & Degenerate)'),
          skeletonUnit(id: 'phy704-m3-u3', title: 'Time-Dependent Perturbation Theory'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m4',
        title: 'Quantum Scattering Theory',
        summary: 'Quantum Scattering Theory',
        units: [
          skeletonUnit(id: 'phy704-m4-u1', title: 'What is Quantum Scattering?'),
          skeletonUnit(id: 'phy704-m4-u2', title: 'Cross-Sections (Differential vs. Total)'),
          skeletonUnit(id: 'phy704-m4-u3', title: 'Born Approximation'),
          skeletonUnit(id: 'phy704-m4-u4', title: 'Phase Shifts'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m5',
        title: 'Green\'s Function & Partial Wave Analysis',
        summary: 'Green\'s Function & Partial Wave Analysis',
        units: [
          skeletonUnit(id: 'phy704-m5-u1', title: 'The Impulse-Response Intuition (Green\'s Functions)'),
          skeletonUnit(id: 'phy704-m5-u2', title: 'Partial Wave Method'),
          skeletonUnit(id: 'phy704-m5-u3', title: 'Optical Theorem'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m6',
        title: 'Quantum Models in Atomic, Molecular, and Solid-State Physics',
        summary: 'Quantum Models in Atomic, Molecular, and Solid-State Physics',
        units: [
          skeletonUnit(id: 'phy704-m6-u1', title: 'Multi-Electron Atoms & The Exclusion Principle'),
          skeletonUnit(id: 'phy704-m6-u2', title: 'Molecular Bonding'),
          skeletonUnit(id: 'phy704-m6-u3', title: 'Energy Bands in Solids'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m7',
        title: 'Quantum Models in Nuclear Physics',
        summary: 'Quantum Models in Nuclear Physics',
        units: [
          skeletonUnit(id: 'phy704-m7-u1', title: 'Nuclear Forces & Potential Wells'),
          skeletonUnit(id: 'phy704-m7-u2', title: 'Alpha Decay & Quantum Tunneling'),
          skeletonUnit(id: 'phy704-m7-u3', title: 'The Nuclear Shell Model'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m8',
        title: 'Introduction to Quantum Statistical Mechanics',
        summary: 'Introduction to Quantum Statistical Mechanics',
        units: [
          skeletonUnit(id: 'phy704-m8-u1', title: 'Classical vs. Quantum Statistics'),
          skeletonUnit(id: 'phy704-m8-u2', title: 'Fermi-Dirac Statistics'),
          skeletonUnit(id: 'phy704-m8-u3', title: 'Bose-Einstein Statistics'),
        ],
      ),
    ],
  );
}
