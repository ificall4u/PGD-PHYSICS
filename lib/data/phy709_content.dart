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
            Module(
        id: 'phy709-m3',
        title: 'Photolithography & Pattern Transfer',
        summary:
            'Stencil analogy, positive/negative resist, lithography process steps, optical resolution limits.',
        units: [
          Unit(
            id: 'phy709-m3-u1',
            title: 'The stencil-painting analogy',
            content: r'''
## Learning goal

Picture photolithography as printing a microscopic stencil on the wafer with light so later etch or implant hits only chosen regions.

## Stencil idea

A painter’s stencil blocks paint except where openings exist. In lithography, a **mask** (or reticle) and light-sensitive **photoresist** create a patterned protective layer. Openings in the developed resist define where the next process step acts.

## Parallelism

An entire wafer (or exposure field) is patterned in one optical step — millions of features at once — which is why optical lithography scales mass production.

## Check yourself

What does the resist stencil protect against in a typical etch step?
''',
            keyTakeaways: [
              'Lithography prints a temporary stencil of photoresist.',
              'Mask + light define where resist remains or is removed.',
              'Parallel patterning enables high-volume chip manufacture.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m3-u1-q1',
                question: 'Photolithography is best compared to',
                options: [
                  'Random sanding of the wafer',
                  'Using light and resist as a microscopic stencil for later process steps',
                  'Only melting the entire wafer',
                  'Hand-drawing each transistor with a pen',
                ],
                correctIndex: 1,
                explanation: 'Patterned resist selectively exposes regions to etch/implant/deposit.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m3-u2',
            title: 'Photoresist chemistry',
            content: r'''
## Learning goal

Contrast positive and negative photoresists after UV exposure.

## Positive resist

Exposure makes the resist **more soluble** in developer. Exposed regions wash away; unexposed regions remain as the stencil. Mask dark areas → resist stays (for positive resist process polarity).

## Negative resist

Exposure **cross-links / hardens** the resist. Exposed regions remain; unexposed wash away. Polarity of the transferred pattern is opposite to positive resist for the same mask.

## Choice

Process engineers pick polarity, resolution, and etch resistance to match the layer being patterned.

## Check yourself

With positive resist, do the bright (exposed) regions of the wafer keep resist or lose it after develop?
''',
            keyTakeaways: [
              'Positive: exposed resist dissolves away.',
              'Negative: exposed resist remains.',
              'Polarity chooses how mask tone maps to wafer openings.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m3-u2-q1',
                question: 'In positive photoresist, UV-exposed regions',
                options: [
                  'Become insoluble and always stay',
                  'Become more soluble and wash away in developer',
                  'Turn into metal',
                  'Disappear before exposure',
                ],
                correctIndex: 1,
                explanation: 'Positive resist is developed away where exposed.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m3-u3',
            title: 'The lithography pipeline',
            content: r'''
## Learning goal

List the main process steps from bare film to patterned resist openings.

## Typical sequence

1. **Clean** and prepare the surface.  
2. **Spin-coat** liquid photoresist for a uniform thin film; soft-bake to drive off solvent.  
3. **Align** the photomask/reticle to existing wafer marks.  
4. **Expose** with UV (or EUV in advanced nodes) through the mask pattern.  
5. **Develop** to create openings in the resist.  
6. Hard-bake if needed; then **etch or implant**; finally **strip** remaining resist.

## Alignment

Each new layer must overlay previous layers within tight tolerances — a major engineering challenge as features shrink.

## Check yourself

Why is wafer-to-mask alignment critical when a chip has many patterned layers?
''',
            keyTakeaways: [
              'Coat → align → expose → develop is the core loop.',
              'Resist openings define etch/implant windows.',
              'Overlay accuracy stacks across many layers.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m3-u3-q1',
                question: 'Spin coating is used to',
                options: [
                  'Dope the wafer with ions',
                  'Spread a uniform photoresist film on the wafer',
                  'Slice the ingot',
                  'Package the die',
                ],
                correctIndex: 1,
                explanation: 'Rotation spreads resist into a controlled thickness film.',
              ),
            ],
          ),
          Unit(
            id: 'phy709-m3-u4',
            title: 'Optical resolution limits',
            content: r'''
## Learning goal

Relate printable feature size to wavelength and explain the drive toward UV and EUV light.

## Diffraction limit (intuition)

Light cannot be focused into arbitrarily small spots; the wavelength sets a scale for the finest printable lines. Shorter wavelength → finer potential resolution (with suitable optics and resist).

## UV to EUV

Mercury-lamp and laser UV wavelengths enabled micrometre then deep-submicron features. **Extreme ultraviolet (EUV)** (~13.5 nm class) is used in leading-edge nodes to print features far smaller than a virus — at great tool complexity and cost.

## Not only wavelength

Lens quality, illumination tricks, multiple patterning, and resist chemistry all push effective resolution beyond naive limits.

## Check yourself

Why does visible red light struggle to print the finest modern transistor gates compared with EUV?
''',
            keyTakeaways: [
              'Shorter wavelength supports finer optical patterning.',
              'Industry moved UV → DUV → EUV as features shrank.',
              'Optics, multipatterning, and resist also set practical limits.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy709-m3-u4-q1',
                question: 'EUV lithography is used in advanced nodes mainly to',
                options: [
                  'Heat the wafer only',
                  'Print smaller features using much shorter wavelength light',
                  'Avoid all masks forever',
                  'Grow crystals from melt',
                ],
                correctIndex: 1,
                explanation: 'Shorter λ enables finer resolution in optical patterning.',
              ),
            ],
          ),
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
