import 'package:pgd_physics/models/course.dart';

/// PHY 709 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY709/
Course buildPhy709() {
  return Course(
    id: 'phy-709',
    code: 'PHY 709',
    title: 'Electronic Devices and Fabrication',
    description: 'How devices are made — shells.',
    semester: 'First Semester',
    units: 3,
    icon: '🏭',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy-709-m1',
        title: 'From sand to wafer',
        summary: 'Substrates and cleanliness.',
        units: [
          skeletonUnit(id: 'phy-709-m1-u1', title: 'Why silicon'),
          skeletonUnit(id: 'phy-709-m1-u2', title: 'Wafer idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-709-m2',
        title: 'Doping & junctions',
        summary: 'Putting carriers where we need them.',
        units: [
          skeletonUnit(id: 'phy-709-m2-u1', title: 'Doping processes'),
          skeletonUnit(id: 'phy-709-m2-u2', title: 'PN junction fabrication sketch'),
        ],
      ),
      skeletonModule(
        id: 'phy-709-m3',
        title: 'Lithography & patterning',
        summary: 'Drawing with light.',
        units: [
          skeletonUnit(id: 'phy-709-m3-u1', title: 'Lithography idea'),
          skeletonUnit(id: 'phy-709-m3-u2', title: 'Etch and deposit'),
        ],
      ),
      skeletonModule(
        id: 'phy-709-m4',
        title: 'Devices on chip',
        summary: 'LED, transistor, IC.',
        units: [
          skeletonUnit(id: 'phy-709-m4-u1', title: 'Discrete devices'),
          skeletonUnit(id: 'phy-709-m4-u2', title: 'IC idea'),
          skeletonUnit(id: 'phy-709-m4-u3', title: 'MOSFET cross-section review'),
        ],
      ),
    ],
  );
}
