import 'package:pgd_physics/models/course.dart';

/// PHY 799 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY799/
Course buildPhy799() {
  return Course(
    id: 'phy-799',
    code: 'PHY 799',
    title: 'Research Project',
    description: 'Guided project pathway — shells.',
    semester: 'Project',
    units: 6,
    icon: '🎓',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy-799-m1',
        title: 'Choosing a problem',
        summary: 'Scope and questions.',
        units: [
          skeletonUnit(id: 'phy-799-m1-u1', title: 'What makes a good PGD project'),
          skeletonUnit(id: 'phy-799-m1-u2', title: 'Literature first steps'),
        ],
      ),
      skeletonModule(
        id: 'phy-799-m2',
        title: 'Methods & data',
        summary: 'How you will work.',
        units: [
          skeletonUnit(id: 'phy-799-m2-u1', title: 'Method choices'),
          skeletonUnit(id: 'phy-799-m2-u2', title: 'Recording data'),
        ],
      ),
      skeletonModule(
        id: 'phy-799-m3',
        title: 'Analysis & writing',
        summary: 'From results to story.',
        units: [
          skeletonUnit(id: 'phy-799-m3-u1', title: 'Figures that argue'),
          skeletonUnit(id: 'phy-799-m3-u2', title: 'Report structure'),
          skeletonUnit(id: 'phy-799-m3-u3', title: 'Defense preparation'),
        ],
      ),
    ],
  );
}
