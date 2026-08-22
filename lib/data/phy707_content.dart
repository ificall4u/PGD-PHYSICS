import 'package:pgd_physics/models/course.dart';

/// PHY 707 — Digital Electronics
/// Structure from content_prompts/PHY707 (placeholder lesson bodies only).
Course buildPhy707() {
  return Course(
    id: 'phy-707',
    code: 'PHY 707',
    title: 'Digital Electronics',
    description: 'Logic gates, Boolean algebra, sequential logic, families and data converters.',
    semester: 'First Semester',
    units: 3,
    icon: '▣',
    colorHint: ColorHint.orange,
    modules: [
            Module(
        id: 'phy707-m1',
        title: 'Fundamental Logic Gates & Truth Tables',
        summary:
            'Binary HIGH/LOW, basic and derived gates, truth tables for AND OR NOT NAND NOR XOR XNOR.',
        units: [
          Unit(
            id: 'phy707-m1-u1',
            title: 'Binary state intuition',
            content: r'''
## Learning goal

Explain digital representation of information as two voltage levels: HIGH (1) and LOW (0).

## Light-switch picture

A simple switch is either ON or OFF — two states. Digital circuits use the same idea with voltages: a range near the supply called **HIGH / 1 / ON**, and a range near ground called **LOW / 0 / OFF**. Everything in classical digital logic is built from decisions on those two levels.

## Why two levels?

Two states are easy to restore, store, and discriminate even with noise. Intermediate voltages are avoided in steady logic; gates actively pull outputs fully HIGH or LOW.

## Bits

One binary digit (bit) holds one 0 or 1. Patterns of bits encode numbers, text, and instructions.

## Check yourself

Why is a noisy intermediate voltage risky if a circuit expects only clean 0 or 1?
''',
            keyTakeaways: [
              'Digital logic uses two levels: HIGH (1) and LOW (0).',
              'Switches and voltages both illustrate binary states.',
              'Bits are the units of binary information.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m1-u1-q1',
                question: 'In binary digital logic, information is represented using',
                options: [
                  'Any continuous voltage with equal meaning',
                  'Two states typically called 0 and 1 (LOW and HIGH)',
                  'Only mechanical gears',
                  'Three mandatory levels always',
                ],
                correctIndex: 1,
                explanation: 'Classical digital logic is binary: two restored levels.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m1-u2',
            title: 'Basic logic gates (AND, OR, NOT)',
            content: r'''
## Learning goal

Define AND, OR, and NOT with switch–bulb analogies.

## AND gate

Two switches in **series** with a bulb: the bulb lights only if **both** switches are ON. Output is 1 only when every input is 1.

## OR gate

Two switches in **parallel**: the bulb lights if **either** switch is ON (or both). Output is 1 when at least one input is 1.

## NOT gate (inverter)

A single input that flips: HIGH in → LOW out, and vice versa. Like a switch that turns the bulb off when you “activate” the control in the inverted sense.

## Building blocks

AND, OR, and NOT are enough in principle to build any logic function; in practice we also use the derived gates of the next unit.

## Check yourself

For a 2-input AND, what is the output when inputs are 1 and 0?
''',
            keyTakeaways: [
              'AND: series switches — all inputs 1 → output 1.',
              'OR: parallel switches — any input 1 → output 1.',
              'NOT: inverts 0↔1.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m1-u2-q1',
                question: 'A 2-input OR gate outputs 1 when',
                options: [
                  'Only when both inputs are 0',
                  'When at least one input is 1',
                  'Never',
                  'Only when inputs are equal',
                ],
                correctIndex: 1,
                explanation: 'OR is 1 if any input is 1.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m1-u3',
            title: 'Derived gates (NAND, NOR, XOR, XNOR)',
            content: r'''
## Learning goal

Define NAND, NOR, XOR, and XNOR and note why NAND is universal.

## NAND and NOR

NAND = AND followed by NOT: output is 0 only when all inputs are 1.  
NOR = OR followed by NOT: output is 1 only when all inputs are 0.

**Universal gate:** any Boolean function can be built from NAND alone (or NOR alone) by suitable wiring — useful for standard-cell libraries.

## XOR (exclusive OR)

Output is 1 when inputs **differ** (one 0 and one 1). Stair-switch analogy: two switches controlling one light so the light is on when the switches disagree.

## XNOR

Complement of XOR: output is 1 when inputs **agree**.

## Check yourself

What is NAND(1,1)? What is XOR(1,0)?
''',
            keyTakeaways: [
              'NAND / NOR: inverted AND / OR; each is universal alone.',
              'XOR: 1 when inputs differ; XNOR: 1 when they agree.',
              'Derived gates simplify real designs.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m1-u3-q1',
                question: 'XOR of two bits is 1 when',
                options: [
                  'The bits are equal',
                  'The bits differ',
                  'Always',
                  'Never',
                ],
                correctIndex: 1,
                explanation: 'Exclusive-OR detects difference.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m1-u4',
            title: 'Truth tables',
            content: r'''
## Learning goal

Read and build truth tables that list every input combination and the corresponding output.

## What a truth table is

A complete list of input patterns with the gate’s output for each. For n binary inputs there are 2ⁿ rows.

## Examples (2-input)

AND: outputs 0,0,0,1 as inputs go 00,01,10,11  
OR: 0,1,1,1  
NAND: 1,1,1,0  
NOR: 1,0,0,0  
XOR: 0,1,1,0  
XNOR: 1,0,0,1  

NOT (1 input): 0→1, 1→0

## How to build one

1. List all input combinations in binary order.  
2. Apply the gate rule in plain English for each row.  
3. Fill the output column.  
4. Check edge cases (all 0, all 1).

## Check yourself

How many rows does a truth table for a 3-input AND gate have?
''',
            keyTakeaways: [
              'Truth tables list every input combination and the output.',
              'n inputs → 2ⁿ rows.',
              'Tables define gate behaviour unambiguously.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m1-u4-q1',
                question: 'A truth table for a 2-input gate has how many input rows?',
                options: [
                  '2',
                  '4',
                  '8',
                  '16',
                ],
                correctIndex: 1,
                explanation: '2² = 4 combinations: 00, 01, 10, 11.',
              ),
            ],
          ),
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
