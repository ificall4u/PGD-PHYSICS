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
            Module(
        id: 'phy704-m3',
        title: 'Quantum Perturbation Theory',
        summary:
            'Perturbation idea, time-independent corrections (nondegenerate and degenerate), time-dependent transitions and Fermi\'s golden rule.',
        units: [
          Unit(
            id: 'phy704-m3-u1',
            title: 'The concept of perturbation',
            content: r'''
## Learning goal

Motivate perturbation theory as controlled approximation when a hard problem is a small change away from a solvable one.

## Guitar-string / bumpy-road picture

A perfect guitar string has known vibration frequencies. A small bump or uneven tension shifts those frequencies slightly. Rather than solving the messy exact string from scratch, you start from the perfect solution and compute the small shifts.

A slightly bumpy road still looks like a flat road plus small corrections to the path. Perturbation theory is that idea for quantum Hamiltonians.

## Split the Hamiltonian

Write

Ĥ = Ĥ₀ + V̂

where Ĥ₀ is solvable (known eigenvalues Eₙ⁽⁰⁾ and eigenstates |n⁽⁰⁾⟩) and V̂ is a small perturbation. “Small” means the shifts it causes are modest compared with unperturbed energy spacings (with care in degenerate cases).

## Goal

Approximate the true energies and states as series:

Eₙ ≈ Eₙ⁽⁰⁾ + Eₙ⁽¹⁾ + Eₙ⁽²⁾ + …

|n⟩ ≈ |n⁽⁰⁾⟩ + |n⁽¹⁾⟩ + …

order by order in the strength of V̂.

## Check yourself

Why is it useful that Ĥ₀ is solvable even if Ĥ is not?
''',
            keyTakeaways: [
              'Perturbation theory starts from a solvable Ĥ₀ and adds a small V̂.',
              'Corrections to energies and states are computed order by order.',
              'Analogies: slightly imperfect string or slightly bumpy road.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m3-u1-q1',
                question: 'In perturbation theory one splits',
                options: [
                  'Only the wavefunction into charge and mass',
                  'Ĥ = Ĥ₀ + V̂ with Ĥ₀ solvable and V̂ small',
                  'Time into past and future only',
                  'Spin from charge always',
                ],
                correctIndex: 1,
                explanation: 'The method expands around a known unperturbed problem.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m3-u2',
            title: 'Time-independent perturbation theory',
            content: r'''
## Learning goal

State the first-order energy correction for nondegenerate levels and outline what changes when levels are degenerate.

## Nondegenerate first-order energy

If the unperturbed level Eₙ⁽⁰⁾ is nondegenerate (only one independent state at that energy), the first-order correction is the expectation value of the perturbation in the unperturbed state:

Eₙ⁽¹⁾ = ⟨n⁽⁰⁾| V̂ |n⁽⁰⁾⟩

Derivation sketch: expand Ĥ|n⟩ = Eₙ|n⟩, insert series for Eₙ and |n⟩, collect first-order terms, and take the inner product with ⟨n⁽⁰⁾|. Off-diagonal pieces drop when states are orthonormal and Ĥ₀-eigenstates.

## First-order state correction (idea)

The state picks up admixtures of other unperturbed states m ≠ n:

|n⁽¹⁾⟩ ∝ Σ_{m≠n} |m⁽⁰⁾⟩ ⟨m⁽⁰⁾|V̂|n⁽⁰⁾⟩ / (Eₙ⁽⁰⁾ − Eₘ⁽⁰⁾)

Energy denominators say nearby levels mix more strongly.

## Degenerate perturbation theory

If several unperturbed states share the same E⁽⁰⁾, the simple formula can fail (division by zero in denominators; ambiguous basis). One must diagonalize the perturbation V̂ inside the degenerate subspace first. The eigenvalues of that small matrix are the first-order splittings; the eigenvectors are the “correct” zeroth-order states.

## Check yourself

Why does a vanishing energy denominator signal that nondegenerate theory is insufficient?
''',
            keyTakeaways: [
              'Nondegenerate: Eₙ⁽¹⁾ = ⟨n⁽⁰⁾|V̂|n⁽⁰⁾⟩.',
              'States mix with other levels weighted by matrix elements over energy gaps.',
              'Degenerate case: diagonalize V̂ inside the degenerate subspace first.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m3-u2-q1',
                question: 'The first-order energy correction in nondegenerate perturbation theory is',
                options: [
                  'Always zero',
                  '⟨n⁽⁰⁾|V̂|n⁽⁰⁾⟩',
                  'Only the kinetic energy',
                  'Independent of V̂',
                ],
                correctIndex: 1,
                explanation: 'It is the expectation value of the perturbation in the unperturbed state.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m3-u3',
            title: 'Time-dependent perturbation theory',
            content: r'''
## Learning goal

Describe transitions driven by a time-dependent perturbation and state the role of Fermi’s golden rule for transition rates.

## Time-dependent V

Many real influences vary in time: a light pulse, a radio-frequency field, a sudden switching of a potential. Write V̂ = V̂(t). The system may start in an eigenstate of Ĥ₀ and later be found in another — a **transition**.

## Transition amplitudes

Time-dependent perturbation theory expands the state in the unperturbed basis with time-dependent coefficients. To first order, the amplitude to go from i to f involves an integral of e^{iω_{fi}t} times the matrix element ⟨f|V̂(t)|i⟩ — resonant when the driving frequencies match the Bohr frequency ω_{fi} = (E_f − E_i)/ℏ.

## Fermi’s golden rule

For a perturbation that is turned on for a long time or is broadly present (with a continuum of final states), the **transition rate** (probability per unit time) takes the form

Γ_{i→f} = (2π/ℏ) |⟨f|V̂|i⟩|² ρ(E_f)

where ρ is the density of final states at the energy fixed by conservation. That is **Fermi’s golden rule** — the workhorse for absorption, emission, and scattering estimates.

## Check yourself

Why does a continuum (density of states ρ) appear in the golden rule rather than a single final level only?
''',
            keyTakeaways: [
              'Time-dependent V drives transitions between unperturbed levels.',
              'Resonance when driving matches Bohr frequencies.',
              'Fermi\'s golden rule: rate ∝ |matrix element|² × density of states.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m3-u3-q1',
                question: 'Fermi\'s golden rule gives',
                options: [
                  'Only static energy shifts',
                  'A transition rate involving |⟨f|V|i⟩|² and a density of states',
                  'Classical trajectories only',
                  'The value of c',
                ],
                correctIndex: 1,
                explanation: 'It estimates probability per unit time for transitions into a continuum.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy704-m4',
        title: 'Quantum Scattering Theory',
        summary:
            'Scattering intuition, differential and total cross sections, Born approximation, phase shifts.',
        units: [
          Unit(
            id: 'phy704-m4-u1',
            title: 'What is quantum scattering?',
            content: r'''
## Learning goal

Define scattering as learning about a target from how a beam of particles is deflected, including the quantum wave aspect.

## Marble-in-the-dark analogy

You cannot see an object in a dark room, but you can throw marbles and watch where they bounce. The pattern of deflections encodes the size and shape of the obstacle. Scattering experiments in physics do the same with atoms, nuclei, or potential wells — using electrons, neutrons, or other probes.

## Quantum version

The “marbles” are quantum particles with wavefunctions. An incoming plane wave (or wave packet) hits a localized potential V(r) and emerges as a distorted wave: still mostly forward-going, plus a scattered outgoing wave. Detectors at large distance measure intensity versus angle.

## Elastic scattering

In elastic scattering the particle’s energy is unchanged; only direction changes. Inelastic processes (excitation, reactions) open additional channels; this module focuses on the elastic potential-scattering picture.

## Check yourself

Why is the angular pattern of scattered particles more informative than only counting how many hit a single detector?
''',
            keyTakeaways: [
              'Scattering probes a target via the deflection pattern of a beam.',
              'Quantum scattering uses wavefunctions: incident + scattered waves.',
              'Elastic scattering conserves the projectile energy.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m4-u1-q1',
                question: 'In a scattering experiment one primarily learns about the target from',
                options: [
                  'The colour of the laboratory walls',
                  'How the beam is deflected (angular distribution)',
                  'Only the total mass of the Earth',
                  'Random numbers unrelated to the beam',
                ],
                correctIndex: 1,
                explanation: 'Angular and energy patterns encode the interaction with the target.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m4-u2',
            title: 'Cross-sections (differential vs total)',
            content: r'''
## Learning goal

Define differential and total cross sections as effective areas measuring scattering probability.

## Effective area picture

Even a pointlike interaction can be assigned an effective area: if the beam has flux F (particles per unit time per unit area), and the number of scattering events per unit time is N, then

σ = N / F

has units of area — the **total cross section**. Larger σ means the target is “easier to hit.”

## Differential cross section

Scattering depends on angle. The **differential cross section** dσ/dΩ is defined so that

(dσ/dΩ) dΩ = (number per time into solid angle dΩ) / flux

Integrating over all solid angles recovers the total cross section:

σ = ∫ (dσ/dΩ) dΩ

## Quantum link

In quantum mechanics dσ/dΩ is proportional to |f(θ, φ)|² where f is the scattering amplitude appearing in the asymptotic wavefunction.

## Check yourself

If dσ/dΩ is isotropic (same in all directions), how is σ related to the value of dσ/dΩ?
''',
            keyTakeaways: [
              'Total cross section σ has units of area: event rate = flux × σ.',
              'dσ/dΩ describes angular distribution of scattering.',
              'σ = ∫ (dσ/dΩ) dΩ.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m4-u2-q1',
                question: 'The total cross section σ is obtained from the differential cross section by',
                options: [
                  'Differentiating with respect to angle',
                  'Integrating dσ/dΩ over solid angle',
                  'Setting it to zero',
                  'Multiplying by ℏ only',
                ],
                correctIndex: 1,
                explanation: 'σ = ∫ (dσ/dΩ) dΩ over 4π steradians (or the relevant sphere).',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m4-u3',
            title: 'Born approximation',
            content: r'''
## Learning goal

State the idea of the Born approximation: treat the incident wave as only weakly disturbed when computing the scattered amplitude.

## High-energy / weak-potential intuition

If the potential is weak or the particle is fast, the wave inside the scattering region is nearly the undisturbed incident plane wave. One can approximate the source of scattered waves using that incident wave rather than the exact distorted wave.

## Result (structure)

The first Born scattering amplitude is proportional to the Fourier transform of the potential V(r) at momentum transfer q = k_out − k_in. So measuring dσ/dΩ roughly maps the shape of V in momentum space.

## Limitations

Strong potentials, resonances, or low energies can invalidate the simple Born picture — then one needs partial waves, exact numerical solution, or higher-order Born terms.

## Check yourself

Why does replacing the true wave by the incident plane wave inside V simplify the calculation?
''',
            keyTakeaways: [
              'Born: use incident wave as approximation inside the potential.',
              'Amplitude related to Fourier transform of V (momentum transfer).',
              'Best for weak potentials or high energy; fails near strong resonances.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m4-u3-q1',
                question: 'The Born approximation is most reliable when',
                options: [
                  'The potential is extremely strong and energy is near zero always',
                  'The potential is weak or the energy is high so the wave is little distorted',
                  'There is no potential at all and nothing to compute',
                  'Spin is ignored for a different reason',
                ],
                correctIndex: 1,
                explanation: 'Small distortion justifies using the incident wave in the integral for f.',
              ),
            ],
          ),
          Unit(
            id: 'phy704-m4-u4',
            title: 'Phase shifts',
            content: r'''
## Learning goal

Explain phase shifts as the lag or advance that a radial partial wave acquires because of the potential compared with a free wave.

## Partial-wave idea (preview)

One expands the scattering wave in angular momentum components (partial waves) labelled by ℓ. Outside the potential each radial wave looks like a free spherical wave but shifted in phase.

## Phase shift δ_ℓ

The asymptotic radial wave for angular momentum ℓ behaves like sin(kr − ℓπ/2 + δ_ℓ) instead of sin(kr − ℓπ/2). The extra **phase shift** δ_ℓ is caused by the potential: attractive wells typically pull wave crests inward (positive δ_ℓ in standard convention); repulsive barriers push them out.

## Link to scattering

The scattering amplitude and cross sections can be written entirely in terms of the set {δ_ℓ}. A resonance often appears as a phase shift rising rapidly through π/2.

## Check yourself

If the potential is exactly zero, what should every phase shift δ_ℓ be?
''',
            keyTakeaways: [
              'Phase shift δ_ℓ measures how much the ℓ-th radial wave is shifted by V.',
              'Asymptotic free waves are recovered when all δ_ℓ = 0.',
              'Cross sections and resonances are encoded in the δ_ℓ’s.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy704-m4-u4-q1',
                question: 'A phase shift δ_ℓ describes',
                options: [
                  'Only the mass of the target',
                  'How the potential shifts the asymptotic radial wave for angular momentum ℓ',
                  'The colour of scattered light only',
                  'Time reversal exclusively',
                ],
                correctIndex: 1,
                explanation: 'δ_ℓ is the extra phase in the ℓ partial wave due to scattering.',
              ),
            ],
          ),
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
