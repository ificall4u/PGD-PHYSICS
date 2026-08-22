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
            Module(
        id: 'phy707-m2',
        title: 'Boolean Algebra & De Morgan\'s Laws',
        summary:
            'Boolean variables as switches, fundamental identities, commutative/associative/distributive laws, De Morgan.',
        units: [
          Unit(
            id: 'phy707-m2-u1',
            title: 'Physical logic rules',
            content: r'''
## Learning goal

Treat Boolean 0 and 1 and variables as open/closed switch states that combine with AND, OR, and NOT.

## Constants and variables

- **0** — switch open / wire LOW / false  
- **1** — switch closed / wire HIGH / true  
- Variable **A** — a signal that is either 0 or 1 at any moment  

## Combining switches

AND is series combination; OR is parallel; NOT is inversion. Boolean algebra is the algebra of these combinations — same results as truth tables, but with algebraic rewriting.

## Check yourself

If A is a switch, what does “A = 1” mean in the switch picture?
''',
            keyTakeaways: [
              '0 and 1 are the two Boolean constants (open/closed, LOW/HIGH).',
              'Variables stand for signals that take those values.',
              'AND/OR/NOT match series, parallel, and invert operations.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m2-u1-q1',
                question: 'In the switch analogy, Boolean 1 typically means',
                options: [
                  'Open switch / LOW',
                  'Closed switch / HIGH',
                  'Undefined always',
                  'Alternating current only',
                ],
                correctIndex: 1,
                explanation: '1 is the closed/ON/HIGH state in the usual positive-logic picture.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m2-u2',
            title: 'Fundamental laws of Boolean algebra',
            content: r'''
## Learning goal

State identity, null, idempotent, and inverse laws with circuit intuition.

## Identity

A · 1 = A (AND with closed switch in series does nothing)  
A + 0 = A (OR with open switch in parallel does nothing)

## Null (domination)

A · 0 = 0 (series open kills the path)  
A + 1 = 1 (parallel closed forces HIGH)

## Idempotent

A · A = A  
A + A = A  

Two identical switches in series or parallel act like one.

## Inverse (complement)

A · A′ = 0  
A + A′ = 1  

A and NOT A cannot both be 1; one of them is always 1 in OR.

## Check yourself

What is A + 1? What is A · 0?
''',
            keyTakeaways: [
              'Identity: A·1 = A, A+0 = A.',
              'Null: A·0 = 0, A+1 = 1.',
              'Idempotent: A·A = A, A+A = A; inverse: A·A′ = 0, A+A′ = 1.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m2-u2-q1',
                question: 'The identity law includes',
                options: [
                  'A · 0 = A',
                  'A · 1 = A',
                  'A + 1 = 0',
                  'A · A′ = 1',
                ],
                correctIndex: 1,
                explanation: 'AND with 1 leaves A unchanged.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m2-u3',
            title: 'Commutative, associative, and distributive laws',
            content: r'''
## Learning goal

Use commutative, associative, and distributive laws to rearrange and simplify expressions without changing behaviour.

## Commutative

A · B = B · A  
A + B = B + A  

Order of inputs to AND or OR does not matter.

## Associative

(A · B) · C = A · (B · C)  
(A + B) + C = A + (B + C)  

Grouping of the same operation does not matter.

## Distributive

A · (B + C) = (A · B) + (A · C)  
A + (B · C) = (A + B) · (A + C)  

(The second form is Boolean-specific and differs from ordinary algebra.)

## Why simplify

Fewer gates, fewer inputs, less delay and power — same truth table.

## Check yourself

Expand A · (B + C) using the distributive law.
''',
            keyTakeaways: [
              'AND and OR are commutative and associative.',
              'Both distributive forms hold in Boolean algebra.',
              'Algebraic rewriting preserves the truth table when laws are applied correctly.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m2-u3-q1',
                question: 'A · (B + C) equals',
                options: [
                  'A + B + C',
                  '(A · B) + (A · C)',
                  'A · B · C',
                  '0 always',
                ],
                correctIndex: 1,
                explanation: 'Distributive law of AND over OR.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m2-u4',
            title: 'De Morgan\'s laws',
            content: r'''
## Learning goal

State both De Morgan laws and interpret them in plain English.

## Law 1

(A · B)′ = A′ + B′  

“NOT (A AND B)” means you failed to have both — so you lack A **or** lack B (or both).

## Law 2

(A + B)′ = A′ · B′  

“NOT (A OR B)” means neither is true — so NOT A **and** NOT B.

## Pie and cake

Not having both pie and cake = no pie OR no cake.  
Not having pie or cake (neither available) = no pie AND no cake.

## Circuit use

De Morgan converts AND–OR structures into NAND/NOR-friendly forms and moves bubbles on gate symbols systematically.

## Check yourself

Apply De Morgan to (A + B)′.
''',
            keyTakeaways: [
              '(A·B)′ = A′ + B′.',
              '(A+B)′ = A′ · B′.',
              'De Morgan swaps AND/OR and complements each literal.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m2-u4-q1',
                question: '(A · B)′ equals',
                options: [
                  'A′ · B′',
                  'A′ + B′',
                  'A + B',
                  'A · B',
                ],
                correctIndex: 1,
                explanation: 'De Morgan: negate and swap AND for OR.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy707-m3',
        title: 'Circuit Minimization (Karnaugh Maps & Quine-McCluskey)',
        summary:
            'Why minimize logic, K-map grouping for 2–4 variables, Quine–McCluskey tabular idea.',
        units: [
          Unit(
            id: 'phy707-m3-u1',
            title: 'The goal of minimization',
            content: r'''
## Learning goal

Explain why simpler Boolean expressions mean cheaper, cooler, and often faster hardware.

## Cost and area

Each gate and each gate input costs silicon area and design effort. Fewer literals and fewer product terms → fewer transistors.

## Power and delay

Fewer transitions and shorter logic depth reduce dynamic power and can shorten critical-path delay. Minimization is not only elegance — it is engineering economy.

## Same function

Minimization preserves the truth table: the simplified circuit must match the original outputs for every input pattern (including don’t-cares when specified).

## Check yourself

If two circuits implement the same truth table, why might the one with fewer gates still be preferred?
''',
            keyTakeaways: [
              'Minimization cuts gates, area, power, and often delay.',
              'The truth table (function) must stay the same.',
              'Practical digital design routinely simplifies before implementation.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m3-u1-q1',
                question: 'Logic minimization aims to',
                options: [
                  'Change the truth table randomly',
                  'Reduce gate count/complexity while preserving the function',
                  'Always add more gates',
                  'Remove binary numbers from computing',
                ],
                correctIndex: 1,
                explanation: 'Simplify implementation, not change the specified behaviour.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m3-u2',
            title: 'Karnaugh maps (K-maps)',
            content: r'''
## Learning goal

Use K-maps as a Gray-code grid of the truth table and group adjacent 1s to eliminate variables.

## What a K-map is

A K-map rearranges truth-table rows into a grid where **adjacent cells differ by only one bit** (Gray code order). Adjacent 1s correspond to terms that can merge by dropping the variable that changes.

## Grouping rules

- Group rectangular blocks of 1, 2, 4, 8, … cells (powers of two).  
- Groups may wrap around edges (the map is toroidal in each dimension).  
- Cover every 1 at least once; larger groups mean fewer literals.  
- Don’t-care cells (X) may be included in groups if helpful, but need not be covered.

## 2-, 3-, and 4-variable maps

- 2 variables: 2×2 grid  
- 3 variables: 2×4 grid  
- 4 variables: 4×4 grid  

Read each group as a product term: only variables that stay constant in the group appear; the bit value chooses A or A′.

## Check yourself

Why must group sizes be powers of two?
''',
            keyTakeaways: [
              'K-map: Gray-code grid so adjacency = one-bit difference.',
              'Group 1/2/4/8… ones; read constant variables as a product term.',
              'Works smoothly up through 4 variables by hand.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m3-u2-q1',
                question: 'Adjacent cells in a K-map differ by',
                options: [
                  'All bits always',
                  'Exactly one bit (Gray-code adjacency)',
                  'No relation to binary',
                  'Two bits always only',
                ],
                correctIndex: 1,
                explanation: 'Gray adjacency enables merging terms that differ in one variable.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m3-u3',
            title: 'Quine–McCluskey (tabular method)',
            content: r'''
## Learning goal

Describe Quine–McCluskey as a systematic tabular algorithm for prime implicants when K-maps become unwieldy.

## When K-maps struggle

With 5+ variables, drawing and seeing adjacencies by hand is hard. Quine–McCluskey does the same merging **algorithmically** on a computer or by careful tables.

## Idea of the method

1. List all minterms (where the function is 1).  
2. Repeatedly combine pairs that differ by one bit; mark terms that combine.  
3. Terms that never combine are **prime implicants**.  
4. Choose a minimal set of prime implicants that cover all minterms (prime implicant chart).

## Outcome

A minimal sum-of-products (or dual product-of-sums) implementation — same goal as K-maps, scalable with automation.

## Check yourself

What is a prime implicant in one plain sentence?
''',
            keyTakeaways: [
              'Quine–McCluskey: tabular, algorithmic minimization.',
              'Combine minterms differing by one bit → prime implicants.',
              'Cover chart selects a minimal set of prime implicants.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m3-u3-q1',
                question: 'Quine–McCluskey is especially useful when',
                options: [
                  'There is only one variable',
                  'Many variables make K-maps impractical by hand',
                  'No truth table exists',
                  'Analog voltages are required',
                ],
                correctIndex: 1,
                explanation: 'The tabular method scales beyond convenient K-map size.',
              ),
            ],
          ),
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
