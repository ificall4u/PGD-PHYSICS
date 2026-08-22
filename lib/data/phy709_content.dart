import 'package:pgd_physics/models/course.dart';

/// PHY 709 — Electronic Devices and Fabrication
/// Structure from content_prompts/PHY709 (placeholder lesson bodies only).
Course buildPhy709() {
  return Course(
    id: 'phy-709',
    code: 'PHY 709',
    title: 'Electronics Devices Design and Fabrication',
    description: 'Micro-circuits, doping and fabrication of junctions, LEDs and transistors.',
    semester: 'First Semester',
    units: 3,
    icon: '🏭',
    colorHint: ColorHint.green,
    modules: [
            Module(
        id: 'phy709-m1',
        title: 'Silicon Substrates & Wafer Preparation',
        summary:
            'Sand to electronic-grade silicon, Czochralski growth, wafer slice and polish, cleanrooms.',
        units: [
          Unit(
            id: 'phy709-m1-u1',
            title: 'From sand to pure silicon',
            content: r'''
## Learning goal

Outline how silica (sand / quartz) is refined into ultra-pure electronic-grade silicon.

## Starting point

Ordinary sand and quartz are largely SiO₂. Metallurgical processes reduce oxide to crude silicon; further chemical purification (historically involving chlorosilanes and distillation) produces **electronic-grade silicon (EGS)** with impurity levels measured in parts per billion — often quoted around “nine nines” purity class for the industry story.

## Why so pure?

Even tiny impurity fractions act as uncontrolled dopants or defect centres. Device thresholds and leakage demand starting material far cleaner than structural or solar-grade silicon.

## Check yourself

Why would uncontrolled boron or phosphorus at ppm levels be a problem in a wafer meant for precise CMOS doping later?
''',
            keyTakeaways: [
              'Silicon begins as SiO₂ (sand/quartz) and is chemically refined.',
              'Electronic-grade silicon is extremely pure.',
              'Trace impurities spoil controlled semiconductor behaviour.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m1-u1-q1',
                question: 'Electronic-grade silicon is purified to',
                options: [
                  'Roughly the purity of window glass only',
                  'Extremely high purity so uncontrolled dopants are negligible',
                  'Contain as much metal as possible',
                  'Be mostly carbon',
                ],
                correctIndex: 1,
                explanation: 'Device control requires ultra-low background impurities.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m1-u2',
            title: 'Single-crystal growth (Czochralski method)',
            content: r'''
## Learning goal

Describe Czochralski (CZ) pulling of a single-crystal silicon ingot from the melt.

## Honey-dipper picture

A small **seed crystal** of known orientation is dipped into molten silicon and slowly pulled upward while rotating. Solid silicon freezes onto the seed in the same crystal orientation, growing a large cylindrical **boule** (ingot) of single-crystal silicon.

## Why single crystal?

A continuous lattice without grain boundaries gives uniform electrical properties and predictable carrier transport. Polycrystalline material has grain boundaries that scatter carriers and spoil fine devices.

## Check yourself

What role does the seed crystal play besides “starting the freeze”?
''',
            keyTakeaways: [
              'CZ: seed pulled from melt grows a single-crystal boule.',
              'Orientation is inherited from the seed.',
              'Single crystal is the standard substrate for high-performance ICs.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m1-u2-q1',
                question: 'In the Czochralski process, a seed crystal is used to',
                options: [
                  'Stir the melt randomly only',
                  'Template the orientation of a growing single-crystal ingot',
                  'Cut the wafer into chips',
                  'Deposit metal interconnects',
                ],
                correctIndex: 1,
                explanation: 'The boule grows as an extension of the seed’s crystal lattice.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m1-u3',
            title: 'Wafer slicing and polishing',
            content: r'''
## Learning goal

Explain how the ingot becomes mirror-smooth wafers ready for lithography.

## Slicing

Multi-wire saws cut the boule into thin discs — **wafers**. Thickness and diameter are standardized for process tools (e.g. 200 mm, 300 mm class fabs).

## Lapping and polishing

Saw damage is removed by grinding/lapping and chemical–mechanical polishing (**CMP**). The front surface becomes optically flat and mirror-like so photolithography can focus microscopic patterns uniformly across the wafer.

## Flats / notches

Edge features mark crystal orientation and doping type for equipment alignment.

## Check yourself

Why does lithography care about wafer flatness at the nanometre-to-micrometre scale?
''',
            keyTakeaways: [
              'Ingot → wafers by precision wire sawing.',
              'CMP produces the mirror finish needed for lithography.',
              'Orientation marks guide processing tools.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m1-u3-q1',
                question: 'Chemical-mechanical planarization (CMP) is used to',
                options: [
                  'Dope the wafer with metals randomly',
                  'Polish wafers to a flat, smooth surface for patterning',
                  'Grow the crystal from melt',
                  'Package finished chips only',
                ],
                correctIndex: 1,
                explanation: 'CMP prepares the surface topography for subsequent layers and lithography.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m1-u4',
            title: 'Cleanroom standards',
            content: r'''
## Learning goal

Explain why semiconductor fabrication needs air far cleaner than ordinary rooms or even typical surgery theatres.

## Particle killer

A dust particle can be larger than a transistor gate. One speck on a critical layer can short wires or block a contact — killing die yield.

## Cleanroom class

Fab cleanrooms control particles per cubic metre (or historically per cubic foot) with filtration, gowning, airflow, and materials discipline. They are orders of magnitude cleaner than normal indoor air.

## People and process

Humans are major particle sources; protocols (suits, air showers, tool automation) protect the wafers. Chemicals and water are also ultra-purified.

## Check yourself

Why can a process that is chemically perfect still fail if the room air is ordinary office air?
''',
            keyTakeaways: [
              'Particles comparable to feature size destroy yield.',
              'Cleanrooms filter and control contamination aggressively.',
              'People, tools, and fluids are all managed as contamination sources.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m1-u4-q1',
                question: 'Semiconductor cleanrooms exist mainly because',
                options: [
                  'Chips prefer warm air only',
                  'Microscopic particles can ruin nanoscale circuit patterns',
                  'Light cannot enter ordinary rooms',
                  'Silicon must stay wet always',
                ],
                correctIndex: 1,
                explanation: 'Contamination at the scale of features kills devices and yield.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy709-m2',
        title: 'Thermal Oxidation & Insulating Films',
        summary:
            'SiO2 as insulator, dry/wet thermal oxidation, Deal–Grove intuition, CVD for other films.',
        units: [
          Unit(
            id: 'phy709-m2-u1',
            title: 'Silicon dioxide (SiO2) as a physical barrier',
            content: r'''
## Learning goal

Explain why SiO₂ is the classic insulator and “protective skin” for silicon technology.

## Natural partner of silicon

Silicon reacts with oxygen to form silicon dioxide — chemically analogous to a controlled, useful “rust.” SiO₂ is an excellent electrical insulator, bonds well to Si, and can be grown with high quality at the Si/SiO₂ interface.

## Roles in chips

Gate dielectrics (historically), field isolation, implant masks, and protective passivation all used SiO₂ extensively. Even when high-k materials replace pure SiO₂ at the gate, oxide-based interfaces remain central.

## Check yourself

Why is a high-quality insulator between gate and channel essential for a MOSFET?
''',
            keyTakeaways: [
              'SiO₂ is a stable, excellent insulator on silicon.',
              'It serves isolation, masking, and (historically) gate dielectric roles.',
              'Interface quality with Si is a key technology advantage.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m2-u1-q1',
                question: 'Silicon dioxide in IC technology is primarily valued as',
                options: [
                  'A metallic conductor',
                  'An electrical insulator and process-friendly film on Si',
                  'A doping gas',
                  'A packaging plastic only',
                ],
                correctIndex: 1,
                explanation: 'SiO₂ isolates and protects while integrating cleanly with silicon.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m2-u2',
            title: 'Thermal oxidation (“baking silicon”)',
            content: r'''
## Learning goal

Contrast dry and wet thermal oxidation for growing SiO₂ from the silicon wafer itself.

## Dry oxidation

Silicon + dry O₂ gas at high temperature grows dense, high-quality oxide relatively slowly. Preferred historically for thin **gate oxides** where integrity and interface quality matter most.

## Wet oxidation

Silicon + steam (H₂O) grows oxide much faster. Useful for thicker field oxides and isolation layers where speed and thickness matter more than ultimate thin-film perfection.

## Consumes silicon

Oxidation converts surface silicon into oxide — the wafer surface is partly consumed as the film grows (important for dimensional control).

## Check yourself

Which process would you choose for a thick isolation oxide if process time is limited: dry or wet?
''',
            keyTakeaways: [
              'Dry O₂: slower, denser, high-quality thin oxides.',
              'Wet steam: faster, thicker isolation oxides.',
              'Thermal oxide grows by consuming surface silicon.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m2-u2-q1',
                question: 'Wet thermal oxidation compared with dry typically',
                options: [
                  'Is always slower',
                  'Grows oxide faster — useful for thick layers',
                  'Cannot form SiO₂',
                  'Uses only nitrogen gas',
                ],
                correctIndex: 1,
                explanation: 'Steam oxidation rates are much higher than dry O₂.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m2-u3',
            title: 'Deal–Grove model intuition',
            content: r'''
## Learning goal

Picture oxide growth as oxidant diffusing through existing oxide to react at the Si interface — the Deal–Grove story.

## Snow-cover analogy

Early snow falls on bare ground quickly. As the pack thickens, new snow must “work through” the existing layer — growth at the ground slows. Similarly, oxidant species must diffuse through already-grown SiO₂ to reach the Si surface and react.

## Two regimes

- Thin oxide / early times: reaction at the interface can limit rate  
- Thick oxide: diffusion through the layer dominates — growth slows as thickness increases  

Deal–Grove equations formalize this; the intuition is enough to predict why thick oxides take disproportionately longer.

## Check yourself

Why does doubling the desired oxide thickness more than double the oxidation time in the thick-film regime?
''',
            keyTakeaways: [
              'Oxidant diffuses through existing oxide to the Si interface.',
              'Thick films become diffusion-limited and grow more slowly.',
              'Deal–Grove captures reaction + diffusion limits.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m2-u3-q1',
                question: 'In the Deal–Grove picture for thick oxides, growth is limited mainly by',
                options: [
                  'Light wavelength',
                  'Diffusion of oxidant through the existing oxide',
                  'Magnetic fields',
                  'Packaging tape',
                ],
                correctIndex: 1,
                explanation: 'Oxidant must diffuse farther as the film thickens.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m2-u4',
            title: 'Chemical vapour deposition (CVD)',
            content: r'''
## Learning goal

Explain when CVD is used instead of thermal oxidation to deposit films such as polysilicon or silicon nitride.

## Not everything can be thermally grown

Thermal oxidation only grows SiO₂ from silicon. Layers like polysilicon gates, silicon nitride, and many metals need **deposition** onto the wafer.

## CVD idea

Precursor gases flow into a reactor and react at the heated wafer surface, leaving a solid film. Temperature, pressure, and chemistry control thickness, composition, and how well the film covers steps (conformality).

## Complement to oxidation

Oxidation for high-quality SiO₂ from the substrate; CVD for additional engineered layers in the full process flow.

## Check yourself

Why can you not “oxidize” a pure nitride film into existence the same way you grow SiO₂ from Si?
''',
            keyTakeaways: [
              'CVD deposits films from gas-phase chemistry on the wafer.',
              'Used for poly-Si, nitride, and many non-thermal-oxide layers.',
              'Complements thermal oxidation in full process flows.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m2-u4-q1',
                question: 'CVD is chosen when',
                options: [
                  'Only thermal SiO₂ from the substrate is required always',
                  'A film must be deposited that cannot be grown by oxidizing the silicon wafer alone',
                  'No solid film is wanted',
                  'Lithography is forbidden',
                ],
                correctIndex: 1,
                explanation: 'Many critical films are deposited, not thermally grown from Si.',
              ),
            ],
          ),
        ],
      ),
      skeletonModule(
        id: 'phy709-m3',
        title: 'Photolithography & Pattern Transfer',
        summary: 'Photolithography & Pattern Transfer',
        units: [
          skeletonUnit(id: 'phy709-m3-u1', title: 'The Stencil-Painting Analogy'),
          skeletonUnit(id: 'phy709-m3-u2', title: 'Photoresist Chemistry'),
          skeletonUnit(id: 'phy709-m3-u3', title: 'The Lithography Pipeline'),
          skeletonUnit(id: 'phy709-m3-u4', title: 'Optical Resolution Limits'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m4',
        title: 'Semiconductor Doping (Diffusion & Ion Implantation)',
        summary: 'Semiconductor Doping (Diffusion & Ion Implantation)',
        units: [
          skeletonUnit(id: 'phy709-m4-u1', title: 'Purpose of Doping'),
          skeletonUnit(id: 'phy709-m4-u2', title: 'Thermal Diffusion ("Soaking in Dye")'),
          skeletonUnit(id: 'phy709-m4-u3', title: 'Ion Implantation ("Firehosing Impurity Atoms")'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m5',
        title: 'Etching Processes (Subtractive Manufacturing)',
        summary: 'Etching Processes (Subtractive Manufacturing)',
        units: [
          skeletonUnit(id: 'phy709-m5-u1', title: 'What is Etching?'),
          skeletonUnit(id: 'phy709-m5-u2', title: 'Wet Chemical Etching'),
          skeletonUnit(id: 'phy709-m5-u3', title: 'Dry Plasma Etching (Reactive Ion Etching - RIE)'),
          skeletonUnit(id: 'phy709-m5-u4', title: 'Selective Etching'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m6',
        title: 'Physical Fabrication of Diodes and Light Emitting Diodes (LEDs)',
        summary: 'Physical Fabrication of Diodes and Light Emitting Diodes (LEDs)',
        units: [
          skeletonUnit(id: 'phy709-m6-u1', title: 'Step-by-Step PN Junction Diode Fabrication'),
          skeletonUnit(id: 'phy709-m6-u2', title: 'LED Fabrication'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m7',
        title: 'Transistor Physical Manufacturing (MOSFET & BJT)',
        summary: 'Transistor Physical Manufacturing (MOSFET & BJT)',
        units: [
          skeletonUnit(id: 'phy709-m7-u1', title: 'MOSFET Layer-by-Layer Fabrication'),
          skeletonUnit(id: 'phy709-m7-u2', title: 'BJT Layer-by-Layer Fabrication'),
          skeletonUnit(id: 'phy709-m7-u3', title: 'CMOS Fabrication Process (N-Well Process)'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m8',
        title: 'Interconnect Metallization, Wafer Dicing, and Chip Packaging',
        summary: 'Interconnect Metallization, Wafer Dicing, and Chip Packaging',
        units: [
          skeletonUnit(id: 'phy709-m8-u1', title: 'Metallization & Interconnects'),
          skeletonUnit(id: 'phy709-m8-u2', title: 'Chemical Mechanical Planarization (CMP)'),
          skeletonUnit(id: 'phy709-m8-u3', title: 'Wafer Dicing & Inspection'),
          skeletonUnit(id: 'phy709-m8-u4', title: 'Packaging & Wire Bonding'),
        ],
      ),
    ],
  );
}
