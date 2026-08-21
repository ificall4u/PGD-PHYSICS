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
            Module(
        id: 'phy704-m2',
        title: 'Quantum Angular Momentum & Intrinsic Spin',
        summary:
            'Orbital angular momentum quantization, spin and Stern–Gerlach, addition of angular momenta.',
        units: [
          Unit(
            id: 'phy704-m2-u1',
            title: 'Orbital angular momentum',
            content: r'''
## Learning goal

Introduce orbital angular momentum as the quantum version of L = r × p and state the basic quantization of magnitude and z-component.

## Classical reminder

Classically L = r × p for a particle about an origin. In atoms, orbital motion of electrons about the nucleus is described by a quantum angular momentum operator with the same symbol structure but non-commuting components.

## Quantization (what measurements find)

When you measure the component of orbital angular momentum along a chosen axis (usually called z), the allowed results are

L_z = m ℓ ℏ,    m_ℓ = −ℓ, −ℓ+1, …, ℓ

where ℓ = 0, 1, 2, … is the orbital angular momentum quantum number. The magnitude is tied to

|L| → √[ℓ(ℓ+1)] ℏ

(not ℓℏ). Different m_ℓ label different orientations of the same ℓ multiplet.

## Spatial wavefunctions

Orbital angular momentum eigenfunctions involve spherical harmonics Y_{ℓ m}(θ, φ) in the angular part of the wavefunction — the shapes behind s, p, d orbitals in chemistry language (ℓ = 0, 1, 2, …).

## Check yourself

How many different m_ℓ values exist for a given ℓ?
''',
            keyTakeaways: [
              'Orbital L is quantized: L_z = m_ℓ ℏ with |m_ℓ| ≤ ℓ.',
              'Magnitude related to √[ℓ(ℓ+1)] ℏ.',
              'Angular wavefunctions involve spherical harmonics Y_{ℓ m}.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m2-u1-q1',
                question: 'Allowed values of L_z for orbital angular momentum are',
                options: [
                  'Any real number',
                  'm_ℓ ℏ with m_ℓ = −ℓ … ℓ in steps of 1',
                  'Only zero',
                  'Only ±ℏ always',
                ],
                correctIndex: 1,
                explanation: 'm_ℓ runs from −ℓ to ℓ in integer steps.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m2-u2',
            title: 'Quantum spin (intrinsic angular momentum)',
            content: r'''
## Learning goal

Describe spin as an intrinsic angular momentum (not a literal billiard-ball rotation) and use the Stern–Gerlach experiment as evidence for two discrete spin outcomes for silver atoms (electrons).

## Not a tiny spinning ball

Electron spin is an intrinsic quantum degree of freedom. Picturing a hard ball spinning fails (surface speeds would be unphysical, and spin-1/2 is not explained by ordinary orbital motion). Treat spin as an internal “magnetic fingerprint” with its own operators S and quantum numbers.

## Spin-1/2

For electrons, protons, neutrons the spin quantum number is s = 1/2. Along z the measured components are

S_z = ± (1/2) ℏ

often called spin up and spin down. There is no third outcome along that axis.

## Stern–Gerlach experiment

A beam of silver atoms (effective unpaired electron spin) passes through an inhomogeneous magnetic field. Instead of a continuous smear of deflections, the beam splits into **two** discrete spots — direct evidence that the magnetic moment (and underlying spin component) is quantized into two values, not a classical continuum of orientations.

## Check yourself

Why does a continuous classical magnetic moment distribution fail to explain two sharp Stern–Gerlach spots?
''',
            keyTakeaways: [
              'Spin is intrinsic angular momentum, not literal billiard-ball rotation.',
              'Electrons: s = 1/2; S_z = ±ℏ/2.',
              'Stern–Gerlach: discrete two-beam split for spin-1/2 systems.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m2-u2-q1',
                question: 'In the Stern–Gerlach experiment with silver atoms, the beam',
                options: [
                  'Does not deflect at all',
                  'Splits into two discrete beams',
                  'Forms a continuous fan only',
                  'Stops completely',
                ],
                correctIndex: 1,
                explanation: 'Two spots correspond to two spin component values.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m2-u3',
            title: 'Addition of angular momentum',
            content: r'''
## Learning goal

State how orbital and spin angular momenta combine into total angular momentum for an electron, and what quantum numbers label the combined system.

## Combining L and S

An electron has orbital angular momentum (quantum number ℓ) and spin (s = 1/2). The total angular momentum J = L + S is also quantized. The allowed values of the total angular momentum quantum number j run in steps of 1 between |ℓ − s| and ℓ + s.

For s = 1/2:

j = ℓ + 1/2    or    j = ℓ − 1/2

(except ℓ = 0, where only j = 1/2 exists).

## Spectroscopic meaning

Fine structure in atoms is organized by these combined quantum numbers: levels with the same n and ℓ but different j split slightly because of spin–orbit coupling (interaction between the electron’s magnetic moment and the magnetic field related to its orbital motion).

## Multiple particles (preview)

For several angular momenta, addition rules generalize: one combines stepwise and finds multiplets labelled by total quantum numbers. Clebsch–Gordan coefficients relate product basis states |ℓ m_ℓ; s m_s⟩ to total-|j m_j⟩ states — bookkeeping for “which ways the arrows can add.”

## Check yourself

For a p electron (ℓ = 1, s = 1/2), what are the possible j values?
''',
            keyTakeaways: [
              'Total J = L + S; for s = 1/2, j = ℓ ± 1/2 (with care at ℓ = 0).',
              'Combined quantum numbers label fine-structure levels.',
              'Addition rules organize multi-angular-momentum systems.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m2-u3-q1',
                question: 'For ℓ = 1 and s = 1/2, possible j values are',
                options: [
                  'Only j = 0',
                  'j = 1/2 and j = 3/2',
                  'j = 2 and j = 3 only',
                  'Any real j',
                ],
                correctIndex: 1,
                explanation: 'j runs from |ℓ−s| to ℓ+s: 1/2 and 3/2.',
              ),
            ],
          ),
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
