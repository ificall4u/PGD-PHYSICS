import 'package:pgd_physics/models/course.dart';

/// PHY 712 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY712/
Course buildPhy712() {
  return Course(
    id: 'phy-712',
    code: 'PHY 712',
    title: 'Energy Conversion and Storage',
    description: 'Modern energy systems — shells.',
    semester: 'Second Semester',
    units: 3,
    icon: '🔋',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy-712-m1',
        title: 'Energy landscape',
        summary: 'Forms and efficiency.',
        units: [
          skeletonUnit(id: 'phy-712-m1-u1', title: 'Energy forms'),
          skeletonUnit(id: 'phy-712-m1-u2', title: 'Efficiency idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-712-m2',
        title: 'Heat engines & renewables',
        summary: 'Wind, heat, ocean ideas.',
        units: [
          skeletonUnit(id: 'phy-712-m2-u1', title: 'Heat engine sketch'),
          skeletonUnit(id: 'phy-712-m2-u2', title: 'Wind and ocean thermal'),
        ],
      ),
      skeletonModule(
        id: 'phy-712-m3',
        title: 'Electrochemical storage',
        summary: 'Batteries and fuel cells.',
        units: [
          skeletonUnit(id: 'phy-712-m3-u1', title: 'Battery idea'),
          skeletonUnit(id: 'phy-712-m3-u2', title: 'Fuel cell'),
          skeletonUnit(id: 'phy-712-m3-u3', title: 'Hydrogen notes'),
        ],
      ),
      skeletonModule(
        id: 'phy-712-m4',
        title: 'Solar & bio routes',
        summary: 'Light and biomass.',
        units: [
          skeletonUnit(id: 'phy-712-m4-u1', title: 'Photovoltaic idea'),
          skeletonUnit(id: 'phy-712-m4-u2', title: 'Biofuel sketch'),
        ],
      ),
    ],
  );
}
