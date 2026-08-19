import 'package:pgd_physics/models/course.dart';

/// PHY 703 — Classical Mechanics
/// Module 1 filled from content_prompts/PHY703 at full depth.
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
            Module(
        id: 'phy703-m1',
        title: 'Conservative Forces, Work, and Potential Energy',
        summary:
            'Work as a line integral, conservative forces, potential energy, and stability from the second derivative of V.',
        units: [
          Unit(
            id: 'phy703-m1-u1',
            title: 'Work and energy intuition',
            content: r'''
## Learning goal

Define mechanical work from the idea of a force acting through a displacement, and write the line-integral formula with every symbol explained.

## Physical meaning of work

When you push a heavy box across the floor, you apply a force while the box moves. Work measures how much that force contributes along the motion. If you push hard but the box does not move, the displacement is zero and the work is zero. If the box moves perpendicular to your push, that component of force does no work either.

## Constant force, straight path

If a constant force F points in the same direction as a straight displacement of length Delta x, the elementary definition is

W = F * Delta x

If the force makes an angle theta with the displacement,

W = (F cos theta) * Delta x = F · dr

where dr is the displacement vector and · is the dot product. Only the component of force along the motion counts.

## Variable force, curved path

In real problems the force can change from point to point. Divide the path into tiny segments dr. On each segment the force is nearly constant, so the tiny bit of work is

dW = F · dr

Sum (integrate) along the path C from point A to point B:

W(A to B) = integral_C F · dr

In coordinates, if r(t) runs from A to B as t goes from t1 to t2,

W = integral from t1 to t2 of F(r(t)) · v(t) dt

with v = dr/dt.

## Link to kinetic energy (preview)

Newton second law implies that the work of the net force equals the change in kinetic energy K = (1/2) m v^2 (work-energy theorem). We use that after conservative forces are defined.

## Check yourself

If you carry a backpack at constant height across a room (force of your hand upward, displacement horizontal), how much work does the vertical supporting force do?
''',
            keyTakeaways: [
              'Work measures force along the displacement.',
              'For a path C: W = integral F · dr.',
              'Only the component of F parallel to dr contributes.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m1-u1-q1',
                question: 'The work of a force along a path C is',
                options: [
                  'F times total time only',
                  'The line integral of F · dr along C',
                  'Always zero',
                  'F · F',
                ],
                correctIndex: 1,
                explanation: 'Work is the line integral of F along the path.',
              ),
              QuizQuestion(
                id: 'phy703-m1-u1-q2',
                question: 'If F is perpendicular to dr everywhere on the path, W equals',
                options: [
                  'A large positive number',
                  '0',
                  'Infinity',
                  'Always - (1/2)mv^2',
                ],
                correctIndex: 1,
                explanation: 'F · dr = 0 when the vectors are perpendicular.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m1-u2',
            title: 'Conservative vs non-conservative forces',
            content: r'''
## Learning goal

Distinguish path-independent (conservative) forces from path-dependent ones, using closed-path work as the test.

## Round-trip hike analogy

Imagine hiking between two points. Elevation change depends only on start and end height, not on whether you took a winding trail or a straight path. That is like a conservative force: the work depends only on the endpoints.

Friction is different: a longer, rougher path costs more effort. Work against friction depends on the path — non-conservative.

## Definition

A force field F(r) is conservative if for every pair of points A, B the work from A to B is independent of which path you choose.

Equivalent statements (in a simply connected region, under standard smoothness):

1. Work around every closed loop is zero.
2. There exists a scalar function V(r) with F = -grad V (next unit).
3. curl F = 0 in 3D.

## Examples

Conservative (idealized): uniform gravity near Earth; ideal spring; electrostatic force in a static field.

Non-conservative: kinetic friction; air drag.

## Path dependence

If F is not conservative, two paths from A to B can give different work values. The difference is often energy lost to heat or other degrees of freedom not tracked in the mechanical model.

## Check yourself

You lift a book straight up, then let it descend on a curved ramp to the same height. Ignoring friction, how does the work of gravity on the way up compare to the work of gravity on the way down?
''',
            keyTakeaways: [
              'Conservative work depends only on endpoints, not on the path.',
              'Closed-loop work vanishes for conservative forces.',
              'Friction and drag are classic non-conservative examples.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m1-u2-q1',
                question: 'A force is conservative when',
                options: [
                  'It is always perpendicular to velocity',
                  'Work between two points is path-independent',
                  'It must be time-dependent',
                  'It can do no work at all',
                ],
                correctIndex: 1,
                explanation: 'Path-independent work is the defining property used here.',
              ),
              QuizQuestion(
                id: 'phy703-m1-u2-q2',
                question: 'Work by kinetic friction around a closed loop is typically',
                options: [
                  'Exactly zero always',
                  'Not zero (path-dependent dissipation)',
                  'Infinite',
                  'Equal to mgh only',
                ],
                correctIndex: 1,
                explanation: 'Friction dissipates energy; closed-loop work is not zero in general.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m1-u3',
            title: 'Potential energy and F = -dV/dx',
            content: r'''
## Learning goal

Define potential energy for a conservative force, derive F = -dV/dx in one dimension, and explain the minus sign.

## Building V from work

Because work from A to B is path-independent for a conservative force, we define a scalar potential energy V(r) so that the work done by the force when the particle moves from A to B is

W_by force (A to B) = V(A) - V(B)

The force does positive work when the system moves to lower potential energy (like gravity doing work as something falls).

Equivalently,

V(B) - V(A) = - integral_A^B F · dr

V is defined only up to an additive constant; only differences matter.

## One dimension

In 1D, integral from x1 to x2 of F(x) dx = V(x1) - V(x2).

Differentiate both sides with respect to the upper limit (fundamental theorem of calculus):

F(x) = - dV/dx

## Three dimensions

F = -grad V, so F_x = -dV/dx, and so on.

## Meaning of the minus sign

If V increases as x increases (uphill on a potential graph), dV/dx > 0, so F = -dV/dx points toward decreasing x — down the potential slope. Springs pull back toward the minimum of (1/2) k x^2; gravity pulls toward lower gravitational potential.

## Examples

Gravity (z upward): V = m g z, F_z = -m g.

Spring: V = (1/2) k x^2, F = -k x.

## Mechanical energy (preview)

When only conservative forces do work, K + V is constant. Non-conservative work changes K + V.

## Check yourself

If V(x) = (1/2) k x^2, compute F and state the direction relative to the displacement from x = 0.
''',
            keyTakeaways: [
              'For conservative F, W_by force(A to B) = V(A) - V(B).',
              'In 1D, F = -dV/dx; in 3D, F = -grad V.',
              'The minus sign means forces drive the system toward lower potential.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m1-u3-q1',
                question: 'If F = -dV/dx and V has positive slope, F points',
                options: [
                  'In the +x direction',
                  'In the -x direction',
                  'Always zero',
                  'Infinity',
                ],
                correctIndex: 1,
                explanation: 'Positive dV/dx implies negative F: force points downhill.',
              ),
              QuizQuestion(
                id: 'phy703-m1-u3-q2',
                question: 'For V = m g z (z upward), the force is',
                options: [
                  '+m g in the z direction',
                  '-m g in the z direction',
                  '0',
                  'm g x',
                ],
                correctIndex: 1,
                explanation: 'F_z = -dV/dz = -m g.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m1-u4',
            title: 'Equilibrium and stability',
            content: r'''
## Learning goal

Define equilibrium from the force (or from dV/dx), and derive the second-derivative test for stable vs unstable equilibrium in one dimension.

## Equilibrium

A point x0 is an equilibrium if a particle placed there with zero velocity feels no force:

F(x0) = 0

For a conservative system, F = -dV/dx, so dV/dx at x0 is 0. Equilibria are critical points of V.

## Marble analogies

Stable: marble in the bottom of a bowl. Small displacement leads to a restoring force. V has a local minimum.

Unstable: marble on a hilltop. Small displacement and it runs away. V has a local maximum.

Neutral: marble on a flat table. V is locally flat.

## Second-derivative test (1D)

Near x0, Taylor expand:

V(x) ≈ V(x0) + V'(x0)(x - x0) + (1/2) V''(x0)(x - x0)^2 + ...

At equilibrium V'(x0) = 0, so

V(x) ≈ V(x0) + (1/2) V''(x0)(x - x0)^2

Force: F ≈ -V''(x0)(x - x0)

If V''(x0) > 0, then F is opposite to the displacement: restoring, stable.

If V''(x0) < 0, force points further away: unstable.

If V''(x0) = 0, the test is inconclusive.

## Small oscillations preview

Near a stable point with V''(x0) = k_eff > 0,

F ≈ -k_eff (x - x0)

like a spring. Motion is simple harmonic with omega = sqrt(k_eff / m) for mass m.

## Check yourself

For V(x) = x^4 - x^2, find the equilibria and classify them with V''.
''',
            keyTakeaways: [
              'Equilibrium: F = 0, or V\' = 0 for conservative 1D systems.',
              'V\'\' > 0 means stable; V\'\' < 0 means unstable (1D test).',
              'Near a stable minimum, motion is approximately harmonic.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m1-u4-q1',
                question: 'At a stable equilibrium of V(x),',
                options: [
                  'V\'\' < 0',
                  'V\'\' > 0',
                  'V is infinite',
                  'F is infinite',
                ],
                correctIndex: 1,
                explanation: 'A local minimum has positive second derivative.',
              ),
              QuizQuestion(
                id: 'phy703-m1-u4-q2',
                question: 'Equilibrium requires',
                options: [
                  'V = 0 only',
                  'F = 0 (or grad V = 0)',
                  'Kinetic energy infinite',
                  'Time = 0',
                ],
                correctIndex: 1,
                explanation: 'No force means no acceleration from rest at that point.',
              ),
            ],
          ),
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
