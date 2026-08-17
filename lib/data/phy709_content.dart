import 'package:pgd_physics/models/course.dart';

/// Complete PHY 709 – Electronics Devices and Fabrication
/// Micro-chunked, physical-intuition first, stencil & kitchen analogies for Tochi
Course buildPhy709() {
  return Course(
    id: 'phy709',
    code: 'PHY 709',
    title: 'Electronics Devices and Fabrication',
    description:
        'How real microchips are made — from pure silicon to doped regions, lithography, PN junctions, LEDs, transistors and the complete IC process.',
    semester: 'First Semester',
    units: 3,
    icon: '🏭',
    colorHint: ColorHint.pink,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. WHY FABRICATION MATTERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t1',
        title: 'Why We Fabricate – From Idea to Physical Device',
        summary: 'Turning a circuit diagram into billions of real transistors on a tiny piece of silicon.',
        units: [
          Unit(
            id: 'phy709-t1-u1',
            title: 'The Goal of Microcircuit Fabrication',
            content: r'''
# The Goal of Microcircuit Fabrication

Hey Tochi…

A circuit diagram is only a plan. Fabrication is the set of physical and chemical steps that turn that plan into real devices you can hold (or that sit inside your phone).

We start with an almost perfect crystal of silicon and, layer by layer, add, remove, or change material until the transistors, diodes, wires and insulators are exactly where the designer intended.

The entire process is a carefully choreographed sequence of cleaning, growing, patterning, doping and connecting — repeated many times.
''',
            keyTakeaways: [
              'Fabrication turns a design into a physical object.',
              'We build by adding, removing or modifying thin layers on silicon.',
              'The same sequence is repeated to create complex circuits.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t1u1q1',
                question: 'The main purpose of microcircuit fabrication is to…',
                options: [
                  'Write equations about transistors',
                  'Turn a circuit design into real physical devices on silicon',
                  'Only test finished chips',
                  'Grow larger crystals for jewellery',
                ],
                correctIndex: 1,
                explanation: 'Fabrication is the manufacturing process that realises the design.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. THE SILICON STARTING POINT
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t2',
        title: 'Starting Material – Pure Silicon Wafers',
        summary: 'Why silicon, how it is purified, and what a wafer actually is.',
        units: [
          Unit(
            id: 'phy709-t2-u1',
            title: 'Why Silicon?',
            content: r'''
# Why Silicon?

Silicon is the second most abundant element in the Earth’s crust (sand is mostly SiO₂). It has four valence electrons, forms a beautiful diamond-like crystal, and — crucially — grows a stable, high-quality oxide (SiO₂) that is an excellent insulator.

That native oxide is the reason silicon won the technology race: we can grow a near-perfect insulator simply by heating the wafer in oxygen.
''',
            keyTakeaways: [
              'Silicon is abundant and forms a stable crystal.',
              'Its oxide (SiO₂) is an outstanding insulator.',
              'The combination made modern microelectronics possible.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t2u1q1',
                question: 'One decisive advantage of silicon is that it…',
                options: [
                  'Is a perfect conductor',
                  'Naturally grows a high-quality insulating oxide',
                  'Never needs doping',
                  'Is a liquid at room temperature',
                ],
                correctIndex: 1,
                explanation: 'The stable SiO₂ layer is unique among semiconductors and enables MOSFET technology.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t2-u2',
            title: 'From Sand to Wafer',
            content: r'''
# From Sand to Wafer

1. Purify silicon to electronic grade (impurities measured in parts per billion).  
2. Melt it and grow a single-crystal ingot by the Czochralski method (a seed crystal is slowly pulled from the melt).  
3. Saw the cylindrical ingot into thin discs — **wafers**.  
4. Polish one side to a mirror finish.

A modern wafer is 300 mm in diameter and only a fraction of a millimetre thick. Hundreds or thousands of chips will later be cut from each wafer.
''',
            keyTakeaways: [
              'Extreme purity is required.',
              'Czochralski growth produces a single crystal.',
              'Wafers are thin, polished discs cut from the ingot.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t2u2q1',
                question: 'The thin polished discs used as the starting material for chips are called…',
                options: ['Ingots', 'Wafers', 'Dies', 'Masks'],
                correctIndex: 1,
                explanation: 'Wafers are the circular slices that become the substrate for fabrication.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. DOPING
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t3',
        title: 'Doping – Adding Controlled Impurities',
        summary: 'How we turn pure silicon into n-type or p-type material exactly where we want it.',
        units: [
          Unit(
            id: 'phy709-t3-u1',
            title: 'What Doping Does',
            content: r'''
# What Doping Does

Pure silicon has very few free carriers. By deliberately adding a tiny amount of another element we can create either extra electrons (n-type) or extra holes (p-type).

- Group-V atoms (phosphorus, arsenic) donate an extra electron → **n-type**  
- Group-III atoms (boron) accept an electron and leave a hole → **p-type**

The concentration is usually only one impurity atom per million (or even billion) silicon atoms, yet that is enough to change the conductivity by many orders of magnitude.
''',
            keyTakeaways: [
              'Doping adds controlled impurities to create free electrons or holes.',
              'Group V → n-type, Group III → p-type.',
              'Very small concentrations produce large electrical effects.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t3u1q1',
                question: 'Adding phosphorus (Group V) to silicon mainly creates…',
                options: [
                  'Extra holes',
                  'Extra free electrons (n-type material)',
                  'An insulator',
                  'A metal',
                ],
                correctIndex: 1,
                explanation: 'Phosphorus has five valence electrons; the fifth becomes a free carrier.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t3-u2',
            title: 'How Doping is Done – Diffusion and Ion Implantation',
            content: r'''
# How Doping is Done – Diffusion and Ion Implantation

**Diffusion**  
Heat the wafer in an atmosphere containing the dopant. At high temperature the impurity atoms slowly wander into the silicon, just as perfume molecules diffuse through air. Depth and concentration are controlled by time and temperature.

**Ion implantation**  
Accelerate dopant ions with high voltage and fire them into the wafer like microscopic bullets. Dose and depth are set by beam current and energy. A later annealing step repairs the crystal damage and activates the impurities.

Ion implantation is more precise and is the dominant method in modern processes.
''',
            keyTakeaways: [
              'Diffusion = heat-driven wandering of impurity atoms.',
              'Ion implantation = high-energy ions shot into the wafer.',
              'Implantation gives better control of dose and depth.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t3u2q1',
                question: 'The more precise modern doping method is…',
                options: [
                  'Simple diffusion only',
                  'Ion implantation',
                  'Painting the dopant on',
                  'Mechanical drilling',
                ],
                correctIndex: 1,
                explanation: 'Ion implantation allows independent control of dose and depth.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. LITHOGRAPHY – THE STENCIL STEP
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t4',
        title: 'Photolithography – The Stencil that Defines Patterns',
        summary: 'How we draw the microscopic patterns that become transistors and wires.',
        units: [
          Unit(
            id: 'phy709-t4-u1',
            title: 'Photoresist and the Basic Idea',
            content: r'''
# Photoresist and the Basic Idea

Think of stencil painting. You cover the surface with a light-sensitive polymer called **photoresist**. A mask (a glass plate with the desired pattern) is held above the wafer and ultraviolet light is shone through it.

Where light hits, the photoresist changes chemically. In a developer bath the exposed (or unexposed, depending on the type) resist washes away, leaving a polymer stencil on the wafer.

That stencil protects some areas while the unprotected areas can be etched, implanted or oxidised.
''',
            keyTakeaways: [
              'Photoresist is a light-sensitive polymer film.',
              'A mask + UV light transfers the pattern.',
              'The developed resist acts as a stencil for later steps.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t4u1q1',
                question: 'In photolithography the photoresist mainly serves as…',
                options: [
                  'A conductor',
                  'A temporary stencil that protects selected areas',
                  'The final metal wiring',
                  'A heat sink',
                ],
                correctIndex: 1,
                explanation: 'It is the patterned protective layer for subsequent processing.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t4-u2',
            title: 'Exposure, Development and Alignment',
            content: r'''
# Exposure, Development and Alignment

Modern steppers or scanners project a reduced image of the mask onto one small area of the wafer at a time, then step to the next area. Alignment marks ensure each new layer sits exactly on top of the previous ones — often to within a few nanometres.

After exposure the wafer is developed, hard-baked, and is ready for the next physical step (etch, implant, etc.). Once that step is finished the remaining resist is stripped away and the cycle repeats for the next layer.
''',
            keyTakeaways: [
              'Steppers project and step across the wafer.',
              'Precise alignment of successive layers is critical.',
              'Resist is temporary — it is removed after each patterning step.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t4u2q1',
                question: 'Why is precise alignment between successive lithography steps essential?',
                options: [
                  'To make the wafer look prettier',
                  'So that transistors, contacts and wires land on top of one another correctly',
                  'To increase the melting point of silicon',
                  'It is not important',
                ],
                correctIndex: 1,
                explanation: 'Misalignment would disconnect or short the microscopic devices.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. ETCHING, OXIDATION & THIN FILMS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t5',
        title: 'Etching, Oxidation and Thin-Film Deposition',
        summary: 'Removing material, growing oxide, and adding new layers.',
        units: [
          Unit(
            id: 'phy709-t5-u1',
            title: 'Etching – Cutting Away the Unwanted Parts',
            content: r'''
# Etching – Cutting Away the Unwanted Parts

After the photoresist stencil is in place we remove material from the unprotected regions.

- **Wet etching** uses liquid chemicals (like a very precise acid bath).  
- **Dry etching** (plasma or reactive-ion etching) uses energetic ions and reactive gases. It can cut nearly vertical walls and is preferred for fine features.

The resist protects the areas we want to keep; everything else is dissolved or sputtered away.
''',
            keyTakeaways: [
              'Etching removes material where the resist is absent.',
              'Wet etching is isotropic; dry etching can be highly anisotropic.',
              'Critical for defining the physical shape of devices.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t5u1q1',
                question: 'The purpose of etching in the fabrication sequence is to…',
                options: [
                  'Add dopant atoms',
                  'Remove material from regions not protected by photoresist',
                  'Grow oxide',
                  'Polish the wafer',
                ],
                correctIndex: 1,
                explanation: 'Etching transfers the resist pattern into the underlying layer.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t5-u2',
            title: 'Oxidation and Deposition – Adding Layers',
            content: r'''
# Oxidation and Deposition – Adding Layers

**Thermal oxidation**  
Simply heat the silicon wafer in oxygen or steam. A high-quality SiO₂ layer grows. Used for gate oxides and isolation.

**Deposition**  
Add completely new materials:

- Chemical vapour deposition (CVD) – gases react on the surface to form a solid film  
- Physical vapour deposition / sputtering – atoms are knocked off a target and coat the wafer  
- Evaporation – metal is melted and condenses on the wafer

These steps build the insulating, semiconducting and metallic layers that make up the finished circuit.
''',
            keyTakeaways: [
              'Thermal oxidation grows SiO₂ from the silicon itself.',
              'CVD, sputtering and evaporation add new films.',
              'Multiple layers are stacked to form the complete device.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t5u2q1',
                question: 'Thermal oxidation produces which important material?',
                options: [
                  'Pure silicon',
                  'Silicon dioxide (SiO₂)',
                  'Aluminium metal',
                  'Photoresist',
                ],
                correctIndex: 1,
                explanation: 'Heating silicon in oxygen grows a native oxide layer.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. BUILDING SIMPLE DEVICES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t6',
        title: 'Fabricating Simple Devices – PN Junction, LED, Transistor',
        summary: 'Putting the process steps together to make real working devices.',
        units: [
          Unit(
            id: 'phy709-t6-u1',
            title: 'Making a PN Junction Diode',
            content: r'''
# Making a PN Junction Diode

1. Start with an n-type wafer (or an n-type epitaxial layer).  
2. Grow or deposit an oxide, pattern it, and open a window.  
3. Implant or diffuse boron through the window to create a p-type region.  
4. Remove the oxide, deposit metal contacts on the p-region and on the back of the wafer.  
5. Alloy the contacts so they make good electrical connection.

The boundary between the p-type and n-type regions is the PN junction. Exactly the same basic sequence, repeated and refined, produces every diode on a modern chip.
''',
            keyTakeaways: [
              'A PN junction is formed by doping a region of the opposite type.',
              'Lithography defines where the doping occurs.',
              'Metal contacts complete the simple diode.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t6u1q1',
                question: 'In the simple process above, the PN junction is created by…',
                options: [
                  'Depositing metal',
                  'Introducing the opposite dopant into a selected region',
                  'Only growing oxide',
                  'Sawing the wafer',
                ],
                correctIndex: 1,
                explanation: 'The metallurgical junction appears where the dopant type changes.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t6-u2',
            title: 'LEDs and the Bipolar Transistor',
            content: r'''
# LEDs and the Bipolar Transistor

**LED**  
A PN junction made in a direct-band-gap semiconductor (often GaAs, GaN or related compounds). When forward-biased, electrons and holes recombine and emit light. The wavelength (colour) is set by the band-gap energy.

**BJT**  
Two junctions back-to-back. Fabrication involves sequential doping steps to create the emitter, base and collector regions with the correct doping levels and thicknesses. Alignment between the successive masks is critical so that the base is thin and properly contacted.
''',
            keyTakeaways: [
              'LED = forward-biased junction in a direct-gap material → light.',
              'BJT requires three carefully doped and aligned regions.',
              'The same process tools are used; only the sequence and materials change.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t6u2q1',
                question: 'An LED emits light because…',
                options: [
                  'It gets hot',
                  'Electrons and holes recombine across a direct band gap and release photons',
                  'It contains a tiny filament',
                  'Magnetic fields are involved',
                ],
                correctIndex: 1,
                explanation: 'Radiative recombination in a direct-gap semiconductor produces the photons.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t6-u3',
            title: 'The MOSFET – The Device that Runs the World',
            content: r'''
# The MOSFET – The Device that Runs the World

A MOSFET is built by:

1. Growing a thin, high-quality gate oxide.  
2. Depositing and patterning a gate electrode (polycrystalline silicon or metal).  
3. Using the gate itself as a mask to implant the source and drain regions (self-alignment).  
4. Adding insulating layers and metal contacts.

Because the gate oxide is only a few nanometres thick and the channel length is measured in tens of nanometres, billions of these transistors fit on a single chip. That is the foundation of all modern digital electronics.
''',
            keyTakeaways: [
              'Gate oxide + gate electrode + self-aligned source/drain.',
              'Self-alignment is a key process invention.',
              'MOSFETs are the dominant device in today’s ICs.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t6u3q1',
                question: 'In a MOSFET process the source and drain implant is often done using the gate as a mask. This is called…',
                options: [
                  'Wet etching',
                  'Self-alignment',
                  'Czochralski growth',
                  'Secondary emission',
                ],
                correctIndex: 1,
                explanation: 'The gate itself defines the edges of the source and drain, guaranteeing perfect alignment.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. INTEGRATED CIRCUIT TECHNOLOGY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy709-t7',
        title: 'Integrated Circuit Technology – Putting It All Together',
        summary: 'How the individual steps become a complete manufacturing flow for complex chips.',
        units: [
          Unit(
            id: 'phy709-t7-u1',
            title: 'The Process Flow – A Recipe with Hundreds of Steps',
            content: r'''
# The Process Flow – A Recipe with Hundreds of Steps

A modern CMOS process can contain 500–1000 individual steps. The high-level sequence is:

1. Isolation (defining where transistors will sit)  
2. Well formation (doping the background regions)  
3. Gate-oxide growth and gate patterning  
4. Source/drain implantation and annealing  
5. Contact holes and first metal layer  
6. Many levels of metal interconnect with insulating layers in between  
7. Final passivation and bond-pad openings

Each lithography step needs its own mask. The entire flow is executed in ultra-clean rooms because a single dust particle can destroy a transistor.
''',
            keyTakeaways: [
              'Hundreds of sequential steps build a complete chip.',
              'Cleanliness is extreme — particles are the enemy.',
              'Multiple metal layers connect the billions of transistors.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t7u1q1',
                question: 'Modern IC fabrication takes place in clean rooms mainly to…',
                options: [
                  'Keep the workers comfortable',
                  'Prevent tiny particles from ruining microscopic devices',
                  'Increase the temperature',
                  'Reduce the cost of electricity',
                ],
                correctIndex: 1,
                explanation: 'A single particle can short or disconnect a nanometre-scale feature.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-t7-u2',
            title: 'From Wafer to Packaged Chip',
            content: r'''
# From Wafer to Packaged Chip

After the last fabrication step the wafer is tested (wafer sort). Good chips are cut out (dicing), attached to a package, bonded with tiny gold or copper wires, and sealed. Final testing verifies that every function works.

Only after the chip is packaged and tested does it become the component that is soldered onto a circuit board or placed inside a phone.
''',
            keyTakeaways: [
              'Wafer-level testing identifies good dies.',
              'Dicing, packaging and wire-bonding turn the die into a usable component.',
              'Final test guarantees functionality before shipping.',
            ],
            quiz: [
              QuizQuestion(
                id: '709t7u2q1',
                question: 'The step that separates individual chips from the finished wafer is called…',
                options: [
                  'Oxidation',
                  'Dicing',
                  'Implantation',
                  'Photolithography',
                ],
                correctIndex: 1,
                explanation: 'Dicing saws or lasers cut the wafer into separate dies.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
