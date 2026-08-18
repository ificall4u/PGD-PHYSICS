import 'package:pgd_physics/models/course.dart';

/// PHY 799 — PGD Research Project (shells aligned to content_prompts/PHY799)
Course buildPhy799() {
  return Course(
    id: 'phy-799',
    code: 'PHY 799',
    title: 'PGD Research Project',
    description:
        'Supervised research in contemporary physics with a detailed project report — ABUAD PGD requirement.',
    semester: 'Project',
    units: 6,
    icon: '🎓',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy799-m1',
        title: 'Choosing a topic and research question',
        summary: 'Scope a feasible PGD project and a clear research question.',
        units: [
          skeletonUnit(id: 'phy799-m1-u1', title: 'What makes a suitable PGD project'),
          skeletonUnit(id: 'phy799-m1-u2', title: 'From area to research question'),
          skeletonUnit(id: 'phy799-m1-u3', title: 'Feasibility, safety and supervision'),
          skeletonUnit(id: 'phy799-m1-u4', title: 'Writing a grounded problem statement'),
        ],
      ),
      skeletonModule(
        id: 'phy799-m2',
        title: 'Literature survey and physics background',
        summary: 'Organize prior work and accurate domain background.',
        units: [
          skeletonUnit(id: 'phy799-m2-u1', title: 'Reading and organizing prior work'),
          skeletonUnit(id: 'phy799-m2-u2', title: 'Background from standard sources'),
          skeletonUnit(id: 'phy799-m2-u3', title: 'Identifying the research gap'),
          skeletonUnit(id: 'phy799-m2-u4', title: 'Keeping the physics accurate'),
        ],
      ),
      skeletonModule(
        id: 'phy799-m3',
        title: 'Methods and project design',
        summary: 'Experimental, computational or design methods with honest uncertainty.',
        units: [
          skeletonUnit(id: 'phy799-m3-u1', title: 'Choosing a project structure'),
          skeletonUnit(id: 'phy799-m3-u2', title: 'Measurement, uncertainty and reproducibility'),
          skeletonUnit(id: 'phy799-m3-u3', title: 'Domain methods from standard references'),
          skeletonUnit(id: 'phy799-m3-u4', title: 'Ethics, safety and data recording'),
        ],
      ),
      skeletonModule(
        id: 'phy799-m4',
        title: 'Results, analysis and the final report',
        summary: 'Present results and write the PGD project report.',
        units: [
          skeletonUnit(id: 'phy799-m4-u1', title: 'Presenting results honestly'),
          skeletonUnit(id: 'phy799-m4-u2', title: 'Linking results to physics and the question'),
          skeletonUnit(id: 'phy799-m4-u3', title: 'Report structure for PHY 799'),
          skeletonUnit(id: 'phy799-m4-u4', title: 'Presentation, limitations and feedback'),
        ],
      ),
    ],
  );
}
