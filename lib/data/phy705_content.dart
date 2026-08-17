import 'package:pgd_physics/models/course.dart';

/// Complete PHY 705 – Introductory Solid State Electronics
/// Micro-chunked, intuition-first, written for Tochi
Course buildPhy705() {
  return Course(
    id: 'phy705',
    code: 'PHY 705',
    title: 'Introductory Solid State Electronics',
    description:
        'How electrons move in metals and semiconductors, energy barriers, the Hall effect, emission phenomena, and the basic devices that run modern electronics — diodes, transistors, solar cells and more.',
    semester: 'First Semester',
    units: 3,
    icon: '🔋',
    colorHint: ColorHint.green,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. CONDUCTION IN METALS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t1',
        title: 'Electrical Conduction in Metals',
        summary: 'Why metals conduct so well — free electrons, drift, and Ohm’s law from a microscopic view.',
        units: [
          Unit(
            id: 'phy705-t1-u1',
            title: 'Free Electrons – The Crowd That Can Move',
            content: r'''
# Free Electrons – The Crowd That Can Move

Hey Tochi…

In a metal the outer electrons are not tightly bound to any particular atom. They form a shared “sea” that can move throughout the crystal. We call them **free electrons** or conduction electrons.

When you apply an electric field, this whole crowd feels a gentle force and begins to drift slowly in one direction. That drift is the electric current.

Even though individual electrons bounce around at high thermal speeds, the *net* drift velocity is tiny — yet there are so many electrons that a usable current flows.
''',
            keyTakeaways: [
              'Metals have a sea of electrons that are free to move.',
              'An electric field causes a slow net drift of this sea.',
              'Current is the collective drift of many electrons.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t1u1q1',
                question: 'What is mainly responsible for electrical conduction in a metal?',
                options: [
                  'The atomic nuclei',
                  'The free (conduction) electrons',
                  'Bound electrons in filled shells',
                  'Phonons only',
                ],
                correctIndex: 1,
                explanation: 'The loosely held outer electrons form a mobile sea that carries the current.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t1-u2',
            title: 'Drift Velocity and Ohm’s Law Microscopically',
            content: r'''
# Drift Velocity and Ohm’s Law Microscopically

Between collisions an electron accelerates under the electric field E. After a short average time τ (the relaxation time) it collides and loses the extra velocity it gained.

The average extra velocity is the **drift velocity**:

$$ v_d = -\frac{e\tau}{m}E $$

Current density J is then proportional to E, which is Ohm’s law:

$$ J = \sigma E \qquad \sigma = \frac{ne^2\tau}{m} $$

σ is the conductivity. Higher n (more free electrons) or longer τ (fewer collisions) means better conduction.
''',
            keyTakeaways: [
              'Drift velocity is the small net velocity caused by the field.',
              'Conductivity σ = ne²τ/m.',
              'Ohm’s law emerges naturally from this microscopic picture.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t1u2q1',
                question: 'If the average time between collisions τ increases, the conductivity…',
                options: [
                  'Decreases',
                  'Stays the same',
                  'Increases',
                  'Becomes zero',
                ],
                correctIndex: 2,
                explanation: 'Longer τ means electrons accelerate for longer before colliding, so they carry more current.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. SEMICONDUCTORS & ENERGY BANDS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t2',
        title: 'Energy Bands and Semiconductors',
        summary: 'Why some materials conduct a little, some a lot, and some not at all — the band picture.',
        units: [
          Unit(
            id: 'phy705-t2-u1',
            title: 'Energy Bands – Theater Seating for Electrons',
            content: r'''
# Energy Bands – Theater Seating for Electrons

Imagine a theater. The allowed seats are arranged in continuous rows (bands). Between the rows there are empty gaps where no seats exist (band gaps).

Electrons can only sit in the allowed seats. In an **insulator** the lower rows (valence band) are completely full and the next empty row (conduction band) is far away — a large gap. Almost no electrons can jump up.

In a **metal** the top row is only partly filled, so electrons can easily move to empty seats in the same band.

In a **semiconductor** the gap is small. A little thermal energy (or light) can promote a few electrons into the conduction band, leaving empty seats (holes) behind in the valence band. Both the electrons and the holes can carry current.
''',
            keyTakeaways: [
              'Allowed energies form bands; forbidden regions are gaps.',
              'Metals have a partially filled band; insulators have a large gap.',
              'Semiconductors have a small gap — a few carriers can be excited.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t2u1q1',
                question: 'In the theater analogy, what corresponds to the band gap?',
                options: [
                  'A full row of seats',
                  'The empty space between rows where no seats exist',
                  'The stage',
                  'The audience',
                ],
                correctIndex: 1,
                explanation: 'No allowed energy states exist inside the gap.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t2-u2',
            title: 'Electrons and Holes – Two Types of Carrier',
            content: r'''
# Electrons and Holes – Two Types of Carrier

When an electron leaves the valence band it leaves behind an empty state. That empty state can be treated as a positively charged particle called a **hole**.

- Electrons in the conduction band move freely and carry negative charge.
- Holes in the valence band effectively move when electrons hop into the empty spots; they behave as positive carriers.

In an intrinsic (pure) semiconductor the number of electrons equals the number of holes. Adding impurities (doping) can make one type dominate → n-type or p-type material.
''',
            keyTakeaways: [
              'A missing electron in the valence band acts as a positive hole.',
              'Both electrons and holes contribute to current.',
              'Doping controls which carrier is in the majority.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t2u2q1',
                question: 'A hole in a semiconductor is best thought of as…',
                options: [
                  'A real positive particle added from outside',
                  'An empty electron state that behaves like a positive charge',
                  'A lattice vibration',
                  'A photon',
                ],
                correctIndex: 1,
                explanation: 'It is the absence of an electron that moves as if it were a positive carrier.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. ENERGY BARRIERS & THE p-n JUNCTION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t3',
        title: 'Energy Barriers and the p-n Junction',
        summary: 'What happens when p-type and n-type material meet — the heart of the diode.',
        units: [
          Unit(
            id: 'phy705-t3-u1',
            title: 'The p-n Junction – A Built-in Turnstile',
            content: r'''
# The p-n Junction – A Built-in Turnstile

When p-type and n-type semiconductors are joined, electrons from the n-side diffuse into the p-side and holes diffuse the other way. They leave behind charged ions, creating a region depleted of free carriers — the **depletion region**.

This region acts like a built-in barrier (an electric potential difference). It is easy for current to flow in one direction (forward bias, barrier lowered) and very hard in the other direction (reverse bias, barrier raised).

That one-way behaviour is the essence of a **diode**.
''',
            keyTakeaways: [
              'Diffusion of carriers creates a depletion region and a built-in potential.',
              'The barrier is lowered by forward bias and raised by reverse bias.',
              'This is why a diode conducts mainly in one direction.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t3u1q1',
                question: 'In a p-n junction the depletion region is formed mainly by…',
                options: [
                  'External battery only',
                  'Diffusion of electrons and holes across the junction',
                  'Heating the crystal',
                  'Shining light',
                ],
                correctIndex: 1,
                explanation: 'Carriers diffuse and leave fixed ions behind, creating the barrier.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. MOTION IN E AND B FIELDS & HALL EFFECT
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t4',
        title: 'Motion of Charges in E and B Fields – Hall Effect',
        summary: 'How magnetic fields bend moving charges and reveal the sign of the carriers.',
        units: [
          Unit(
            id: 'phy705-t4-u1',
            title: 'Lorentz Force – The Sideways Push',
            content: r'''
# Lorentz Force – The Sideways Push

A charged particle moving in a magnetic field feels a force perpendicular to both its velocity and the field:

$$ \mathbf{F} = q\,(\mathbf{v} \times \mathbf{B}) $$

The force does no work (it is always perpendicular to velocity) but it bends the path into a circle or helix.

When both E and B are present the particle can have a steady “drift” velocity that is perpendicular to both fields. This is the basis of many sensors and of the Hall effect.
''',
            keyTakeaways: [
              'Magnetic force is q(v × B) — perpendicular to velocity.',
              'It changes direction, not speed.',
              'Combined E and B fields produce useful drift motions.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t4u1q1',
                question: 'The magnetic part of the Lorentz force does what to the speed of a charged particle?',
                options: [
                  'Increases it',
                  'Decreases it',
                  'Leaves the speed unchanged (only bends the path)',
                  'Reverses it',
                ],
                correctIndex: 2,
                explanation: 'Because F is perpendicular to v, the work done is zero and kinetic energy is constant.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t4-u2',
            title: 'The Hall Effect – Measuring Carrier Type and Density',
            content: r'''
# The Hall Effect – Measuring Carrier Type and Density

Send a current through a rectangular sample and apply a magnetic field perpendicular to the current. The Lorentz force pushes the carriers to one side until the electric field they build up (the Hall field) balances the magnetic force.

The sign of the Hall voltage tells you whether the majority carriers are electrons or holes. The size of the voltage tells you how many carriers there are.

It is one of the most important diagnostic tools in semiconductor physics.
''',
            keyTakeaways: [
              'Hall voltage polarity reveals the sign of the majority carriers.',
              'Magnitude of the Hall voltage gives carrier density.',
              'Standard laboratory method for characterising materials.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t4u2q1',
                question: 'If the Hall voltage has the opposite sign from what you expect for electrons, the majority carriers are…',
                options: [
                  'Still electrons',
                  'Holes',
                  'Neutral',
                  'Photons',
                ],
                correctIndex: 1,
                explanation: 'Opposite polarity is the classic signature of hole conduction.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. ELECTRON EMISSION PHENOMENA
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t5',
        title: 'Electron Emission Phenomena',
        summary: 'How electrons escape from a solid — photoelectric, thermionic and secondary emission.',
        units: [
          Unit(
            id: 'phy705-t5-u1',
            title: 'Photoelectric Emission – Light Kicking Electrons Out',
            content: r'''
# Photoelectric Emission – Light Kicking Electrons Out

A photon can give its entire energy hf to an electron. If that energy is greater than the work function φ (the energy needed to escape the surface), the electron can leave the metal with kinetic energy:

$$ K_{\max} = hf - \phi $$

This is the photoelectric effect. It proves light comes in quanta and is the operating principle of photodiodes and some solar cells.
''',
            keyTakeaways: [
              'Photon energy must exceed the work function for emission.',
              'Maximum kinetic energy of the electron is hf – φ.',
              'Demonstrates the quantum nature of light.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t5u1q1',
                question: 'In the photoelectric effect, increasing the intensity of the light (while keeping frequency fixed) mainly increases…',
                options: [
                  'The maximum kinetic energy of each electron',
                  'The number of electrons emitted per second',
                  'The work function',
                  'The frequency of the light',
                ],
                correctIndex: 1,
                explanation: 'More photons → more electrons, but each photon still has the same energy hf.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t5-u2',
            title: 'Thermionic & Secondary Emission',
            content: r'''
# Thermionic & Secondary Emission

**Thermionic emission**  
Heat a metal so that a few electrons in the high-energy tail of the distribution have enough energy to overcome the work function. They “boil off”. This is how the cathodes of old vacuum tubes and some electron guns work.

**Secondary emission**  
A fast electron hitting a surface can knock out additional electrons. The ratio of emitted to incident electrons is the secondary-emission coefficient. Used in photomultiplier tubes and some detectors.
''',
            keyTakeaways: [
              'Thermionic = thermal energy frees electrons.',
              'Secondary = energetic incident electrons knock out more electrons.',
              'Both are practical sources of free electrons in devices.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t5u2q1',
                question: 'Thermionic emission is caused by…',
                options: [
                  'Photons',
                  'High temperature giving electrons enough energy to escape',
                  'Magnetic fields',
                  'Mechanical vibration',
                ],
                correctIndex: 1,
                explanation: 'Heating populates high-energy states that can overcome the work function.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. BASIC ELECTRONIC DEVICES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t6',
        title: 'Fabrication & Basic Devices – Diode, BJT, FET, Solar Cell',
        summary: 'How the physics is turned into the components that actually process signals and convert light into electricity.',
        units: [
          Unit(
            id: 'phy705-t6-u1',
            title: 'The Diode and the Bipolar Junction Transistor (BJT)',
            content: r'''
# The Diode and the BJT

**Diode**  
A single p-n junction. Conducts strongly in forward bias, almost not at all in reverse bias. Used for rectification, protection, and signal demodulation.

**BJT**  
Two junctions back-to-back (n-p-n or p-n-p). A small current into the base controls a much larger current between collector and emitter — current amplification. The classic workhorse of analogue electronics for decades.
''',
            keyTakeaways: [
              'Diode = one p-n junction → one-way current.',
              'BJT = two junctions → current amplification.',
              'Small base current controls large collector current.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t6u1q1',
                question: 'The essential amplifying action of a BJT relies on…',
                options: [
                  'A single p-n junction',
                  'A small base current controlling a larger collector–emitter current',
                  'Only the photoelectric effect',
                  'Heating the device',
                ],
                correctIndex: 1,
                explanation: 'That is the definition of the transistor’s current gain.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t6-u2',
            title: 'Field-Effect Transistor (FET) and Solar Cells',
            content: r'''
# Field-Effect Transistor (FET) and Solar Cells

**FET**  
A voltage applied to a gate electrode controls the conductivity of a channel between source and drain. Almost no gate current is needed — voltage-controlled amplification. MOSFETs are the foundation of all modern digital electronics.

**Solar cell**  
A large-area p-n junction. Light creates electron-hole pairs. The built-in field of the junction separates them, producing a usable current and voltage. Efficiency depends on band gap, absorption, and recombination losses.
''',
            keyTakeaways: [
              'FET = voltage on the gate controls channel current.',
              'MOSFETs dominate digital circuits.',
              'Solar cell = illuminated p-n junction that separates photo-generated carriers.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t6u2q1',
                question: 'In a solar cell the built-in electric field of the p-n junction mainly serves to…',
                options: [
                  'Heat the device',
                  'Separate the photo-generated electrons and holes',
                  'Increase the band gap',
                  'Produce magnetic fields',
                ],
                correctIndex: 1,
                explanation: 'Separation of the carriers is what creates the external current.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. THIN FILMS & IC MANUFACTURE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy705-t7',
        title: 'Thin Films and Integrated Circuit Manufacture',
        summary: 'How millions of devices are built on a single chip — the technology that made modern electronics possible.',
        units: [
          Unit(
            id: 'phy705-t7-u1',
            title: 'Thin Films – Building Layer by Layer',
            content: r'''
# Thin Films – Building Layer by Layer

Modern devices are made by depositing and patterning extremely thin layers of metals, insulators and semiconductors. Techniques include:

- Evaporation and sputtering (physical vapour deposition)
- Chemical vapour deposition (CVD)
- Epitaxial growth (for high-quality crystalline layers)

Thicknesses are often only tens or hundreds of nanometres. Controlling purity, uniformity and interfaces is the art of thin-film technology.
''',
            keyTakeaways: [
              'Devices are built from stacked thin layers.',
              'Multiple deposition methods exist for different materials.',
              'Nanometre-scale control is essential.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t7u1q1',
                question: 'In integrated-circuit manufacture, active layers are typically how thick?',
                options: [
                  'Several millimetres',
                  'Tens to hundreds of nanometres',
                  'Several centimetres',
                  'Invisible to all instruments',
                ],
                correctIndex: 1,
                explanation: 'Modern thin films are nanoscale.',
              ),
            ],
          ),
          Unit(
            id: 'phy705-t7-u2',
            title: 'The IC Process – From Wafer to Chip',
            content: r'''
# The IC Process – From Wafer to Chip

A simplified sequence:

1. Start with a pure silicon wafer.
2. Oxidise or deposit insulating layers.
3. Pattern with photolithography (light + photoresist).
4. Etch or implant dopants to create n and p regions.
5. Deposit metal interconnects.
6. Repeat many times to build complex circuits.
7. Dice the wafer into individual chips and package them.

The same basic physics you have learned — doping, p-n junctions, MOS structures — is repeated millions of times on every chip.
''',
            keyTakeaways: [
              'Photolithography defines the patterns.',
              'Doping, oxidation, deposition and etching are the core steps.',
              'All of the solid-state physics you studied is used at industrial scale.',
            ],
            quiz: [
              QuizQuestion(
                id: '705t7u2q1',
                question: 'The step that transfers the circuit pattern onto the wafer is called…',
                options: [
                  'Sputtering',
                  'Photolithography',
                  'Thermionic emission',
                  'Hall measurement',
                ],
                correctIndex: 1,
                explanation: 'Photolithography uses light and photoresist to define the geometry.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
