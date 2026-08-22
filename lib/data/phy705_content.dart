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
            Module(
        id: 'phy705-m3',
        title: 'The Hall Effect & Charge Carrier Diagnostics',
        summary:
            'Hall effect intuition, Hall voltage from force balance, carrier density and sign (n vs p).',
        units: [
          Unit(
            id: 'phy705-m3-u1',
            title: 'Hall effect intuition',
            content: r'''
## Learning goal

Build a physical picture of charge pile-up on the sides of a current-carrying sample in a perpendicular magnetic field.

## Crowded hallway analogy

People walk down a hallway (current). A sideways “wind” (magnetic force) pushes them toward one wall. They crowd that wall until the pressure of the crowd pushes back as hard as the wind — a steady sideways imbalance.

In a semiconductor bar, carriers drifting with the current feel a magnetic force q(v × B) toward one face. Charge accumulates there until the **Hall electric field** pushes back and balances the magnetic force.

## Geometry

Typical setup: current along +x, magnetic field along +z, Hall field along ±y (sign depending on carrier sign).

## Check yourself

If there were no sideways charge pile-up, would the magnetic force alone keep deflecting carriers forever toward one edge?
''',
            keyTakeaways: [
              'Perpendicular B deflects drifting carriers to one side.',
              'Charge accumulation builds a transverse Hall electric field.',
              'Steady state: magnetic force balanced by electric force from that field.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m3-u1-q1',
                question: 'In the Hall effect, carriers are pushed sideways by',
                options: [
                  'Gravity only',
                  'The magnetic part of the Lorentz force',
                  'Only temperature gradients always',
                  'Nuclear forces',
                ],
                correctIndex: 1,
                explanation: 'q(v × B) deflects carriers across the sample.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m3-u2',
            title: 'Hall voltage derivation',
            content: r'''
## Learning goal

Balance electric and magnetic forces on carriers to obtain the Hall field and Hall voltage.

## Force balance

In steady state for carriers of charge q and drift speed v_d:

|q| E_H = |q| v_d B

so

E_H = v_d B

(magnitudes; signs fixed by geometry and carrier sign).

## Hall voltage

If the sample width (along the Hall direction) is w,

V_H = E_H w = v_d B w

## Link to current

Current density J_x = n q v_d (for a single carrier type with density n). Then v_d = J_x / (n q) and

E_H = J_x B / (n q)

The Hall coefficient R_H = 1/(n q) (for one carrier type) appears in E_y = R_H J_x B_z.

## Check yourself

If current density doubles at fixed B and n, what happens to E_H?
''',
            keyTakeaways: [
              'Balance: E_H = v_d B.',
              'V_H = E_H w across the sample width.',
              'E_H = J B / (n q) for a single carrier type.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m3-u2-q1',
                question: 'In steady state Hall balance, E_H equals',
                options: [
                  'v_d / B',
                  'v_d B',
                  'B / v_d',
                  '0 always',
                ],
                correctIndex: 1,
                explanation: 'Electric force qE_H balances magnetic force q v_d B.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m3-u3',
            title: 'Carrier concentration and sign determination',
            content: r'''
## Learning goal

Use the sign of V_H to distinguish n-type from p-type material and extract carrier density from |V_H|.

## Sign of carriers

Electrons (negative) and holes (positive) deflect toward opposite faces for the same current and B directions. The polarity of the Hall voltage reveals the **dominant carrier sign**:

- One polarity → n-type (electron majority)
- Opposite polarity → p-type (hole majority)

This is a standard laboratory diagnostic for semiconductors.

## Concentration

From |E_H| = |J| B / (|n q|),

|n| = |J| B / (|q| |E_H|)

Measuring J, B, and V_H (hence E_H) yields the majority carrier density. Combined with conductivity σ = n |q| μ, one also extracts mobility μ.

## Check yourself

Why does the Hall polarity reverse when the majority carrier type switches from electrons to holes?
''',
            keyTakeaways: [
              'Hall polarity diagnoses n-type vs p-type.',
              'Carrier density from |n| = |J|B / (|q||E_H|).',
              'With σ, Hall data also give mobility.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m3-u3-q1',
                question: 'The sign of the Hall voltage primarily indicates',
                options: [
                  'The sample temperature only',
                  'Whether majority carriers are positive or negative',
                  'The nuclear composition only',
                  'Optical colour only',
                ],
                correctIndex: 1,
                explanation: 'Opposite carrier charges deflect to opposite sides.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy705-m4',
        title: 'Photoelectric, Thermionic, and Secondary Electronic Emission',
        summary:
            'Work function, photoelectric effect, thermionic emission, secondary emission and applications.',
        units: [
          Unit(
            id: 'phy705-m4-u1',
            title: 'Work function',
            content: r'''
## Learning goal

Define the work function as the energy “ticket price” an electron must pay to leave a metal into vacuum.

## Ticket-price picture

Inside a metal, electrons are bound. To escape into the vacuum just outside, an electron needs at least energy φ — the **work function**. Below that, it cannot classically leave (though tunneling can matter for very strong fields).

## Typical scale

Work functions are a few electron volts (eV), depending on the metal and surface condition. Cleanliness, crystal face, and coatings change φ — important in real devices.

## Role in emission

Photoelectric, thermionic, and field emission all compare the energy supplied (photon, heat, or field-assisted tunneling) against this barrier height φ.

## Check yourself

If two metals have different work functions, which one emits electrons more easily for the same extra energy input, all else equal?
''',
            keyTakeaways: [
              'Work function φ: minimum energy to extract an electron into vacuum.',
              'φ is a few eV and surface-dependent.',
              'All vacuum emission processes are measured against φ.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m4-u1-q1',
                question: 'The work function is best described as',
                options: [
                  'The melting temperature',
                  'The minimum energy to remove an electron from the metal to vacuum',
                  'Always equal to 1 MeV',
                  'The same as the Fermi energy only',
                ],
                correctIndex: 1,
                explanation: 'φ is the surface barrier height for electron escape.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m4-u2',
            title: 'Photoelectric emission',
            content: r'''
## Learning goal

State Einstein’s photoelectric equation and the photon picture of light ejecting electrons.

## Photon picture

Light of frequency f comes in energy packets (photons) of energy hf (h = Planck’s constant). One photon can give its energy to one electron.

## Einstein’s equation

Maximum kinetic energy of an emitted electron:

K_max = hf − φ

Emission requires hf > φ (threshold frequency f₀ = φ/h). Intensity affects how many electrons are emitted, not K_max for a given f (in the basic model).

## Why this mattered

Classical wave theory expected intensity, not frequency, to set electron energy. Experiments showed a frequency threshold and K_max linear in f — decisive evidence for photons.

## Check yourself

If frequency is below threshold, can raising intensity alone produce photoelectrons in the basic Einstein model?
''',
            keyTakeaways: [
              'Photons of energy hf knock out electrons.',
              'K_max = hf − φ; threshold f₀ = φ/h.',
              'Intensity → number of electrons; frequency → energy per electron.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m4-u2-q1',
                question: 'Einstein\'s photoelectric equation is',
                options: [
                  'K_max = φ − hf',
                  'K_max = hf − φ',
                  'K_max = hf + φ',
                  'K_max independent of f',
                ],
                correctIndex: 1,
                explanation: 'Photon energy minus work function leaves kinetic energy.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m4-u3',
            title: 'Thermionic emission',
            content: r'''
## Learning goal

Describe thermionic emission as heat-driven escape of electrons over the work-function barrier (Richardson–Dushman intuition).

## Boiling off electrons

Heating a metal increases the fraction of electrons with enough thermal energy to surmount φ. Electrons “boil” into vacuum — thermionic emission (historically linked to the Edison effect in hot-filament tubes).

## Current density (intuition)

Emission current density rises steeply with temperature, roughly as

J ∝ T² e^{−φ / kT}

(Richardson–Dushman form). The exponential dominates: small changes in T or φ cause large changes in emission.

## Applications

Vacuum-tube cathodes, electron guns, and some sensors rely on controlled thermionic emission from heated filaments or coated cathodes.

## Check yourself

Why does lowering φ (e.g. with special cathode coatings) greatly increase emission at the same temperature?
''',
            keyTakeaways: [
              'Thermionic emission: thermal energy overcomes φ.',
              'J grows roughly as T² exp(−φ/kT).',
              'Used in vacuum-tube cathodes and electron guns.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m4-u3-q1',
                question: 'Thermionic emission is primarily driven by',
                options: [
                  'Cooling the metal to absolute zero',
                  'Heating so electrons can surmount the work function',
                  'Only magnetic fields with no heat',
                  'Nuclear decay only',
                ],
                correctIndex: 1,
                explanation: 'Heat populates high-energy tail above φ.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m4-u4',
            title: 'Secondary emission and applications',
            content: r'''
## Learning goal

Explain secondary emission as electrons ejected by impact of energetic primary electrons, and name key applications.

## Mechanism

A primary electron (or other energetic particle) strikes a surface and transfers energy to electrons in the material. Some of those electrons escape as **secondary electrons**. The yield δ = (secondaries)/(primaries) depends on energy, angle, and material.

## Photomultiplier tubes (PMTs)

Light → photoelectron at a photocathode → acceleration into a dynode chain. Each impact multiplies the electron number via secondary emission → large detectable pulse from a single photon-level event.

## Other uses

Secondary emission matters in vacuum tubes, some electron multipliers, and surface analysis. Unwanted secondary emission can also cause noise or charging in devices.

## Check yourself

In a PMT, why does a chain of dynodes amplify the signal so dramatically?
''',
            keyTakeaways: [
              'Secondary emission: impact ejects additional electrons from a surface.',
              'Yield depends on primary energy and material.',
              'Photomultipliers use cascaded secondary emission for huge gain.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m4-u4-q1',
                question: 'Secondary emission refers to',
                options: [
                  'Emission caused only by heating',
                  'Electrons ejected when energetic primaries strike a surface',
                  'Nuclear fission fragments only',
                  'Photon emission from LEDs only',
                ],
                correctIndex: 1,
                explanation: 'Primary impact knocks out secondary electrons.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy705-m5',
        title: 'PN Junction Diodes and Solar Cells',
        summary:
            'Doping, PN junction and depletion region, diode I–V action, photovoltaic solar cells.',
        units: [
          Unit(
            id: 'phy705-m5-u1',
            title: 'N-type and P-type doping',
            content: r'''
## Learning goal

Explain how adding donor or acceptor impurities turns pure silicon into n-type or p-type material.

## Intrinsic silicon

Pure Si has four valence electrons and a full covalent lattice. Thermal energy creates equal numbers of free electrons and holes — few carriers at room temperature.

## N-type (donors)

Replace some Si atoms with phosphorus (five valence electrons). Four electrons bond in the lattice; the fifth is weakly bound and easily becomes a free **electron**. Phosphorus is a **donor**. Majority carriers: electrons; minority: holes.

## P-type (acceptors)

Replace some Si with boron (three valence electrons). A missing bond acts as a **hole** that can move when electrons hop into it. Boron is an **acceptor**. Majority carriers: holes; minority: electrons.

## Check yourself

Why does a small fraction of dopant atoms change conductivity dramatically compared with pure Si?
''',
            keyTakeaways: [
              'Donors (e.g. P) add mobile electrons → n-type.',
              'Acceptors (e.g. B) add mobile holes → p-type.',
              'Majority vs minority carriers defined by doping type.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m5-u1-q1',
                question: 'Phosphorus doped into silicon typically produces',
                options: [
                  'P-type material (hole majority)',
                  'N-type material (electron majority)',
                  'A perfect insulator always',
                  'Only nuclear radiation',
                ],
                correctIndex: 1,
                explanation: 'Group-V donors contribute extra electrons.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m5-u2',
            title: 'PN junction formation',
            content: r'''
## Learning goal

Describe diffusion of carriers across a PN boundary, recombination, and formation of the depletion region.

## Contact

When p-type and n-type regions meet, electrons diffuse from n → p and holes from p → n (down their concentration gradients). They recombine near the junction.

## Depletion region

Recombination leaves behind charged ions: positive donor ions on the n side and negative acceptor ions on the p side. That charged **depletion region** (space-charge region) is depleted of free carriers — a “no-man’s land” for mobile charge.

## Built-in field

The ion charge creates a built-in electric field pointing from n toward p, which opposes further diffusion. Equilibrium: diffusion current balanced by drift in the built-in field. A built-in potential barrier forms.

## Check yourself

Which side of the junction has exposed positive ion charge in the depletion region?
''',
            keyTakeaways: [
              'Diffusion of majority carriers across the junction leads to recombination.',
              'Depletion region: fixed ion charge, few free carriers.',
              'Built-in field / potential barrier reaches equilibrium with diffusion.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m5-u2-q1',
                question: 'The depletion region of a PN junction is characterized by',
                options: [
                  'Very high free-carrier density',
                  'Space charge from ionized donors/acceptors and few free carriers',
                  'Zero electric field always',
                  'Only metallic conduction',
                ],
                correctIndex: 1,
                explanation: 'Uncovered ions create the barrier; free carriers are depleted.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m5-u3',
            title: 'Diode action (the turnstile)',
            content: r'''
## Learning goal

Explain forward vs reverse bias as lowering or raising the junction barrier — the one-way turnstile behaviour of a diode.

## Forward bias

Positive voltage on p relative to n reduces the built-in barrier. Majority carriers inject across the junction → large current. The turnstile opens.

## Reverse bias

Positive voltage on n relative to p increases the barrier. Majority flow is blocked; only a small minority-carrier reverse saturation current flows (ideally). The turnstile closes.

## I–V picture

Exponential rise of current in forward bias (Shockley diode equation structure); small nearly constant reverse current until breakdown at large reverse voltage.

## Check yourself

In forward bias, is the depletion region typically wider or narrower than at zero bias?
''',
            keyTakeaways: [
              'Forward bias lowers the barrier → easy current.',
              'Reverse bias raises the barrier → little current.',
              'Diode acts as an electrical one-way turnstile.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m5-u3-q1',
                question: 'Forward bias of a PN diode',
                options: [
                  'Widens the barrier and blocks all current always',
                  'Lowers the barrier and allows large majority-carrier current',
                  'Removes the semiconductor',
                  'Only affects magnetic properties',
                ],
                correctIndex: 1,
                explanation: 'Forward bias reduces the built-in potential barrier.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m5-u4',
            title: 'Solar cells and the photovoltaic effect',
            content: r'''
## Learning goal

Explain how light generates electron–hole pairs and how the junction field separates them to produce power.

## Photon absorption

A photon with energy above the semiconductor gap creates an electron–hole pair. In or near the depletion region, the built-in field sweeps electrons toward the n side and holes toward the p side.

## Photocurrent and voltage

Separated carriers drive current in an external circuit (photocurrent). Open-circuit voltage builds until forward bias of the junction balances the photocurrent — the solar cell I–V curve sits in the power-generating quadrant.

## Efficiency notes

Not every photon is absorbed usefully; recombination and optical losses matter. Design aims to absorb light near the junction and collect carriers before they recombine.

## Check yourself

Why must the photon energy exceed the semiconductor band gap for efficient pair generation in this picture?
''',
            keyTakeaways: [
              'Light creates electron–hole pairs (if hf > gap).',
              'Junction field separates carriers → photocurrent.',
              'Solar cell delivers power in the fourth I–V quadrant.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m5-u4-q1',
                question: 'In a solar cell, the depletion-region field primarily',
                options: [
                  'Creates photons',
                  'Separates photogenerated electrons and holes',
                  'Removes the band gap',
                  'Stops all current always',
                ],
                correctIndex: 1,
                explanation: 'Built-in field sweeps carriers apart to produce terminal current.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy705-m6',
        title: 'Bipolar Junction Transistors (BJT)',
        summary:
            'NPN/PNP structure, current gain beta, cutoff/active/saturation, common-emitter picture.',
        units: [
          Unit(
            id: 'phy705-m6-u1',
            title: 'BJT architecture',
            content: r'''
## Learning goal

Describe NPN and PNP sandwich structures: emitter, base, and collector.

## Three layers

A BJT is two PN junctions sharing a thin middle region:

- **Emitter** — heavily doped; injects carriers
- **Base** — thin and lightly doped; controls the flow
- **Collector** — collects carriers that cross the base

**NPN:** n-emitter / p-base / n-collector  
**PNP:** p-emitter / n-base / p-collector  

## Faucet analogy

The base terminal is like a faucet handle: a small adjustment of base current (or voltage) opens or closes a much larger flow from collector to emitter. The emitter is the supply side; the collector is the outlet side in the usual active-region story for NPN.

## Check yourself

Why must the base be thin for efficient transistor action?
''',
            keyTakeaways: [
              'BJT: emitter–base–collector sandwich (NPN or PNP).',
              'Base is thin and lightly doped relative to the emitter.',
              'Base acts like a control valve for a larger collector current.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m6-u1-q1',
                question: 'In an NPN BJT the middle layer is',
                options: [
                  'N-type collector only',
                  'P-type base',
                  'Metal only',
                  'Vacuum',
                ],
                correctIndex: 1,
                explanation: 'NPN means n–p–n: p-type base in the middle.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m6-u2',
            title: 'Current amplification mechanism',
            content: r'''
## Learning goal

Explain how a small base current controls a large collector current and define β = I_C / I_B.

## Injection and collection

In active-region NPN bias, the emitter–base junction is forward biased: electrons inject from emitter into base. Most diffuse across the thin base and are swept into the reverse-biased collector–base junction — forming **collector current** I_C.

A small fraction recombines in the base or flows out the base terminal as **base current** I_B. Because the base is thin and lightly doped, recombination is small → I_C ≫ I_B.

## Current gain

β (beta) = I_C / I_B

Typical small-signal values might be tens to hundreds. Also α = I_C / I_E with I_E = I_C + I_B and β = α/(1−α).

## Check yourself

If β = 100 and I_B = 10 μA, what is I_C?
''',
            keyTakeaways: [
              'Emitter injects; most carriers reach the collector.',
              'Small base current → large collector current.',
              'β = I_C / I_B is the common-emitter current gain.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m6-u2-q1',
                question: 'The common-emitter current gain β is',
                options: [
                  'I_B / I_C',
                  'I_C / I_B',
                  'I_E only',
                  'Always 1',
                ],
                correctIndex: 1,
                explanation: 'β = I_C / I_B.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m6-u3',
            title: 'Operating regions',
            content: r'''
## Learning goal

Distinguish cutoff, active, and saturation regions of BJT operation.

## Cutoff

Both junctions effectively off (emitter–base not forward conducting). I_C ≈ 0 — the switch is **OFF**.

## Active (forward-active)

Emitter–base forward, collector–base reverse. Linear control: I_C ≈ β I_B — the **amplifying** region used for analog gain.

## Saturation

Both junctions forward biased; the transistor is fully ON as a switch. V_CE is small; I_C is set more by the external circuit than by β I_B. Digital switching often uses cutoff ↔ saturation.

## Check yourself

Which region is preferred for linear amplification, and which pair of regions for on/off switching?
''',
            keyTakeaways: [
              'Cutoff: switch OFF, essentially no collector current.',
              'Active: amplification, I_C ≈ β I_B.',
              'Saturation: switch ON, low V_CE.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m6-u3-q1',
                question: 'Linear amplification with I_C ≈ β I_B occurs in the',
                options: [
                  'Cutoff region only',
                  'Forward-active region',
                  'Breakdown only',
                  'When the device is unpowered',
                ],
                correctIndex: 1,
                explanation: 'Active region provides controlled current gain.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m6-u4',
            title: 'Common-emitter configuration',
            content: r'''
## Learning goal

Describe the common-emitter setup and the physical meaning of input and output characteristics.

## Common emitter

Emitter is the shared reference for input and output. Input: base–emitter port. Output: collector–emitter port. This configuration provides both current and voltage gain and is the most familiar textbook amplifier connection.

## Input characteristic

I_B vs V_BE looks like a forward diode curve: little current until V_BE ≈ 0.7 V (silicon), then steep rise.

## Output characteristic

Family of curves I_C vs V_CE for fixed I_B values. In the active region, I_C is nearly flat vs V_CE (slight slope from Early effect) and steps up as I_B steps up — visual proof of current control. Saturation appears at low V_CE where curves bend down toward the origin.

## Check yourself

On the output family of curves, what does a higher I_B curve mean for I_C in the active region?
''',
            keyTakeaways: [
              'Common emitter: shared emitter; input at base, output at collector.',
              'Input curve resembles a diode I–V.',
              'Output family shows I_C controlled by I_B in the active region.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m6-u4-q1',
                question: 'In common-emitter output curves, raising I_B in the active region',
                options: [
                  'Lowers I_C to zero always',
                  'Raises the I_C level of the curve',
                  'Removes V_CE',
                  'Has no effect ever',
                ],
                correctIndex: 1,
                explanation: 'Higher base current yields higher collector current when active.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy705-m7',
        title: 'Field-Effect Transistors (FET & MOSFET)',
        summary:
            'Voltage vs current control, MOSFET structure, inversion channel and pinch-off, MOSFET as logic switch.',
        units: [
          Unit(
            id: 'phy705-m7-u1',
            title: 'Voltage control vs current control',
            content: r'''
## Learning goal

Contrast BJTs (current-controlled) with FETs (voltage/field-controlled).

## BJT reminder

In a BJT, base current I_B controls collector current I_C. The input port draws current; power is spent in the base circuit.

## FET idea

A **field-effect transistor** uses an electric field (set by a gate voltage) to control the conductivity of a semiconductor channel between source and drain. Ideally the gate draws negligible DC current — control is by voltage, not by a continuous input current.

## Why it matters

Voltage control with tiny gate current is ideal for dense digital logic and low static power (especially CMOS). FETs dominate modern integrated circuits.

## Check yourself

Which device family is naturally better for high input impedance amplifiers: BJT or FET, and why?
''',
            keyTakeaways: [
              'BJT: current-controlled (I_B controls I_C).',
              'FET: field/voltage-controlled (gate voltage controls channel).',
              'Negligible DC gate current → high input impedance.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m7-u1-q1',
                question: 'A defining feature of FETs compared with BJTs is',
                options: [
                  'Control by continuous large base current only',
                  'Control of a channel by gate voltage / electric field',
                  'Absence of any semiconductor',
                  'Only optical operation',
                ],
                correctIndex: 1,
                explanation: 'FETs modulate a channel with an electric field from the gate.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m7-u2',
            title: 'MOSFET architecture',
            content: r'''
## Learning goal

Describe the metal–oxide–semiconductor stack: gate, oxide insulator, and semiconductor channel region.

## Layers

- **Gate** — conductive electrode (metal or polysilicon)
- **Oxide** — thin insulating SiO₂ (or high-k dielectric) under the gate
- **Semiconductor** — body in which a conductive channel can form between **source** and **drain** terminals

The oxide prevents DC gate current; the field from the gate still reaches the semiconductor.

## Field-effect bridge analogy

The gate voltage is like raising or lowering a drawbridge (the channel) between two riverbanks (source and drain). When the bridge is up (channel formed), current can flow; when down (no channel), the path is blocked.

## Enhancement-mode n-MOSFET (typical)

With gate voltage near zero, no n-channel exists in a p-type body — device off. Sufficient positive gate voltage attracts electrons to the surface → **inversion layer** n-channel → device can conduct from drain to source.

## Check yourself

What role does the thin oxide play electrically between gate and channel?
''',
            keyTakeaways: [
              'MOSFET: gate / oxide / semiconductor stack plus source and drain.',
              'Oxide isolates DC current but transmits electric field.',
              'Gate voltage can form or suppress a conductive channel.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m7-u2-q1',
                question: 'In a MOSFET the oxide layer primarily',
                options: [
                  'Shorts gate to drain always',
                  'Insulates the gate while allowing field control of the channel',
                  'Acts as the only conductor for drain current',
                  'Removes the need for source and drain',
                ],
                correctIndex: 1,
                explanation: 'Gate dielectric blocks DC current but transmits the controlling field.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m7-u3',
            title: 'Channel formation and pinch-off',
            content: r'''
## Learning goal

Explain inversion-layer formation under the gate and pinch-off when drain voltage is large.

## Inversion channel

Positive V_GS (n-MOS) bends the energy bands at the surface until the surface is inverted to n-type. That electron layer connects source to drain — the channel. Higher V_GS means more channel charge and higher conductance (above threshold).

## Pinch-off

With V_DS applied, the channel is not uniform: the voltage along the channel varies. At the drain end the effective gate-to-channel voltage is reduced. At high enough V_DS the channel is **pinched off** near the drain — the inversion layer thins to a point. Current still flows (carriers are swept through the depletion region) but saturates: further increase in V_DS does not raise I_D much (ideal saturation region).

## Regions

- Cutoff: V_GS below threshold — no channel  
- Linear/triode: small V_DS — channel acts like a resistor controlled by V_GS  
- Saturation: beyond pinch-off — I_D roughly set by V_GS  

## Check yourself

Why does increasing V_DS eventually stop increasing I_D strongly in saturation?
''',
            keyTakeaways: [
              'Inversion layer under the gate forms the MOSFET channel.',
              'Pinch-off near the drain causes current saturation.',
              'Cutoff / linear / saturation regions for circuit design.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m7-u3-q1',
                question: 'Pinch-off in a MOSFET refers to',
                options: [
                  'Destruction of the oxide always',
                  'Narrowing of the channel near the drain at high V_DS leading to current saturation',
                  'Removal of the source terminal',
                  'Zero gate voltage only',
                ],
                correctIndex: 1,
                explanation: 'High V_DS pinches the channel at the drain end; I_D saturates.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-m7-u4',
            title: 'MOSFET as logic switch',
            content: r'''
## Learning goal

Connect MOSFET ON/OFF behaviour to digital logic building blocks in processors.

## Binary switch

Digital logic represents 0 and 1 with two voltage levels. A MOSFET can be driven fully OFF (cutoff) or strongly ON (low-resistance channel) — a near-ideal electronic switch controlled by the gate.

## CMOS idea

Complementary n-MOS and p-MOS transistors form gates (inverters, NAND, NOR) where one device pulls the output high and the other pulls low, with very small static current when the output is steady. Billions of such switches implement CPUs and memories.

## Scaling

Smaller transistors switch faster and pack denser, but face leakage, heat, and quantum tunneling through ultra-thin oxides — the engineering frontier of modern microelectronics.

## Check yourself

Why is low static gate current important when billions of transistors sit on one chip?
''',
            keyTakeaways: [
              'MOSFET: voltage-controlled ON/OFF switch for logic levels.',
              'CMOS pairs n- and p-devices for efficient digital gates.',
              'Modern processors are vast networks of MOSFET switches.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy705-m7-u4-q1',
                question: 'In digital CMOS logic, MOSFETs primarily act as',
                options: [
                  'Only analog resistors never switching',
                  'Electrically controlled switches implementing 0/1 levels',
                  'Nuclear sensors',
                  'Mechanical relays only',
                ],
                correctIndex: 1,
                explanation: 'Logic gates are networks of MOSFET switches.',
              ),
            ],
          ),
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
