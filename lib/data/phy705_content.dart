import 'package:pgd_physics/models/course.dart';

/// PHY 705 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY705/
Course buildPhy705() {
  return Course(
    id: 'phy-705',
    code: 'PHY 705',
    title: 'Solid State / Electronics Foundations',
    description: 'Materials and devices foundation — shells.',
    semester: 'First Semester',
    units: 3,
    icon: '🔷',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy-705-m1',
        title: 'Crystal & electron in a solid',
        summary: 'From atoms to bands.',
        units: [
          skeletonUnit(id: 'phy-705-m1-u1', title: 'Crystal idea'),
          skeletonUnit(id: 'phy-705-m1-u2', title: 'Free electron sketch'),
          skeletonUnit(id: 'phy-705-m1-u3', title: 'Energy bands'),
        ],
      ),
      skeletonModule(
        id: 'phy-705-m2',
        title: 'Semiconductors',
        summary: 'Gaps, carriers, doping.',
        units: [
          skeletonUnit(id: 'phy-705-m2-u1', title: 'Intrinsic semiconductors'),
          skeletonUnit(id: 'phy-705-m2-u2', title: 'Doping n and p'),
          skeletonUnit(id: 'phy-705-m2-u3', title: 'Carrier ideas'),
        ],
      ),
      skeletonModule(
        id: 'phy-705-m3',
        title: 'p–n junction',
        summary: 'The diode heart.',
        units: [
          skeletonUnit(id: 'phy-705-m3-u1', title: 'Junction formation'),
          skeletonUnit(id: 'phy-705-m3-u2', title: 'Depletion region'),
          skeletonUnit(id: 'phy-705-m3-u3', title: 'Diode I–V idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-705-m4',
        title: 'Transistors & devices',
        summary: 'Controlling current.',
        units: [
          skeletonUnit(id: 'phy-705-m4-u1', title: 'BJT idea'),
          skeletonUnit(id: 'phy-705-m4-u2', title: 'FET / MOSFET idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-705-m5',
        title: 'Optoelectronics preview',
        summary: 'Light and semiconductors.',
        units: [
          skeletonUnit(id: 'phy-705-m5-u1', title: 'LED idea'),
          skeletonUnit(id: 'phy-705-m5-u2', title: 'Photodiode / solar cell idea'),
        ],
      ),
    ],
  );
}
