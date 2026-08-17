import 'package:pgd_physics/models/course.dart';

/// Complete PHY 707 – Digital Electronics
/// Micro-chunked, intuition-first, visual & switch-based analogies for Tochi
Course buildPhy707() {
  return Course(
    id: 'phy707',
    code: 'PHY 707',
    title: 'Digital Electronics',
    description:
        'From simple on/off switches to the logic that runs every computer — gates, Boolean algebra, flip-flops, counters, converters and the families that make them real.',
    semester: 'First Semester',
    units: 3,
    icon: '🔢',
    colorHint: ColorHint.orange,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. LOGIC GATES – THE BASIC SWITCHES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t1',
        title: 'Logic Gates – The Basic Switches',
        summary: 'The elementary on/off decisions that everything else is built from.',
        units: [
          Unit(
            id: 'phy707-t1-u1',
            title: 'What Digital Really Means – Only Two States',
            content: r'''
# What Digital Really Means – Only Two States

Hey Tochi…

In the analogue world a voltage can be any value. In the **digital** world we deliberately restrict ourselves to just two levels:

- HIGH (usually called 1 or TRUE)
- LOW (usually called 0 or FALSE)

Everything that follows is simply clever ways of combining these two states.  
Think of an ordinary light switch: it is either ON or OFF. That is already a one-bit digital device.
''',
            keyTakeaways: [
              'Digital systems use only two voltage levels: HIGH (1) and LOW (0).',
              'All complex behaviour is built by combining these two states.',
              'A light switch is the simplest real-world digital device.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t1u1q1',
                question: 'In digital electronics, how many distinct voltage levels do we normally use?',
                options: ['One', 'Two', 'Ten', 'Infinitely many'],
                correctIndex: 1,
                explanation: 'We deliberately restrict ourselves to just two levels — that is the definition of binary digital.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t1-u2',
            title: 'NOT, AND, OR – The Three Primitive Gates',
            content: r'''
# NOT, AND, OR – The Three Primitive Gates

**NOT gate (inverter)**  
One input. Output is the opposite of the input.  
Like a light that is ON only when the switch is OFF.

**AND gate**  
Output is HIGH only if *every* input is HIGH.  
Like two switches in series: both must be closed for the light to come on.

**OR gate**  
Output is HIGH if *at least one* input is HIGH.  
Like two switches in parallel: either one is enough to light the bulb.

These three are enough to build any digital circuit in principle.
''',
            keyTakeaways: [
              'NOT flips the value.',
              'AND requires all inputs HIGH.',
              'OR requires at least one input HIGH.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t1u2q1',
                question: 'An AND gate with two inputs outputs HIGH only when…',
                options: [
                  'At least one input is HIGH',
                  'Both inputs are HIGH',
                  'Both inputs are LOW',
                  'The inputs are different',
                ],
                correctIndex: 1,
                explanation: 'AND is true only when every input is true.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t1-u3',
            title: 'NAND, NOR, XOR – The Useful Combinations',
            content: r'''
# NAND, NOR, XOR – The Useful Combinations

**NAND** = AND followed by NOT. Output is LOW only when every input is HIGH.  
(Very important in practice because it is easy to make in silicon and can implement any function.)

**NOR** = OR followed by NOT. Output is HIGH only when every input is LOW.

**XOR (Exclusive OR)**  
Output is HIGH when the inputs are *different*.  
Like a light that comes on only when exactly one of two switches is flipped — classic “either but not both”.
''',
            keyTakeaways: [
              'NAND and NOR are universal — any circuit can be built from them alone.',
              'XOR is HIGH when inputs differ.',
              'These three appear constantly in real designs.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t1u3q1',
                question: 'The output of an XOR gate is HIGH when…',
                options: [
                  'Both inputs are HIGH',
                  'Both inputs are LOW',
                  'The inputs are different',
                  'Always',
                ],
                correctIndex: 2,
                explanation: 'Exclusive-OR means “one or the other but not both”.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. BOOLEAN ALGEBRA & SIMPLIFICATION
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t2',
        title: 'Boolean Algebra and Simplification',
        summary: 'The algebra of true/false that lets us simplify complicated logic before we build it.',
        units: [
          Unit(
            id: 'phy707-t2-u1',
            title: 'Boolean Algebra – Rules of the Two-Value World',
            content: r'''
# Boolean Algebra – Rules of the Two-Value World

Just as ordinary algebra has rules for + and ×, Boolean algebra has rules for AND, OR and NOT.

A few of the most useful:

- A AND 1 = A  
- A OR 0 = A  
- A AND 0 = 0  
- A OR 1 = 1  
- A AND A = A  
- A OR A = A  
- NOT (NOT A) = A

These identities let us rewrite a complicated expression into a simpler one that needs fewer gates.
''',
            keyTakeaways: [
              'Boolean algebra is the set of rules for combining 0s and 1s.',
              'Many expressions can be dramatically simplified with a few identities.',
              'Simpler expression → fewer gates → cheaper, faster, lower-power circuit.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t2u1q1',
                question: 'What is the result of A AND 0?',
                options: ['A', '1', '0', 'NOT A'],
                correctIndex: 2,
                explanation: 'Anything ANDed with 0 is 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t2-u2',
            title: 'De Morgan’s Laws – The Two Great Dualities',
            content: r'''
# De Morgan’s Laws – The Two Great Dualities

Two extremely useful rules:

1. NOT (A AND B) = (NOT A) OR (NOT B)  
2. NOT (A OR B) = (NOT A) AND (NOT B)

In words: “breaking a NOT over an AND turns it into an OR (and vice versa), while negating each term.”

They let you convert networks of AND gates into networks of OR gates (and the other way round) and are the theoretical reason NAND and NOR are universal.
''',
            keyTakeaways: [
              'De Morgan swaps AND↔OR when you push a NOT through.',
              'Essential for converting between gate types.',
              'Underpins the universality of NAND and NOR.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t2u2q1',
                question: 'According to De Morgan, NOT (A OR B) equals…',
                options: [
                  '(NOT A) OR (NOT B)',
                  '(NOT A) AND (NOT B)',
                  'A AND B',
                  'A OR B',
                ],
                correctIndex: 1,
                explanation: 'The OR becomes AND and each variable is negated.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t2-u3',
            title: 'Karnaugh Maps – Visual Simplification',
            content: r'''
# Karnaugh Maps – Visual Simplification

A Karnaugh map (K-map) is a special table in which neighbouring cells differ by only one variable. Groups of 1s that form rectangles of size 1, 2, 4, 8… can be circled; each circle becomes one product term in the simplified expression.

You do not need heavy algebra — you just look for the largest possible power-of-two groupings. It is the visual way to minimise a logic function for a small number of variables.
''',
            keyTakeaways: [
              'K-map arranges minterms so that adjacent cells differ by one bit.',
              'Circle power-of-two groups of 1s.',
              'Each circle → one simplified product term.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t2u3q1',
                question: 'In a Karnaugh map we look for groups whose size is…',
                options: [
                  'Any even number',
                  'A power of two (1, 2, 4, 8…)',
                  'Exactly three',
                  'As small as possible',
                ],
                correctIndex: 1,
                explanation: 'Only power-of-two rectangles correspond to valid product terms that eliminate variables.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t2-u4',
            title: 'Quine–McCluskey – Tabular Minimisation',
            content: r'''
# Quine–McCluskey – Tabular Minimisation

When the number of variables grows beyond what a Karnaugh map can comfortably handle, we use a systematic tabular method called **Quine–McCluskey**.

You list all the minterms, group them by the number of 1s in their binary representation, then repeatedly combine pairs that differ by only one bit. The terms that cannot be combined further are the prime implicants. A final covering step selects the smallest set of prime implicants that cover every required minterm.

It is essentially the same logic as K-maps, written as a procedure a computer (or a careful human) can follow for larger problems.
''',
            keyTakeaways: [
              'Quine–McCluskey is a tabular alternative to K-maps for more variables.',
              'Combine minterms that differ by one bit until no further combination is possible.',
              'Select a minimal set of prime implicants that cover all required terms.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t2u4q1',
                question: 'Quine–McCluskey is mainly used when…',
                options: [
                  'There are only two variables',
                  'The number of variables is too large for a convenient Karnaugh map',
                  'We only need to draw gates',
                  'The circuit is already minimal',
                ],
                correctIndex: 1,
                explanation: 'It scales better than hand-drawn K-maps for larger functions.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. FLIP-FLOPS – MEMORY
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t3',
        title: 'Flip-Flops – Giving Circuits Memory',
        summary: 'Gates alone are memory-less. Flip-flops store a bit so that sequential logic becomes possible.',
        units: [
          Unit(
            id: 'phy707-t3-u1',
            title: 'Why We Need Memory – The SR Latch',
            content: r'''
# Why We Need Memory – The SR Latch

A pure combination of gates produces an output that depends only on the *present* inputs. The moment the inputs change, the old information is gone.

To remember anything we need feedback. The simplest memory cell is the **SR latch** made from two cross-coupled NOR (or NAND) gates.  

- Set (S) forces the output to 1  
- Reset (R) forces the output to 0  
- When both are inactive the latch simply holds whatever value it last had

That held value is one bit of memory.
''',
            keyTakeaways: [
              'Combinational logic has no memory of the past.',
              'Cross-coupled gates create a bistable circuit that can store a bit.',
              'SR latch is the basic set/reset memory element.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t3u1q1',
                question: 'What is the essential new ability that a flip-flop / latch adds?',
                options: [
                  'Faster switching',
                  'The ability to remember a previous state',
                  'More voltage levels',
                  'Lower power only',
                ],
                correctIndex: 1,
                explanation: 'Memory of past state is what turns combinational logic into sequential logic.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t3-u2',
            title: 'Clocked Flip-Flops – Edge-Triggered Memory',
            content: r'''
# Clocked Flip-Flops – Edge-Triggered Memory

An ordinary latch is sensitive to its inputs the whole time they are active. That can cause timing races.

A **clocked flip-flop** samples its inputs only at a sharp edge of a clock signal and then ignores them until the next edge. The most common types are:

- D flip-flop – simply stores whatever is on the D input at the clock edge  
- JK flip-flop – more flexible set/reset/toggle behaviour  
- T flip-flop – toggles on every clock when T = 1

Almost all modern sequential circuits are built from edge-triggered D flip-flops.
''',
            keyTakeaways: [
              'Clocked flip-flops change state only at a clock edge.',
              'D flip-flop is the workhorse of modern design.',
              'Edge-triggering prevents many timing problems.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t3u2q1',
                question: 'A D flip-flop stores the value of its D input…',
                options: [
                  'Continuously while the clock is high',
                  'Only at the active edge of the clock',
                  'Only when D is high',
                  'Never',
                ],
                correctIndex: 1,
                explanation: 'Edge-triggered devices capture the input only at the clock transition.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. COUNTERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t4',
        title: 'Counters – Asynchronous and Synchronous',
        summary: 'Using flip-flops to count events in binary.',
        units: [
          Unit(
            id: 'phy707-t4-u1',
            title: 'Ripple (Asynchronous) Counters',
            content: r'''
# Ripple (Asynchronous) Counters

Chain T or JK flip-flops so that the output of one becomes the clock of the next. Each stage toggles at half the rate of the previous stage — binary counting.

Because the clock “ripples” from one flip-flop to the next, there is a small propagation delay at every stage. For long counters those delays add up and can cause decoding glitches. That is why they are called asynchronous or ripple counters.
''',
            keyTakeaways: [
              'Each flip-flop divides the frequency by two.',
              'Clock is derived from the previous stage → ripple delay.',
              'Simple but limited to moderate speeds and lengths.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t4u1q1',
                question: 'In a ripple counter the main practical limitation is…',
                options: [
                  'It cannot count in binary',
                  'Cumulative propagation delay through the stages',
                  'It needs an analogue input',
                  'It uses too many voltage levels',
                ],
                correctIndex: 1,
                explanation: 'Each stage waits for the previous one, so delays accumulate.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t4-u2',
            title: 'Synchronous Counters',
            content: r'''
# Synchronous Counters

All flip-flops share the *same* common clock. Extra combinational logic decides, for each bit, whether it should toggle on the next edge.

Because every flip-flop sees the clock at the same instant, there is no ripple delay. Synchronous counters can run faster and are preferred in almost all modern designs.
''',
            keyTakeaways: [
              'All flip-flops clocked simultaneously.',
              'Extra gates compute the next-state logic.',
              'Faster and cleaner than ripple counters.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t4u2q1',
                question: 'The defining feature of a synchronous counter is that…',
                options: [
                  'Only one flip-flop is used',
                  'All flip-flops share a common clock edge',
                  'It counts only in decimal',
                  'It has no combinational logic',
                ],
                correctIndex: 1,
                explanation: 'Common clock is what removes the ripple delay.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. MULTIPLEXERS & DEMULTIPLEXERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t5',
        title: 'Multiplexers and Demultiplexers',
        summary: 'Selecting one of many signals, or sending one signal to many places.',
        units: [
          Unit(
            id: 'phy707-t5-u1',
            title: 'Multiplexer – The Digital Railway Switch',
            content: r'''
# Multiplexer – The Digital Railway Switch

A multiplexer (MUX) has several data inputs and a set of select lines. The select lines choose *which one* of the data inputs is connected to the single output.

Think of a railway junction: the select signals set the points so that only one track is connected to the outgoing line.

A 4-to-1 MUX needs two select bits; an 8-to-1 MUX needs three, and so on.
''',
            keyTakeaways: [
              'MUX selects one of many inputs to appear on a single output.',
              'Select lines determine which input is chosen.',
              'Universal building block for data routing and logic implementation.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t5u1q1',
                question: 'A multiplexer with 8 data inputs needs how many select lines?',
                options: ['2', '3', '4', '8'],
                correctIndex: 1,
                explanation: '2³ = 8, so three select bits are required.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t5-u2',
            title: 'Demultiplexer – The Opposite Switch',
            content: r'''
# Demultiplexer – The Opposite Switch

A demultiplexer (DEMUX) takes one data input and a set of select lines, and routes that single input to one of many outputs.

It is the exact reverse of a multiplexer — one incoming track is switched onto one of several outgoing tracks.
''',
            keyTakeaways: [
              'DEMUX routes one input to one of many outputs.',
              'Select lines choose the destination.',
              'Often used together with MUXes for data distribution.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t5u2q1',
                question: 'A demultiplexer does the opposite job of a…',
                options: [
                  'Flip-flop',
                  'Multiplexer',
                  'Counter',
                  'ADC',
                ],
                correctIndex: 1,
                explanation: 'MUX many→one, DEMUX one→many.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. DATA CONVERTERS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t6',
        title: 'DAC and ADC – Bridging Analogue and Digital',
        summary: 'Converting real-world continuous voltages into numbers and back again.',
        units: [
          Unit(
            id: 'phy707-t6-u1',
            title: 'Digital-to-Analogue Converter (DAC)',
            content: r'''
# Digital-to-Analogue Converter (DAC)

A DAC takes a binary number and produces a proportional voltage or current.  

Simplest idea: each bit controls a switch that adds a weighted amount of current (or voltage). The weights are powers of two, so the total output is exactly proportional to the binary value.

Used whenever a computer needs to drive a real physical actuator, loudspeaker, motor, etc.
''',
            keyTakeaways: [
              'DAC turns a binary number into a proportional analogue voltage/current.',
              'Binary weighting is the key idea.',
              'Interface from digital world to physical actuators.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t6u1q1',
                question: 'A DAC is used to convert…',
                options: [
                  'Analogue voltage into a binary number',
                  'A binary number into an analogue voltage or current',
                  'One logic family into another',
                  'Serial data into parallel data',
                ],
                correctIndex: 1,
                explanation: 'Digital → Analogue is the direction of a DAC.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t6-u2',
            title: 'Analogue-to-Digital Converter (ADC)',
            content: r'''
# Analogue-to-Digital Converter (ADC)

An ADC does the reverse: it measures a continuous voltage and outputs the nearest binary number.

Common methods include successive approximation, flash conversion and dual-slope integration. All of them ultimately compare the input against a set of reference levels and encode the result as bits.

Resolution (number of bits) and sampling speed determine how faithfully the digital numbers represent the original signal.
''',
            keyTakeaways: [
              'ADC turns a continuous voltage into a binary number.',
              'Resolution and sampling rate are the two critical specifications.',
              'Essential for any system that senses the physical world.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t6u2q1',
                question: 'An ADC converts…',
                options: [
                  'Binary numbers into voltages',
                  'Continuous voltages into binary numbers',
                  'Logic gates into flip-flops',
                  'Counters into multiplexers',
                ],
                correctIndex: 1,
                explanation: 'Analogue → Digital is the direction of an ADC.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 7. LOGIC FAMILIES
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy707-t7',
        title: 'Logic Families – DTL, TTL, CMOS, NMOS, ECL',
        summary: 'The different circuit technologies used to actually build the gates.',
        units: [
          Unit(
            id: 'phy707-t7-u1',
            title: 'Why Different Families Exist',
            content: r'''
# Why Different Families Exist

The same Boolean function can be realised with different transistor circuits. Each technology (family) offers a different trade-off among:

- Speed  
- Power consumption  
- Noise immunity  
- Supply voltage  
- Ability to drive other gates (fan-out)

Historically important families include DTL, TTL, NMOS, ECL and, overwhelmingly today, CMOS.
''',
            keyTakeaways: [
              'Different circuit styles implement the same logic.',
              'Trade-offs: speed vs power vs noise margin vs cost.',
              'CMOS dominates modern digital electronics.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t7u1q1',
                question: 'Today the dominant logic family in almost all digital chips is…',
                options: ['TTL', 'ECL', 'CMOS', 'DTL'],
                correctIndex: 2,
                explanation: 'CMOS offers the best combination of low power and high density.',
              ),
            ],
          ),
          Unit(
            id: 'phy707-t7-u2',
            title: 'TTL vs CMOS – The Two Classic Workhorses',
            content: r'''
# TTL vs CMOS – The Two Classic Workhorses

**TTL (Transistor-Transistor Logic)**  
Bipolar transistors. Fast for its era, relatively high power, 5 V supply. Defined the shape of digital design for two decades.

**CMOS (Complementary MOS)**  
Uses both n-channel and p-channel MOSFETs. Power is consumed mainly when switching; static power is almost zero. Wide supply range, excellent noise margins, and scales beautifully to tiny transistors. Virtually every modern CPU, GPU and microcontroller is CMOS.
''',
            keyTakeaways: [
              'TTL = bipolar, fast but power-hungry.',
              'CMOS = complementary MOS, low static power, scalable.',
              'CMOS won the long-term race.',
            ],
            quiz: [
              QuizQuestion(
                id: '707t7u2q1',
                question: 'The main reason CMOS replaced TTL in most applications is…',
                options: [
                  'CMOS is always faster',
                  'CMOS consumes far less static power and scales to smaller sizes',
                  'CMOS uses higher voltages',
                  'TTL cannot implement NAND gates',
                ],
                correctIndex: 1,
                explanation: 'Low static power and excellent scaling are the decisive advantages.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
