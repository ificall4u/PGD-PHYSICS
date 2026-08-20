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
            Module(
        id: 'phy703-m3',
        title: 'Calculus of Variations & Hamilton\'s Principle of Least Action',
        summary:
            'From Newtonian forces to action principles; action integral; full derivation of the Euler–Lagrange equation.',
        units: [
          Unit(
            id: 'phy703-m3-u1',
            title: 'Path optimization intuition',
            content: r'''
## Learning goal

Contrast Newtonian “force at each instant” thinking with the idea that nature selects an entire path in time, using Fermat’s principle as a physical metaphor.

## Newtonian picture

In Newton’s laws, you look at a system at one moment: forces act, acceleration follows, F = ma. The future is built by integrating those instantaneous laws forward in time. The fundamental object is the force (or the differential equation) at each t.

## Path picture

Another point of view asks: among all imaginable histories the system could follow between two configurations, which history actually occurs? Mechanics can be rewritten so that the true history is the one that makes a certain global quantity — the **action** — stationary (often a minimum or a saddle).

That is a shift from “what pushes right now?” to “which entire path is preferred?”

## Optical metaphor: Fermat’s principle

Light traveling between two points in a medium with varying speed does not “feel a force” in the mechanical sense. Yet the path it takes is the one that makes the travel **time** stationary (Fermat’s principle of least time). In a uniform medium that path is a straight line; at an interface it yields Snell’s law.

Fermat’s principle is an existence proof that nature sometimes encodes dynamics as a path-optimization rule. Hamilton’s principle is the mechanical analogue: replace “time of travel” by a mechanical **action** built from kinetic and potential energy.

## What we will build next

- Define the action as an integral along a trial path.
- Require that the true path makes the action stationary under variations that keep the endpoints fixed.
- Extract a differential equation — the Euler–Lagrange equation — that the true path must satisfy.

## Check yourself

In one sentence, how does a “path principle” differ from specifying F = ma at each instant?
''',
            keyTakeaways: [
              'Newton focuses on instantaneous forces; action principles select entire histories.',
              'Fermat\'s least-time principle is an optical analogue of path optimization.',
              'Hamilton\'s principle will play that role for mechanics.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m3-u1-q1',
                question: 'Fermat\'s principle says that light takes a path that',
                options: [
                  'Maximizes travel time always',
                  'Makes travel time stationary (often a minimum)',
                  'Ignores the medium completely',
                  'Is always a circle',
                ],
                correctIndex: 1,
                explanation: 'Fermat\'s principle is a stationary-time principle for optical paths.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m3-u2',
            title: 'The action integral and the Lagrangian',
            content: r'''
## Learning goal

Define the action S as an integral of the Lagrangian along a path, and explain L = T − V in plain language.

## Trial paths

Fix two times t₁ and t₂ and two configurations of the system: q(t₁) = q₁ and q(t₂) = q₂. A **trial path** is any smooth function q(t) connecting those endpoints. Only one of those paths is the true motion; the action principle will pick it out.

## Lagrangian

For a standard mechanical system, the **Lagrangian** is

L(q, q̇, t) = T(q, q̇, t) − V(q, t)

where:

- T is the kinetic energy (energy of motion), usually quadratic in the velocities q̇
- V is the potential energy (energy of configuration), depending on positions

So L measures, at each instant, “how much kinetic energy exceeds potential energy.”

## Action

The **action** of a path q(t) between t₁ and t₂ is

S[q] = ∫_{t₁}^{t₂} L(q(t), q̇(t), t) dt

S is a number attached to an entire history, not to a single moment. Different trial paths generally yield different values of S.

## Hamilton’s principle (statement)

Among all paths with the same endpoints q(t₁) and q(t₂), the true path is one for which S is **stationary**:

δS = 0

That is, a first-order change in the path produces no first-order change in S. (Often S is a minimum, but stationarity is the precise requirement.)

## Check yourself

If two trial paths share the same endpoints but differ in the middle, do they generally have the same action S?
''',
            keyTakeaways: [
              'L = T − V is the Lagrangian.',
              'S = ∫ L dt is the action of a path between fixed times.',
              'Hamilton\'s principle: the true path makes δS = 0 at fixed endpoints.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m3-u2-q1',
                question: 'The action S is',
                options: [
                  'Equal to the force at one instant',
                  'The integral of L along a path in time',
                  'Always equal to the potential energy only',
                  'The mass of the particle',
                ],
                correctIndex: 1,
                explanation: 'S = ∫_{t₁}^{t₂} L dt along the path.',
              ),
              QuizQuestion(
                id: 'phy703-m3-u2-q2',
                question: 'For standard mechanics, L equals',
                options: [
                  'T + V',
                  'T − V',
                  'V − T',
                  'T V',
                ],
                correctIndex: 1,
                explanation: 'The Lagrangian is kinetic minus potential energy.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m3-u3',
            title: 'Deriving the Euler–Lagrange equation',
            content: r'''
## Learning goal

Derive the Euler–Lagrange equation from δS = 0 with fixed endpoints, showing the variation, integration by parts, and boundary terms explicitly (one degree of freedom; the multi-DoF case is identical componentwise).

## Setup

Consider one generalized coordinate q(t). Let the true path be q(t), and a varied path be

q(t; ε) = q(t) + ε η(t)

where ε is a small parameter and η(t) is an arbitrary smooth function with

η(t₁) = 0,    η(t₂) = 0

so every varied path shares the same endpoints. Then

δq := ε η,    δq̇ = ε η̇

at linear order in ε.

## Action as a function of ε

S(ε) = ∫_{t₁}^{t₂} L(q + ε η, q̇ + ε η̇, t) dt

Stationarity of S at the true path means

dS/dε |_{ε=0} = 0

for every allowed η.

## Differentiate under the integral

dS/dε |_{ε=0} = ∫_{t₁}^{t₂} [ (∂L/∂q) η + (∂L/∂q̇) η̇ ] dt = 0

## Integration by parts on the velocity term

∫ (∂L/∂q̇) η̇ dt = [ (∂L/∂q̇) η ]_{t₁}^{t₂} − ∫ η d/dt(∂L/∂q̇) dt

Because η(t₁) = η(t₂) = 0, the boundary term vanishes:

[ (∂L/∂q̇) η ]_{t₁}^{t₂} = 0

Therefore

∫_{t₁}^{t₂} [ ∂L/∂q − d/dt(∂L/∂q̇) ] η(t) dt = 0

## Fundamental lemma of the calculus of variations

If a continuous function α(t) satisfies ∫ α(t) η(t) dt = 0 for every smooth η vanishing at the endpoints, then α(t) = 0 everywhere on (t₁, t₂).

Apply that lemma with

α(t) = ∂L/∂q − d/dt(∂L/∂q̇)

to conclude

d/dt (∂L/∂q̇) − ∂L/∂q = 0

This is the **Euler–Lagrange equation**.

## Several coordinates

If there are n generalized coordinates q₁, …, qₙ, the same argument applied to each variation ηᵢ yields

d/dt (∂L/∂q̇ᵢ) − ∂L/∂qᵢ = 0,    i = 1, …, n

## What we gained

The path principle δS = 0 is equivalent to a system of second-order differential equations for qᵢ(t) — the same dynamical content as Newton’s laws for standard systems, but written in arbitrary generalized coordinates.

## Check yourself

Where did the fixed-endpoint condition η(t₁) = η(t₂) = 0 enter the derivation, and what would go wrong if the endpoints were free?
''',
            keyTakeaways: [
              'Vary q(t) → q + εη with η vanishing at t₁ and t₂.',
              'Integration by parts moves d/dt onto ∂L/∂q̇; boundary terms vanish.',
              'Euler–Lagrange: d/dt(∂L/∂q̇) − ∂L/∂q = 0 (each coordinate).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m3-u3-q1',
                question: 'In the derivation of Euler–Lagrange, the boundary term vanishes because',
                options: [
                  'L is always zero',
                  'η(t₁) = η(t₂) = 0',
                  'T equals V',
                  'Time is discrete',
                ],
                correctIndex: 1,
                explanation: 'Fixed endpoints force the variation η to vanish at the ends.',
              ),
              QuizQuestion(
                id: 'phy703-m3-u3-q2',
                question: 'The Euler–Lagrange equation is',
                options: [
                  '∂L/∂q = 0 only',
                  'd/dt(∂L/∂q̇) − ∂L/∂q = 0',
                  'L = T + V',
                  'q̈ = 0 always',
                ],
                correctIndex: 1,
                explanation: 'That is the EL equation for each generalized coordinate.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy703-m4',
        title: 'Lagrangian Mechanics & Applications',
        summary:
            'Lagrangian recipe, mass-spring and pendulum worked examples, generalized momenta and cyclic coordinates.',
        units: [
          Unit(
            id: 'phy703-m4-u1',
            title: 'The Lagrangian recipe',
            content: r'''
## Learning goal

State a universal four-step procedure for solving a standard mechanical problem with the Lagrangian method.

## The four steps

1. **Choose generalized coordinates** q₁, …, qₙ that already incorporate holonomic constraints and match the degrees of freedom.

2. **Write the kinetic energy** T as a function of the q’s and q̇’s. Start from Cartesian (1/2)m(ẋ²+ẏ²+ż²) for each particle if needed, then substitute x(q), y(q), z(q).

3. **Write the potential energy** V as a function of the q’s (and possibly t). Examples: mgy, (1/2)kx², gravitational or electrostatic potentials.

4. **Form L = T − V** and apply the Euler–Lagrange equation for each coordinate:

d/dt (∂L/∂q̇ᵢ) − ∂L/∂qᵢ = 0

## What you get

A system of second-order differential equations for qᵢ(t) — the equations of motion — without explicitly introducing constraint forces that do no virtual work (for ideal holonomic constraints).

## Check yourself

Why is step 1 (choosing q’s that build in constraints) important before writing T and V?
''',
            keyTakeaways: [
              'Recipe: choose q\'s → write T → write V → L = T − V → Euler–Lagrange.',
              'T is often easiest from Cartesians after substituting x(q).',
              'Ideal holonomic constraints are built into the coordinates, not added as extra forces.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m4-u1-q1',
                question: 'The Lagrangian recipe ends by applying',
                options: [
                  'Only Newton\'s third law',
                  'The Euler–Lagrange equations to L = T − V',
                  'Fermat\'s principle to light only',
                  'Random forces',
                ],
                correctIndex: 1,
                explanation: 'Step 4 is forming L and writing EL equations.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m4-u2',
            title: 'Application 1: mass–spring oscillator',
            content: r'''
## Learning goal

Carry out the Lagrangian recipe for a one-dimensional mass–spring system and recover m q̈ + k q = 0.

## System

Mass m slides without friction in one dimension, attached to a fixed wall by a spring of constant k. Let q be the extension from equilibrium (so V = 0 at q = 0).

## Step 1 — Coordinate

One degree of freedom: generalized coordinate q.

## Step 2 — Kinetic energy

T = (1/2) m q̇²

## Step 3 — Potential energy

V = (1/2) k q²

## Step 4 — Lagrangian and EL

L = T − V = (1/2) m q̇² − (1/2) k q²

Compute:

∂L/∂q̇ = m q̇

d/dt (∂L/∂q̇) = m q̈

∂L/∂q = − k q

Euler–Lagrange: m q̈ − (−k q) = 0 ⇒

m q̈ + k q = 0

This is Newton’s second law with F = −k q. The Lagrangian method reproduces the familiar oscillator equation.

## Check yourself

If the equilibrium were shifted so V = (1/2)k(q − q₀)², what changes in the EL equation after a redefinition of the origin?
''',
            keyTakeaways: [
              'For the mass–spring: L = (1/2)m q̇² − (1/2)k q².',
              'EL yields m q̈ + k q = 0.',
              'Lagrangian mechanics agrees with Newton for this standard system.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m4-u2-q1',
                question: 'For L = (1/2)m q̇² − (1/2)k q², the EL equation is',
                options: [
                  'm q̈ − k q = 0',
                  'm q̈ + k q = 0',
                  'q̈ = 0',
                  'k q̈ + m q = 0',
                ],
                correctIndex: 1,
                explanation: 'd/dt(m q̇) − (−k q) = 0 gives m q̈ + k q = 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m4-u3',
            title: 'Application 2: simple pendulum',
            content: r'''
## Learning goal

Express the plane pendulum in terms of the angle θ, build L, and derive the exact equation of motion.

## Geometry

Pivot at the origin; rod length ℓ; mass m in a vertical plane. Angle θ measured from the downward vertical.

Cartesian coordinates of the mass:

x = ℓ sin θ

y = −ℓ cos θ

(with y increasing upward).

## Velocities

ẋ = ℓ θ̇ cos θ

ẏ = ℓ θ̇ sin θ

ẋ² + ẏ² = ℓ² θ̇² (cos²θ + sin²θ) = ℓ² θ̇²

## Kinetic and potential energy

T = (1/2) m (ẋ² + ẏ²) = (1/2) m ℓ² θ̇²

V = m g y = − m g ℓ cos θ

(If you prefer V = 0 at the bottom, use V = m g ℓ (1 − cos θ); the two choices differ by a constant and give the same EL equation.)

## Lagrangian

Using V = − m g ℓ cos θ:

L = (1/2) m ℓ² θ̇² + m g ℓ cos θ

Using V = m g ℓ (1 − cos θ):

L = (1/2) m ℓ² θ̇² − m g ℓ (1 − cos θ)

## Euler–Lagrange

Take L = (1/2) m ℓ² θ̇² + m g ℓ cos θ.

∂L/∂θ̇ = m ℓ² θ̇

d/dt (∂L/∂θ̇) = m ℓ² θ̈

∂L/∂θ = − m g ℓ sin θ

EL: m ℓ² θ̈ − (− m g ℓ sin θ) = 0 ⇒

θ̈ + (g/ℓ) sin θ = 0

For small θ, sin θ ≈ θ, recovering θ̈ + (g/ℓ) θ = 0.

## Check yourself

Show that switching to V = m g ℓ (1 − cos θ) yields the same EL equation.
''',
            keyTakeaways: [
              'Pendulum: T = (1/2)m ℓ² θ̇² after substituting Cartesians.',
              'L leads to θ̈ + (g/ℓ) sin θ = 0.',
              'Additive constants in V do not change the equations of motion.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m4-u3-q1',
                question: 'The exact pendulum equation from EL is',
                options: [
                  'θ̈ + (g/ℓ) θ = 0 only (exact for all angles)',
                  'θ̈ + (g/ℓ) sin θ = 0',
                  'θ̈ = 0',
                  'θ̈ − (g/ℓ) sin θ = 0',
                ],
                correctIndex: 1,
                explanation: 'The nonlinear equation is θ̈ + (g/ℓ) sin θ = 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m4-u4',
            title: 'Generalized momenta and cyclic coordinates',
            content: r'''
## Learning goal

Define generalized momentum, identify cyclic coordinates, and connect missing coordinates in L to conservation laws (Noether intuition).

## Generalized momentum

For each coordinate qⱼ define

pⱼ := ∂L/∂q̇ⱼ

This is the **generalized momentum** conjugate to qⱼ. For a free particle with L = (1/2)m ẋ² and q = x, one gets p = m ẋ — ordinary linear momentum. For the pendulum coordinate θ, p_θ = m ℓ² θ̇ — angular momentum about the pivot.

## Euler–Lagrange in momentum form

EL says

dpⱼ/dt = ∂L/∂qⱼ

So the rate of change of pⱼ equals how L depends on qⱼ itself.

## Cyclic coordinates

If L does not depend on a particular coordinate qⱼ (though it may still depend on q̇ⱼ),

∂L/∂qⱼ = 0

then

dpⱼ/dt = 0 ⇒ pⱼ = constant

Such a qⱼ is called **cyclic** (or ignorable). Its conjugate momentum is conserved.

## Noether intuition

A coordinate that does not appear in L labels a direction in configuration space along which the physics looks the same — a **symmetry**. The conserved pⱼ is the quantity tied to that symmetry (Noether’s theorem in elementary form: continuous symmetry ↔ conserved momentum).

### Examples

- Free particle: L independent of x ⇒ p_x = mẋ conserved (translation symmetry).
- Central force in polar coordinates: L independent of φ ⇒ p_φ = angular momentum conserved (rotational symmetry).

## Check yourself

For L = (1/2)m(ṙ² + r² φ̇²) − V(r), which coordinate is cyclic and what is conserved?
''',
            keyTakeaways: [
              'pⱼ = ∂L/∂q̇ⱼ is the momentum conjugate to qⱼ.',
              'If ∂L/∂qⱼ = 0, then pⱼ is conserved (qⱼ is cyclic).',
              'A missing coordinate signals a symmetry and a conservation law.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m4-u4-q1',
                question: 'If L does not depend on qⱼ, then',
                options: [
                  'qⱼ must be zero',
                  'pⱼ = ∂L/∂q̇ⱼ is constant in time',
                  'Energy is always zero',
                  'The system has no kinetic energy',
                ],
                correctIndex: 1,
                explanation: 'Cyclic coordinates have conserved conjugate momenta.',
              ),
              QuizQuestion(
                id: 'phy703-m4-u4-q2',
                question: 'Generalized momentum pⱼ is defined as',
                options: [
                  '∂L/∂qⱼ',
                  '∂L/∂q̇ⱼ',
                  'qⱼ itself',
                  'T + V',
                ],
                correctIndex: 1,
                explanation: 'pⱼ := ∂L/∂q̇ⱼ.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy703-m5',
        title: 'Central Forces & Central Potential Problems',
        summary:
            'Central forces, reduced mass, angular momentum conservation and planar motion, effective potential.',
        units: [
          Unit(
            id: 'phy703-m5-u1',
            title: 'Physical definition of a central force',
            content: r'''
## Learning goal

Define a central force and give the main physical examples used in orbital mechanics.

## Definition

A force on a particle is **central** (about a fixed point O) if it is always directed along the line from O to the particle. In vector form,

F(r) = F(r) r̂

where r is the distance from O, r̂ is the unit vector from O toward the particle, and F(r) depends only on r (not on angles).

Equivalently, F = −∇V with a potential V that depends only on r: V = V(r).

## Examples

- Newtonian gravity of a fixed point mass: F(r) = −GMm/r² (attractive).
- Coulomb force between charges (same structure with constants k q₁ q₂).
- Ideal spring force toward a fixed origin: F = −k r (Hooke’s law in 3D radial form).

## Two-body remark

In the two-body problem (Sun–Earth, binary stars), each body pulls the other along the line joining them. After the reduction of the next unit, the relative motion behaves as a single particle in a central force about the center of mass.

## Check yourself

Is a uniform gravitational field F = −mg ẑ near the Earth’s surface a central force about the Earth’s center? About a point on the table?
''',
            keyTakeaways: [
              'A central force is always along the line from a fixed center: F = F(r) r̂.',
              'It derives from a potential V(r) that depends only on distance.',
              'Gravity and Coulomb forces are the standard orbital examples.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m5-u1-q1',
                question: 'A central force about O is always',
                options: [
                  'Perpendicular to the radius from O',
                  'Parallel to the radius vector from O',
                  'Independent of position',
                  'Zero',
                ],
                correctIndex: 1,
                explanation: 'Central means along the line from O to the particle.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m5-u2',
            title: 'Reduction to the one-body problem',
            content: r'''
## Learning goal

Derive the reduced mass μ = m₁ m₂ / (m₁ + m₂) and show that relative motion obeys a one-body equation with that mass.

## Two-body setup

Particles of masses m₁, m₂ at positions r₁, r₂ relative to an inertial origin. Interaction forces are equal and opposite along r₁ − r₂ (Newton’s third law, central mutual force).

Total mass M = m₁ + m₂. Center of mass:

R = (m₁ r₁ + m₂ r₂) / M

Relative vector:

r = r₁ − r₂

## Invert for r₁, r₂

r₁ = R + (m₂/M) r

r₂ = R − (m₁/M) r

## Kinetic energy split

T = (1/2) m₁ |ṙ₁|² + (1/2) m₂ |ṙ₂|²

Substitute and expand. Cross terms rearrange so that

T = (1/2) M |Ṙ|² + (1/2) μ |ṙ|²

where the **reduced mass** is

μ = m₁ m₂ / (m₁ + m₂)

## Relative equation of motion

If the only forces are the mutual central forces ±F, the center of mass moves uniformly (or stays at rest), and the relative vector satisfies

μ r̈ = F

with F along r — a single particle of mass μ in a central force.

## Check yourself

If m₂ → ∞ with m₁ fixed (fixed force center), what does μ approach?
''',
            keyTakeaways: [
              'Two-body motion splits into CM motion plus relative motion.',
              'μ = m₁ m₂ / (m₁ + m₂) is the reduced mass.',
              'Relative vector obeys μ r̈ = F with F central in r.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m5-u2-q1',
                question: 'The reduced mass μ equals',
                options: [
                  'm₁ + m₂',
                  'm₁ m₂ / (m₁ + m₂)',
                  'm₁ − m₂',
                  'M²',
                ],
                correctIndex: 1,
                explanation: 'μ = m₁ m₂ / (m₁ + m₂).',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m5-u3',
            title: 'Angular momentum conservation and planar motion',
            content: r'''
## Learning goal

Prove that a central force conserves angular momentum, and deduce that the motion lies in a fixed plane.

## Angular momentum

For a particle (or relative particle) at position r with momentum p = μ ṙ,

L = r × p = μ r × ṙ

## Torque of a central force

Torque about the origin: τ = r × F. If F = F(r) r̂, then F is parallel to r, so

r × F = 0

Newton’s law in angular form: dL/dt = τ = 0. Therefore

L = constant vector

## Planar motion

Because L is fixed in direction, r × ṙ is always parallel to a fixed axis. Both r and ṙ remain perpendicular to that axis, so r(t) stays in the fixed plane orthogonal to L (provided L ≠ 0).

If L = 0, motion is along a straight line through the origin.

## Polar form in the plane

In the plane of motion, use polar coordinates (r, φ). Then

|L| = μ r² φ̇ = constant

so

φ̇ = ℓ / (μ r²)

where ℓ = |L| is the constant magnitude of angular momentum.

## Check yourself

Why does r × F vanish when F is parallel to r?
''',
            keyTakeaways: [
              'Central force ⇒ torque zero ⇒ angular momentum L conserved.',
              'Fixed L direction ⇒ motion in a fixed plane.',
              'In plane polar coordinates, μ r² φ̇ = ℓ constant.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m5-u3-q1',
                question: 'For a central force, angular momentum about the center is',
                options: [
                  'Never conserved',
                  'Conserved in time',
                  'Always zero',
                  'Equal to the energy',
                ],
                correctIndex: 1,
                explanation: 'Torque vanishes, so dL/dt = 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-m5-u4',
            title: 'Effective potential energy',
            content: r'''
## Learning goal

Derive the effective potential V_eff(r) = V(r) + ℓ²/(2μ r²), interpret the centrifugal term, and describe the shape for Newtonian gravity.

## Radial kinetic energy

In plane polar coordinates,

T = (1/2) μ (ṙ² + r² φ̇²)

Using ℓ = μ r² φ̇ so φ̇ = ℓ/(μ r²),

T = (1/2) μ ṙ² + ℓ² / (2 μ r²)

## Energy

E = T + V(r) = (1/2) μ ṙ² + [ V(r) + ℓ² / (2 μ r²) ]

Define the **effective potential**

V_eff(r) = V(r) + ℓ² / (2 μ r²)

Then

E = (1/2) μ ṙ² + V_eff(r)

Radial motion looks like a 1D particle of mass μ in the potential V_eff.

## Centrifugal barrier

The term ℓ²/(2μ r²) is positive and blows up as r → 0 when ℓ ≠ 0. It represents the kinetic energy tied up in tangential motion required by angular-momentum conservation: you cannot reach r = 0 without infinite tangential speed if ℓ ≠ 0. That is the **centrifugal barrier**.

## Newtonian gravity

V(r) = −α/r with α = G M μ (for fixed center mass M, or the two-body equivalent). Then

V_eff(r) = −α/r + ℓ²/(2μ r²)

- As r → 0, the +1/r² term dominates → V_eff → +∞.
- As r → ∞, V_eff → 0 from below if α > 0.
- There is a minimum at intermediate r for ℓ ≠ 0, allowing circular and bound elliptical orbits for suitable E.

## Check yourself

For ℓ = 0, what happens to V_eff, and can the particle reach the origin if V = −α/r?
''',
            keyTakeaways: [
              'V_eff(r) = V(r) + ℓ²/(2μ r²).',
              'The ℓ²/(2μ r²) term is the centrifugal barrier.',
              'Radial motion is 1D motion in V_eff; gravity yields the standard orbital effective potential.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy703-m5-u4-q1',
                question: 'The centrifugal term in V_eff is',
                options: [
                  '−ℓ²/(2μ r²)',
                  'ℓ²/(2μ r²)',
                  'μ r²',
                  'V(r) only',
                ],
                correctIndex: 1,
                explanation: 'Angular kinetic energy becomes ℓ²/(2μ r²) in V_eff.',
              ),
              QuizQuestion(
                id: 'phy703-m5-u4-q2',
                question: 'Energy in radial form reads',
                options: [
                  'E = V only',
                  'E = (1/2)μ ṙ² + V_eff(r)',
                  'E = ℓ only',
                  'E = 0 always',
                ],
                correctIndex: 1,
                explanation: 'That is the 1D energy equation for r(t).',
              ),
            ],
          ),
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
