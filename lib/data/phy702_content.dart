import 'package:pgd_physics/models/course.dart';

/// Complete PHY 702 – Electromagnetism
/// Micro-chunked, visual & physical-first for Tochi (no heavy vector calculus assumed)
Course buildPhy702() {
  return Course(
    id: 'phy702',
    code: 'PHY 702',
    title: 'Electromagnetism',
    description:
        'Electric and magnetic fields as real physical entities — from Coulomb’s law and Gauss’s law through Faraday, Maxwell’s equations and the beginnings of electromagnetic waves.',
    semester: 'Second Semester',
    units: 3,
    icon: '⚡',
    colorHint: ColorHint.cyan,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. COULOMB’S LAW & ELECTROSTATIC FORCE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t1',
        title: 'Coulomb’s Law and Electrostatic Force',
        summary: 'The basic force between electric charges — the starting point of everything electrical.',
        units: [
          Unit(
            id: 'phy702-t1-u1',
            title: 'Electric Charge – Two Kinds Only',
            content: r'''
# Electric Charge – Two Kinds Only

Hey Tochi…

Electric charge comes in exactly two varieties. We call them positive and negative by pure convention. Like charges repel; opposite charges attract.

Charge is conserved: you cannot create or destroy net charge, you can only separate it or move it around. The smallest free chunk of charge we normally meet is the charge of a proton or electron (they are equal in size and opposite in sign).
''',
            keyTakeaways: [
              'Only two kinds of charge: positive and negative.',
              'Like charges repel, opposite charges attract.',
              'Net charge is conserved.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t1u1q1',
                question: 'Two positive charges placed near each other will…',
                options: [
                  'Attract each other',
                  'Repel each other',
                  'Feel no force',
                  'Orbit each other forever',
                ],
                correctIndex: 1,
                explanation: 'Like charges always repel.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t1-u2',
            title: 'Coulomb’s Law – The Size of the Force',
            content: r'''
# Coulomb’s Law – The Size of the Force

The force between two point charges is:

- Proportional to the product of the two charges  
- Inversely proportional to the square of the distance between them  
- Directed along the line joining them

In symbols:

$$ F = k \frac{q_1 q_2}{r^2} $$

k is just a constant that sets the units. The important physical content is the inverse-square dependence and the product of the charges.

This is the electrical analogue of Newton’s law of gravitation, but far stronger and able to attract or repel.
''',
            keyTakeaways: [
              'Force ∝ product of charges.',
              'Force ∝ 1/r².',
              'Direction is along the line joining the charges.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t1u2q1',
                question: 'If you double the distance between two charges, the electrostatic force becomes…',
                options: [
                  'Twice as big',
                  'Half as big',
                  'One-quarter as big',
                  'Four times as big',
                ],
                correctIndex: 2,
                explanation: 'Inverse-square means doubling r multiplies the force by 1/4.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. ELECTRIC FIELD & GAUSS’S LAW
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t2',
        title: 'Electric Field and Gauss’s Law',
        summary: 'Thinking of the force as a property of space itself, and a powerful shortcut for symmetric cases.',
        units: [
          Unit(
            id: 'phy702-t2-u1',
            title: 'The Electric Field – A Property of Space',
            content: r'''
# The Electric Field – A Property of Space

Instead of saying “charge A exerts a force on charge B”, we can say:

“Charge A creates an invisible condition in the space around it — the electric field E. When charge B is placed in that space it feels a force F = qE.”

The field is a vector at every point; its direction is the direction of the force on a positive test charge, and its magnitude is force per unit charge.

Thinking in terms of fields becomes essential once charges start moving or the situation is time-varying.
''',
            keyTakeaways: [
              'Electric field = force per unit charge.',
              'It is a property of the space around charges.',
              'F = qE once the field is known.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t2u1q1',
                question: 'The electric field at a point is defined as…',
                options: [
                  'The total charge nearby',
                  'The force experienced by a unit positive charge placed at that point',
                  'The potential energy only',
                  'The magnetic field strength',
                ],
                correctIndex: 1,
                explanation: 'That is the operational definition of E.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t2-u2',
            title: 'Gauss’s Law – The Flux Idea',
            content: r'''
# Gauss’s Law – The Flux Idea

Imagine the electric field as a flow of invisible arrows. The “flux” through a closed surface is a measure of how many arrows pierce outward through that surface.

Gauss’s law says:

**The total electric flux out of any closed surface equals the charge enclosed divided by ε₀.**

In highly symmetric situations (sphere, infinite plane, infinite line) the flux is easy to calculate and you can solve for E without doing complicated integrals. That is why Gauss’s law is so practical.
''',
            keyTakeaways: [
              'Flux measures how much field “pierces” a surface.',
              'Gauss: outward flux = Q_enclosed / ε₀.',
              'Symmetry turns the law into a fast way to find E.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t2u2q1',
                question: 'Gauss’s law relates the electric flux through a closed surface to…',
                options: [
                  'The magnetic field',
                  'The charge enclosed by that surface',
                  'The temperature',
                  'The mass of the surface',
                ],
                correctIndex: 1,
                explanation: 'Flux is proportional to the enclosed charge.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. POTENTIAL, POISSON & LAPLACE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t3',
        title: 'Electric Potential, Poisson and Laplace Equations',
        summary: 'Working with a scalar instead of a vector field, and the equations that govern it.',
        units: [
          Unit(
            id: 'phy702-t3-u1',
            title: 'Electric Potential – The Height Analogy',
            content: r'''
# Electric Potential – The Height Analogy

Just as gravitational potential energy depends on height, electric potential energy depends on position in an electric field. We define the **electric potential** V so that the potential energy of a charge q is qV.

The electric field points “downhill” from high potential to low potential, and its strength is the steepness of that slope:

$$ \mathbf{E} = -\nabla V $$

Working with the scalar V is often easier than working with the vector E.
''',
            keyTakeaways: [
              'Potential V is related to potential energy by U = qV.',
              'E points from high V to low V and equals the negative gradient of V.',
              'A scalar is usually simpler to handle than a vector.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t3u1q1',
                question: 'The electric field points…',
                options: [
                  'From low potential to high potential',
                  'From high potential to low potential',
                  'Always upward',
                  'In random directions',
                ],
                correctIndex: 1,
                explanation: 'By definition E = –∇V, so it points downhill in potential.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t3-u2',
            title: 'Poisson and Laplace Equations',
            content: r'''
# Poisson and Laplace Equations

When we combine Gauss’s law with E = –∇V we obtain an equation that V itself must satisfy:

$$ \nabla^2 V = -\frac{\rho}{\varepsilon_0} $$

This is **Poisson’s equation**. In regions where there is no charge (ρ = 0) it simplifies to

$$ \nabla^2 V = 0 $$

which is **Laplace’s equation**.

Solving these equations with given values of V (or its derivative) on the boundaries is the classic boundary-value problem of electrostatics.
''',
            keyTakeaways: [
              'Poisson: ∇²V = –ρ/ε₀ (charge present).',
              'Laplace: ∇²V = 0 (no charge).',
              'Boundary conditions select the unique physical solution.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t3u2q1',
                question: 'In empty space (no charge) the electrostatic potential obeys…',
                options: [
                  'Poisson’s equation with a large right-hand side',
                  'Laplace’s equation (∇²V = 0)',
                  'Coulomb’s law only',
                  'Faraday’s law',
                ],
                correctIndex: 1,
                explanation: 'When ρ = 0, Poisson reduces to Laplace.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. MAGNETOSTATICS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t4',
        title: 'Magnetostatics – Steady Currents and Magnetic Fields',
        summary: 'The magnetic field produced by steady currents and the forces it exerts.',
        units: [
          Unit(
            id: 'phy702-t4-u1',
            title: 'Magnetic Field of a Steady Current',
            content: r'''
# Magnetic Field of a Steady Current

Moving charges (currents) produce magnetic fields. The simplest useful statements are:

- A long straight wire produces circles of B field around itself.  
- A loop produces a field that threads through its centre (like a short magnet).  
- A solenoid produces an almost uniform field inside.

The direction is given by the right-hand rule: thumb in the direction of current, fingers curl in the direction of B.

Unlike electric field lines, magnetic field lines always form closed loops — they never begin or end.
''',
            keyTakeaways: [
              'Steady currents are the source of static magnetic fields.',
              'Field lines form closed loops.',
              'Right-hand rule gives the direction.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t4u1q1',
                question: 'Magnetic field lines…',
                options: [
                  'Begin on positive charges and end on negative charges',
                  'Always form closed loops',
                  'Are only present near magnets, never near currents',
                  'Point from low to high potential',
                ],
                correctIndex: 1,
                explanation: 'There are no magnetic monopoles, so lines close on themselves.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t4-u2',
            title: 'Force on a Moving Charge and on a Current',
            content: r'''
# Force on a Moving Charge and on a Current

A charge q moving with velocity v in a magnetic field B feels the Lorentz force:

$$ \mathbf{F} = q\,(\mathbf{v} \times \mathbf{B}) $$

The force is perpendicular to both v and B, so it changes direction but never speed. That is why magnetic fields bend particle trajectories into circles or helices without doing work.

A current-carrying wire is just a stream of moving charges, so it also feels a force in a magnetic field — the basis of electric motors.
''',
            keyTakeaways: [
              'F = q(v × B) — always perpendicular to velocity.',
              'Magnetic forces change direction, not speed.',
              'Currents in magnetic fields experience forces (motors).',
            ],
            quiz: [
              QuizQuestion(
                id: '702t4u2q1',
                question: 'A magnetic field can change a charged particle’s…',
                options: [
                  'Speed only',
                  'Direction of motion (but not its speed)',
                  'Mass',
                  'Charge',
                ],
                correctIndex: 1,
                explanation: 'The force is always perpendicular to v, so kinetic energy stays constant.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. FARADAY’S LAW & INDUCTION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t5',
        title: 'Faraday’s Law – Changing Magnetic Fields Make Electric Fields',
        summary: 'The discovery that links electricity and magnetism in a dynamical way.',
        units: [
          Unit(
            id: 'phy702-t5-u1',
            title: 'Induced EMF and Faraday’s Law',
            content: r'''
# Induced EMF and Faraday’s Law

Whenever the magnetic flux through a circuit changes, an electric current is driven around that circuit. Faraday’s law states that the induced electromotive force equals the negative rate of change of flux:

$$ \mathcal{E} = -\frac{d\Phi_B}{dt} $$

The minus sign is Lenz’s law: the induced current tries to oppose the change that produced it.

This is the operating principle of generators, transformers and inductors.
''',
            keyTakeaways: [
              'Changing magnetic flux induces an EMF.',
              'EMF = –dΦ_B/dt.',
              'Lenz’s law gives the direction (opposition to the change).',
            ],
            quiz: [
              QuizQuestion(
                id: '702t5u1q1',
                question: 'An EMF is induced in a loop whenever…',
                options: [
                  'There is a steady magnetic field through it',
                  'The magnetic flux through the loop is changing',
                  'The loop is made of copper',
                  'The temperature rises',
                ],
                correctIndex: 1,
                explanation: 'Only a changing flux produces an induced EMF.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. MAXWELL’S EQUATIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t6',
        title: 'Maxwell’s Equations – The Complete Set',
        summary: 'Four equations that govern all classical electric and magnetic phenomena.',
        units: [
          Unit(
            id: 'phy702-t6-u1',
            title: 'The Four Equations in Words',
            content: r'''
# The Four Equations in Words

Maxwell collected and completed the laws of electricity and magnetism into four statements:

1. **Gauss’s law for electricity** – Electric flux out of a closed surface is proportional to the charge inside.  
2. **Gauss’s law for magnetism** – Magnetic flux out of any closed surface is zero (no magnetic monopoles).  
3. **Faraday’s law** – A changing magnetic field produces an electric field (curl of E is related to –∂B/∂t).  
4. **Ampère–Maxwell law** – Magnetic field is produced by currents *and* by changing electric fields.

The last term (the displacement current) was Maxwell’s great addition; without it the equations would be inconsistent and electromagnetic waves would not exist.
''',
            keyTakeaways: [
              'Four equations summarise all classical EM.',
              'Maxwell’s displacement-current term completes Ampère’s law.',
              'Together they predict electromagnetic waves.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t6u1q1',
                question: 'Maxwell’s key addition to the existing laws was…',
                options: [
                  'Coulomb’s law',
                  'The displacement-current term in Ampère’s law',
                  'The invention of the battery',
                  'The discovery of the electron',
                ],
                correctIndex: 1,
                explanation: 'The displacement current made the equations consistent and predicted waves.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t6-u2',
            title: 'Electromagnetic Waves – The Great Prediction',
            content: r'''
# Electromagnetic Waves – The Great Prediction

When Maxwell’s equations are combined in empty space they yield wave equations for both E and B. The speed of those waves turns out to be exactly

$$ c = \frac{1}{\sqrt{\mu_0\varepsilon_0}} $$

which is the measured speed of light. Light is an electromagnetic wave.

The simplest solutions are plane waves in which E and B oscillate perpendicular to each other and to the direction of travel. Spherical waves radiate outward from localised sources, falling in amplitude as 1/r.
''',
            keyTakeaways: [
              'Maxwell’s equations predict waves that travel at the speed of light.',
              'Light is an electromagnetic wave.',
              'Plane and spherical waves are the basic solutions.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t6u2q1',
                question: 'The speed of electromagnetic waves in vacuum is determined by…',
                options: [
                  'The charge of the electron',
                  'The constants μ₀ and ε₀ that appear in Maxwell’s equations',
                  'The temperature of space',
                  'The mass of the photon',
                ],
                correctIndex: 1,
                explanation: 'c = 1/√(μ₀ε₀) is a direct consequence of the wave equation derived from Maxwell.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. ENERGY IN FIELDS & MOVING CHARGES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy702-t7',
        title: 'Electric & Magnetic Energy, Moving Charges in Fields',
        summary: 'Where the energy is stored and how charges move under the full Lorentz force.',
        units: [
          Unit(
            id: 'phy702-t7-u1',
            title: 'Energy Stored in Electric and Magnetic Fields',
            content: r'''
# Energy Stored in Electric and Magnetic Fields

It takes work to assemble a collection of charges or to build up a current in an inductor. That work is stored in the fields themselves:

- Electric energy density ∝ E²  
- Magnetic energy density ∝ B²

In many practical devices (capacitors, inductors, resonant circuits) thinking of the energy as residing in the fields is both accurate and useful.
''',
            keyTakeaways: [
              'Assembling charges or currents stores energy in the fields.',
              'Electric energy density proportional to E².',
              'Magnetic energy density proportional to B².',
            ],
            quiz: [
              QuizQuestion(
                id: '702t7u1q1',
                question: 'The energy stored in a capacitor is best thought of as residing in…',
                options: [
                  'The metal plates only',
                  'The electric field between the plates',
                  'The connecting wires',
                  'The battery forever',
                ],
                correctIndex: 1,
                explanation: 'The energy density is proportional to E² in the field region.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-t7-u2',
            title: 'Moving Charges in Combined E and B Fields',
            content: r'''
# Moving Charges in Combined E and B Fields

The full force on a charge is the Lorentz force:

$$ \mathbf{F} = q\mathbf{E} + q(\mathbf{v} \times \mathbf{B}) $$

Electric fields change the speed; magnetic fields change only the direction. Together they produce drifts, cycloid motion, and the Hall effect you already met. This single equation governs particle motion in everything from CRT tubes to particle accelerators to the Earth’s magnetosphere.
''',
            keyTakeaways: [
              'Full Lorentz force = electric part + magnetic part.',
              'E changes energy; B only changes direction.',
              'Combined fields produce rich trajectories.',
            ],
            quiz: [
              QuizQuestion(
                id: '702t7u2q1',
                question: 'Which part of the Lorentz force can change the kinetic energy of a charged particle?',
                options: [
                  'Only the magnetic part',
                  'Only the electric part',
                  'Both equally',
                  'Neither',
                ],
                correctIndex: 1,
                explanation: 'Magnetic force is always perpendicular to velocity and does no work; electric force can do work.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
