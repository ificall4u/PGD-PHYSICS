import 'package:pgd_physics/models/course.dart';

/// Complete PHY 703 – Analytical Mechanics
/// Micro-chunked, intuition-first, written for Tochi
Course buildPhy703() {
  return Course(
    id: 'phy703',
    code: 'PHY 703',
    title: 'Analytical Mechanics',
    description:
        'From everyday motion to the elegant Lagrangian and Hamiltonian pictures — conservative forces, central forces, rigid bodies, oscillations and the deep principles that govern them all.',
    semester: 'First Semester',
    units: 3,
    icon: '⚛️',
    colorHint: ColorHint.cyan,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. CONSERVATIVE FORCES & POTENTIALS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t1',
        title: 'Conservative Forces and Potentials',
        summary: 'Forces that store energy cleanly — the foundation of almost everything that follows.',
        units: [
          Unit(
            id: 'phy703-t1-u1',
            title: 'What Makes a Force “Conservative”?',
            content: r'''
# What Makes a Force “Conservative”?

Hey Tochi…

Imagine rolling a ball up a smooth hill and letting it go. It comes back with the same speed it started with (ignoring friction). The force of gravity did not “steal” any energy permanently; it only stored it and gave it back.

A force is called **conservative** when the work it does on a particle moving from A to B depends *only* on the endpoints, not on the path taken.

Equivalently: the work done around any closed loop is exactly zero.

Gravity and the ideal spring force are conservative. Friction is not — it always takes energy away as heat, no matter which path you choose.
''',
            keyTakeaways: [
              'Conservative force → work depends only on start and end points.',
              'Work around any closed loop is zero.',
              'Gravity and ideal springs are conservative; friction is not.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t1u1q1',
                question: 'If a force does different amounts of work along two different paths between the same two points, the force is…',
                options: [
                  'Conservative',
                  'Non-conservative',
                  'Always gravitational',
                  'Impossible',
                ],
                correctIndex: 1,
                explanation: 'Path dependence is the hallmark of a non-conservative force.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t1-u2',
            title: 'Potential Energy – The Stored Form',
            content: r'''
# Potential Energy – The Stored Form

Because a conservative force’s work depends only on position, we can invent a function of position called **potential energy** V.

The force is then simply the negative gradient of V:

$$ \mathbf{F} = -\nabla V $$

In one dimension this is just:

$$ F = -\frac{dV}{dx} $$

### Intuition
Potential energy is the “account balance” of stored work. When the force does negative work on the particle (slowing it down), the potential energy account increases by the same amount. Total mechanical energy E = K + V stays constant.
''',
            keyTakeaways: [
              'Conservative force = negative gradient of a potential energy function.',
              'V is defined so that the work done by the force equals the decrease in V.',
              'Mechanical energy K + V is conserved.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t1u2q1',
                question: 'The force is related to potential energy by…',
                options: [
                  'F = +dV/dx',
                  'F = –dV/dx (in one dimension)',
                  'F = V × x',
                  'F = ∫V dx',
                ],
                correctIndex: 1,
                explanation: 'The minus sign means the force pushes the system toward lower potential energy.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. CENTRAL FORCES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t2',
        title: 'Central Force Problems',
        summary: 'Forces that always point toward (or away from) a single fixed point — gravity, electrostatics, springs in 3-D.',
        units: [
          Unit(
            id: 'phy703-t2-u1',
            title: 'What is a Central Force?',
            content: r'''
# What is a Central Force?

A force is **central** if it always points directly toward (or directly away from) a fixed centre and its magnitude depends only on the distance from that centre.

$$ \mathbf{F} = f(r)\, \hat{\mathbf{r}} $$

Gravity between two point masses and the Coulomb force are the classic examples.

### Immediate consequences
- The torque about the centre is zero → **angular momentum about the centre is conserved**.
- Motion is confined to a plane (the plane perpendicular to the constant angular-momentum vector).

That single fact collapses a three-dimensional problem into a two-dimensional one and is the starting point for planetary motion, Rutherford scattering, and more.
''',
            keyTakeaways: [
              'Central force points along the line from a fixed centre and depends only on distance.',
              'Angular momentum about the centre is conserved.',
              'Motion stays in a single plane.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t2u1q1',
                question: 'Why is angular momentum conserved in a central-force problem?',
                options: [
                  'Because energy is conserved',
                  'Because the torque about the centre is zero',
                  'Because the force is strong',
                  'Because mass is constant',
                ],
                correctIndex: 1,
                explanation: 'Torque = r × F; when F is parallel to r the cross product vanishes.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t2-u2',
            title: 'Effective Potential – Turning 3-D into 1-D',
            content: r'''
# Effective Potential – Turning 3-D into 1-D

Because angular momentum L is conserved, the kinetic energy of the tangential motion can be rewritten as a purely radial term:

$$ \frac{L^2}{2mr^2} $$

This term acts exactly like an extra potential. We combine it with the real potential V(r) to form the **effective potential**:

$$ V_{\text{eff}}(r) = V(r) + \frac{L^2}{2mr^2} $$

The radial motion then looks like a simple one-dimensional particle moving in V_eff. All the familiar tools (turning points, bound orbits, escape energy) become available again.
''',
            keyTakeaways: [
              'Conserved angular momentum produces a centrifugal barrier L²/2mr².',
              'V_eff = V + centrifugal term.',
              'Radial motion reduces to 1-D motion in V_eff.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t2u2q1',
                question: 'The centrifugal term in the effective potential comes from…',
                options: [
                  'Gravity itself',
                  'The conserved angular momentum',
                  'Friction',
                  'Air resistance',
                ],
                correctIndex: 1,
                explanation: 'It is the kinetic energy associated with the tangential velocity, rewritten using L = mrv_θ.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. DEGREES OF FREEDOM & GENERALISED COORDINATES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t3',
        title: 'Degrees of Freedom and Generalised Coordinates',
        summary: 'Counting how many independent numbers are needed to specify a configuration, then choosing the smartest numbers.',
        units: [
          Unit(
            id: 'phy703-t3-u1',
            title: 'Degrees of Freedom – Counting Freedom',
            content: r'''
# Degrees of Freedom – Counting Freedom

The number of **degrees of freedom** is the number of independent coordinates you must specify to fix the configuration of the system completely.

- Free particle in 3-D space → 3 degrees of freedom
- Rigid body in 3-D space → 6 (3 translational + 3 rotational)
- Pendulum swinging in a plane → 1 (just the angle)

Constraints reduce the count. A bead forced to slide on a wire has only one degree of freedom even though it lives in three-dimensional space.

Getting the count right is the first practical step before writing any equations.
''',
            keyTakeaways: [
              'Degrees of freedom = number of independent coordinates needed.',
              'Constraints reduce the number.',
              'A free rigid body has six degrees of freedom.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t3u1q1',
                question: 'A simple pendulum (bob on a fixed-length string swinging in a plane) has how many degrees of freedom?',
                options: ['1', '2', '3', '0'],
                correctIndex: 0,
                explanation: 'Only the angle is free; the length is fixed by the constraint.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t3-u2',
            title: 'Generalised Coordinates – Choosing Smart Variables',
            content: r'''
# Generalised Coordinates – Choosing Smart Variables

Any set of independent coordinates that completely specify the configuration are called **generalised coordinates** (usually written q₁, q₂, …, qₙ).

They do not have to be Cartesian. For a pendulum the angle θ is a far better generalised coordinate than x and y.

The time derivatives ẋ, ẏ, … become \(\dot{q}_i\). Kinetic and potential energies are rewritten entirely in terms of the q’s and \(\dot{q}\)’s. That is the preparation for Lagrange’s equations.
''',
            keyTakeaways: [
              'Generalised coordinates are any convenient independent set.',
              'They can be angles, distances along a constraint, etc.',
              'Everything will be expressed in terms of q and q̇.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t3u2q1',
                question: 'Why do we bother introducing generalised coordinates?',
                options: [
                  'They make the force look stronger',
                  'They automatically incorporate constraints and often simplify the equations',
                  'They are required by Newton’s laws',
                  'They eliminate energy',
                ],
                correctIndex: 1,
                explanation: 'Smart coordinates absorb the constraints so we never have to write constraint forces explicitly.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. LAGRANGE’S FORMULATION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t4',
        title: 'Lagrange’s Formulation of Mechanics',
        summary: 'A completely different starting point that uses energy instead of force and automatically respects constraints.',
        units: [
          Unit(
            id: 'phy703-t4-u1',
            title: 'The Lagrangian – Kinetic Minus Potential',
            content: r'''
# The Lagrangian – Kinetic Minus Potential

Instead of writing ∑F = ma for every particle, we form a single function called the **Lagrangian**:

$$ L = T - V $$

T is the total kinetic energy, V the total potential energy, both expressed in generalised coordinates.

This one function contains the entire dynamics. The equations of motion are obtained from it by a standard recipe (the Euler–Lagrange equations). The great practical advantage: constraint forces that do no virtual work never appear.
''',
            keyTakeaways: [
              'L = T – V',
              'Everything is written in generalised coordinates.',
              'Constraint forces that do no work drop out automatically.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t4u1q1',
                question: 'The Lagrangian is defined as…',
                options: [
                  'T + V',
                  'T – V',
                  'V – T',
                  '½mv² only',
                ],
                correctIndex: 1,
                explanation: 'By definition L = kinetic energy minus potential energy.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t4-u2',
            title: 'Euler–Lagrange Equations – The Recipe',
            content: r'''
# Euler–Lagrange Equations – The Recipe

For each generalised coordinate qᵢ the equation of motion is:

$$ \frac{d}{dt}\left(\frac{\partial L}{\partial \dot{q}_i}\right) - \frac{\partial L}{\partial q_i} = 0 $$

In plain English:
- Compute how L depends on the velocity \(\dot{q}_i\) → that is the “generalised momentum”
- Take its time derivative
- Subtract how L depends on the coordinate qᵢ itself
- Set the result to zero

Do this once for every degree of freedom. You obtain exactly the same dynamics as Newton’s laws, but often with far less pain.
''',
            keyTakeaways: [
              'One Euler–Lagrange equation per generalised coordinate.',
              'It is a systematic recipe once L is written down.',
              'Equivalent to Newton but constraint-friendly.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t4u2q1',
                question: 'How many Euler–Lagrange equations do you write for a system with 3 degrees of freedom?',
                options: ['1', '2', '3', '6'],
                correctIndex: 2,
                explanation: 'One equation for each independent generalised coordinate.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. CALCULUS OF VARIATIONS & ACTION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t5',
        title: 'Calculus of Variations and the Action Principle',
        summary: 'The deepest reason Lagrange’s equations work — nature chooses the path that makes the action stationary.',
        units: [
          Unit(
            id: 'phy703-t5-u1',
            title: 'The Action – A Single Number for a Whole Path',
            content: r'''
# The Action – A Single Number for a Whole Path

Imagine every possible path a system could take between two times. For each path we can compute the integral of the Lagrangian along that path:

$$ S = \int_{t_1}^{t_2} L\, dt $$

S is called the **action**. It is just a single number for each entire history.

Hamilton’s principle (the action principle) says that the path actually taken by the system is the one for which S is stationary (usually a minimum). The Euler–Lagrange equations are precisely the condition that makes S stationary.

This is one of the most beautiful ideas in all of physics: the laws of motion are equivalent to a statement about an extremum of a single quantity.
''',
            keyTakeaways: [
              'Action S = time integral of L along a path.',
              'The true path makes S stationary.',
              'Euler–Lagrange equations are the mathematical expression of that stationarity.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t5u1q1',
                question: 'Hamilton’s principle says the true path is the one that…',
                options: [
                  'Maximises kinetic energy',
                  'Makes the action stationary',
                  'Minimises potential energy only',
                  'Follows the shortest geometric distance',
                ],
                correctIndex: 1,
                explanation: 'The action integral is stationary along the physical trajectory.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. HAMILTON’S FORMULATION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t6',
        title: 'Hamilton’s Formulation of Mechanics',
        summary: 'Rewrite the dynamics in terms of coordinates and momenta — the gateway to statistical mechanics and quantum theory.',
        units: [
          Unit(
            id: 'phy703-t6-u1',
            title: 'From Lagrange to Hamilton – Legendre Transform',
            content: r'''
# From Lagrange to Hamilton – Legendre Transform

We define the **generalised momentum** conjugate to qᵢ:

$$ p_i = \frac{\partial L}{\partial \dot{q}_i} $$

Then we construct the Hamiltonian by a Legendre transform:

$$ H(q,p) = \sum_i p_i \dot{q}_i - L $$

When L = T – V and T is quadratic in velocities, H turns out to be simply T + V — the total energy expressed in terms of q and p.
''',
            keyTakeaways: [
              'pᵢ = ∂L/∂q̇ᵢ is the conjugate momentum.',
              'H = ∑ p q̇ – L',
              'For standard kinetic energy, H equals total energy.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t6u1q1',
                question: 'In most ordinary mechanical systems the Hamiltonian equals…',
                options: [
                  'Kinetic energy only',
                  'Potential energy only',
                  'Total energy T + V',
                  'The Lagrangian',
                ],
                correctIndex: 2,
                explanation: 'When T is quadratic in the velocities, H = T + V.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t6-u2',
            title: 'Hamilton’s Equations – The New Equations of Motion',
            content: r'''
# Hamilton’s Equations – The New Equations of Motion

The dynamics are now expressed as a pair of first-order equations for every degree of freedom:

$$ \dot{q}_i = \frac{\partial H}{\partial p_i} \qquad \dot{p}_i = -\frac{\partial H}{\partial q_i} $$

These are Hamilton’s equations. They treat coordinates and momenta on an equal footing and make the geometric structure of phase space visible. They are the starting point for Liouville’s theorem, canonical transformations, and the road to quantum mechanics.
''',
            keyTakeaways: [
              'Two first-order equations per degree of freedom.',
              'q̇ = ∂H/∂p , ṗ = –∂H/∂q',
              'Phase-space geometry becomes transparent.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t6u2q1',
                question: 'Hamilton’s equations are first-order in time. How many of them are there for a system with n degrees of freedom?',
                options: ['n', '2n', 'n²', '1'],
                correctIndex: 1,
                explanation: 'One equation for each q and one for each p → 2n equations.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. RIGID BODY DYNAMICS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t7',
        title: 'Rigid Body Dynamics',
        summary: 'Rotation of extended objects that keep their shape — angular velocity, inertia tensor, Euler angles.',
        units: [
          Unit(
            id: 'phy703-t7-u1',
            title: 'Angular Velocity and the Inertia Tensor',
            content: r'''
# Angular Velocity and the Inertia Tensor

A rigid body has six degrees of freedom. Three describe the location of a reference point (usually the centre of mass). The remaining three describe orientation.

The angular velocity vector ω tells how the orientation is changing. The rotational kinetic energy is

$$ T_{\text{rot}} = \frac{1}{2} \boldsymbol{\omega} \cdot \mathbf{I} \cdot \boldsymbol{\omega} $$

where I is the **inertia tensor** — a 3×3 matrix that depends on the mass distribution. In principal axes I becomes diagonal and the expression simplifies to ½(I₁ω₁² + I₂ω₂² + I₃ω₃³).
''',
            keyTakeaways: [
              'Rigid body = 6 degrees of freedom.',
              'Rotational KE involves the inertia tensor.',
              'Principal axes diagonalise I and simplify the energy.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t7u1q1',
                question: 'The inertia tensor encodes…',
                options: [
                  'Only the total mass',
                  'How the mass is distributed relative to the rotation axes',
                  'The temperature of the body',
                  'The colour of the object',
                ],
                correctIndex: 1,
                explanation: 'It is built from the second moments of the mass distribution.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 8. OSCILLATORY SYSTEMS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t8',
        title: 'Oscillatory Systems – Damped, Forced & Coupled',
        summary: 'Small vibrations about equilibrium — the universal language of small motions in physics.',
        units: [
          Unit(
            id: 'phy703-t8-u1',
            title: 'Simple, Damped and Forced Oscillators',
            content: r'''
# Simple, Damped and Forced Oscillators

Near a stable equilibrium the potential looks like a parabola, so the restoring force is linear. The result is simple harmonic motion.

Add a friction term proportional to velocity → damped oscillator.  
Drive it with an external oscillating force → forced oscillator, resonance, phase lag.

All of these are still linear second-order ODEs and can be solved exactly with the methods you already met in Mathematical Methods.
''',
            keyTakeaways: [
              'Stable equilibrium → harmonic restoring force for small displacements.',
              'Damping dissipates energy; driving can feed energy in.',
              'Resonance occurs when the driving frequency matches a natural frequency.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t8u1q1',
                question: 'Resonance in a forced oscillator is strongest when the driving frequency is…',
                options: [
                  'Very low',
                  'Very high',
                  'Close to a natural frequency of the system',
                  'Exactly zero',
                ],
                correctIndex: 2,
                explanation: 'Energy is transferred most efficiently near the natural frequencies.',
              ),
            ],
          ),
          Unit(
            id: 'phy703-t8-u2',
            title: 'Coupled Oscillations and Normal Modes',
            content: r'''
# Coupled Oscillations and Normal Modes

When two (or more) oscillators can exchange energy, the motion looks complicated in the original coordinates. There exist special patterns of motion — **normal modes** — in which every part of the system oscillates at the same frequency with fixed relative amplitudes.

Any free motion is a linear combination of the normal modes. Finding the normal-mode frequencies and shapes is an eigenvalue problem; the matrix that appears is built from the kinetic and potential energy quadratic forms.

This idea appears everywhere: molecules, coupled circuits, lattices, and the free vibrations of continuous systems.
''',
            keyTakeaways: [
              'Normal modes = independent collective oscillations at single frequencies.',
              'General motion = superposition of normal modes.',
              'Frequencies and shapes come from an eigenvalue problem.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t8u2q1',
                question: 'In a system of coupled oscillators, a normal mode is a motion in which…',
                options: [
                  'Only one oscillator moves',
                  'All parts move at the same frequency with fixed amplitude ratios',
                  'Energy is continually lost',
                  'The system stays at rest',
                ],
                correctIndex: 1,
                explanation: 'That is the definition of a normal mode.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 9. CONTINUOUS MEDIA (BRIEF)
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy703-t9',
        title: 'Mechanics of Continuous Media – First Look',
        summary: 'When the number of degrees of freedom becomes infinite — strings, membranes, fluids.',
        units: [
          Unit(
            id: 'phy703-t9-u1',
            title: 'From Discrete to Continuous',
            content: r'''
# From Discrete to Continuous

A beaded string with N beads has N degrees of freedom. As N → ∞ and the spacing → 0 we obtain a continuous string. The discrete index i is replaced by a continuous coordinate x, and the displacement becomes a field u(x,t).

The Lagrangian becomes an integral of a Lagrangian density. The Euler–Lagrange equation turns into a partial differential equation — the wave equation for the transverse string.

The same limiting process produces the equations of continuum mechanics and classical field theory.
''',
            keyTakeaways: [
              'Continuous systems are the N → ∞ limit of coupled oscillators.',
              'Displacement becomes a field u(x,t).',
              'The wave equation emerges naturally.',
            ],
            quiz: [
              QuizQuestion(
                id: '703t9u1q1',
                question: 'The wave equation for a string can be viewed as the continuum limit of…',
                options: [
                  'A single free particle',
                  'A chain of coupled oscillators',
                  'A rigid body',
                  'A central-force problem',
                ],
                correctIndex: 1,
                explanation: 'That is the standard derivation from a discrete mass-spring chain.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
