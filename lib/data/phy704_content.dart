import 'package:pgd_physics/models/course.dart';

/// PHY 704 — Quantum Mechanics
/// Structure from content_prompts/PHY704 (placeholder lesson bodies only).
Course buildPhy704() {
  return Course(
    id: 'phy-704',
    code: 'PHY 704',
    title: 'Quantum Physics',
    description: 'State vectors, angular momentum, perturbation theory, scattering and selected applications.',
    semester: 'Second Semester',
    units: 3,
    icon: 'ℏ',
    colorHint: ColorHint.purple,
    modules: [
            Module(
        id: 'phy704-m1',
        title: 'Mathematical Formulation of Quantum Mechanics',
        summary:
            'State vectors, operators and eigenvalues, wavefunction and Born rule, Schrödinger equation in plain English.',
        units: [
          Unit(
            id: 'phy704-m1-u1',
            title: 'Quantum state vectors (|ψ⟩)',
            content: r'''
## Learning goal

Introduce the quantum state as a structured list of possibilities rather than a single classical location.

## Classical vs quantum description

Classically, a particle has a definite position and velocity at each time. In quantum mechanics, before a measurement, the system is described by a **state vector** |ψ⟩ (read “ket psi”). Think of |ψ⟩ as encoding the full set of potential outcomes and how they combine — not one fixed path.

## List of possibilities picture

In a simple two-outcome situation (for example spin up or down along an axis), the state can be written as a combination:

|ψ⟩ = a |↑⟩ + b |↓⟩

The complex numbers a and b are **amplitudes**. They are not ordinary probabilities, but |a|² and |b|² will become probabilities when you measure. Until you measure, both possibilities are held together in the state.

## Dirac notation (lightly)

|ψ⟩ is a ket (column-like object in an abstract space). The matching bra ⟨ψ| is used to form inner products ⟨φ|ψ⟩ that yield amplitudes or probabilities. You do not need full linear-algebra machinery yet — treat kets as labelled states you can add and scale.

## Check yourself

In the two-outcome picture, what do |a|² and |b|² represent after a measurement in that basis?
''',
            keyTakeaways: [
              'The state |ψ⟩ encodes potential outcomes, not a single classical trajectory.',
              'Amplitudes combine linearly; probabilities involve |amplitude|².',
              'Dirac kets label quantum states in a compact way.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m1-u1-q1',
                question: 'A quantum state vector |ψ⟩ is best thought of as',
                options: [
                  'Only a classical position always',
                  'A structured description of potential measurement outcomes',
                  'Always a single number',
                  'The same as force',
                ],
                correctIndex: 1,
                explanation: 'States encode amplitudes for possible outcomes until measurement.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m1-u2',
            title: 'Linear operators as actions',
            content: r'''
## Learning goal

Explain operators as actions or measurements on states, and eigenvalues as the definite numerical outcomes those measurements can return.

## What an operator does

An **operator** Ô takes a state |ψ⟩ and returns another vector Ô|ψ⟩. Physically, important operators represent measurable quantities: energy (Hamiltonian Ĥ), momentum (p̂), position (x̂), spin components, and so on.

## Eigenstates and eigenvalues

Sometimes Ô|ψ⟩ is simply a number times the same state:

Ô|ψ⟩ = λ |ψ⟩

Then |ψ⟩ is an **eigenstate** (eigenvector) of Ô and λ is the **eigenvalue**. If the system is in that eigenstate and you measure the quantity represented by Ô, you get the definite result λ (in the ideal projective-measurement picture).

## Measurement intuition

Generic states are not eigenstates of every operator. Measuring a quantity “collapses” or selects an eigenstate and returns the corresponding eigenvalue, with probabilities fixed by the amplitudes in |ψ⟩. Different observables may not share eigenstates — that is the root of complementarity and uncertainty.

## Check yourself

If Ĥ|E⟩ = E|E⟩, what does a measurement of energy yield when the system is in |E⟩?
''',
            keyTakeaways: [
              'Operators act on states; many represent measurable quantities.',
              'Eigenvalue equations Ô|ψ⟩ = λ|ψ⟩ link definite outcomes λ to special states.',
              'Measurement outcomes are eigenvalues when the state is an eigenstate.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m1-u2-q1',
                question: 'In Ô|ψ⟩ = λ|ψ⟩, λ is called',
                options: [
                  'The bra',
                  'An eigenvalue',
                  'The Hamiltonian only always',
                  'A force',
                ],
                correctIndex: 1,
                explanation: 'λ is the eigenvalue associated with eigenstate |ψ⟩.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m1-u3',
            title: 'The wavefunction ψ(x)',
            content: r'''
## Learning goal

Interpret the position-space wavefunction and Born’s rule: probability density is |ψ(x)|².

## Wavefunction

In the position representation, the state is described by a complex function ψ(x) — the **wavefunction**. Roughly, ψ(x) is the amplitude for finding the particle near x.

## Born’s rule

The probability of finding the particle in a small interval dx about x is

P(x) dx = |ψ(x)|² dx

So |ψ(x)|² is a **probability density**. The total probability must be 1:

∫ |ψ(x)|² dx = 1

(normalization).

## Not a classical wave

ψ is not a pressure or displacement in a material medium. It is a probability amplitude. Interference of amplitudes can produce interference of probabilities — the hallmark of quantum behaviour.

## Check yourself

If ψ is multiplied by a pure phase factor e^{iθ} (constant θ), does |ψ|² change?
''',
            keyTakeaways: [
              'ψ(x) is the position-space wavefunction (amplitude vs x).',
              'Born: |ψ(x)|² is the probability density for position.',
              'Normalization: ∫|ψ|² dx = 1.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m1-u3-q1',
                question: 'Born\'s rule states that |ψ(x)|² is',
                options: [
                  'The energy always',
                  'The probability density for position',
                  'The magnetic field',
                  'Always zero',
                ],
                correctIndex: 1,
                explanation: 'Probability per unit length (in 1D) is |ψ|².',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m1-u4',
            title: 'The Schrödinger equation',
            content: r'''
## Learning goal

Translate the time-dependent Schrödinger equation into conversational English as the law for how the list of possibilities evolves.

## The equation

i ℏ d|ψ⟩/dt = Ĥ |ψ⟩

or, in the wavefunction picture for a particle,

i ℏ ∂ψ/∂t = Ĥ ψ

where Ĥ is the Hamiltonian operator (total energy as an operator).

## Plain English

“The way the state changes in time is determined by the energy operator acting on the state.” The constant ℏ sets the quantum scale; the factor i is required so that probabilities stay normalized as time runs.

## Stationary states

If |ψ⟩ is an energy eigenstate Ĥ|E⟩ = E|E⟩, time evolution is only an overall phase e^{−i E t/ℏ}. Measurable |amplitudes|² in that energy basis stay constant — a **stationary state**. Superpositions of different energies oscillate and interfere in time.

## Check yourself

Does the Schrödinger equation replace the need for Born’s rule, or does it work together with Born’s rule?
''',
            keyTakeaways: [
              'iℏ d|ψ⟩/dt = Ĥ|ψ⟩ governs time evolution of the state.',
              'Ĥ is the energy operator; evolution preserves probability.',
              'Energy eigenstates pick up only a phase in time (stationary states).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m1-u4-q1',
                question: 'The Schrödinger equation determines',
                options: [
                  'Only the value of c',
                  'How the quantum state evolves in time',
                  'Only classical trajectories',
                  'That measurement never happens',
                ],
                correctIndex: 1,
                explanation: 'It is the fundamental dynamical law for |ψ⟩(t).',
              ),
            ],
          ),
        ],
      ),
      skeletonModule(
        id: 'phy704-m2',
        title: 'Quantum Angular Momentum & Intrinsic Spin',
        summary: 'Quantum Angular Momentum & Intrinsic Spin',
        units: [
          skeletonUnit(id: 'phy704-m2-u1', title: 'Orbital Angular Momentum'),
          skeletonUnit(id: 'phy704-m2-u2', title: 'Quantum Spin (Intrinsic Angular Momentum)'),
          skeletonUnit(id: 'phy704-m2-u3', title: 'Addition of Angular Momentum'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m3',
        title: 'Quantum Perturbation Theory',
        summary: 'Quantum Perturbation Theory',
        units: [
          skeletonUnit(id: 'phy704-m3-u1', title: 'The Concept of Perturbation'),
          skeletonUnit(id: 'phy704-m3-u2', title: 'Time-Independent Perturbation Theory (Non-Degenerate & Degenerate)'),
          skeletonUnit(id: 'phy704-m3-u3', title: 'Time-Dependent Perturbation Theory'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m4',
        title: 'Quantum Scattering Theory',
        summary: 'Quantum Scattering Theory',
        units: [
          skeletonUnit(id: 'phy704-m4-u1', title: 'What is Quantum Scattering?'),
          skeletonUnit(id: 'phy704-m4-u2', title: 'Cross-Sections (Differential vs. Total)'),
          skeletonUnit(id: 'phy704-m4-u3', title: 'Born Approximation'),
          skeletonUnit(id: 'phy704-m4-u4', title: 'Phase Shifts'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m5',
        title: 'Green\'s Function & Partial Wave Analysis',
        summary: 'Green\'s Function & Partial Wave Analysis',
        units: [
          skeletonUnit(id: 'phy704-m5-u1', title: 'The Impulse-Response Intuition (Green\'s Functions)'),
          skeletonUnit(id: 'phy704-m5-u2', title: 'Partial Wave Method'),
          skeletonUnit(id: 'phy704-m5-u3', title: 'Optical Theorem'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m6',
        title: 'Quantum Models in Atomic, Molecular, and Solid-State Physics',
        summary: 'Quantum Models in Atomic, Molecular, and Solid-State Physics',
        units: [
          skeletonUnit(id: 'phy704-m6-u1', title: 'Multi-Electron Atoms & The Exclusion Principle'),
          skeletonUnit(id: 'phy704-m6-u2', title: 'Molecular Bonding'),
          skeletonUnit(id: 'phy704-m6-u3', title: 'Energy Bands in Solids'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m7',
        title: 'Quantum Models in Nuclear Physics',
        summary: 'Quantum Models in Nuclear Physics',
        units: [
          skeletonUnit(id: 'phy704-m7-u1', title: 'Nuclear Forces & Potential Wells'),
          skeletonUnit(id: 'phy704-m7-u2', title: 'Alpha Decay & Quantum Tunneling'),
          skeletonUnit(id: 'phy704-m7-u3', title: 'The Nuclear Shell Model'),
        ],
      ),
      skeletonModule(
        id: 'phy704-m8',
        title: 'Introduction to Quantum Statistical Mechanics',
        summary: 'Introduction to Quantum Statistical Mechanics',
        units: [
          skeletonUnit(id: 'phy704-m8-u1', title: 'Classical vs. Quantum Statistics'),
          skeletonUnit(id: 'phy704-m8-u2', title: 'Fermi-Dirac Statistics'),
          skeletonUnit(id: 'phy704-m8-u3', title: 'Bose-Einstein Statistics'),
        ],
      ),
    ],
  );
}
