import 'package:pgd_physics/models/course.dart';

/// Complete PHY 706 – Electrical Measurements and Instrumentation
/// Micro-chunked, practical & analogy-first for Tochi
Course buildPhy706() {
  return Course(
    id: 'phy706',
    code: 'PHY 706',
    title: 'Electrical Measurements and Instrumentation',
    description:
        'How we actually measure electrical quantities, understand errors, use oscilloscopes, meters, transducers and op-amps, and begin to design simple electronic instruments.',
    semester: 'Second Semester',
    units: 3,
    icon: '📟',
    colorHint: ColorHint.green,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. PRINCIPLES OF MEASUREMENT
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy706-t1',
        title: 'Principles of Measurement, Errors and Accuracy',
        summary: 'What it means to measure something and why every measurement is imperfect.',
        units: [
          Unit(
            id: 'phy706-t1-u1',
            title: 'What is a Measurement?',
            content: r'''
# What is a Measurement?

Hey Tochi…

A measurement is a comparison of an unknown quantity with a known standard. When you say “this battery is 1.5 V” you are really saying “it produces the same effect as our standard of 1.5 volts.”

Every measurement involves:
- a **measurand** (the thing you want to know)
- a **sensor / transducer** that converts it into something readable
- a **display or recording** system
- and always some **uncertainty**
''',
            keyTakeaways: [
              'Measurement = comparison with a standard.',
              'A complete chain includes sensor, processing and display.',
              'No measurement is perfect; uncertainty is always present.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t1u1q1',
                question: 'At its core, a measurement is…',
                options: [
                  'A pure mathematical calculation',
                  'A comparison of an unknown quantity with a known standard',
                  'Only possible with digital instruments',
                  'Always exact',
                ],
                correctIndex: 1,
                explanation: 'That is the fundamental definition of measurement.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t1-u2',
            title: 'Errors, Accuracy and Precision',
            content: r'''
# Errors, Accuracy and Precision

**Error** is the difference between the measured value and the true value.  
**Accuracy** tells you how close the measurement is to the truth.  
**Precision** tells you how repeatable the measurement is (how tightly the results cluster) even if they are all slightly wrong.

A watch that is always 5 minutes fast is precise but not accurate. A watch that jumps randomly around the correct time is accurate on average but not precise.

We also speak of systematic errors (consistent bias) and random errors (scatter).
''',
            keyTakeaways: [
              'Accuracy = closeness to the true value.',
              'Precision = repeatability / low scatter.',
              'Systematic vs random errors have different causes and cures.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t1u2q1',
                question: 'An instrument that always reads 0.2 V too high is…',
                options: [
                  'Precise but inaccurate (systematic error)',
                  'Accurate but imprecise',
                  'Perfect',
                  'Only suffering from random error',
                ],
                correctIndex: 0,
                explanation: 'A constant offset is a classic systematic error; readings can still be very repeatable.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. BASIC INSTRUMENTS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy706-t2',
        title: 'Working Principles of Common Instruments',
        summary: 'How the classic laboratory instruments actually work.',
        units: [
          Unit(
            id: 'phy706-t2-u1',
            title: 'Analog and Digital Meters',
            content: r'''
# Analog and Digital Meters

**Analog meter** (moving-coil, moving-iron, etc.)  
A current produces a mechanical torque that moves a pointer against a spring. The deflection is proportional to the quantity being measured. Simple, continuous, but limited in precision and easily overloaded.

**Digital meter**  
Converts the analogue voltage into a number (using an ADC) and displays the digits. Higher precision, no parallax error, but can miss rapid changes between samples.
''',
            keyTakeaways: [
              'Analog meters use mechanical deflection.',
              'Digital meters sample and convert to numbers.',
              'Each has strengths; modern labs use both.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t2u1q1',
                question: 'A digital multimeter displays a reading by…',
                options: [
                  'Moving a pointer across a scale',
                  'Converting the input to a number with an ADC and showing the digits',
                  'Only measuring resistance',
                  'Using a cathode-ray tube',
                ],
                correctIndex: 1,
                explanation: 'The heart of a digital meter is analogue-to-digital conversion.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t2-u2',
            title: 'The Cathode Ray Oscilloscope (CRO) – A Heart Monitor for Signals',
            content: r'''
# The Cathode Ray Oscilloscope – A Heart Monitor for Signals

An oscilloscope draws a live graph of voltage versus time.

An electron beam is swept horizontally at a known speed while the input voltage deflects it vertically. The glowing trace on the screen is therefore a real-time plot of the waveform.

Modern digital scopes sample the signal and reconstruct the waveform on an LCD, but the purpose remains the same: let you *see* what the electricity is doing.
''',
            keyTakeaways: [
              'CRO / oscilloscope displays voltage as a function of time.',
              'Horizontal axis = time, vertical axis = voltage.',
              'Essential for examining waveforms, frequencies and transients.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t2u2q1',
                question: 'The main job of an oscilloscope is to…',
                options: [
                  'Measure only DC resistance',
                  'Show how a voltage changes with time',
                  'Generate high voltages',
                  'Replace a multimeter completely',
                ],
                correctIndex: 1,
                explanation: 'It is a time-domain voltage viewer.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t2-u3',
            title: 'Q-meters, Watt-meters and Semiconductor Testers',
            content: r'''
# Q-meters, Watt-meters and Semiconductor Testers

**Q-meter**  
Measures the quality factor of a coil or resonant circuit (how “sharp” the resonance is). Useful for characterising inductors and RF components.

**Watt-meter**  
Measures real power (average of instantaneous voltage × current). Electrodynamic or electronic versions exist.

**Semiconductor tester**  
Applies controlled voltages and currents to a diode or transistor and checks whether the junctions behave correctly (forward drop, reverse leakage, current gain, etc.).
''',
            keyTakeaways: [
              'Q-meter → quality factor of resonant circuits.',
              'Watt-meter → real power.',
              'Semiconductor tester → quick health check of diodes and transistors.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t2u3q1',
                question: 'A watt-meter is designed to measure…',
                options: [
                  'Only voltage',
                  'Only current',
                  'Real electrical power',
                  'Frequency only',
                ],
                correctIndex: 2,
                explanation: 'Power is the product of voltage and current averaged over time.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t2-u4',
            title: 'X–Y Plotters',
            content: r'''
# X–Y Plotters

An X–Y plotter draws a graph by moving a pen in two dimensions according to two input voltages: one controls horizontal position, the other vertical position.

Unlike a normal oscilloscope that almost always plots voltage against time, an X–Y plotter (or an oscilloscope in X–Y mode) lets you plot one signal against another — for example diode I–V curves, Lissajous figures, or characteristic curves of transistors.

Many modern digital scopes still offer an X–Y mode that serves the same purpose.
''',
            keyTakeaways: [
              'X–Y plotter graphs one voltage against another (not necessarily against time).',
              'Useful for device characteristic curves and phase relationships.',
              'Oscilloscopes often provide an X–Y mode that does the same job.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t2u4q1',
                question: 'An X–Y plotter is especially useful for…',
                options: [
                  'Measuring only temperature',
                  'Plotting one electrical signal against another (e.g. I–V curves)',
                  'Generating high voltage',
                  'Replacing a power supply',
                ],
                correctIndex: 1,
                explanation: 'Its defining feature is graphing Y versus X rather than versus time.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. TRANSDUCERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy706-t3',
        title: 'Transducers and Their Applications',
        summary: 'Devices that convert a physical quantity into an electrical signal (or vice versa).',
        units: [
          Unit(
            id: 'phy706-t3-u1',
            title: 'What a Transducer Does',
            content: r'''
# What a Transducer Does

A transducer converts energy from one form to another. In instrumentation we usually mean a device that turns a physical quantity (temperature, pressure, light, displacement, force…) into an electrical signal that can be measured, recorded or controlled.

Examples:
- Thermocouple or RTD → temperature to voltage/resistance  
- Strain gauge → deformation to resistance  
- Photodiode → light to current  
- Loudspeaker → electrical signal to sound (the reverse direction)
''',
            keyTakeaways: [
              'Transducer = converter between physical and electrical domains.',
              'Sensors are the input half of the story.',
              'Almost every modern measurement chain starts with a transducer.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t3u1q1',
                question: 'A photodiode used to measure light intensity is acting as a…',
                options: [
                  'Power supply',
                  'Transducer (light → electrical signal)',
                  'Logic gate',
                  'Mechanical switch only',
                ],
                correctIndex: 1,
                explanation: 'It converts optical energy into an electrical current or voltage.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. OPERATIONAL AMPLIFIERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy706-t4',
        title: 'Operational Amplifiers (Op-Amps)',
        summary: 'The versatile building block that amplifies, adds, integrates and filters signals.',
        units: [
          Unit(
            id: 'phy706-t4-u1',
            title: 'Op-Amp as an Electric Lever',
            content: r'''
# Op-Amp as an Electric Lever

An ideal operational amplifier is a differential amplifier with enormous gain. A tiny voltage difference between its two inputs produces a large output voltage.

With external feedback resistors we can tame that gain and make the circuit do almost anything: amplify by a precise factor, add several signals, integrate, differentiate, filter, compare, etc.

Think of it as a lever: a small effort at the input end produces a controlled, much larger effect at the output end.
''',
            keyTakeaways: [
              'Op-amp = very high-gain differential amplifier.',
              'Feedback sets the useful, controlled behaviour.',
              'One chip can implement dozens of different functions.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t4u1q1',
                question: 'The main reason we almost always use feedback around an op-amp is…',
                options: [
                  'To make the gain even higher and uncontrolled',
                  'To set a precise, stable gain or transfer function',
                  'To destroy the signal',
                  'Only for decoration',
                ],
                correctIndex: 1,
                explanation: 'Negative feedback trades raw gain for predictability and stability.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t4-u2',
            title: 'Basic Op-Amp Circuits You Will Meet',
            content: r'''
# Basic Op-Amp Circuits You Will Meet

- **Inverting amplifier** – gain set by two resistors, output inverted  
- **Non-inverting amplifier** – gain set by two resistors, output same polarity  
- **Voltage follower** – unity gain, very high input impedance (buffer)  
- **Summing amplifier** – adds several input voltages  
- **Integrator / differentiator** – time-domain operations used in analogue computing and filters  

Once you can recognise these few topologies you can read most simple analogue instrument schematics.
''',
            keyTakeaways: [
              'A handful of standard topologies cover most instrument needs.',
              'Gain and function are set by external passive components.',
              'Buffers, summers and integrators appear constantly.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t4u2q1',
                question: 'A voltage follower (unity-gain buffer) is mainly used to…',
                options: [
                  'Multiply the voltage by a large factor',
                  'Provide high input impedance and low output impedance without changing the voltage',
                  'Generate oscillations',
                  'Measure magnetic fields',
                ],
                correctIndex: 1,
                explanation: 'It isolates stages while preserving the signal voltage.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. INTRODUCTION TO ELECTRONIC EQUIPMENT DESIGN
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy706-t5',
        title: 'Introduction to Electronic Equipment Design',
        summary: 'How the pieces come together into a working instrument.',
        units: [
          Unit(
            id: 'phy706-t5-u1',
            title: 'The Signal Chain of a Typical Instrument',
            content: r'''
# The Signal Chain of a Typical Instrument

Most electronic instruments follow a similar flow:

1. **Transducer** – converts the physical quantity into an electrical signal  
2. **Signal conditioning** – amplification, filtering, linearisation (often with op-amps)  
3. **Conversion / processing** – ADC, digital processing, or further analogue computation  
4. **Display or output** – numbers, screen, actuator, data link  

Understanding this chain lets you design, troubleshoot or improve almost any measurement system.
''',
            keyTakeaways: [
              'Typical chain: transducer → conditioning → processing → display.',
              'Op-amps and ADCs are the usual conditioning/processing tools.',
              'Clear signal-flow thinking is the heart of instrument design.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t5u1q1',
                question: 'In a typical measurement instrument the first block is usually a…',
                options: [
                  'Display screen',
                  'Transducer / sensor',
                  'Power amplifier only',
                  'Loudspeaker',
                ],
                correctIndex: 1,
                explanation: 'The physical quantity must first be converted into an electrical signal.',
              ),
            ],
          ),
          Unit(
            id: 'phy706-t5-u2',
            title: 'Practical Design Considerations',
            content: r'''
# Practical Design Considerations

When you design even a simple instrument you must think about:

- Range and resolution needed  
- Accuracy and how to calibrate  
- Noise, interference and grounding  
- Power supply and protection against overload  
- User interface and safety  

A well-designed instrument is not just a collection of working blocks; it is a reliable, understandable and safe tool for the person who will use it.
''',
            keyTakeaways: [
              'Range, resolution, accuracy and calibration matter.',
              'Noise and protection are practical necessities.',
              'Good design serves the user, not just the schematic.',
            ],
            quiz: [
              QuizQuestion(
                id: '706t5u2q1',
                question: 'Calibration of an instrument is performed mainly to…',
                options: [
                  'Make it look newer',
                  'Reduce systematic error and improve accuracy',
                  'Increase its bandwidth only',
                  'Change its colour',
                ],
                correctIndex: 1,
                explanation: 'Calibration compares the instrument against standards and corrects bias.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
