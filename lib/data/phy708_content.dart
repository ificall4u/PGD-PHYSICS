import 'package:pgd_physics/models/course.dart';

/// Complete PHY 708 – Nuclear and Particle Physics
/// Micro-chunked, conceptual & metaphor-first for Tochi
Course buildPhy708() {
  return Course(
    id: 'phy708',
    code: 'PHY 708',
    title: 'Nuclear and Particle Physics',
    description:
        'The heart of the atom and the particles inside it — nuclear structure, radioactivity, fission and fusion, reactors, and the elementary particles that make up everything.',
    semester: 'Second Semester',
    units: 3,
    icon: '☢️',
    colorHint: ColorHint.orange,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. NUCLEAR STRUCTURE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t1',
        title: 'Nuclear Structure – Size, Mass and Forces',
        summary: 'What the nucleus is made of and what holds it together.',
        units: [
          Unit(
            id: 'phy708-t1-u1',
            title: 'The Nucleus – A Tiny Dense Core',
            content: r'''
# The Nucleus – A Tiny Dense Core

Hey Tochi…

Almost all the mass of an atom sits in a tiny central region called the **nucleus**. If the atom were the size of a football stadium, the nucleus would be a marble at the centre.

The nucleus contains protons (positive charge) and neutrons (no charge). Together they are called nucleons. The number of protons is the atomic number Z; the total number of nucleons is the mass number A.
''',
            keyTakeaways: [
              'Nucleus = tiny, dense core of the atom.',
              'Protons + neutrons = nucleons.',
              'Z = proton number, A = total nucleons.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t1u1q1',
                question: 'Compared with the whole atom, the nucleus is…',
                options: [
                  'About the same size',
                  'Extremely small and extremely dense',
                  'Larger than the electron cloud',
                  'Empty space only',
                ],
                correctIndex: 1,
                explanation: 'The nucleus is orders of magnitude smaller yet contains nearly all the mass.',
              ),
            ],
          ),
          Unit(
            id: 'phy708-t1-u2',
            title: 'The Strong Nuclear Force – Nuclear Glue',
            content: r'''
# The Strong Nuclear Force – Nuclear Glue

Protons repel each other electrically. Something much stronger must hold the nucleus together. That something is the **strong nuclear force**.

It is attractive, acts only over a very short range (a few femtometres), and is roughly the same between proton–proton, proton–neutron and neutron–neutron pairs. Think of it as an extremely strong, extremely short-range glue that sticks nucleons together once they are close enough.
''',
            keyTakeaways: [
              'Strong force overcomes proton repulsion inside the nucleus.',
              'Very short range — only nearest neighbours feel it.',
              'Charge-independent: acts equally on protons and neutrons.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t1u2q1',
                question: 'The force that holds protons and neutrons together in the nucleus is…',
                options: [
                  'Gravity',
                  'The electromagnetic force',
                  'The strong nuclear force',
                  'Friction',
                ],
                correctIndex: 2,
                explanation: 'Only the strong force is both strong enough and short-ranged enough.',
              ),
            ],
          ),
          Unit(
            id: 'phy708-t1-u3',
            title: 'Nuclear Mass and Binding Energy',
            content: r'''
# Nuclear Mass and Binding Energy

The mass of a nucleus is slightly less than the sum of the masses of its individual protons and neutrons. The “missing” mass has been converted into binding energy (E = mc²).

The binding energy per nucleon tells us how tightly the nucleus is held together. Iron and nickel sit near the maximum — they are the most stable. Lighter nuclei can fuse to gain stability; heavier nuclei can split (fission) to gain stability.
''',
            keyTakeaways: [
              'Mass defect appears as binding energy.',
              'Binding energy per nucleon measures stability.',
              'Iron/nickel region is the most tightly bound.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t1u3q1',
                question: 'The mass of a nucleus is less than the total mass of its separate nucleons because…',
                options: [
                  'Some nucleons have escaped',
                  'Part of the mass has become binding energy',
                  'The nucleus is hollow',
                  'Measurement error',
                ],
                correctIndex: 1,
                explanation: 'The mass defect is the binding energy divided by c².',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. NUCLEAR MODELS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t2',
        title: 'Nuclear Models',
        summary: 'Simple pictures that capture the main features of nuclear behaviour.',
        units: [
          Unit(
            id: 'phy708-t2-u1',
            title: 'Liquid-Drop Model and Shell Model',
            content: r'''
# Liquid-Drop Model and Shell Model

**Liquid-drop model**  
Treats the nucleus like a drop of incompressible liquid. It explains binding energies, fission, and the roughly constant density of nuclei.

**Shell model**  
Nucleons move in orbits inside a common potential, just as electrons do in atoms. Magic numbers (2, 8, 20, 28, 50, 82, 126) appear when shells are filled, producing especially stable nuclei.

Both models are useful; each captures different aspects of nuclear reality.
''',
            keyTakeaways: [
              'Liquid-drop → bulk properties, fission, binding systematics.',
              'Shell model → magic numbers and individual nucleon states.',
              'Real nuclei show features of both pictures.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t2u1q1',
                question: 'Magic numbers in nuclei are evidence for…',
                options: [
                  'The liquid-drop model only',
                  'A shell structure similar to electron shells in atoms',
                  'The absence of the strong force',
                  'Classical billiard-ball behaviour only',
                ],
                correctIndex: 1,
                explanation: 'Filled nuclear shells produce extra stability at the magic numbers.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. RADIOACTIVE DECAY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t3',
        title: 'Radioactive Decay',
        summary: 'Unstable nuclei change into other nuclei by emitting particles or radiation.',
        units: [
          Unit(
            id: 'phy708-t3-u1',
            title: 'Types of Decay – Alpha, Beta, Gamma',
            content: r'''
# Types of Decay – Alpha, Beta, Gamma

**Alpha decay**  
Emission of a helium-4 nucleus (2 protons + 2 neutrons). Common in heavy nuclei. Greatly reduces mass and charge.

**Beta decay**  
A neutron turns into a proton (or vice versa) inside the nucleus, emitting an electron (or positron) and a neutrino. Changes Z by one unit while A stays the same.

**Gamma decay**  
An excited nucleus drops to a lower energy level by emitting a high-energy photon. No change in Z or A — only a loss of energy.
''',
            keyTakeaways: [
              'α = helium nucleus, reduces A and Z.',
              'β = neutron ↔ proton conversion + e± + neutrino.',
              'γ = pure energy release, no change in particle numbers.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t3u1q1',
                question: 'In beta-minus decay a nucleus…',
                options: [
                  'Loses two protons and two neutrons',
                  'Converts a neutron into a proton and emits an electron and a neutrino',
                  'Emits only a photon',
                  'Splits into two roughly equal pieces',
                ],
                correctIndex: 1,
                explanation: 'That is the definition of β⁻ decay.',
              ),
            ],
          ),
          Unit(
            id: 'phy708-t3-u2',
            title: 'Half-Life – The Popcorn Analogy',
            content: r'''
# Half-Life – The Popcorn Analogy

Imagine a huge pan of popcorn kernels. Each kernel pops independently and randomly. After a certain time roughly half of them have popped; after the same interval again, half of the remainder have popped, and so on.

Radioactive nuclei behave the same way. The **half-life** is the time in which half of any sample decays. It is a fixed property of each isotope and is independent of the size of the sample or the external conditions (for ordinary temperatures and pressures).
''',
            keyTakeaways: [
              'Half-life = time for half the nuclei to decay.',
              'Each nucleus decays independently and randomly.',
              'Half-life is characteristic of the isotope.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t3u2q1',
                question: 'After two half-lives, the fraction of the original radioactive nuclei that remain is…',
                options: ['½', '¼', '⅛', 'Zero'],
                correctIndex: 1,
                explanation: 'Half remain after one half-life; half of those (i.e. one-quarter) remain after two.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. DETECTORS & SPECTROSCOPY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t4',
        title: 'Radiation Detectors and Spectroscopy',
        summary: 'How we see and measure the invisible particles and photons coming from nuclei.',
        units: [
          Unit(
            id: 'phy708-t4-u1',
            title: 'How Detectors Work – Ionisation and Scintillation',
            content: r'''
# How Detectors Work – Ionisation and Scintillation

Most detectors rely on the fact that ionising radiation knocks electrons free from atoms.

- **Gas detectors** (Geiger–Müller, proportional counters) collect the freed charges as an electrical pulse.  
- **Scintillators** convert the energy into a flash of light that a photomultiplier turns into an electrical signal.  
- **Semiconductor detectors** use the charge liberated in silicon or germanium for high-resolution energy measurement.

The size of the pulse often tells us the energy of the incoming particle or photon.
''',
            keyTakeaways: [
              'Radiation ionises or excites atoms; detectors sense that energy deposit.',
              'Gas, scintillation and semiconductor detectors are the main families.',
              'Pulse height frequently encodes particle energy.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t4u1q1',
                question: 'A Geiger–Müller counter detects radiation primarily by…',
                options: [
                  'Weighing the sample',
                  'Collecting ionisation produced in a gas',
                  'Measuring temperature rise only',
                  'Listening for sound',
                ],
                correctIndex: 1,
                explanation: 'Ionisation of the fill gas produces the countable electrical pulse.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. NEUTRONS, FISSION & FUSION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t5',
        title: 'Neutron Physics, Fission and Fusion',
        summary: 'Splitting heavy nuclei and joining light nuclei — the two routes to nuclear energy.',
        units: [
          Unit(
            id: 'phy708-t5-u1',
            title: 'Nuclear Fission – Splitting the Drop',
            content: r'''
# Nuclear Fission – Splitting the Drop

A heavy nucleus (uranium-235 or plutonium-239) can capture a neutron and split into two medium-mass nuclei plus a few extra neutrons and a large amount of energy.

The extra neutrons can trigger further fissions → chain reaction. Controlled chain reactions power nuclear reactors; uncontrolled ones power nuclear weapons.

The energy released comes from the increase in binding energy per nucleon when a heavy nucleus splits into two better-bound fragments.
''',
            keyTakeaways: [
              'Fission = heavy nucleus splits into two lighter ones.',
              'Extra neutrons enable a chain reaction.',
              'Energy comes from the gain in binding energy.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t5u1q1',
                question: 'In a fission chain reaction the key particles that keep the reaction going are…',
                options: [
                  'Protons',
                  'Electrons',
                  'Neutrons released by each fission',
                  'Photons only',
                ],
                correctIndex: 2,
                explanation: 'The neutrons emitted in one fission can induce the next fission.',
              ),
            ],
          ),
          Unit(
            id: 'phy708-t5-u2',
            title: 'Nuclear Fusion – Joining Light Nuclei',
            content: r'''
# Nuclear Fusion – Joining Light Nuclei

Light nuclei (isotopes of hydrogen) can join to form heavier nuclei, again releasing energy because the binding energy per nucleon increases up to iron.

Fusion powers the Sun and other stars. On Earth we are still working to achieve controlled fusion for power generation — the fuel is abundant and the radioactive waste problem is far smaller than for fission, but the required temperature and confinement are extreme.
''',
            keyTakeaways: [
              'Fusion = light nuclei combine into heavier ones.',
              'Energy gain again comes from higher binding energy per nucleon.',
              'Stars run on fusion; terrestrial controlled fusion is still under development.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t5u2q1',
                question: 'The Sun’s energy comes primarily from…',
                options: [
                  'Chemical burning of coal',
                  'Nuclear fission of uranium',
                  'Nuclear fusion of hydrogen into helium',
                  'Gravitational collapse alone',
                ],
                correctIndex: 2,
                explanation: 'Proton–proton and related fusion chains power main-sequence stars.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. NUCLEAR REACTORS & ENERGY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t6',
        title: 'Nuclear Reactors and Nuclear Energy',
        summary: 'How we control fission to produce useful heat and electricity.',
        units: [
          Unit(
            id: 'phy708-t6-u1',
            title: 'The Basic Parts of a Fission Reactor',
            content: r'''
# The Basic Parts of a Fission Reactor

- **Fuel** – usually uranium dioxide enriched in the fissile isotope U-235  
- **Moderator** – slows neutrons so they are more likely to cause further fission (water, heavy water or graphite)  
- **Control rods** – absorb neutrons; inserting them reduces the reaction rate  
- **Coolant** – carries heat away from the core  
- **Containment and shielding** – protect the outside world from radiation and accidents  

The heat ultimately boils water, drives turbines and generates electricity — just as in a fossil-fuel plant, but with a different heat source.
''',
            keyTakeaways: [
              'Fuel, moderator, control rods, coolant and shielding are the essential elements.',
              'Control rods regulate the chain reaction.',
              'Heat → steam → turbine → electricity.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t6u1q1',
                question: 'Control rods in a nuclear reactor work by…',
                options: [
                  'Adding more fuel',
                  'Absorbing neutrons and thereby slowing or stopping the chain reaction',
                  'Increasing the temperature only',
                  'Generating electricity directly',
                ],
                correctIndex: 1,
                explanation: 'Neutron-absorbing materials reduce the number of neutrons available for fission.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. ELEMENTARY PARTICLES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy708-t7',
        title: 'Elementary Particles',
        summary: 'The deepest known building blocks and the forces that act between them.',
        units: [
          Unit(
            id: 'phy708-t7-u1',
            title: 'The Particle Zoo and the Standard Model',
            content: r'''
# The Particle Zoo and the Standard Model

Matter is built from two families of fermions:

- **Quarks** – never seen alone; they combine to form protons, neutrons and hundreds of other hadrons  
- **Leptons** – electrons, muons, taus and their neutrinos  

Forces are carried by bosons:

- Photon → electromagnetic force  
- Gluons → strong force  
- W and Z bosons → weak force  
- Higgs boson → gives mass to other particles  

Gravity is not yet successfully included in the Standard Model. Everything we have observed in laboratories fits this picture (with the still-mysterious dark matter and dark energy left outside).
''',
            keyTakeaways: [
              'Matter fermions: quarks and leptons.',
              'Force carriers: photon, gluons, W/Z, Higgs.',
              'Standard Model summarises all known laboratory particle physics.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t7u1q1',
                question: 'Protons and neutrons are made of…',
                options: [
                  'Electrons only',
                  'Quarks held together by gluons',
                  'Photons',
                  'Higgs bosons alone',
                ],
                correctIndex: 1,
                explanation: 'Each nucleon contains three quarks bound by the strong force (gluons).',
              ),
            ],
          ),
          Unit(
            id: 'phy708-t7-u2',
            title: 'Conservation Laws and the Three Interactions',
            content: r'''
# Conservation Laws and the Three Interactions

Certain quantities are never created or destroyed in any known process:

- Energy and momentum  
- Electric charge  
- Baryon number (quarks)  
- Lepton number  

The three interactions that appear in particle physics are:

- **Strong** – holds quarks inside nucleons and nucleons inside nuclei  
- **Electromagnetic** – acts on anything with charge or magnetism  
- **Weak** – responsible for beta decay and many rare particle decays  

Every allowed reaction must respect the conservation laws and can proceed only via one or more of these interactions.
''',
            keyTakeaways: [
              'Conservation laws severely restrict what reactions can occur.',
              'Strong, electromagnetic and weak forces govern particle processes.',
              'Beta decay is a classic weak-interaction process.',
            ],
            quiz: [
              QuizQuestion(
                id: '708t7u2q1',
                question: 'Beta decay is an example of which interaction?',
                options: [
                  'Strong',
                  'Electromagnetic',
                  'Weak',
                  'Gravitational only',
                ],
                correctIndex: 2,
                explanation: 'The conversion of a neutron into a proton (or vice versa) proceeds via the weak force.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
