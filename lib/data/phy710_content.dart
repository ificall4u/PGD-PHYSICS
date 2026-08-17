import 'package:pgd_physics/models/course.dart';

/// Complete PHY 710 – Vacuum Physics and Thin Film
/// Micro-chunked, practical & everyday-analogy first for Tochi
Course buildPhy710() {
  return Course(
    id: 'phy710',
    code: 'PHY 710',
    title: 'Vacuum Physics and Thin Film',
    description:
        'How we create and measure empty space, and how we grow ultra-thin layers of material that form the heart of modern electronics, optics and coatings.',
    semester: 'Second Semester',
    units: 3,
    icon: '🌀',
    colorHint: ColorHint.cyan,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. WHAT IS A VACUUM?
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t1',
        title: 'What is a Vacuum and Why Do We Need It?',
        summary: 'Emptying the space so that molecules no longer interfere with our processes.',
        units: [
          Unit(
            id: 'phy710-t1-u1',
            title: 'Vacuum = Very Few Molecules Left',
            content: r'''
# Vacuum = Very Few Molecules Left

Hey Tochi…

Air at ordinary pressure contains about 10²⁵ molecules in every cubic metre. A vacuum is simply a region where we have removed most of those molecules.

We need vacuum for many reasons:
- So that evaporated atoms can travel in straight lines to a substrate without colliding
- So that surfaces stay clean
- So that electron beams and plasmas can exist without being scattered
- So that materials can be heated without burning or oxidising

Different processes need different degrees of emptiness — from a rough vacuum to ultra-high vacuum.
''',
            keyTakeaways: [
              'Vacuum means far fewer gas molecules than normal air.',
              'Needed for clean surfaces, free molecular flight, and many particle beams.',
              'Different applications require different vacuum levels.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t1u1q1',
                question: 'The main reason we create a vacuum for thin-film deposition is…',
                options: [
                  'To make the chamber look empty',
                  'So that atoms can travel from source to substrate without scattering and so surfaces stay clean',
                  'To increase the temperature only',
                  'To generate electricity',
                ],
                correctIndex: 1,
                explanation: 'Collisions and contamination ruin controlled film growth.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. VACUUM SYSTEMS & PUMPS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t2',
        title: 'Vacuum Systems, Pumps and Gauges',
        summary: 'How we remove the air and how we know how empty the chamber is.',
        units: [
          Unit(
            id: 'phy710-t2-u1',
            title: 'Types of Vacuum Pumps – From Rough to Ultra-High',
            content: r'''
# Types of Vacuum Pumps – From Rough to Ultra-High

Think of emptying a swimming pool with different tools:

- **Roughing pumps** (rotary vane, scroll, diaphragm) remove the bulk of the air, down to about 10⁻²–10⁻³ mbar. Like a strong shop vacuum.
- **High-vacuum pumps** (turbomolecular, diffusion, cryopumps) take over once the pressure is already low and push into the 10⁻⁶–10⁻¹⁰ mbar range. Like a precision fan that only works when most of the air is already gone.
- **Ultra-high-vacuum techniques** (ion pumps, titanium sublimation, careful baking) remove the last stubborn molecules that cling to the walls.

No single pump covers the whole range; we use them in sequence.
''',
            keyTakeaways: [
              'Roughing pumps handle the bulk atmosphere.',
              'High-vacuum pumps take over at lower pressures.',
              'Pumps are staged because each type works best in a limited pressure window.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t2u1q1',
                question: 'A turbomolecular pump is typically used…',
                options: [
                  'To pump the room air from atmospheric pressure by itself',
                  'After a roughing pump has already lowered the pressure',
                  'Only for liquids',
                  'As a pressure gauge',
                ],
                correctIndex: 1,
                explanation: 'Turbo pumps require a pre-vacuum; they are high-vacuum pumps, not roughing pumps.',
              ),
            ],
          ),
          Unit(
            id: 'phy710-t2-u2',
            title: 'Pressure Gauges – How We Measure Emptiness',
            content: r'''
# Pressure Gauges – How We Measure Emptiness

Different gauges work in different ranges:

- **Pirani / thermocouple gauges** – measure how well the gas conducts heat away from a hot wire (good for rough to medium vacuum).
- **Capacitance manometers** – measure the deflection of a diaphragm (accurate, gas-independent).
- **Ionisation gauges** (hot-cathode or cold-cathode) – ionise the remaining molecules and measure the ion current (necessary for high and ultra-high vacuum).

You always choose a gauge whose working range matches the pressure you care about.
''',
            keyTakeaways: [
              'No single gauge covers the entire vacuum range.',
              'Thermal-conductivity gauges for higher pressures; ionisation gauges for lower pressures.',
              'Matching the gauge to the expected pressure is essential.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t2u2q1',
                question: 'Ionisation gauges are mainly used for…',
                options: [
                  'Atmospheric pressure only',
                  'High and ultra-high vacuum',
                  'Measuring liquid level',
                  'Generating the vacuum itself',
                ],
                correctIndex: 1,
                explanation: 'They work by ionising the sparse remaining molecules and are suited to very low pressures.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. HEATING IN VACUUM
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t3',
        title: 'Heating Methods in Vacuum',
        summary: 'How we heat materials when there is almost no air to carry the heat.',
        units: [
          Unit(
            id: 'phy710-t3-u1',
            title: 'Resistance, Induction and Electron-Bombardment Heating',
            content: r'''
# Resistance, Induction and Electron-Bombardment Heating

In vacuum there is almost no convection, so we heat by other means:

- **Resistance heating** – pass current through a filament or boat that holds the material (simple evaporation sources).
- **Induction heating** – a coil carrying RF current induces eddy currents inside a conducting crucible or the charge itself.
- **Electron-bombardment heating** – a beam of electrons is accelerated and slammed into the material; nearly all the kinetic energy becomes heat. Excellent for high-melting-point metals and for precise control.
''',
            keyTakeaways: [
              'Vacuum eliminates convective heating, so we use radiation, conduction or particle beams.',
              'Resistance, induction and e-beam are the common laboratory methods.',
              'E-beam is especially useful for refractory materials.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t3u1q1',
                question: 'Electron-bombardment heating works by…',
                options: [
                  'Blowing hot air on the sample',
                  'Transferring the kinetic energy of accelerated electrons into heat',
                  'Only using sunlight',
                  'Chemical combustion',
                ],
                correctIndex: 1,
                explanation: 'Energetic electrons deposit their energy as heat when they stop in the target.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. EVAPORATION & SUBSTRATE PREPARATION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t4',
        title: 'Vacuum Evaporation and Substrate Preparation',
        summary: 'Turning a solid into vapour and letting it condense as a thin film on a prepared surface.',
        units: [
          Unit(
            id: 'phy710-t4-u1',
            title: 'Thermal Evaporation – Boiling in Empty Space',
            content: r'''
# Thermal Evaporation – Boiling in Empty Space

Heat a material in vacuum until its vapour pressure becomes appreciable. Atoms or molecules leave the surface, travel in straight lines (because there is almost nothing to collide with), and condense on the cooler substrate.

The film thickness is controlled by evaporation rate and time. A quartz-crystal monitor often measures the accumulating mass in real time.

Because the mean free path is long, the coating is “line-of-sight” — anything in the shadow of a particle stays uncoated.
''',
            keyTakeaways: [
              'Evaporation = heat until vapour forms, then condense on substrate.',
              'Long mean free path → line-of-sight deposition.',
              'Rate and time control thickness.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t4u1q1',
                question: 'In high-vacuum thermal evaporation the atoms travel…',
                options: [
                  'By random diffusion through dense air',
                  'In nearly straight lines from source to substrate',
                  'Only along the chamber walls',
                  'As liquid droplets',
                ],
                correctIndex: 1,
                explanation: 'With few collisions the trajectories are essentially ballistic.',
              ),
            ],
          ),
          Unit(
            id: 'phy710-t4-u2',
            title: 'Substrate Preparation – Cleanliness is Everything',
            content: r'''
# Substrate Preparation – Cleanliness is Everything

A thin film is only as good as the surface it sits on. Typical preparation steps:

- Degreasing with solvents  
- Ultrasonic cleaning  
- Acid or plasma cleaning to remove oxides and organic residues  
- Sometimes a thin adhesion layer or surface activation  

Any residual contamination can cause poor adhesion, pinholes or unwanted chemical reactions. In ultra-high vacuum the substrate may even be heated or ion-bombarded to strip the last adsorbed molecules.
''',
            keyTakeaways: [
              'Surface cleanliness determines film adhesion and quality.',
              'Solvent, ultrasonic, chemical and plasma cleaning are common.',
              'UHV allows still more thorough surface preparation.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t4u2q1',
                question: 'The most common reason a deposited film peels off is…',
                options: [
                  'The vacuum was too good',
                  'Contamination or poor preparation of the substrate surface',
                  'The film was too thin',
                  'The chamber was too cold',
                ],
                correctIndex: 1,
                explanation: 'Contaminated surfaces prevent proper bonding of the arriving atoms.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. SPUTTERING
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t5',
        title: 'Sputtering Techniques',
        summary: 'Knocking atoms out of a solid target with energetic ions — like atomic-scale sandblasting.',
        units: [
          Unit(
            id: 'phy710-t5-u1',
            title: 'The Sputtering Process',
            content: r'''
# The Sputtering Process

A plasma is created in a low-pressure gas (often argon). Positive ions from the plasma are accelerated into a target. Each ion impact knocks atoms out of the target — that is **sputtering**.

The ejected atoms travel to the substrate and form a film. Unlike evaporation, sputtering can deposit alloys, compounds and refractory materials that are hard to evaporate. The arriving atoms also carry more energy, which often improves film density and adhesion.
''',
            keyTakeaways: [
              'Energetic ions knock target atoms free.',
              'Works for metals, alloys, oxides, etc.',
              'Higher particle energy than thermal evaporation → denser films.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t5u1q1',
                question: 'In sputtering the atoms that form the film originally come from…',
                options: [
                  'The gas itself',
                  'A solid target that is bombarded by ions',
                  'The substrate only',
                  'Chemical vapour only',
                ],
                correctIndex: 1,
                explanation: 'Ions eject atoms from the solid target; those atoms become the film.',
              ),
            ],
          ),
          Unit(
            id: 'phy710-t5-u2',
            title: 'DC, RF and Magnetron Sputtering',
            content: r'''
# DC, RF and Magnetron Sputtering

- **DC sputtering** – simple, works for conducting targets.  
- **RF sputtering** – can also deposit insulating materials because the alternating field prevents charge build-up.  
- **Magnetron sputtering** – magnets trap electrons near the target, increasing ionisation efficiency. Allows lower pressures, higher rates and less substrate heating. The dominant industrial method today.
''',
            keyTakeaways: [
              'DC for conductors; RF for insulators as well.',
              'Magnetron geometry greatly improves efficiency.',
              'Magnetron sputtering is the workhorse of modern thin-film industry.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t5u2q1',
                question: 'Magnetron sputtering is widely used because…',
                options: [
                  'It requires no vacuum',
                  'Magnetic confinement raises plasma density, allowing faster deposition at lower pressure',
                  'It only works for gold',
                  'It eliminates the need for a target',
                ],
                correctIndex: 1,
                explanation: 'The magnetic trap keeps electrons in the plasma longer, boosting ionisation.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. EPITAXIAL GROWTH
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t6',
        title: 'Epitaxial Growth Processes',
        summary: 'Growing a crystalline film that continues the lattice of the substrate — ordered atom by atom.',
        units: [
          Unit(
            id: 'phy710-t6-u1',
            title: 'What Epitaxy Means',
            content: r'''
# What Epitaxy Means

Epitaxy is the growth of a crystalline film whose atoms lock into registry with the crystal lattice of the substrate. The film is not just any solid layer; it is an ordered continuation of the underlying crystal.

Two main flavours:
- **Homoepitaxy** – same material (e.g. silicon on silicon)  
- **Heteroepitaxy** – different but lattice-matched (or deliberately strained) material

Epitaxial layers are essential for high-performance transistors, lasers, LEDs and many quantum devices.
''',
            keyTakeaways: [
              'Epitaxy = crystalline film in atomic registry with the substrate.',
              'Homoepitaxy vs heteroepitaxy.',
              'Required for the highest-quality electronic and optoelectronic devices.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t6u1q1',
                question: 'An epitaxial film is distinguished by…',
                options: [
                  'Being completely amorphous',
                  'Having its crystal lattice aligned with that of the substrate',
                  'Being thicker than 1 mm',
                  'Containing no atoms from the target',
                ],
                correctIndex: 1,
                explanation: 'Atomic registry with the substrate is the definition of epitaxy.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. CHARACTERISATION & APPLICATIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy710-t7',
        title: 'Characterisation and Applications of Thin Films',
        summary: 'How we measure what we have grown and where thin films are used.',
        units: [
          Unit(
            id: 'phy710-t7-u1',
            title: 'Measuring Thickness, Structure and Properties',
            content: r'''
# Measuring Thickness, Structure and Properties

Common characterisation tools:

- **Quartz-crystal microbalance / profilometry / ellipsometry** – thickness  
- **X-ray diffraction (XRD)** – crystal structure and orientation  
- **Scanning electron microscopy (SEM) / atomic-force microscopy (AFM)** – surface morphology  
- **Four-point probe / Hall effect** – electrical properties  
- **Spectrophotometry** – optical constants and band gap  

Together they tell us whether the film is the thickness, composition, structure and performance we intended.
''',
            keyTakeaways: [
              'Thickness, structure, morphology and electrical/optical properties are all measured.',
              'Different tools probe different aspects.',
              'Characterisation closes the loop between process and result.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t7u1q1',
                question: 'X-ray diffraction of a thin film is mainly used to learn about…',
                options: [
                  'Only the colour of the film',
                  'Crystal structure and preferred orientation',
                  'The vacuum pressure during growth',
                  'The operator’s name',
                ],
                correctIndex: 1,
                explanation: 'XRD reveals how the atoms are arranged and whether the film is crystalline.',
              ),
            ],
          ),
          Unit(
            id: 'phy710-t7-u2',
            title: 'Where Thin Films Appear in Real Life',
            content: r'''
# Where Thin Films Appear in Real Life

- Microelectronics – every transistor gate oxide, interconnect and dielectric  
- Optics – anti-reflection coatings, mirrors, filters  
- Solar cells and LEDs – active semiconductor layers  
- Magnetic hard-disk coatings and read heads  
- Decorative and protective coatings on tools, glass and packaging  
- Biomedical coatings and sensors  

Almost every modern high-tech device contains at least one deliberately engineered thin film.
''',
            keyTakeaways: [
              'Thin films are ubiquitous in electronics, optics, energy and coatings.',
              'Performance often depends on nanometre-scale control.',
              'The vacuum and deposition techniques you have learned enable all of them.',
            ],
            quiz: [
              QuizQuestion(
                id: '710t7u2q1',
                question: 'A major application of thin films is…',
                options: [
                  'Only large structural beams',
                  'The active layers inside integrated circuits, solar cells and optical coatings',
                  'Replacing all bulk metals',
                  'Generating gravity',
                ],
                correctIndex: 1,
                explanation: 'Microelectronics, photovoltaics and precision optics all rely on engineered thin films.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
