import 'package:pgd_physics/models/course.dart';

/// PHY 705 — Solid State and Electronic Devices
/// Structure from content_prompts/PHY705 (placeholder lesson bodies only).
Course buildPhy705() {
  return Course(
    id: 'phy-705',
    code: 'PHY 705',
    title: 'Introductory Solid State Electronics',
    description: 'Conduction, barriers, Hall effect, emission, diodes, BJT, FET, solar cells and IC introduction.',
    semester: 'First Semester',
    units: 3,
    icon: '🔷',
    colorHint: ColorHint.cyan,
    modules: [
            Module(
        id: 'phy705-m1',
        title: 'Electrical Conduction in Metals and Semiconductors',
        summary:
            'Drude free-electron model, conductivity from first principles, band intuition, metals vs semiconductors vs insulators.',
        units: [
          Unit(
            id: 'phy705-m1-u1',
            title: 'Free electron model (Drude model)',
            content: r'''
## Learning goal

Picture conduction in a metal as a sea of mobile electrons scattering off the ionic lattice (Drude model).

## Sea of electrons

In a copper wire, valence electrons are not bound to single atoms. They form a shared **electron gas** moving through a lattice of positive ions. With no electric field, thermal motions are random: no net current.

## Drift under a field

An applied electric field E accelerates electrons between collisions. On average they acquire a small **drift velocity** opposite the field (electrons are negative). That net flow is the electric current.

## Collisions and relaxation

Electrons scatter from ions, impurities, and lattice vibrations (phonons). The average time between effective scattering events is the **relaxation time** τ. Drift is a balance between field acceleration and frictional scattering.

## Check yourself

In the Drude picture, what prevents electrons from accelerating without bound under a constant field?
''',
            keyTakeaways: [
              'Metals: mobile electron gas in an ionic lattice.',
              'Current is net drift velocity under an applied field.',
              'Scattering (relaxation time τ) limits drift speed.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m1-u1-q1',
                question: 'In the Drude model, electrons in a metal are pictured as',
                options: [
                  'Fixed permanently to one ion each',
                  'A mobile sea scattering off the lattice',
                  'Having zero charge',
                  'Only photons',
                ],
                correctIndex: 1,
                explanation: 'Drude treats conduction electrons as a gas with collisions.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m1-u2',
            title: 'Ohm\'s law from first principles',
            content: r'''
## Learning goal

Derive the Drude conductivity σ = n e² τ / m and translate each symbol into plain English.

## Drift speed

Between collisions, acceleration has magnitude a = e E / m (electron charge e, mass m). In time τ the typical drift speed is v_d ≈ (e E / m) τ.

## Current density

If n is the number of conduction electrons per unit volume, the current density magnitude is

J = n e v_d ≈ n e (e E τ / m) = (n e² τ / m) E

## Conductivity

Ohm’s law in local form: J = σ E, so

σ = n e² τ / m

## Symbol translation

- n — density of mobile electrons (1/m³)
- e — elementary charge magnitude
- τ — mean free / relaxation time between scatterings
- m — electron mass
- σ — conductivity (S/m); resistivity ρ = 1/σ

## Check yourself

If scattering becomes more frequent (τ decreases), what happens to σ?
''',
            keyTakeaways: [
              'σ = n e² τ / m in the Drude model.',
              'J = σ E is the microscopic Ohm law.',
              'Higher n or longer τ → higher conductivity.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m1-u2-q1',
                question: 'Drude conductivity σ equals',
                options: [
                  'n e / m',
                  'n e² τ / m',
                  'm / (n e² τ)',
                  'τ only',
                ],
                correctIndex: 1,
                explanation: 'σ = n e² τ / m from J = n e v_d with v_d = e E τ / m.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m1-u3',
            title: 'Energy band theory intuition',
            content: r'''
## Learning goal

Use a theater-seating analogy for allowed energy levels, gaps, valence bands, and conduction bands.

## Theater seating

Imagine electron energies as seats in a theater. Allowed seats are organized in sections (bands). Between sections are closed-off aisles (forbidden **energy gaps**) where no seats exist.

## Valence and conduction bands

In solids, the highest mostly filled band of electron states is the **valence band**. The next higher mostly empty band is the **conduction band**. Electrons in the conduction band (and vacancies in the valence band) can move and carry current.

## Filling rules

Electrons fill seats from the lowest energy up (with Pauli exclusion: limited occupancy per state). Where the “Fermi level” sits relative to bands and gaps decides metal vs semiconductor vs insulator behaviour (next unit).

## Check yourself

What does a forbidden gap mean for an electron’s possible energies?
''',
            keyTakeaways: [
              'Bands = allowed energy regions; gaps = forbidden energies.',
              'Valence band: highest occupied-like band; conduction band: next empty band.',
              'Pauli filling from the bottom sets which states are occupied.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m1-u3-q1',
                question: 'A forbidden energy gap is a range of energy where',
                options: [
                  'Electrons must always sit',
                  'No electron states exist in the ideal band picture',
                  'Only protons live',
                  'Temperature is undefined',
                ],
                correctIndex: 1,
                explanation: 'Gaps are ranges without allowed electronic states.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m1-u4',
            title: 'Metals vs semiconductors vs insulators',
            content: r'''
## Learning goal

Contrast band structures of metals, semiconductors, and insulators, and introduce electrons and holes in intrinsic semiconductors.

## Metals

In a metal, the Fermi level lies inside a band (partly filled band). Empty states are available at essentially zero energy cost, so electrons accelerate easily → high conductivity.

## Insulators

A large energy gap separates a full valence band from an empty conduction band. Very few electrons can be thermally excited across the gap → negligible conductivity at ordinary temperatures.

## Semiconductors

Like insulators but with a **smaller gap** (about 1 eV scale for Si and Ge). Thermal energy promotes a modest number of electrons into the conduction band, leaving **holes** (missing electrons) in the valence band. Both electrons and holes carry current.

## Intrinsic semiconductor

A pure semiconductor (e.g. pure Si) with thermally generated electron–hole pairs only — no intentional impurity doping. Carrier density is highly temperature sensitive.

## Check yourself

Why does a full valence band with a large gap above it conduct poorly even though it is full of electrons?
''',
            keyTakeaways: [
              'Metal: partly filled band → easy conduction.',
              'Insulator: large gap; semiconductor: smaller gap.',
              'Intrinsic semiconductors: electrons + holes from thermal excitation across the gap.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m1-u4-q1',
                question: 'An intrinsic semiconductor differs from an insulator mainly by',
                options: [
                  'Having no energy gap',
                  'Having a smaller energy gap so thermal excitation is appreciable',
                  'Being a perfect metal',
                  'Containing only neutrons',
                ],
                correctIndex: 1,
                explanation: 'Smaller gap allows thermally generated carriers at moderate T.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy705-m2',
        title: 'Energy Barriers and Charge Motion in Fields',
        summary:
            'Potential barriers and work function, drift in E fields, Lorentz force in B, cyclotron motion.',
        units: [
          Unit(
            id: 'phy705-m2-u1',
            title: 'Physical meaning of energy barriers',
            content: r'''
## Learning goal

Explain potential energy barriers with a ball-and-hill picture and introduce the work function as a barrier for electrons leaving a metal.

## Ball and hill

A ball needs enough kinetic energy to roll over a hill. If its energy is below the hilltop, classically it rolls back. The hill is a **potential energy barrier** V(x). In electronics, electrons face similar barriers at surfaces, junctions, and insulating gaps.

## Work function

The **work function** φ is the minimum energy needed to remove an electron from a metal into vacuum just outside the surface. It is a barrier height set by how tightly the metal holds its electrons. Different metals have different φ — important for thermionic emission and contact potentials (later modules).

## Quantum note

Even below the barrier top, quantum tunneling can allow some transmission (as in alpha decay or thin oxide barriers). For this module, the classical barrier picture is the starting intuition.

## Check yourself

If you increase an electron’s kinetic energy toward a fixed barrier height, what happens to its chance of classically surmounting the barrier?
''',
            keyTakeaways: [
              'Barriers are regions of high potential energy that impede charge motion.',
              'Work function: minimum energy to extract an electron from a metal.',
              'Classical surmounting needs energy above the barrier; tunneling is a quantum correction.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m2-u1-q1',
                question: 'The work function of a metal is',
                options: [
                  'Its melting point only',
                  'The minimum energy to remove an electron into vacuum',
                  'Always zero',
                  'The same as Planck\'s constant',
                ],
                correctIndex: 1,
                explanation: 'φ measures the surface barrier for electron emission.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m2-u2',
            title: 'Motion in electric fields',
            content: r'''
## Learning goal

Describe acceleration and drift of charge carriers in an applied electric field.

## Force and acceleration

A carrier with charge q in field E feels F = q E. Free acceleration a = q E / m would grow without bound, but in a solid, scattering resets the velocity on the timescale τ (Module 1).

## Drift velocity

Average velocity along the field (for holes) or against it (for electrons) is the **drift velocity** v_d = μ E, where μ is the **mobility**. Current density J = σ E with σ = n e μ for a single carrier type (related to Drude: μ = e τ / m).

## Direction

Electrons (q < 0) accelerate opposite E; conventional current is defined in the direction positive charge would move.

## Check yourself

If mobility rises at fixed E, what happens to drift speed?
''',
            keyTakeaways: [
              'F = qE accelerates carriers between scattering events.',
              'Drift velocity v_d = μ E; σ linked to n and μ.',
              'Electrons drift opposite the E-field direction.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m2-u2-q1',
                question: 'Drift velocity in the linear regime is related to field by',
                options: [
                  'v_d = E / μ',
                  'v_d = μ E',
                  'v_d independent of E always',
                  'v_d = 0 always in metals',
                ],
                correctIndex: 1,
                explanation: 'v_d = μ E defines mobility μ.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m2-u3',
            title: 'Motion in magnetic fields',
            content: r'''
## Learning goal

State the magnetic part of the Lorentz force and the steering-wheel intuition for curved paths.

## Lorentz magnetic force

F_B = q (v × B)

The force is perpendicular to both velocity and magnetic field. It changes direction of motion, not speed (no work).

## Steering analogy

Like a steering force always sideways to the motion, a magnetic field bends trajectories without speeding the particle up or slowing it down.

## Right-hand rule

For positive q: fingers along v, sweep toward B, thumb gives F. Electrons reverse the force direction relative to that rule for positive charges.

## Check yourself

If v is parallel to B, what is F_B?
''',
            keyTakeaways: [
              'F_B = q(v × B) is perpendicular to v and to B.',
              'Magnetic forces steer charges without changing |v|.',
              'Sign of q flips the deflection direction.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m2-u3-q1',
                question: 'The magnetic force q(v × B) is always',
                options: [
                  'Parallel to v',
                  'Perpendicular to v',
                  'Independent of B',
                  'Zero if q is nonzero and v is nonzero and perpendicular to B — wait, no that is false',
                ],
                correctIndex: 1,
                explanation: 'Cross product is perpendicular to v; magnetic force does no work.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m2-u4',
            title: 'Cyclotron motion',
            content: r'''
## Learning goal

Explain circular and helical paths when a charge moves in a uniform magnetic field.

## Perpendicular velocity

If v is perpendicular to uniform B, |F| = |q| v B provides centripetal force:

|q| v B = m v² / R ⇒ R = m v / (|q| B)

The particle moves in a circle of cyclotron radius R. Angular frequency ω_c = |q| B / m (cyclotron frequency).

## Parallel component

Velocity parallel to B is unchanged. Combined with circular motion → **helix** along the field lines.

## Relevance

Cyclotron motion appears in Hall-effect geometries, magnetoresistance, and vacuum devices; it is the same structure as in PHY 702 Module 7, now aimed at carriers in solids and beams.

## Check yourself

If B doubles at fixed v_perp, what happens to R?
''',
            keyTakeaways: [
              'Uniform B, v ⊥ B: circle with R = mv/(|q|B).',
              'ω_c = |q|B/m.',
              'Parallel velocity + circular motion ⇒ helix.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m2-u4-q1',
                question: 'The cyclotron radius R for v perpendicular to B is',
                options: [
                  'R = |q| B / m v',
                  'R = m v / (|q| B)',
                  'R = m / |q| only',
                  'Independent of B',
                ],
                correctIndex: 1,
                explanation: 'Centripetal balance gives R = mv/(|q|B).',
              ),
            ],
          ),
        ],
      ),
      skeletonModule(
        id: 'phy705-m3',
        title: 'The Hall Effect & Charge Carrier Diagnostics',
        summary: 'The Hall Effect & Charge Carrier Diagnostics',
        units: [
          skeletonUnit(id: 'phy705-m3-u1', title: 'The Hall Effect Intuition'),
          skeletonUnit(id: 'phy705-m3-u2', title: 'Hall Voltage Derivation'),
          skeletonUnit(id: 'phy705-m3-u3', title: 'Carrier Concentration & Sign Determination'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m4',
        title: 'Photoelectric, Thermionic, and Secondary Electronic Emission',
        summary: 'Photoelectric, Thermionic, and Secondary Electronic Emission',
        units: [
          skeletonUnit(id: 'phy705-m4-u1', title: 'Work Function'),
          skeletonUnit(id: 'phy705-m4-u2', title: 'Photoelectric Emission'),
          skeletonUnit(id: 'phy705-m4-u3', title: 'Thermionic Emission'),
          skeletonUnit(id: 'phy705-m4-u4', title: 'Secondary Emission & Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m5',
        title: 'PN Junction Diodes and Solar Cells',
        summary: 'PN Junction Diodes and Solar Cells',
        units: [
          skeletonUnit(id: 'phy705-m5-u1', title: 'N-type & P-type Doping'),
          skeletonUnit(id: 'phy705-m5-u2', title: 'PN Junction Formation'),
          skeletonUnit(id: 'phy705-m5-u3', title: 'Diode Action (The Turnstile)'),
          skeletonUnit(id: 'phy705-m5-u4', title: 'Solar Cells & Photovoltaic Effect'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m6',
        title: 'Bipolar Junction Transistors (BJT)',
        summary: 'Bipolar Junction Transistors (BJT)',
        units: [
          skeletonUnit(id: 'phy705-m6-u1', title: 'BJT Architecture'),
          skeletonUnit(id: 'phy705-m6-u2', title: 'Current Amplification Mechanism'),
          skeletonUnit(id: 'phy705-m6-u3', title: 'Operating Regions'),
          skeletonUnit(id: 'phy705-m6-u4', title: 'Common Emitter Configuration'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m7',
        title: 'Field-Effect Transistors (FET & MOSFET)',
        summary: 'Field-Effect Transistors (FET & MOSFET)',
        units: [
          skeletonUnit(id: 'phy705-m7-u1', title: 'Voltage Control vs Current Control'),
          skeletonUnit(id: 'phy705-m7-u2', title: 'MOSFET Architecture'),
          skeletonUnit(id: 'phy705-m7-u3', title: 'Channel Formation & Pinch-off'),
          skeletonUnit(id: 'phy705-m7-u4', title: 'MOSFET as Logic Switch'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m8',
        title: 'Thin Films and Integrated Circuit (IC) Fabrication',
        summary: 'Thin Films and Integrated Circuit (IC) Fabrication',
        units: [
          skeletonUnit(id: 'phy705-m8-u1', title: 'What is a Thin Film?'),
          skeletonUnit(id: 'phy705-m8-u2', title: 'Photolithography (Micro-printing)'),
          skeletonUnit(id: 'phy705-m8-u3', title: 'Doping & Etching'),
          skeletonUnit(id: 'phy705-m8-u4', title: 'IC Assembly'),
        ],
      ),
    ],
  );
}
