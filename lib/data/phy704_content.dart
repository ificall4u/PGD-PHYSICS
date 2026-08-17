import 'package:pgd_physics/models/course.dart';

/// Complete PHY 704 – Quantum Physics
/// Micro-chunked, conceptual & analogy-first for Tochi
Course buildPhy704() {
  return Course(
    id: 'phy704',
    code: 'PHY 704',
    title: 'Quantum Physics',
    description:
        'The strange rules of the microscopic world — state vectors, operators, spin, perturbation theory, scattering, and how quantum ideas explain atoms, solids and nuclei.',
    semester: 'Second Semester',
    units: 3,
    icon: '⚛️',
    colorHint: ColorHint.purple,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. WHY QUANTUM?
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t1',
        title: 'Why Classical Physics Fails at Small Scales',
        summary: 'The experimental clues that forced us to invent a new kind of mechanics.',
        units: [
          Unit(
            id: 'phy704-t1-u1',
            title: 'The Ultraviolet Catastrophe and Photons',
            content: r'''
# The Ultraviolet Catastrophe and Photons

Hey Tochi…

Classical physics predicted that a hot object should radiate infinite energy at short wavelengths — the “ultraviolet catastrophe.” Nature does not do that.

Planck’s solution (and Einstein’s interpretation) was radical: light comes in packets of energy E = hf. Those packets are photons. Energy is not continuous; it is grainy.

That single idea was the first crack in the classical world.
''',
            keyTakeaways: [
              'Classical physics predicted infinite UV radiation from hot bodies.',
              'Energy of light is quantised: E = hf.',
              'Photons are the energy packets of the electromagnetic field.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t1u1q1',
                question: 'The ultraviolet catastrophe was resolved by assuming that…',
                options: [
                  'Light intensity can be infinite',
                  'Light energy comes in discrete packets (photons)',
                  'Atoms have no energy levels',
                  'Temperature is continuous',
                ],
                correctIndex: 1,
                explanation: 'Quantisation of energy prevents the classical divergence.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t1-u2',
            title: 'Wave–Particle Duality',
            content: r'''
# Wave–Particle Duality

Electrons (and all matter) can diffract and interfere exactly as waves do. Light can eject electrons from a metal as if it were made of particles.

The same entity behaves as a wave or as a particle depending on the experiment you perform. There is no classical object that does both. Quantum mechanics is the theory that accepts this duality as fundamental.
''',
            keyTakeaways: [
              'Matter shows interference (wave behaviour).',
              'Light shows photoelectric effect (particle behaviour).',
              'Wave–particle duality is a central quantum fact.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t1u2q1',
                question: 'Wave–particle duality means that…',
                options: [
                  'Only light is a wave and only electrons are particles',
                  'The same quantum entity can exhibit both wave and particle properties',
                  'Classical physics is still complete',
                  'Interference is impossible',
                ],
                correctIndex: 1,
                explanation: 'Electrons diffract; photons eject electrons — both faces belong to the same entities.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. STATE VECTORS & OPERATORS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t2',
        title: 'State Vectors and Linear Operators',
        summary: 'How we describe a quantum system and the mathematical objects that represent measurements.',
        units: [
          Unit(
            id: 'phy704-t2-u1',
            title: 'The State Vector – A List of Possibilities',
            content: r'''
# The State Vector – A List of Possibilities

In classical physics a particle has a definite position and momentum. In quantum mechanics the most complete description is a **state vector** (or wavefunction).

Think of it as a list of complex numbers — one amplitude for every possible outcome of a measurement. The squared magnitude of each amplitude is the probability of that outcome.

Until you measure, the system is not forced to choose. The state vector encodes all the possibilities and their relative weights.
''',
            keyTakeaways: [
              'A state vector encodes the probabilities of all possible measurement outcomes.',
              'It is the most complete description of an isolated quantum system.',
              'Measurement forces one of the possibilities to become actual.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t2u1q1',
                question: 'A quantum state vector is best thought of as…',
                options: [
                  'The exact classical trajectory',
                  'A list of amplitudes for possible measurement outcomes',
                  'A photograph of the particle',
                  'The temperature of the system',
                ],
                correctIndex: 1,
                explanation: 'It is the collection of probability amplitudes for every possible result.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t2-u2',
            title: 'Operators – Actions that Extract Information',
            content: r'''
# Operators – Actions that Extract Information

Every physical quantity (position, momentum, energy, spin…) is represented by a **linear operator**. When you “measure” that quantity you apply the corresponding operator to the state vector.

If the state happens to be an eigenvector of the operator, the measurement yields a definite value (the eigenvalue) and the state is left unchanged. Otherwise the measurement yields one of the possible eigenvalues at random and the state collapses to the corresponding eigenvector.

Operators are the quantum replacement for ordinary classical variables.
''',
            keyTakeaways: [
              'Physical quantities ↔ linear operators.',
              'Eigenvalues are the possible measurement results.',
              'Measurement projects the state onto an eigenvector.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t2u2q1',
                question: 'In quantum mechanics, a measurable physical quantity is represented by…',
                options: [
                  'A simple number',
                  'A linear operator',
                  'A temperature',
                  'A classical trajectory',
                ],
                correctIndex: 1,
                explanation: 'Operators act on state vectors and their eigenvalues are the possible outcomes.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. ANGULAR MOMENTUM & SPIN
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t3',
        title: 'Angular Momentum and Spin',
        summary: 'Quantised rotation and the intrinsic angular momentum that has no classical analogue.',
        units: [
          Unit(
            id: 'phy704-t3-u1',
            title: 'Orbital Angular Momentum is Quantised',
            content: r'''
# Orbital Angular Momentum is Quantised

When a particle moves around a centre, its orbital angular momentum is quantised. The component along any chosen axis can only take discrete values spaced by ħ.

This is why electron orbits in atoms are labelled by integer quantum numbers and why the magnetic properties of atoms come in discrete steps.
''',
            keyTakeaways: [
              'Orbital angular momentum components are discrete multiples of ħ.',
              'Quantum numbers label the allowed values.',
              'This quantisation is visible in atomic spectra and magnetism.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t3u1q1',
                question: 'A component of orbital angular momentum can take…',
                options: [
                  'Any continuous value',
                  'Only discrete values spaced by ħ',
                  'Only zero',
                  'Only infinite values',
                ],
                correctIndex: 1,
                explanation: 'Angular momentum quantisation is one of the central results of quantum theory.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t3-u2',
            title: 'Spin – Intrinsic Angular Momentum',
            content: r'''
# Spin – Intrinsic Angular Momentum

Electrons (and many other particles) possess an intrinsic angular momentum called **spin** that is not caused by physical rotation in space. It is a purely quantum degree of freedom.

An electron has spin ½; its component along any axis is only +ħ/2 or –ħ/2. That two-valuedness is the origin of the Pauli exclusion principle and of the magnetic moment of the electron.

Spin has no classical counterpart; it is one of the clearest signatures that we have left the classical world.
''',
            keyTakeaways: [
              'Spin is intrinsic angular momentum, not orbital motion.',
              'Electron spin component is only ±ħ/2.',
              'Spin underlies the Pauli principle and electron magnetism.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t3u2q1',
                question: 'Electron spin is…',
                options: [
                  'Caused by the electron literally spinning on its axis like a top',
                  'An intrinsic quantum angular momentum with no classical analogue',
                  'Always zero',
                  'A form of orbital angular momentum',
                ],
                correctIndex: 1,
                explanation: 'Spin is a purely quantum attribute; the classical spinning-ball picture is only a metaphor.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. PERTURBATION THEORY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t4',
        title: 'Perturbation Theory',
        summary: 'How we calculate approximate answers when the exact problem is too hard.',
        units: [
          Unit(
            id: 'phy704-t4-u1',
            title: 'Time-Independent Perturbation Theory',
            content: r'''
# Time-Independent Perturbation Theory

Most realistic Hamiltonians are too complicated to solve exactly. If the extra piece is small we can treat it as a **perturbation**.

We start from a known solvable problem and add corrections order by order. The first-order correction to the energy is simply the average of the perturbing potential in the unperturbed state. Higher orders involve sums over intermediate states.

This is the workhorse method for fine-structure corrections, Stark and Zeeman effects, and many solid-state calculations.
''',
            keyTakeaways: [
              'Perturbation theory expands around a solvable problem.',
              'First-order energy shift = expectation value of the perturbation.',
              'Used throughout atomic and solid-state physics.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t4u1q1',
                question: 'The first-order correction to the energy in time-independent perturbation theory is…',
                options: [
                  'Always zero',
                  'The expectation value of the perturbing Hamiltonian in the unperturbed state',
                  'The classical energy',
                  'Infinite',
                ],
                correctIndex: 1,
                explanation: 'That is the standard first-order formula.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t4-u2',
            title: 'Time-Dependent Perturbation Theory – Transitions',
            content: r'''
# Time-Dependent Perturbation Theory – Transitions

When the perturbation itself changes with time (for example an oscillating electromagnetic field), the system can make transitions between energy levels.

Fermi’s golden rule gives the transition rate in terms of the strength of the perturbation and the density of available final states. This is the theoretical basis for absorption, emission, and scattering rates in atoms and solids.
''',
            keyTakeaways: [
              'Time-dependent perturbations cause transitions.',
              'Fermi’s golden rule estimates the rate.',
              'Explains absorption and emission of light.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t4u2q1',
                question: 'Fermi’s golden rule is used to calculate…',
                options: [
                  'Only static energy levels',
                  'Transition rates caused by time-dependent perturbations',
                  'Classical trajectories',
                  'Magnetic field strengths',
                ],
                correctIndex: 1,
                explanation: 'It gives the probability per unit time of a transition.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. SCATTERING THEORY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t5',
        title: 'Scattering Theory',
        summary: 'What happens when a particle wave encounters a target — the quantum version of collisions.',
        units: [
          Unit(
            id: 'phy704-t5-u1',
            title: 'The Idea of a Scattering Amplitude',
            content: r'''
# The Idea of a Scattering Amplitude

A beam of particles (or a wave packet) approaches a target. Far away after the collision the wave is a superposition of the original beam plus a scattered spherical wave.

The strength of that scattered wave in different directions is described by the **scattering amplitude**. Its squared modulus gives the differential cross-section — the probability of scattering into a particular solid angle.

All experimental information about the interaction is encoded in that amplitude.
''',
            keyTakeaways: [
              'Scattering produces an outgoing spherical wave.',
              'Scattering amplitude determines the angular distribution.',
              'Cross-section is the observable probability.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t5u1q1',
                question: 'The differential cross-section is obtained from…',
                options: [
                  'The temperature of the target',
                  'The squared modulus of the scattering amplitude',
                  'Only the incident energy',
                  'The mass of the experimenter',
                ],
                correctIndex: 1,
                explanation: '|f(θ,φ)|² gives the angular probability density.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t5-u2',
            title: 'Partial Waves and Green’s Functions (Conceptual)',
            content: r'''
# Partial Waves and Green’s Functions (Conceptual)

For a central potential one can expand the wave in angular-momentum components (“partial waves”). Each partial wave is scattered with its own phase shift. Summing them reconstructs the full amplitude.

Green’s functions provide another powerful language: they describe how a wave propagates from one point to another in the presence of the potential. Both techniques convert the complicated differential equation into more manageable integral or algebraic statements.
''',
            keyTakeaways: [
              'Partial-wave expansion organises scattering by angular momentum.',
              'Phase shifts characterise each partial wave.',
              'Green’s functions encode propagation in the potential.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t5u2q1',
                question: 'In partial-wave analysis the effect of a central potential on each angular-momentum channel is summarised by…',
                options: [
                  'A temperature',
                  'A phase shift',
                  'A classical impact parameter only',
                  'The colour of the particle',
                ],
                correctIndex: 1,
                explanation: 'Each partial wave acquires a phase shift that determines its contribution to the scattering.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. SELECTED PHENOMENA
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t6',
        title: 'Quantum Models of Real Phenomena',
        summary: 'How the abstract machinery explains atoms, molecules, solids and nuclei.',
        units: [
          Unit(
            id: 'phy704-t6-u1',
            title: 'Atoms and Molecules – Energy Levels and Spectra',
            content: r'''
# Atoms and Molecules – Energy Levels and Spectra

The Schrödinger equation (or its relativistic extensions) plus the Coulomb potential produces the discrete energy levels of hydrogen. Adding electron–electron interactions and spin–orbit coupling explains the richer spectra of heavier atoms.

Molecules are held together by quantum sharing of electrons (covalent bonding) or by charge transfer (ionic bonding). Vibration and rotation of molecules are also quantised, giving characteristic infrared and microwave spectra.
''',
            keyTakeaways: [
              'Discrete atomic levels come from solving the Schrödinger equation with Coulomb attraction.',
              'Molecular binding is a quantum-electromagnetic effect.',
              'Vibrational and rotational quantisation produce molecular spectra.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t6u1q1',
                question: 'The discrete spectral lines of hydrogen are a direct consequence of…',
                options: [
                  'Classical orbits of any radius',
                  'Quantised energy levels of the electron in the Coulomb potential',
                  'Random thermal motion only',
                  'Magnetic monopoles',
                ],
                correctIndex: 1,
                explanation: 'Only certain energies are allowed; transitions between them emit or absorb photons of definite frequency.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-t6-u2',
            title: 'Solids and Nuclei – Collective Quantum Behaviour',
            content: r'''
# Solids and Nuclei – Collective Quantum Behaviour

In a crystalline solid the electron states form bands. Whether a band is filled or partially filled decides if the material is an insulator, semiconductor or metal — the foundation of the solid-state electronics you have already studied.

Inside a nucleus the strong force binds protons and neutrons into shells analogous to atomic shells. Quantum statistics (Pauli principle) and residual interactions produce the rich pattern of nuclear energy levels and decay modes.
''',
            keyTakeaways: [
              'Electron bands determine solid-state electrical behaviour.',
              'Nuclei also exhibit shell structure.',
              'The same quantum principles operate at very different scales.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t6u2q1',
                question: 'Whether a solid is a metal or an insulator is largely decided by…',
                options: [
                  'Its colour',
                  'Whether the highest occupied electron band is partially filled or completely filled',
                  'Its temperature alone',
                  'The presence of magnetic fields only',
                ],
                correctIndex: 1,
                explanation: 'Partial filling allows electrons to move freely; a full band with a gap does not.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. QUANTUM STATISTICAL MECHANICS (INTRO)
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy704-t7',
        title: 'Introduction to Quantum Statistical Mechanics',
        summary: 'How quantum rules change the statistics of many-particle systems.',
        units: [
          Unit(
            id: 'phy704-t7-u1',
            title: 'Identical Particles and Quantum Statistics',
            content: r'''
# Identical Particles and Quantum Statistics

Classical particles are distinguishable; quantum particles of the same type are not. The wavefunction of a many-particle system must be either symmetric (bosons) or antisymmetric (fermions) under exchange.

Fermions (electrons, protons, neutrons) obey the Pauli exclusion principle — at most one particle per quantum state. Bosons (photons, helium-4 atoms, many nuclei) prefer to occupy the same state.

These two statistics produce radically different macroscopic behaviour: Fermi gases, Bose–Einstein condensation, superconductivity, lasers, etc.
''',
            keyTakeaways: [
              'Identical quantum particles are indistinguishable.',
              'Fermions → antisymmetric wavefunctions → Pauli principle.',
              'Bosons → symmetric wavefunctions → macroscopic occupation of one state.',
            ],
            quiz: [
              QuizQuestion(
                id: '704t7u1q1',
                question: 'Electrons are fermions. This means that…',
                options: [
                  'Any number can occupy the same quantum state',
                  'At most one electron can occupy a given quantum state',
                  'They have zero spin',
                  'They are distinguishable',
                ],
                correctIndex: 1,
                explanation: 'The Pauli exclusion principle is the direct consequence of fermionic antisymmetry.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
