import 'package:pgd_physics/models/course.dart';

/// PHY 702 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY702/
Course buildPhy702() {
  return Course(
    id: 'phy-702',
    code: 'PHY 702',
    title: 'Classical Mechanics',
    description: 'Newtonian to Lagrangian thinking — module shells for rewrite.',
    semester: 'Second Semester',
    units: 3,
    icon: '⚙️',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy-702-m1',
        title: 'Newtonian foundations',
        summary: 'Force, motion, and reference frames.',
        units: [
          skeletonUnit(id: 'phy-702-m1-u1', title: 'Review of Newton’s laws'),
          skeletonUnit(id: 'phy-702-m1-u2', title: 'Frames and constraints'),
          skeletonUnit(id: 'phy-702-m1-u3', title: 'Work and energy'),
        ],
      ),
      skeletonModule(
        id: 'phy-702-m2',
        title: 'Oscillations & central force',
        summary: 'Periodic motion and orbits.',
        units: [
          skeletonUnit(id: 'phy-702-m2-u1', title: 'Simple harmonic motion'),
          skeletonUnit(id: 'phy-702-m2-u2', title: 'Central forces'),
          skeletonUnit(id: 'phy-702-m2-u3', title: 'Gravity as a central force'),
        ],
      ),
      skeletonModule(
        id: 'phy-702-m3',
        title: 'Lagrangian mechanics',
        summary: 'Energy-based equations of motion.',
        units: [
          skeletonUnit(id: 'phy-702-m3-u1', title: 'Generalized coordinates'),
          skeletonUnit(id: 'phy-702-m3-u2', title: 'The Lagrangian idea'),
          skeletonUnit(id: 'phy-702-m3-u3', title: 'Euler–Lagrange in practice'),
        ],
      ),
      skeletonModule(
        id: 'phy-702-m4',
        title: 'Hamiltonian & phase space',
        summary: 'Momentum and energy landscape.',
        units: [
          skeletonUnit(id: 'phy-702-m4-u1', title: 'Hamiltonian idea'),
          skeletonUnit(id: 'phy-702-m4-u2', title: 'Phase space intuition'),
        ],
      ),
      skeletonModule(
        id: 'phy-702-m5',
        title: 'Rigid body & continuum preview',
        summary: 'Rotation and continuous systems.',
        units: [
          skeletonUnit(id: 'phy-702-m5-u1', title: 'Rigid body basics'),
          skeletonUnit(id: 'phy-702-m5-u2', title: 'Small continuous systems'),
        ],
      ),
    ],
  );
}
