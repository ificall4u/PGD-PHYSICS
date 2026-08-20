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
            Module(
        id: 'phy703-m2',
        title: 'Degrees of Freedom & Generalized Coordinates',
        summary:
            'Degrees of freedom, holonomic vs non-holonomic constraints, generalized coordinates, and configuration space.',
        units: [
          Unit(
            id: 'phy703-m2-u1',
            title: 'Degrees of freedom (DoF)',
            content: r'''
## Learning goal

Define degrees of freedom as the number of independent pieces of information needed to specify the configuration of a mechanical system, and compute DoF for simple examples.

## Physical meaning

A system’s **degrees of freedom** (DoF) answer: how many independent numbers do you need to say exactly where everything is?

### Free bead in space

A single point particle free in three-dimensional space can move independently in x, y, and z. You need three numbers to locate it. DoF = 3.

### Bead on a wire

If the same bead is forced to slide on a fixed curved wire, its position is fixed once you know a single parameter along the wire (arc length s, or an angle if the wire is a circle). DoF = 1.

The wire has removed two independent directions of motion by constraint.

### Rigid body in space (preview)

A free rigid body needs 3 numbers for the position of one reference point and 3 numbers for orientation (for example three Euler angles). DoF = 6 when unconstrained.

## Counting rule (unconstrained particles)

N point particles in 3D, with no constraints: DoF = 3N.

Each independent constraint that can be used to eliminate one coordinate reduces the count by one (details in the next unit).

## Check yourself

A free particle on a tabletop (motion only in a plane) has how many degrees of freedom?
''',
            keyTakeaways: [
              'DoF = number of independent coordinates needed to specify the configuration.',
              'A free particle in 3D has 3 DoF; a bead on a fixed wire has 1 DoF.',
              'Constraints reduce the number of independent coordinates.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m2-u1-q1',
                question: 'A bead forced to slide on a fixed wire has',
                options: [
                  '3 degrees of freedom',
                  '1 degree of freedom',
                  '0 degrees of freedom',
                  '6 degrees of freedom',
                ],
                correctIndex: 1,
                explanation: 'One parameter along the wire completely fixes the bead\'s position.',
              ),
              QuizQuestion(
                id: 'phy703-m2-u2-q0',
                question: 'N free point particles in 3D with no constraints have',
                options: [
                  'N degrees of freedom',
                  '3N degrees of freedom',
                  '6N degrees of freedom',
                  '1 degree of freedom',
                ],
                correctIndex: 1,
                explanation: 'Each particle contributes 3 coordinates.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m2-u2',
            title: 'Holonomic and non-holonomic constraints',
            content: r'''
## Learning goal

Define constraints, distinguish holonomic from non-holonomic constraints, and give real-world examples of each.

## What a constraint is

A **constraint** is a restriction on the possible motions or configurations of a system — a rule the system is not allowed to violate (an ideal rigid rod, a surface it must stay on, a no-slip rolling condition).

## Holonomic constraints

A constraint is **holonomic** if it can be written as an equation relating the coordinates (and possibly time) only, not the velocities:

f(x₁, y₁, z₁, …, t) = 0

Such a constraint can be used to eliminate one coordinate from the description of the system.

### Example: simple pendulum

A mass on a rigid rod of length ℓ pivoted in a plane satisfies

x² + y² − ℓ² = 0

(with origin at the pivot). This is holonomic. One angle θ completely describes the configuration: x = ℓ sin θ, y = −ℓ cos θ.

### Example: bead on a sphere

A bead constrained to a sphere of radius R:

x² + y² + z² − R² = 0

Holonomic; two angular coordinates (θ, φ) remain.

## Non-holonomic constraints

A constraint is **non-holonomic** if it cannot be written as a relation among coordinates alone — typically it involves velocities (or is an inequality).

### Example: rolling without slipping

A vertical coin rolling on a plane without slipping has a velocity constraint linking the rotation rate to the speed of the contact point. That relation is on velocities; it cannot be integrated once and for all into a fixed relation among coordinates alone in the general case. The system is non-holonomic.

### Example: inequality constraints

A solid object resting on a table satisfies z ≥ 0 for its bottom surface — an inequality, also outside the simple holonomic equality class.

## Why the distinction matters

Holonomic constraints let us reduce to a smaller set of independent coordinates before writing equations of motion. Non-holonomic constraints often must be enforced with extra conditions (Lagrange multipliers, quasi-coordinates) and change the structure of the variational problem.

## Check yourself

Is the rigid-rod condition for a plane pendulum holonomic or non-holonomic? Why?
''',
            keyTakeaways: [
              'Holonomic constraints are equations among coordinates (and possibly t) only.',
              'Non-holonomic constraints involve velocities or inequalities and cannot be reduced the same way.',
              'Pendulum rod length is holonomic; ideal no-slip rolling is a classic non-holonomic example.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m2-u2-q1',
                question: 'A holonomic constraint can be written as',
                options: [
                  'A relation involving velocities only, never positions',
                  'An equation among coordinates (and possibly time)',
                  'Always an inequality',
                  'Newton\'s second law itself',
                ],
                correctIndex: 1,
                explanation: 'Holonomic constraints are f(coordinates, t) = 0.',
              ),
              QuizQuestion(
                id: 'phy703-m2-u2-q2',
                question: 'Rolling without slipping is typically',
                options: [
                  'Holonomic',
                  'Non-holonomic',
                  'Not a constraint',
                  'The same as a free particle',
                ],
                correctIndex: 1,
                explanation: 'No-slip links velocities and is not reducible to a pure coordinate equation in general.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m2-u3',
            title: 'Generalized coordinates',
            content: r'''
## Learning goal

Explain why Cartesian coordinates are often inconvenient under constraints, and define generalized coordinates q₁, …, qₙ that match the true degrees of freedom.

## The inconvenience of Cartesians

For a plane pendulum, the mass has Cartesian coordinates (x, y), but they are not independent: x² + y² = ℓ². If you write kinetic energy T = (1/2)m(ẋ² + ẏ²) and potential V = mgy, you must still enforce the constraint at every step.

It is cleaner to use the single angle θ:

x = ℓ sin θ,    y = −ℓ cos θ

Then T = (1/2) m ℓ² θ̇², V = −mgℓ cos θ, with no leftover constraint equation.

## Definition

**Generalized coordinates** are any set of independent coordinates

q₁, q₂, …, qₙ

sufficient to specify the configuration of the system when constraints (holonomic ones) have been built in. The number n equals the number of degrees of freedom.

They need not be lengths: angles, arc lengths, or other parameters are allowed. The word “generalized” means “not restricted to Cartesian x, y, z.”

## Example set

- Plane pendulum: q₁ = θ
- Spherical pendulum: q₁ = θ, q₂ = φ
- Free particle in plane: q₁ = x, q₂ = y (Cartesians happen to be fine)
- Double pendulum: q₁ = θ₁, q₂ = θ₂

## Velocities

Generalized velocities are q̇ᵢ = dqᵢ/dt. Kinetic energy is written as a function of the q’s and q̇’s after substituting the relations between Cartesian velocities and q̇’s.

## Check yourself

For a bead on a fixed horizontal circle of radius R, name one convenient generalized coordinate and state the DoF.
''',
            keyTakeaways: [
              'Generalized coordinates q₁…qₙ specify configuration after holonomic constraints are incorporated.',
              'n equals the number of degrees of freedom.',
              'Angles and other parameters are valid generalized coordinates.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m2-u3-q1',
                question: 'Generalized coordinates are',
                options: [
                  'Always Cartesian x, y, z only',
                  'Any independent coordinates that specify the configuration',
                  'Only energy and time',
                  'Only velocities',
                ],
                correctIndex: 1,
                explanation: 'Any independent configuration parameters are allowed.',
              ),
              QuizQuestion(
                id: 'phy703-m2-u3-q2',
                question: 'For a plane pendulum, a natural generalized coordinate is',
                options: [
                  'The mass m',
                  'The angle θ from the vertical',
                  'Time t only',
                  'The tension in the rod as a coordinate',
                ],
                correctIndex: 1,
                explanation: 'One angle fully fixes the position of the bob.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m2-u4',
            title: 'Configuration space',
            content: r'''
## Learning goal

Explain configuration space as the mathematical space in which each point represents one entire configuration of the physical system.

## Idea

Once generalized coordinates q₁, …, qₙ are chosen, every allowed arrangement of the system corresponds to a point

q = (q₁, q₂, …, qₙ)

in an n-dimensional space called **configuration space**.

### Examples

- Plane pendulum: configuration space is a circle (θ defined modulo 2π), often drawn as an angle line with ends identified.
- Free particle in a plane: configuration space is the plane ℝ² with coordinates (x, y).
- Double pendulum: configuration space is a 2-torus (two angles, each periodic).

## Motion as a path

As time runs, the system traces a curve q(t) in configuration space. The physical trajectory in ordinary space is recovered by mapping q(t) back through x(q), y(q), …

## Link to later modules

Lagrangian mechanics treats the path q(t) in configuration space as the unknown. Hamilton’s principle selects among all paths between two configurations the one that makes the action stationary. Configuration space is the stage on which that story is told.

## Check yourself

What is the dimension of the configuration space of a system with 5 degrees of freedom?
''',
            keyTakeaways: [
              'Configuration space is the n-dimensional space of generalized coordinates.',
              'Each point is one complete configuration of the system.',
              'Time evolution is a path q(t) through configuration space.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m2-u4-q1',
                question: 'Configuration space is',
                options: [
                  'Only ordinary 3D physical space',
                  'The space whose points are complete system configurations',
                  'Momentum space only',
                  'The same as the set of forces',
                ],
                correctIndex: 1,
                explanation: 'Each point of configuration space labels one full configuration via the q\'s.',
              ),
              QuizQuestion(
                id: 'phy703-m2-u4-q2',
                question: 'A system with n degrees of freedom has configuration space of dimension',
                options: [
                  '1 always',
                  'n',
                  '3n always',
                  '0',
                ],
                correctIndex: 1,
                explanation: 'One axis per independent generalized coordinate.',
              ),
            ],
          ),
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
