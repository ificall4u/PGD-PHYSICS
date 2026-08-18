import 'package:pgd_physics/models/course.dart';

/// PHY 708 — Nuclear and Particle Physics
/// Structure from content_prompts/PHY708 (placeholder lesson bodies only).
Course buildPhy708() {
  return Course(
    id: 'phy-708',
    code: 'PHY 708',
    title: 'Nuclear and Particle Physics',
    description: 'Nuclear structure, decay, detectors, fission/fusion, reactors, and fundamental interactions.',
    semester: 'Second Semester',
    units: 3,
    icon: '☢',
    colorHint: ColorHint.pink,
    modules: [
      skeletonModule(
        id: 'phy708-m1',
        title: 'Nuclear Structure and Subatomic Forces',
        summary: 'Nuclear Structure and Subatomic Forces',
        units: [
          skeletonUnit(id: 'phy708-m1-u1', title: 'What is the Atomic Nucleus?'),
          skeletonUnit(id: 'phy708-m1-u2', title: 'Size and Mass Scales'),
          skeletonUnit(id: 'phy708-m1-u3', title: 'The Strong Nuclear Force ("Nuclear Glue")'),
          skeletonUnit(id: 'phy708-m1-u4', title: 'The Deuteron (Heavy Hydrogen Nucleus)'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m2',
        title: 'Nuclear Models (Liquid Drop vs. Shell Model)',
        summary: 'Nuclear Models (Liquid Drop vs. Shell Model)',
        units: [
          skeletonUnit(id: 'phy708-m2-u1', title: 'Why Do We Need Models?'),
          skeletonUnit(id: 'phy708-m2-u2', title: 'The Liquid Drop Model'),
          skeletonUnit(id: 'phy708-m2-u3', title: 'The Nuclear Shell Model'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m3',
        title: 'Radioactive Decay and Spectroscopy',
        summary: 'Radioactive Decay and Spectroscopy',
        units: [
          skeletonUnit(id: 'phy708-m3-u1', title: 'Why Are Some Nuclei Unstable?'),
          skeletonUnit(id: 'phy708-m3-u2', title: 'Three Major Decay Modes'),
          skeletonUnit(id: 'phy708-m3-u3', title: 'Half-Life Intuition'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m4',
        title: 'Radiation Detectors and Subatomic Measurement',
        summary: 'Radiation Detectors and Subatomic Measurement',
        units: [
          skeletonUnit(id: 'phy708-m4-u1', title: 'How Do We "See" Subatomic Radiation?'),
          skeletonUnit(id: 'phy708-m4-u2', title: 'Gas-Filled Detectors (Geiger-Müller Counters)'),
          skeletonUnit(id: 'phy708-m4-u3', title: 'Scintillation Detectors'),
          skeletonUnit(id: 'phy708-m4-u4', title: 'Gamma Spectroscopy'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m5',
        title: 'Neutron Physics, Fission, and Fusion',
        summary: 'Neutron Physics, Fission, and Fusion',
        units: [
          skeletonUnit(id: 'phy708-m5-u1', title: 'The Magic of Neutrons'),
          skeletonUnit(id: 'phy708-m5-u2', title: 'Thermal vs. Fast Neutrons'),
          skeletonUnit(id: 'phy708-m5-u3', title: 'Nuclear Fission ("Splitting the Atom")'),
          skeletonUnit(id: 'phy708-m5-u4', title: 'Nuclear Fusion ("Power of the Stars")'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m6',
        title: 'Nuclear Reactors and Power Generation',
        summary: 'Nuclear Reactors and Power Generation',
        units: [
          skeletonUnit(id: 'phy708-m6-u1', title: 'The Self-Sustaining Chain Reaction'),
          skeletonUnit(id: 'phy708-m6-u2', title: 'Criticality ($k$ factor)'),
          skeletonUnit(id: 'phy708-m6-u3', title: 'Anatomy of a Nuclear Reactor'),
          skeletonUnit(id: 'phy708-m6-u4', title: 'Reactor Safety Principles'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m7',
        title: 'Elementary Particles and the Standard Model',
        summary: 'Elementary Particles and the Standard Model',
        units: [
          skeletonUnit(id: 'phy708-m7-u1', title: 'Beyond Protons and Neutrons'),
          skeletonUnit(id: 'phy708-m7-u2', title: 'Matter Particles (Fermions)'),
          skeletonUnit(id: 'phy708-m7-u3', title: 'Force Carriers (Bosons)'),
          skeletonUnit(id: 'phy708-m7-u4', title: 'Matter vs. Antimatter'),
        ],
      ),
      skeletonModule(
        id: 'phy708-m8',
        title: 'Fundamental Interactions & Quantum Conservation Laws',
        summary: 'Fundamental Interactions & Quantum Conservation Laws',
        units: [
          skeletonUnit(id: 'phy708-m8-u1', title: 'The Four Fundamental Forces'),
          skeletonUnit(id: 'phy708-m8-u2', title: 'Weak Interactions & Neutrinos'),
          skeletonUnit(id: 'phy708-m8-u3', title: 'Quantum Conservation Laws'),
          skeletonUnit(id: 'phy708-m8-u4', title: 'Feynman Diagrams'),
        ],
      ),
    ],
  );
}
