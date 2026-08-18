import 'package:pgd_physics/models/course.dart';

/// PHY 703 — Classical Mechanics
/// Structure from content_prompts/PHY703 (placeholder lesson bodies only).
Course buildPhy703() {
  return Course(
    id: 'phy-703',
    code: 'PHY 703',
    title: 'Analytical Mechanics',
    description: 'Conservative systems, Lagrange and Hamilton formulations, rigid bodies, oscillations and continuous media.',
    semester: 'First Semester',
    units: 3,
    icon: '⚙️',
    colorHint: ColorHint.orange,
    modules: [
      skeletonModule(
        id: 'phy703-m1',
        title: 'Conservative Forces, Work, and Potential Energy',
        summary: 'Conservative Forces, Work, and Potential Energy',
        units: [
          skeletonUnit(id: 'phy703-m1-u1', title: 'Work & Energy Intuition'),
          skeletonUnit(id: 'phy703-m1-u2', title: 'Conservative vs Non-Conservative Forces'),
          skeletonUnit(id: 'phy703-m1-u3', title: 'Potential Energy Wells'),
          skeletonUnit(id: 'phy703-m1-u4', title: 'Equilibrium & Stability'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m2',
        title: 'Degrees of Freedom & Generalized Coordinates',
        summary: 'Degrees of Freedom & Generalized Coordinates',
        units: [
          skeletonUnit(id: 'phy703-m2-u1', title: 'Degrees of Freedom (DoF)'),
          skeletonUnit(id: 'phy703-m2-u2', title: 'Constraints'),
          skeletonUnit(id: 'phy703-m2-u3', title: 'Generalized Coordinates'),
          skeletonUnit(id: 'phy703-m2-u4', title: 'Configuration Space'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m3',
        title: 'Calculus of Variations & Hamilton\'s Principle of Least Action',
        summary: 'Calculus of Variations & Hamilton\'s Principle of Least Action',
        units: [
          skeletonUnit(id: 'phy703-m3-u1', title: 'Path Optimization Intuition'),
          skeletonUnit(id: 'phy703-m3-u2', title: 'The Action Integral'),
          skeletonUnit(id: 'phy703-m3-u3', title: 'Deriving Euler-Lagrange Equations'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m4',
        title: 'Lagrangian Mechanics & Applications',
        summary: 'Lagrangian Mechanics & Applications',
        units: [
          skeletonUnit(id: 'phy703-m4-u1', title: 'The Lagrangian Recipe'),
          skeletonUnit(id: 'phy703-m4-u2', title: 'Step-by-Step Application 1'),
          skeletonUnit(id: 'phy703-m4-u3', title: 'Step-by-Step Application 2'),
          skeletonUnit(id: 'phy703-m4-u4', title: 'Generalized Momenta & Cyclic Coordinates'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m5',
        title: 'Central Forces & Central Potential Problems',
        summary: 'Central Forces & Central Potential Problems',
        units: [
          skeletonUnit(id: 'phy703-m5-u1', title: 'Physical Definition'),
          skeletonUnit(id: 'phy703-m5-u2', title: 'Reduction to One-Body Problem'),
          skeletonUnit(id: 'phy703-m5-u3', title: 'Conservation Laws in Orbit'),
          skeletonUnit(id: 'phy703-m5-u4', title: 'Effective Potential Energy'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m6',
        title: 'Hamiltonian Mechanics & Phase Space',
        summary: 'Hamiltonian Mechanics & Phase Space',
        units: [
          skeletonUnit(id: 'phy703-m6-u1', title: 'Motivation'),
          skeletonUnit(id: 'phy703-m6-u2', title: 'Legendre Transformation'),
          skeletonUnit(id: 'phy703-m6-u3', title: 'Hamilton\'s Canonical Equations'),
          skeletonUnit(id: 'phy703-m6-u4', title: 'Phase Space Geometry'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m7',
        title: 'Rigid Body Dynamics & Generalized Motion',
        summary: 'Rigid Body Dynamics & Generalized Motion',
        units: [
          skeletonUnit(id: 'phy703-m7-u1', title: 'Continuous Rigid Bodies'),
          skeletonUnit(id: 'phy703-m7-u2', title: 'Center of Mass & Moment of Inertia'),
          skeletonUnit(id: 'phy703-m7-u3', title: 'The Inertia Tensor'),
          skeletonUnit(id: 'phy703-m7-u4', title: 'Euler\'s Equations of Motion'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m8',
        title: 'Oscillatory Systems & Normal Modes',
        summary: 'Oscillatory Systems & Normal Modes',
        units: [
          skeletonUnit(id: 'phy703-m8-u1', title: 'Physics of Small Oscillations'),
          skeletonUnit(id: 'phy703-m8-u2', title: 'Coupled Oscillators'),
          skeletonUnit(id: 'phy703-m8-u3', title: 'The Secular Equation'),
          skeletonUnit(id: 'phy703-m8-u4', title: 'Normal Modes & Coordinates'),
        ],
      ),
      skeletonModule(
        id: 'phy703-m9',
        title: 'Mechanics of Continuous Media & Wave Equations',
        summary: 'Mechanics of Continuous Media & Wave Equations',
        units: [
          skeletonUnit(id: 'phy703-m9-u1', title: 'Discrete to Continuous Transition'),
          skeletonUnit(id: 'phy703-m9-u2', title: 'Lagrangian Density'),
          skeletonUnit(id: 'phy703-m9-u3', title: 'Continuous Euler-Lagrange Equation'),
          skeletonUnit(id: 'phy703-m9-u4', title: 'The 1D Wave Equation'),
        ],
      ),
    ],
  );
}
