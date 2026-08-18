import 'package:pgd_physics/models/course.dart';

/// PHY 708 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY708/
Course buildPhy708() {
  return Course(
    id: 'phy-708',
    code: 'PHY 708',
    title: 'Nuclear and Particle Physics',
    description: 'Nucleus and particles — shells.',
    semester: 'Second Semester',
    units: 3,
    icon: '☢',
    colorHint: ColorHint.pink,
    modules: [
      skeletonModule(
        id: 'phy-708-m1',
        title: 'Nuclear structure',
        summary: 'Size, mass, forces.',
        units: [
          skeletonUnit(id: 'phy-708-m1-u1', title: 'Nuclear size and mass'),
          skeletonUnit(id: 'phy-708-m1-u2', title: 'Binding energy'),
          skeletonUnit(id: 'phy-708-m1-u3', title: 'Nuclear force idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-708-m2',
        title: 'Radioactivity',
        summary: 'Decay and half-life.',
        units: [
          skeletonUnit(id: 'phy-708-m2-u1', title: 'Decay modes'),
          skeletonUnit(id: 'phy-708-m2-u2', title: 'Half-life'),
          skeletonUnit(id: 'phy-708-m2-u3', title: 'Decay law'),
        ],
      ),
      skeletonModule(
        id: 'phy-708-m3',
        title: 'Detectors & radiation',
        summary: 'How we measure.',
        units: [
          skeletonUnit(id: 'phy-708-m3-u1', title: 'Detector types sketch'),
          skeletonUnit(id: 'phy-708-m3-u2', title: 'Spectroscopy idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-708-m4',
        title: 'Fission, fusion, reactors',
        summary: 'Energy from the nucleus.',
        units: [
          skeletonUnit(id: 'phy-708-m4-u1', title: 'Fission'),
          skeletonUnit(id: 'phy-708-m4-u2', title: 'Fusion'),
          skeletonUnit(id: 'phy-708-m4-u3', title: 'Reactor idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-708-m5',
        title: 'Elementary particles',
        summary: 'Conservation and families.',
        units: [
          skeletonUnit(id: 'phy-708-m5-u1', title: 'Particle zoo overview'),
          skeletonUnit(id: 'phy-708-m5-u2', title: 'Interactions sketch'),
        ],
      ),
    ],
  );
}
