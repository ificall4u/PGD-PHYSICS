import 'package:pgd_physics/models/course.dart';

/// PHY 706 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY706/
Course buildPhy706() {
  return Course(
    id: 'phy-706',
    code: 'PHY 706',
    title: 'Electronics Laboratory / Instrumentation',
    description: 'Measurement and instrumentation — shells.',
    semester: 'Second Semester',
    units: 3,
    icon: '🔌',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy-706-m1',
        title: 'Lab foundations',
        summary: 'Safety, error, and instruments.',
        units: [
          skeletonUnit(id: 'phy-706-m1-u1', title: 'Measurement and uncertainty'),
          skeletonUnit(id: 'phy-706-m1-u2', title: 'Oscilloscope idea'),
          skeletonUnit(id: 'phy-706-m1-u3', title: 'Signal sources'),
        ],
      ),
      skeletonModule(
        id: 'phy-706-m2',
        title: 'Analog building blocks',
        summary: 'Amps and filters in practice.',
        units: [
          skeletonUnit(id: 'phy-706-m2-u1', title: 'Op-amp ideal idea'),
          skeletonUnit(id: 'phy-706-m2-u2', title: 'Basic amplifier configs'),
          skeletonUnit(id: 'phy-706-m2-u3', title: 'Filters sketch'),
        ],
      ),
      skeletonModule(
        id: 'phy-706-m3',
        title: 'Digital interfacing',
        summary: 'Logic meets the bench.',
        units: [
          skeletonUnit(id: 'phy-706-m3-u1', title: 'Logic levels'),
          skeletonUnit(id: 'phy-706-m3-u2', title: 'Simple digital IO'),
        ],
      ),
      skeletonModule(
        id: 'phy-706-m4',
        title: 'Data & reporting',
        summary: 'From trace to conclusion.',
        units: [
          skeletonUnit(id: 'phy-706-m4-u1', title: 'Recording results'),
          skeletonUnit(id: 'phy-706-m4-u2', title: 'Lab report structure'),
        ],
      ),
    ],
  );
}
