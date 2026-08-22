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
      skeletonModule(
        id: 'phy709-m2',
        title: 'Thermal Oxidation & Insulating Films',
        summary: 'Thermal Oxidation & Insulating Films',
        units: [
          skeletonUnit(id: 'phy709-m2-u1', title: 'Silicon Dioxide (SiO2) as a Physical Barrier'),
          skeletonUnit(id: 'phy709-m2-u2', title: 'Thermal Oxidation ("Baking Silicon")'),
          skeletonUnit(id: 'phy709-m2-u3', title: 'Deal-Grove Model Intuition'),
          skeletonUnit(id: 'phy709-m2-u4', title: 'Chemical Vapor Deposition (CVD)'),
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
