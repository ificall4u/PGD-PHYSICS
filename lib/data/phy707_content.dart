import 'package:pgd_physics/models/course.dart';

/// PHY 707 — Digital Electronics
/// Structure from content_prompts/PHY707 (placeholder lesson bodies only).
Course buildPhy707() {
  return Course(
    id: 'phy-707',
    code: 'PHY 707',
    title: 'Digital Electronics',
    description: 'Logic gates through Boolean algebra, sequential systems, families, and data converters.',
    semester: 'First Semester',
    units: 3,
    icon: '▣',
    colorHint: ColorHint.orange,
    modules: [
      skeletonModule(
        id: 'phy707-m1',
        title: 'Fundamental Logic Gates & Truth Tables',
        summary: 'Fundamental Logic Gates & Truth Tables',
        units: [
          skeletonUnit(id: 'phy707-m1-u1', title: 'Binary State Intuition'),
          skeletonUnit(id: 'phy707-m1-u2', title: 'Basic Logic Gates (AND, OR, NOT)'),
          skeletonUnit(id: 'phy707-m1-u3', title: 'Derived Logic Gates (NAND, NOR, XOR, XNOR)'),
          skeletonUnit(id: 'phy707-m1-u4', title: 'Truth Tables'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m2',
        title: 'Boolean Algebra & De Morgan\'s Laws',
        summary: 'Boolean Algebra & De Morgan\'s Laws',
        units: [
          skeletonUnit(id: 'phy707-m2-u1', title: 'Physical Logic Rules'),
          skeletonUnit(id: 'phy707-m2-u2', title: 'Fundamental Laws of Boolean Algebra'),
          skeletonUnit(id: 'phy707-m2-u3', title: 'Distributive, Associative, and Commutative Laws'),
          skeletonUnit(id: 'phy707-m2-u4', title: 'De Morgan\'s Laws'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m3',
        title: 'Circuit Minimization (Karnaugh Maps & Quine-McCluskey)',
        summary: 'Circuit Minimization (Karnaugh Maps & Quine-McCluskey)',
        units: [
          skeletonUnit(id: 'phy707-m3-u1', title: 'The Goal of Minimization'),
          skeletonUnit(id: 'phy707-m3-u2', title: 'Karnaugh Maps (K-Maps)'),
          skeletonUnit(id: 'phy707-m3-u3', title: 'Quine-McCluskey (Tabular Method)'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m4',
        title: 'Combinational Logic, Multiplexers, and Demultiplexers',
        summary: 'Combinational Logic, Multiplexers, and Demultiplexers',
        units: [
          skeletonUnit(id: 'phy707-m4-u1', title: 'Combinational Logic'),
          skeletonUnit(id: 'phy707-m4-u2', title: 'Multiplexers (MUX - Data Selectors)'),
          skeletonUnit(id: 'phy707-m4-u3', title: 'Demultiplexers (DEMUX - Data Distributors)'),
          skeletonUnit(id: 'phy707-m4-u4', title: 'Encoders & Decoders'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m5',
        title: 'Sequential Logic & Memory (Flip-Flops)',
        summary: 'Sequential Logic & Memory (Flip-Flops)',
        units: [
          skeletonUnit(id: 'phy707-m5-u1', title: 'Memory in Circuits'),
          skeletonUnit(id: 'phy707-m5-u2', title: 'SR Latch (Set-Reset)'),
          skeletonUnit(id: 'phy707-m5-u3', title: 'Clocked Flip-Flops'),
          skeletonUnit(id: 'phy707-m5-u4', title: 'D Flip-Flop (Data/Delay)'),
          skeletonUnit(id: 'phy707-m5-u5', title: 'JK & T Flip-Flops'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m6',
        title: 'Registers and Counters',
        summary: 'Registers and Counters',
        units: [
          skeletonUnit(id: 'phy707-m6-u1', title: 'Shift Registers'),
          skeletonUnit(id: 'phy707-m6-u2', title: 'Asynchronous (Ripple) Counters'),
          skeletonUnit(id: 'phy707-m6-u3', title: 'Synchronous Counters'),
          skeletonUnit(id: 'phy707-m6-u4', title: 'Real-world applications'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m7',
        title: 'Physical Implementation & Logic Families',
        summary: 'Physical Implementation & Logic Families',
        units: [
          skeletonUnit(id: 'phy707-m7-u1', title: 'What is a Logic Family?'),
          skeletonUnit(id: 'phy707-m7-u2', title: 'DTL (Diode-Transistor Logic) & TTL (Transistor-Transistor Logic)'),
          skeletonUnit(id: 'phy707-m7-u3', title: 'CMOS (Complementary Metal-Oxide-Semiconductor)'),
          skeletonUnit(id: 'phy707-m7-u4', title: 'NMOS & ECL (Emitter-Coupled Logic)'),
          skeletonUnit(id: 'phy707-m7-u5', title: 'Key Electrical Metrics'),
        ],
      ),
      skeletonModule(
        id: 'phy707-m8',
        title: 'Analog-Digital Interfacing (DAC and ADC)',
        summary: 'Analog-Digital Interfacing (DAC and ADC)',
        units: [
          skeletonUnit(id: 'phy707-m8-u1', title: 'The Real World vs. Digital World'),
          skeletonUnit(id: 'phy707-m8-u2', title: 'Digital-to-Analog Conversion (DAC)'),
          skeletonUnit(id: 'phy707-m8-u3', title: 'Analog-to-Digital Conversion (ADC)'),
          skeletonUnit(id: 'phy707-m8-u4', title: 'Sampling & Quantization'),
        ],
      ),
    ],
  );
}
