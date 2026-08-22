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
            Module(
        id: 'phy707-m4',
        title: 'Combinational Logic, Multiplexers, and Demultiplexers',
        summary:
            'Combinational logic definition, MUX, DEMUX, encoders and decoders including 7-segment idea.',
        units: [
          Unit(
            id: 'phy707-m4-u1',
            title: 'Combinational logic',
            content: r'''
## Learning goal

Define combinational logic as circuits whose outputs depend only on current inputs — no memory of the past.

## Definition

In a **combinational** circuit, each output is a Boolean function of the present inputs alone. There are no feedback loops that store state, and no clocks required for the definition (though real gates have delay).

## Contrast with sequential

Sequential circuits (next modules) remember past inputs via latches and flip-flops. Combinational blocks are the “instant logic” pieces: adders, muxes, decoders, ALU slices.

## Design flow

Specify truth table or equations → minimize → implement with gates or standard cells → verify every input combination.

## Check yourself

If an output depends on which button was pressed last time, is that purely combinational?
''',
            keyTakeaways: [
              'Combinational: outputs = function of current inputs only.',
              'No internal memory state in the ideal model.',
              'Building blocks: gates, mux, demux, encoder, decoder, adder, …',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m4-u1-q1',
                question: 'A combinational circuit\'s outputs depend on',
                options: [
                  'Only the distant past',
                  'Current inputs only (no stored state)',
                  'Random noise only',
                  'Temperature exclusively',
                ],
                correctIndex: 1,
                explanation: 'No memory element in pure combinational logic.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m4-u2',
            title: 'Multiplexers (MUX — data selectors)',
            content: r'''
## Learning goal

Describe a multiplexer as selecting one of several data inputs onto a single output using select lines — the railway-switch picture.

## Railway analogy

Several tracks (data inputs) can feed one outgoing track. A lever (select lines) chooses which incoming track connects through.

## 2-to-1 MUX

Inputs D0, D1; select S; output Y.

Y = S′ D0 + S D1

When S = 0, Y follows D0; when S = 1, Y follows D1. Built from two AND gates, one NOT, and one OR (or equivalent).

## 4-to-1 MUX

Two select bits S1 S0 choose among D0–D3. One of four AND terms is enabled; OR combines them. Cascading 2-to-1 muxes also builds larger muxes.

## Check yourself

For a 2-to-1 MUX with S = 1, which data input appears at Y?
''',
            keyTakeaways: [
              'MUX selects one of many data inputs onto one output.',
              'Select lines encode which input is routed.',
              '2-to-1: Y = S′D0 + S D1; larger muxes generalize.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m4-u2-q1',
                question: 'A multiplexer',
                options: [
                  'Always adds numbers',
                  'Routes one of several inputs to a single output under select control',
                  'Stores bits indefinitely without power',
                  'Only inverts signals',
                ],
                correctIndex: 1,
                explanation: 'MUX is a data selector.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m4-u3',
            title: 'Demultiplexers (DEMUX — data distributors)',
            content: r'''
## Learning goal

Describe a demultiplexer as the reverse of a mux: one input steered to one of many outputs by select lines.

## Picture

One incoming track splits to several destinations; the select lever chooses the destination. Only one output path is active (in the basic binary DEMUX); others stay inactive (often 0).

## Relation to decoder

A demux with the data input tied to 1 acts like a decoder: select lines turn on exactly one output line. Decoders and demuxes are closely related blocks.

## Use cases

Routing a shared line to one of several destinations; enabling one device among many; building larger steering networks.

## Check yourself

How does a DEMUX differ from a MUX in the number of data inputs vs outputs?
''',
            keyTakeaways: [
              'DEMUX: one data input → one of many outputs via selects.',
              'Inverse steering role relative to MUX.',
              'Tied-high data input → binary decoder behaviour.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m4-u3-q1',
                question: 'A demultiplexer',
                options: [
                  'Merges many inputs into one output only',
                  'Sends one input to one of several outputs chosen by selects',
                  'Is identical to a resistor',
                  'Cannot use select lines',
                ],
                correctIndex: 1,
                explanation: 'DEMUX distributes one input to a selected output.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m4-u4',
            title: 'Encoders and decoders',
            content: r'''
## Learning goal

Define encoders and decoders and connect decoders to 7-segment displays.

## Decoder

n select (input) bits → up to 2ⁿ one-hot outputs (exactly one output active). Example: 2-to-4 and 3-to-8 decoders. Used for address decoding and seven-segment digit patterns when combined with further mapping.

## Encoder

Reverse idea: multiple inputs (often one-hot) → fewer bits encoding which input was active. Priority encoders handle multiple simultaneous inputs by ranking them.

## 7-segment displays

A binary digit (or BCD nibble) feeds a decoder/driver that lights the correct subset of seven segments (a–g) to draw 0–9. The decoder maps each code to a pattern of segment ON/OFF values — pure combinational logic.

## Check yourself

Why is a 3-to-8 decoder a natural fit for selecting one of eight memory chips?
''',
            keyTakeaways: [
              'Decoder: n bits → one of 2ⁿ lines active.',
              'Encoder: many lines → compact binary code.',
              '7-segment drivers map codes to segment patterns combinationally.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m4-u4-q1',
                question: 'A binary decoder typically',
                options: [
                  'Compresses many bits into heat only',
                  'Activates one of 2ⁿ outputs from an n-bit code',
                  'Stores analog voltages',
                  'Replaces the need for any select input',
                ],
                correctIndex: 1,
                explanation: 'n-to-2ⁿ decoding is the standard one-hot expansion.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy707-m5',
        title: 'Sequential Logic & Memory (Flip-Flops)',
        summary:
            'Feedback memory, SR latch, clocking, D flip-flop, JK and T flip-flops.',
        units: [
          Unit(
            id: 'phy707-m5-u1',
            title: 'Memory in circuits',
            content: r'''
## Learning goal

Explain how feedback lets a circuit depend on the past — the essence of sequential logic.

## Combinational limit

Pure gates without loops forget the past: outputs track inputs only. To remember, the circuit needs a state that persists.

## Feedback

Connecting outputs back to inputs creates loops. The circuit can settle into a stable pattern that remains even after the original forcing input is removed — **memory**.

## Sequential logic

Outputs depend on current inputs **and** current state (history). Clocks often coordinate when state is allowed to change (synchronous design).

## Check yourself

Why can a loop of gates hold a value that is no longer present at any external input?
''',
            keyTakeaways: [
              'Memory requires state, often via feedback.',
              'Sequential outputs depend on inputs and past state.',
              'Clocks commonly synchronize state updates.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m5-u1-q1',
                question: 'Sequential logic differs from combinational logic by',
                options: [
                  'Never using gates',
                  'Depending on past state as well as current inputs',
                  'Avoiding binary values',
                  'Only analog voltages',
                ],
                correctIndex: 1,
                explanation: 'State/memory is the defining addition.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m5-u2',
            title: 'SR latch (set–reset)',
            content: r'''
## Learning goal

Describe the SR latch with cross-coupled NOR or NAND gates, including the forbidden input combination.

## Cross-coupled pair

Two NOR gates (or two NAND gates) with cross feedback form a bistable circuit: it holds Q = 1 or Q = 0 until told to change.

## Set and reset

- **Set (S):** force Q to 1  
- **Reset (R):** force Q to 0  
- **Hold:** both inactive — remember previous Q  

## Illegal state

For the NOR SR latch, S = R = 1 is invalid: both outputs driven in a conflicting way; releasing may cause a race. Designers avoid that input combination (NAND SR has a related forbidden case depending on active level).

## Check yourself

After Set makes Q = 1, if both S and R go inactive, what should Q do?
''',
            keyTakeaways: [
              'SR latch: cross-coupled gates store one bit.',
              'Set forces 1; Reset forces 0; idle holds.',
              'Avoid the illegal S=R=1 (NOR) combination.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m5-u2-q1',
                question: 'An SR latch is primarily used to',
                options: [
                  'Add floating-point numbers',
                  'Store one bit with set and reset controls',
                  'Replace the power supply',
                  'Generate radio waves only',
                ],
                correctIndex: 1,
                explanation: 'It is a basic 1-bit bistable memory element.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m5-u3',
            title: 'Clocked flip-flops',
            content: r'''
## Learning goal

Introduce the clock as a shared heartbeat that times when sequential elements may change state.

## Why clock?

Without coordination, cascading latches can be transparent at the wrong time and race. A **clock** signal defines instants (edges) or windows (levels) when state updates are allowed.

## Flip-flop vs latch

- **Latch:** often level-sensitive (transparent while enable is active)  
- **Flip-flop:** edge-triggered (samples inputs on rising or falling clock edge)

Edge-triggered flip-flops are the standard building block of synchronous digital systems.

## Check yourself

What problem does a common clock help prevent in a chain of memory elements?
''',
            keyTakeaways: [
              'Clock synchronizes when state may change.',
              'Flip-flops are typically edge-triggered.',
              'Synchronous design uses one timing reference for registers.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m5-u3-q1',
                question: 'Edge-triggered flip-flops update state',
                options: [
                  'Continuously at all times randomly',
                  'On a clock edge (rising or falling as designed)',
                  'Only when power is removed',
                  'Never',
                ],
                correctIndex: 1,
                explanation: 'The defining sample moment is the active clock edge.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m5-u4',
            title: 'D flip-flop (data/delay)',
            content: r'''
## Learning goal

Present the D flip-flop as the standard 1-bit register cell: Q follows D at the clock edge.

## Behaviour

On the active clock edge, Q becomes equal to D. Between edges, Q holds its value regardless of D (ideally).

## Use

Pipelines, shift registers, finite-state machines, and the storage cells behind much of “register” storage in digital chips. Chaining D flip-flops with a shared clock builds multi-bit registers.

## Setup and hold (awareness)

D must be stable a little before (setup) and after (hold) the clock edge so the sampling is reliable — timing rules of real hardware.

## Check yourself

If D changes long after the clock edge, when does Q next update?
''',
            keyTakeaways: [
              'D FF: Q ← D at the active clock edge; then hold.',
              'Basic 1-bit synchronous memory cell.',
              'Registers are arrays of D flip-flops.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m5-u4-q1',
                question: 'A D flip-flop on its active clock edge',
                options: [
                  'Ignores D always',
                  'Copies D to Q',
                  'Clears the power rail',
                  'Multiplies D by 2',
                ],
                correctIndex: 1,
                explanation: 'Q becomes D at the triggering edge.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m5-u5',
            title: 'JK and T flip-flops',
            content: r'''
## Learning goal

Describe JK as an SR-like element without the illegal state, and T as a toggle flip-flop.

## JK flip-flop

Inputs J and K:

- J=1, K=0 → set  
- J=0, K=1 → reset  
- J=0, K=0 → hold  
- J=1, K=1 → **toggle** Q  

The toggle case replaces the illegal SR combination with a defined behaviour.

## T flip-flop

Single input T: when T=1 at the clock edge, Q toggles; when T=0, Q holds. Equivalent to a JK with J=K=T. Natural for binary counters (each bit toggles when lower bits overflow).

## Check yourself

If a T flip-flop has T tied to 1, what does Q do on every clock edge?
''',
            keyTakeaways: [
              'JK: set/reset/hold/toggle — no illegal SR pair.',
              'T: toggle when T=1; foundation of binary counting.',
              'Both are edge-triggered sequential primitives.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m5-u5-q1',
                question: 'When J=K=1, a JK flip-flop',
                options: [
                  'Enters an undefined illegal state always like basic NOR SR',
                  'Toggles Q on the active clock edge',
                  'Destroys the chip',
                  'Ignores the clock forever',
                ],
                correctIndex: 1,
                explanation: 'JK defines J=K=1 as toggle.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy707-m6',
        title: 'Registers and Counters',
        summary:
            'Shift registers, ripple counters, synchronous counters, clocks and timers applications.',
        units: [
          Unit(
            id: 'phy707-m6-u1',
            title: 'Shift registers',
            content: r'''
## Learning goal

Describe a shift register as a chain of flip-flops that moves bits along on each clock.

## Chain of D flip-flops

Connect Q of each stage to D of the next, share one clock. On every active edge, each bit shifts one position. A new bit can enter the first stage; the last stage emits a serial stream.

## Serial ↔ parallel

- **SIPO:** serial in, parallel out — collect bits then read all Qs at once  
- **PISO:** parallel load, then shift out serially  
- **SISO / PIPO:** other useful combinations  

## Use

Communication links, LED drivers, delay lines, and temporary storage of multi-bit words.

## Check yourself

After four clocks, where is the bit that entered a 4-bit SIPO shift register on the first clock?
''',
            keyTakeaways: [
              'Shift register: cascade of flip-flops sharing a clock.',
              'Each edge moves data one stage along the chain.',
              'Supports serial/parallel conversion patterns.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m6-u1-q1',
                question: 'In a simple shift register, bits move',
                options: [
                  'Only when power is removed',
                  'From stage to stage on each clock edge',
                  'Randomly without a clock',
                  'Only through resistors',
                ],
                correctIndex: 1,
                explanation: 'Clocked transfers shift the bit pattern along the chain.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m6-u2',
            title: 'Asynchronous (ripple) counters',
            content: r'''
## Learning goal

Build a binary count with toggled flip-flops where each stage is clocked by the previous stage’s output — and note the ripple delay problem.

## Structure

Wire T flip-flops (or JK with J=K=1) so the first is clocked by the external clock and each next stage is clocked by the Q of the previous stage. Each bit toggles at half the rate of the one before → binary up-count.

## Ripple effect

A change must propagate through successive stages. Intermediate patterns can be briefly wrong; total delay grows with the number of bits. At high clock rates this limits reliable decoding of all bits at once.

## Check yourself

Why might a fast system prefer not to decode a wide ripple counter’s outputs right after the clock?
''',
            keyTakeaways: [
              'Ripple counter: each stage clocks the next.',
              'Natural binary counting via successive divide-by-2.',
              'Propagation “ripple” delays limit speed and clean decoding.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m6-u2-q1',
                question: 'In a ripple counter, higher bits toggle',
                options: [
                  'At the same rate as the input clock always',
                  'More slowly — after lower bits complete their cycles',
                  'Never',
                  'Only when asynchronous means simultaneous',
                ],
                correctIndex: 1,
                explanation: 'Each stage divides frequency by 2; delay accumulates.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m6-u3',
            title: 'Synchronous counters',
            content: r'''
## Learning goal

Contrast synchronous counters where all flip-flops share one common clock, with combinational logic deciding which bits toggle.

## Common clock

Every stage receives the same clock edge. Toggle enables are computed from current state (e.g. toggle bit i when all lower bits are 1 for a binary up-counter). No ripple through clocks — only combinational delay for the enable logic.

## Sequences

- Binary up / down  
- Modulo-N (reset or recycle after N states)  
- Arbitrary state sequences with suitable next-state logic  

## Advantage

All bits update together; intermediate illegal counts from ripple are avoided (assuming the enable logic meets timing).

## Check yourself

What must the combinational logic compute for each T input in a synchronous binary up-counter?
''',
            keyTakeaways: [
              'Synchronous: shared clock; enables from state logic.',
              'Supports up/down and modulo-N designs cleanly.',
              'Avoids multi-stage clock ripple.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m6-u3-q1',
                question: 'A synchronous counter clocks',
                options: [
                  'Only the LSB from the MSB output',
                  'All flip-flops from a common clock',
                  'Nothing ever',
                  'Only using asynchronous resets as clocks',
                ],
                correctIndex: 1,
                explanation: 'Shared clock defines synchronous sequential design.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m6-u4',
            title: 'Real-world applications',
            content: r'''
## Learning goal

Connect counters and registers to clocks, timers, and event counting.

## Digital clocks and timers

Counters divide a stable oscillator (crystal) down to seconds, minutes, and hours. Cascaded modulo-60 and modulo-24 stages build clock calendars.

## Event counters

Each event pulse advances a counter — laboratory instrumentation, traffic counts, digital scorekeepers.

## Embedded control

Microcontrollers use timers/counters for PWM, baud-rate generation, and periodic interrupts — the same divide-and-count idea in silicon peripherals.

## Check yourself

Why is a stable frequency reference important before a chain of counters can keep accurate time?
''',
            keyTakeaways: [
              'Counters divide timebase frequencies for clocks and timers.',
              'Event counting accumulates external pulses.',
              'Same blocks appear inside MCU timer peripherals.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m6-u4-q1',
                question: 'A digital clock typically uses counters to',
                options: [
                  'Generate heat only',
                  'Divide a reference oscillator into seconds and minutes',
                  'Replace the need for any crystal',
                  'Store analog music only',
                ],
                correctIndex: 1,
                explanation: 'Frequency division by counting builds civil time units.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy707-m7',
        title: 'Physical Implementation & Logic Families',
        summary:
            'Logic families overview, DTL/TTL, CMOS, NMOS/ECL, noise margin delay and power metrics.',
        units: [
          Unit(
            id: 'phy707-m7-u1',
            title: 'What is a logic family?',
            content: r'''
## Learning goal

Define a logic family as a consistent way of building gates from electronic devices that share voltage levels and electrical characteristics.

## From abstract gates to silicon

AND, OR, and NOT are abstract. A **logic family** specifies how those functions are implemented with transistors, diodes, and resistors, and which voltages mean 0 and 1.

## Why families matter

Gates from the same family interconnect cleanly (levels, fan-out, speed). Mixing families may need level shifters. Choosing a family trades speed, power, density, and cost.

## Check yourself

Why might two chips both labelled “NAND” still be electrically incompatible?
''',
            keyTakeaways: [
              'Logic family = physical recipe for gates + shared electrical rules.',
              'Same family → compatible levels and drive.',
              'Choice balances speed, power, and density.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m7-u1-q1',
                question: 'A logic family primarily specifies',
                options: [
                  'Only the colour of the package',
                  'How gates are built and which electrical levels represent 0 and 1',
                  'The brand of solder only',
                  'Analog radio protocols exclusively',
                ],
                correctIndex: 1,
                explanation: 'Implementation technology and signalling conventions define the family.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m7-u2',
            title: 'DTL and TTL',
            content: r'''
## Learning goal

Sketch the historical path from diode–transistor logic to transistor–transistor logic using BJTs.

## DTL

**Diode–transistor logic** uses diode networks for AND/OR-like combining and a BJT for inversion/gain. Workable but limited speed and integration density by modern standards.

## TTL

**Transistor–transistor logic** replaces input diode networks with multi-emitter BJT structures and saturated BJT switching. Classic 5 V TTL dominated mid-era digital hardware (7400-series culture). Faster and more integrated than DTL, still bipolar and relatively power-hungry compared with CMOS.

## Check yourself

What device type is the main switching element in classic TTL?
''',
            keyTakeaways: [
              'DTL: diodes + BJT gain stage.',
              'TTL: BJT-based, multi-emitter inputs, 5 V classic era.',
              'Bipolar families: solid speed, higher static power than CMOS.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m7-u2-q1',
                question: 'Classic TTL gates are based primarily on',
                options: [
                  'Only vacuum tubes',
                  'Bipolar junction transistors',
                  'Only optical switches',
                  'Mechanical relays exclusively',
                ],
                correctIndex: 1,
                explanation: 'TTL is a bipolar transistor logic family.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m7-u3',
            title: 'CMOS',
            content: r'''
## Learning goal

Explain complementary MOS logic: n- and p-channel MOSFET pairs and why static power is nearly zero.

## Complementary pair

A basic CMOS inverter uses a p-MOS pull-up and an n-MOS pull-down. When the input is LOW, p-MOS is on and n-MOS off → output HIGH. When input is HIGH, the opposite → output LOW. Only one path is strongly on in steady state.

## Static power

In ideal steady state no DC path from supply to ground exists through the complementary pair → **near-zero static power**. Energy is used mainly when switching (charging capacitances). That is why CMOS dominates microprocessors and dense digital ICs.

## Check yourself

Why does a pure n-MOS load logic tend to waste more static power than complementary CMOS?
''',
            keyTakeaways: [
              'CMOS: complementary p-MOS and n-MOS networks.',
              'Steady state: no DC path → tiny static power.',
              'Dominant technology for modern digital chips.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m7-u3-q1',
                question: 'CMOS is valued in large digital chips largely because',
                options: [
                  'It always draws maximum DC current',
                  'Static power is very low when not switching',
                  'It cannot implement inverters',
                  'It requires vacuum tubes',
                ],
                correctIndex: 1,
                explanation: 'Complementary structure avoids DC paths in steady states.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m7-u4',
            title: 'NMOS and ECL',
            content: r'''
## Learning goal

Place NMOS and ECL as specialized families: density vs ultimate speed.

## NMOS

n-channel MOS logic (historically important) used n-MOS transistors with load devices. Good density for its era but continuous current in some states — higher static power than CMOS, which largely superseded it for general logic.

## ECL

**Emitter-coupled logic** keeps BJTs out of heavy saturation, steering current between branches. Very fast, used in niche high-speed systems, at the cost of high static power and specialized levels.

## Check yourself

If you needed the absolute lowest propagation delay regardless of power, which specialized bipolar style was historically chosen?
''',
            keyTakeaways: [
              'NMOS: historically dense MOS logic; more static power than CMOS.',
              'ECL: ultra-fast non-saturated bipolar switching.',
              'Speed/power trade-offs drive family choice.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m7-u4-q1',
                question: 'ECL is known for',
                options: [
                  'Lowest possible power always',
                  'Very high speed using non-saturated current steering',
                  'Being identical to CMOS',
                  'Only optical computing',
                ],
                correctIndex: 1,
                explanation: 'Emitter-coupled logic targets high speed at high power cost.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m7-u5',
            title: 'Key electrical metrics',
            content: r'''
## Learning goal

Define noise margin, propagation delay, and power dissipation in plain language.

## Noise margins

How much noise can sit on a valid 0 or 1 before the next gate might misread it. Larger margins → more robust in electrically noisy environments.

## Propagation delay

Time from an input change until the output settles to the new valid level. Sets how fast a clock can run in synchronous systems (with setup constraints).

## Power dissipation

Static (idle) plus dynamic (switching, CV²f). CMOS shines on static power; every family pays dynamic cost when nodes toggle.

## Check yourself

If clock frequency doubles and all else is equal, what happens to dynamic power roughly?
''',
            keyTakeaways: [
              'Noise margin: immunity to misreading levels.',
              'Propagation delay: speed limit for logic paths.',
              'Power: static + dynamic; CMOS minimizes static.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m7-u5-q1',
                question: 'Propagation delay measures',
                options: [
                  'Only the cost of the chip package',
                  'How long a gate takes to respond to an input change',
                  'Magnetic field strength only',
                  'Battery chemistry',
                ],
                correctIndex: 1,
                explanation: 'Delay from input transition to valid output transition.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy707-m8',
        title: 'Analog-Digital Interfacing (DAC and ADC)',
        summary:
            'Analog vs digital, DAC (weighted and R-2R), ADC (flash and SAR), sampling and quantization.',
        units: [
          Unit(
            id: 'phy707-m8-u1',
            title: 'The real world vs the digital world',
            content: r'''
## Learning goal

Contrast continuous analog quantities with discrete digital representations.

## Analog

Temperature, sound pressure, and sensor voltages vary smoothly. Between any two values there are others — a continuum.

## Digital

Computation and storage use finite bit patterns: only specific levels (ideally two per bit). To process the real world in a microcontroller, we must **sample** in time and **quantize** in amplitude.

## Interface role

DACs turn bit patterns into voltages or currents; ADCs turn voltages into bit patterns. They are the bridges between physics and binary logic.

## Check yourself

Is a 16-bit recording of a song still analog at the speaker, or digital inside the file?
''',
            keyTakeaways: [
              'Analog: continuous physical quantities.',
              'Digital: discrete bit patterns.',
              'ADC/DAC bridge the two domains.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m8-u1-q1',
                question: 'An analog signal is characterized by',
                options: [
                  'Only two allowed values ever',
                  'Continuous range of values',
                  'Being stored only as ASCII text',
                  'Never interacting with sensors',
                ],
                correctIndex: 1,
                explanation: 'Analog quantities vary continuously.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m8-u2',
            title: 'Digital-to-analog conversion (DAC)',
            content: r'''
## Learning goal

Explain binary-weighted resistor DACs and the R-2R ladder using only two resistor values.

## Binary-weighted network

Each bit switches a current or voltage contribution proportional to 1, 2, 4, 8, … (powers of two). Summing produces an analog level matching the binary code. Problem: many different precise resistor values are hard to match on a chip.

## R-2R ladder

A ladder network using only resistances R and 2R creates successive voltage division by two at each stage. Bits switch nodes of the ladder; the output still weights bits binary-style. Manufacturing likes having only two resistor values to match.

## Result

More bits → finer steps (higher resolution), requiring tighter matching and lower noise.

## Check yourself

Why is an R-2R ladder easier to build accurately than a full set of binary-weighted resistors?
''',
            keyTakeaways: [
              'DAC maps digital codes to analog voltages/currents.',
              'Weighted resistors: simple idea, hard matching.',
              'R-2R: binary weights with only R and 2R.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m8-u2-q1',
                question: 'An R-2R ladder DAC is popular because',
                options: [
                  'It needs infinitely many resistor values',
                  'It builds binary weights using only two resistor values',
                  'It cannot produce analog output',
                  'It only works with optical signals',
                ],
                correctIndex: 1,
                explanation: 'Matched R and 2R networks realize binary division cleanly.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m8-u3',
            title: 'Analog-to-digital conversion (ADC)',
            content: r'''
## Learning goal

Contrast flash ADCs (speed) with successive-approximation ADCs (binary search).

## Flash ADC

A bank of comparators compares the input against a resistor-string ladder of thresholds in parallel. Encoder logic outputs the binary code. Extremely fast; hardware cost grows exponentially with bits (2ⁿ − 1 comparators).

## SAR ADC (balance scale)

**Successive approximation** guesses the MSB first, tests with an internal DAC, then refines lower bits — a **binary search** for the code that best matches the input. Moderate speed, excellent efficiency for many embedded uses.

## Other types (awareness)

Pipeline, sigma-delta, dual-slope — each optimizes different speed/resolution/power corners.

## Check yourself

Why does an 8-bit flash ADC need far more comparators than an 8-bit SAR?
''',
            keyTakeaways: [
              'Flash: parallel comparators — fastest, most hardware.',
              'SAR: binary-search bit trials — efficient workhorse.',
              'Architecture chosen by speed, resolution, and power needs.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m8-u3-q1',
                question: 'A successive-approximation ADC finds the code by',
                options: [
                  'Only one comparison ever',
                  'Binary-search style bit decisions using an internal DAC',
                  'Avoiding all digital logic',
                  'Measuring only temperature',
                ],
                correctIndex: 1,
                explanation: 'SAR refines the digital estimate bit by bit.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-m8-u4',
            title: 'Sampling and quantization',
            content: r'''
## Learning goal

State the sampling idea behind the Nyquist criterion and what quantization does to amplitude.

## Sampling in time

An ADC measures the analog waveform at discrete instants. If samples are too infrequent, fast wiggles are missed or look like slower ones (**aliasing**). The **Nyquist** idea: to represent a signal that contains frequencies up to B hertz, you need more than 2B samples per second (with ideal filters). Practical systems sample faster and filter anti-alias carefully.

## Quantization in amplitude

Each sample is rounded to the nearest allowed digital level. The error is **quantization noise**. More bits → smaller steps → less quantization error.

## Together

Sampling + quantization turn a continuous waveform into a finite list of numbers a computer can store and process.

## Check yourself

If you only care about audio up to 20 kHz, why do CDs sample at 44.1 kHz rather than 20 kHz?
''',
            keyTakeaways: [
              'Sample often enough to capture the highest frequency of interest (Nyquist).',
              'Quantization maps voltage to finite codes; more bits → finer steps.',
              'Aliasing and quantization error are the main information losses.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy707-m8-u4-q1',
                question: 'The Nyquist idea says that to represent frequencies up to B you need a sampling rate',
                options: [
                  'Much less than B always',
                  'Greater than 2B (with appropriate filtering)',
                  'Exactly equal to B only never more',
                  'Independent of B always',
                ],
                correctIndex: 1,
                explanation: 'More than two samples per cycle of the highest frequency are required in the ideal theorem.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
