import 'package:pgd_physics/models/course.dart';

/// Complete PHY 712 – Energy Conversion and Storage
/// Micro-chunked, intuitive & analogy-first for Tochi
Course buildPhy712() {
  return Course(
    id: 'phy712',
    code: 'PHY 712',
    title: 'Energy Conversion and Storage',
    description:
        'How we turn natural energy flows into useful work and electricity, and how we store that energy for when we need it — heat engines, fuel cells, solar, wind, hydrogen, biomass and more.',
    semester: 'Second Semester',
    units: 3,
    icon: '🔋',
    colorHint: ColorHint.green,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. ENERGY CONVERSION – THE BIG PICTURE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t1',
        title: 'Energy Conversion – The Big Picture',
        summary: 'Turning one form of energy into another that we can actually use.',
        units: [
          Unit(
            id: 'phy712-t1-u1',
            title: 'What Energy Conversion Means',
            content: r'''
# What Energy Conversion Means

Hey Tochi…

Energy is never created or destroyed; it only changes form. What we call “energy conversion” is simply guiding that change so the energy ends up in a form we can use — usually electricity or mechanical work.

A solar panel converts light into electricity. A wind turbine converts the kinetic energy of moving air into electricity. A fuel cell converts the chemical energy of hydrogen into electricity. Every power source is a converter.
''',
            keyTakeaways: [
              'Energy changes form; it is not created or destroyed.',
              'Useful conversion means delivering energy as electricity or work.',
              'Every generator or power device is an energy converter.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t1u1q1',
                question: 'A solar panel is an example of…',
                options: [
                  'Energy creation from nothing',
                  'Conversion of light energy into electrical energy',
                  'Only a storage device',
                  'A heat engine',
                ],
                correctIndex: 1,
                explanation: 'It transforms one existing form of energy (light) into another (electricity).',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. HEAT ENGINES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t2',
        title: 'Heat Engines',
        summary: 'Devices that turn heat differences into mechanical work — the foundation of most traditional power plants.',
        units: [
          Unit(
            id: 'phy712-t2-u1',
            title: 'How a Heat Engine Works – The Simple Idea',
            content: r'''
# How a Heat Engine Works – The Simple Idea

A heat engine sits between a hot place and a cold place. Heat flows from hot to cold, and the engine intercepts part of that flow and turns it into mechanical work (spinning a shaft).

The rest of the heat is rejected to the cold side. You can never convert all of the heat into work — that is a fundamental limit set by thermodynamics (Carnot efficiency).

Steam turbines, petrol engines and jet engines are all heat engines.
''',
            keyTakeaways: [
              'Heat engine = extracts work from a heat flow between hot and cold reservoirs.',
              'Some heat must always be rejected; 100 % conversion is impossible.',
              'Most traditional power stations use heat engines.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t2u1q1',
                question: 'A heat engine always needs…',
                options: [
                  'Only a hot source',
                  'A hot source and a colder sink so heat can flow',
                  'No temperature difference',
                  'Only electricity',
                ],
                correctIndex: 1,
                explanation: 'Work is extracted from the spontaneous flow of heat from hot to cold.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. WIND & OCEAN THERMAL
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t3',
        title: 'Windmills and Ocean Thermal Energy',
        summary: 'Harvesting kinetic energy from air and thermal energy from the sea.',
        units: [
          Unit(
            id: 'phy712-t3-u1',
            title: 'Wind Turbines – Catching Moving Air',
            content: r'''
# Wind Turbines – Catching Moving Air

Wind is air that has kinetic energy. A turbine blade extracts some of that kinetic energy and turns it into rotational energy, which a generator converts into electricity.

There is a theoretical maximum (the Betz limit) of about 59 % of the wind’s kinetic energy that any turbine can capture. Real turbines reach a good fraction of that limit under the right conditions.
''',
            keyTakeaways: [
              'Wind turbines convert kinetic energy of air into electricity.',
              'Betz limit ≈ 59 % is the theoretical maximum.',
              'Practical turbines aim for a high fraction of that limit.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t3u1q1',
                question: 'The Betz limit says that a wind turbine can capture at most roughly…',
                options: [
                  '100 % of the wind’s kinetic energy',
                  '59 % of the wind’s kinetic energy',
                  '10 % of the wind’s kinetic energy',
                  'No energy at all',
                ],
                correctIndex: 1,
                explanation: '59 % is the theoretical upper bound for a perfect turbine in an open flow.',
              ),
            ],
          ),
          Unit(
            id: 'phy712-t3-u2',
            title: 'Ocean Thermal Energy Conversion (OTEC)',
            content: r'''
# Ocean Thermal Energy Conversion (OTEC)

In tropical oceans the surface water is warm and the deep water is cold. OTEC runs a heat engine between these two temperatures.

The temperature difference is small (about 20 °C), so the maximum efficiency is low, but the energy reservoir is enormous and constantly replenished by the sun. Several experimental plants have demonstrated the idea.
''',
            keyTakeaways: [
              'OTEC uses the temperature difference between warm surface and cold deep ocean water.',
              'Small ΔT means low Carnot efficiency, but huge resource.',
              'Still largely experimental / demonstration stage.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t3u2q1',
                question: 'OTEC extracts energy from…',
                options: [
                  'Waves only',
                  'The temperature difference between surface and deep ocean water',
                  'Ocean salt only',
                  'Tidal currents only',
                ],
                correctIndex: 1,
                explanation: 'It is a heat engine operating on the natural ocean temperature gradient.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. THERMOELECTRIC, THERMIONIC & FUEL CELLS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t4',
        title: 'Thermoelectric, Thermionic and Fuel Cells',
        summary: 'Direct conversion of heat or chemical energy into electricity without moving parts.',
        units: [
          Unit(
            id: 'phy712-t4-u1',
            title: 'Thermoelectric and Thermionic Conversion',
            content: r'''
# Thermoelectric and Thermionic Conversion

**Thermoelectric**  
A temperature difference across certain materials generates a voltage (Seebeck effect). No moving parts — used in space probes and some remote sensors. Efficiency is modest.

**Thermionic**  
Heat a surface until electrons “boil off” (thermionic emission) and collect them on a cooler electrode. Again, direct heat-to-electricity conversion. High temperatures are required.
''',
            keyTakeaways: [
              'Thermoelectric: temperature difference → voltage in special materials.',
              'Thermionic: heat-driven electron emission → current.',
              'Both are solid-state or vacuum devices with no macroscopic moving parts.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t4u1q1',
                question: 'A thermoelectric generator produces electricity from…',
                options: [
                  'A magnetic field only',
                  'A temperature difference across a special material',
                  'Moving water only',
                  'Nuclear fission only',
                ],
                correctIndex: 1,
                explanation: 'The Seebeck effect converts a thermal gradient into an electric potential.',
              ),
            ],
          ),
          Unit(
            id: 'phy712-t4-u2',
            title: 'Fuel Cells – Batteries that Breathe',
            content: r'''
# Fuel Cells – Batteries that Breathe

A fuel cell continuously converts the chemical energy of a fuel (usually hydrogen) and an oxidant (usually oxygen from air) directly into electricity and water.

It is like a battery that never “runs down” as long as you keep supplying fuel and air. The heart of the cell is an electrolyte that lets ions pass while forcing electrons to travel through an external circuit — that electron flow is the useful current.

High efficiency, quiet operation, and only water as exhaust (when hydrogen is the fuel) make fuel cells attractive for both stationary and transport applications.
''',
            keyTakeaways: [
              'Fuel cell = continuous chemical-to-electrical conversion.',
              'Hydrogen + oxygen → electricity + water.',
              'No combustion; high potential efficiency and clean exhaust.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t4u2q1',
                question: 'A hydrogen fuel cell’s main exhaust product is…',
                options: [
                  'Carbon dioxide',
                  'Water',
                  'Nitrogen oxides',
                  'Soot',
                ],
                correctIndex: 1,
                explanation: 'When hydrogen is the fuel, the only chemical product is water.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. HYDROGEN PRODUCTION & STORAGE
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t5',
        title: 'Hydrogen Production and Storage',
        summary: 'Making hydrogen and keeping it until we need it.',
        units: [
          Unit(
            id: 'phy712-t5-u1',
            title: 'How We Produce Hydrogen',
            content: r'''
# How We Produce Hydrogen

Most hydrogen today is made by reforming natural gas (steam + methane). That route emits CO₂.

Cleaner routes:
- **Electrolysis** of water using renewable electricity → “green hydrogen”
- High-temperature electrolysis or thermochemical cycles using solar or nuclear heat
- Biological and photo-catalytic methods still under development

The dream is large-scale electrolysis powered by surplus wind and solar electricity.
''',
            keyTakeaways: [
              'Current mainstream production is from fossil fuels (not carbon-free).',
              'Electrolysis with renewable power yields green hydrogen.',
              'Other advanced methods are being researched.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t5u1q1',
                question: '“Green hydrogen” is typically produced by…',
                options: [
                  'Burning coal',
                  'Electrolysis of water using renewable electricity',
                  'Mining it directly from the ground',
                  'Only from natural gas without capture',
                ],
                correctIndex: 1,
                explanation: 'Renewable-powered electrolysis is the defining route for green hydrogen.',
              ),
            ],
          ),
          Unit(
            id: 'phy712-t5-u2',
            title: 'Storing Hydrogen',
            content: r'''
# Storing Hydrogen

Hydrogen has high energy per unit mass but low energy per unit volume at ordinary pressure. Storage options include:

- Compressed gas (high-pressure tanks)
- Cryogenic liquid (very cold)
- Chemical storage in metal hydrides or liquid organic carriers
- Underground storage in salt caverns for large seasonal quantities

Each method has trade-offs among energy density, cost, safety and round-trip efficiency.
''',
            keyTakeaways: [
              'Hydrogen is light but bulky at atmospheric pressure.',
              'Compression, liquefaction, hydrides and geological storage are the main routes.',
              'Storage remains one of the practical challenges of a hydrogen economy.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t5u2q1',
                question: 'One practical difficulty with hydrogen is that…',
                options: [
                  'It has almost no energy content',
                  'It has low volumetric energy density under normal conditions, so storage needs special methods',
                  'It cannot be produced at all',
                  'It is heavier than lead',
                ],
                correctIndex: 1,
                explanation: 'High mass-energy density but low volume-energy density drives the storage problem.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. PHOTOELECTRON / SOLAR CONVERTERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t6',
        title: 'Photoelectron Converters – Solar Cells',
        summary: 'Turning sunlight directly into electricity.',
        units: [
          Unit(
            id: 'phy712-t6-u1',
            title: 'How a Solar Cell Works',
            content: r'''
# How a Solar Cell Works

Sunlight hits a semiconductor (usually silicon). Photons with enough energy knock electrons loose, creating electron–hole pairs. An internal electric field (from a p–n junction) sweeps the electrons one way and the holes the other way. That separation produces a usable voltage and current.

Efficiency is limited by the portion of the solar spectrum that the material can absorb usefully and by various recombination and electrical losses. Commercial silicon panels typically convert 15–22 % of the incident sunlight into electricity.
''',
            keyTakeaways: [
              'Photons generate electron–hole pairs in a semiconductor.',
              'A built-in field separates the charges → current and voltage.',
              'Practical efficiencies are a fraction of the theoretical maximum.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t6u1q1',
                question: 'In a solar cell the key step that creates free charges is…',
                options: [
                  'Heating the cell until electrons boil off',
                  'Absorption of photons that generate electron–hole pairs',
                  'Mechanical spinning of a turbine',
                  'Chemical combustion',
                ],
                correctIndex: 1,
                explanation: 'The photovoltaic effect begins with photon absorption and carrier generation.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. BIOMASS, PHOTOSYNTHESIS & BIOFUELS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy712-t7',
        title: 'Biomass, Photosynthesis and Biofuels',
        summary: 'Nature’s own solar energy storage and how we turn it into liquid fuels.',
        units: [
          Unit(
            id: 'phy712-t7-u1',
            title: 'Photosynthesis – Nature’s Solar Factory',
            content: r'''
# Photosynthesis – Nature’s Solar Factory

Plants capture sunlight and use it to convert carbon dioxide and water into sugars (chemical energy) and oxygen. That is photosynthesis — a biological solar energy converter and storage system that has run for billions of years.

The stored chemical energy can later be released by burning the plant material (biomass) or by converting it into liquid fuels.
''',
            keyTakeaways: [
              'Photosynthesis stores solar energy as chemical energy in biomass.',
              'CO₂ + H₂O + light → sugars + O₂.',
              'Biomass is therefore a form of stored solar energy.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t7u1q1',
                question: 'Photosynthesis ultimately converts…',
                options: [
                  'Chemical energy into light',
                  'Light energy into chemical energy stored in biomass',
                  'Nuclear energy into electricity',
                  'Wind energy into heat',
                ],
                correctIndex: 1,
                explanation: 'That is the core energy-conversion step of photosynthesis.',
              ),
            ],
          ),
          Unit(
            id: 'phy712-t7-u2',
            title: 'Biofuels – Methanol and Ethanol',
            content: r'''
# Biofuels – Methanol and Ethanol

Plant sugars or starches can be fermented into ethanol. Woody biomass or other feedstocks can be gasified and turned into methanol or other synthetic fuels.

These liquid biofuels can be used in existing engines and infrastructure with relatively modest changes. Their net carbon benefit depends on how the feedstock is grown, harvested and processed — the whole life cycle matters.
''',
            keyTakeaways: [
              'Ethanol from fermentation of sugars/starches; methanol from synthesis gas.',
              'Liquid fuels compatible with much existing transport infrastructure.',
              'Climate benefit depends on sustainable feedstock and processing.',
            ],
            quiz: [
              QuizQuestion(
                id: '712t7u2q1',
                question: 'Ethanol as a biofuel is commonly produced by…',
                options: [
                  'Direct mining',
                  'Fermentation of plant sugars or starches',
                  'Only from crude oil',
                  'Electrolysis of water',
                ],
                correctIndex: 1,
                explanation: 'Yeast fermentation of sugars is the classic route to bio-ethanol.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
