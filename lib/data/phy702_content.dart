import 'package:pgd_physics/models/course.dart';

/// PHY 702 — Electromagnetism
/// Module 1 filled from content_prompts/PHY702 (Griffiths-aligned depth).
Course buildPhy702() {
  return Course(
    id: 'phy-702',
    code: 'PHY 702',
    title: 'Electromagnetism',
    description: 'Coulomb to Maxwell: electrostatics, magnetostatics, induction, Maxwell equations and spherical waves.',
    semester: 'Second Semester',
    units: 3,
    icon: '⚡',
    colorHint: ColorHint.cyan,
    modules: [
            Module(
        id: 'phy702-m1',
        title: 'Coulomb\'s Law and Electrostatic Forces',
        summary:
            'Electric charge, Coulomb force intuition and formula, vector form and superposition.',
        units: [
          Unit(
            id: 'phy702-m1-u1',
            title: 'Physical intuition of electric charge',
            content: r'''
## Learning goal

Introduce electric charge as a fundamental property of matter and state the rules of attraction and repulsion.

## What charge is

**Electric charge** is a property of particles and objects that determines how strongly they participate in electromagnetic interactions. In SI units charge is measured in **coulombs** (C).

Ordinary matter is built from protons (positive charge), electrons (negative charge), and neutrons (zero charge). Bulk objects are usually nearly neutral: the total positive charge nearly cancels the total negative charge. Rubbing, contact, or chemical processes can leave a small imbalance — that imbalance is the net charge you feel in static electricity experiments.

## Two kinds of charge

There are two kinds of charge, conventionally called **positive** and **negative**. Like charges repel; opposite charges attract:

- + and + → repel
- − and − → repel
- + and − → attract

These rules are experimental facts summarized in Coulomb’s law (next units).

## Conservation

In isolated processes, the total charge (sum of all positive and negative contributions) is conserved. Charge can move from place to place or be separated, but it is not created or destroyed in ordinary chemistry and mechanics.

## Check yourself

If a glass rod gains a positive charge when rubbed, what can you say about the total charge of rod plus cloth together (assuming they started neutral)?
''',
            keyTakeaways: [
              'Charge is a fundamental property measured in coulombs.',
              'Like charges repel; opposite charges attract.',
              'Total charge is conserved in isolated processes.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m1-u1-q1',
                question: 'Two negative charges',
                options: [
                  'Attract each other',
                  'Repel each other',
                  'Ignore each other always',
                  'Must cancel to zero force always',
                ],
                correctIndex: 1,
                explanation: 'Like charges repel.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m1-u2',
            title: 'Coulomb\'s law intuition',
            content: r'''
## Learning goal

Build intuition for how electrostatic force depends on charge sizes and on separation, using a spreading-on-a-sphere picture for the inverse-square law.

## Larger charges, larger force

If you double either charge, the force doubles (when everything else is fixed). The force is proportional to the product of the charge magnitudes.

## Farther apart, weaker force

If you double the distance between two point charges, the force falls to one quarter of its previous value — an **inverse-square** law.

## Sphere-spreading analogy

Imagine something that spreads uniformly over the surface of a sphere (light from a point source, or sound intensity in a uniform medium). The surface area of a sphere is 4πr². Whatever “amount” spreads over that surface is diluted by a factor of 1/r² as r grows. Coulomb’s force between point charges has the same 1/r² geometric dilution: the field lines (Module 2) spread over a sphere.

## Direction

The force is along the line joining the charges: repulsive along that line for like charges, attractive for opposite charges.

## Check yourself

If you move two charges three times farther apart, by what factor does the Coulomb force magnitude change?
''',
            keyTakeaways: [
              'Force grows with the product of charge magnitudes.',
              'Force falls as 1/r² with separation for point charges.',
              'The 1/r² factor matches spreading over a sphere of area 4πr².',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m1-u2-q1',
                question: 'Doubling the distance between two point charges multiplies the force by',
                options: [
                  '2',
                  '1/2',
                  '1/4',
                  '4',
                ],
                correctIndex: 2,
                explanation: 'Inverse-square law: factor (1/2)² = 1/4.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m1-u3',
            title: 'Coulomb\'s law equation, symbol by symbol',
            content: r'''
## Learning goal

Write Coulomb’s law for the magnitude of the force between two point charges and translate every symbol into plain English.

## Magnitude form

The magnitude of the electrostatic force between two stationary point charges is

F = k_e |q₁ q₂| / r²

## Symbol translation

- F — magnitude of the force (SI unit: newton, N)
- q₁, q₂ — the two charges (SI unit: coulomb, C)
- r — distance between the charges (SI unit: metre, m)
- k_e — Coulomb’s constant, k_e = 1/(4πϵ₀) ≈ 8.99 × 10⁹ N·m²/C²
- ϵ₀ — permittivity of free space (appears in the modern SI form)

Often one writes

F = (1/(4πϵ₀)) |q₁ q₂| / r²

The absolute value |q₁ q₂| keeps F positive as a magnitude; direction is handled separately with unit vectors.

## Validity

This form assumes point charges (or spherically symmetric charge distributions for which the outside field matches a point charge) at rest in electrostatics, in vacuum (or to a good approximation in air).

## Check yourself

Name the SI units of k_e using only the units of F, q, and r.
''',
            keyTakeaways: [
              'F = k_e |q₁ q₂| / r² with k_e = 1/(4πϵ₀).',
              'Every symbol has a clear physical meaning and SI unit.',
              'The formula is for point (or equivalent) charges in electrostatics.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m1-u3-q1',
                question: 'In F = k_e |q₁ q₂| / r², r stands for',
                options: [
                  'The mass of the charges',
                  'The distance between the charges',
                  'Time',
                  'Temperature',
                ],
                correctIndex: 1,
                explanation: 'r is the separation between the point charges.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m1-u4',
            title: 'Vector form and the superposition principle',
            content: r'''
## Learning goal

Write the force as a vector along the line joining two charges, and use superposition to add forces from several charges.

## Vector form for two charges

Let r₁ and r₂ be the position vectors of charges q₁ and q₂. The vector from 2 to 1 is r = r₁ − r₂, with magnitude r = |r| and unit vector r̂ = r/r.

The force on q₁ due to q₂ is

F_{12} = k_e (q₁ q₂ / r²) r̂

If q₁ q₂ > 0 (like signs), F_{12} points away from q₂ (repulsion). If q₁ q₂ < 0, F_{12} points toward q₂ (attraction). The force on q₂ due to q₁ is −F_{12} (Newton’s third law).

## Superposition

If several charges q₂, q₃, … act on q₁, the total force on q₁ is the vector sum of the individual Coulomb forces:

F₁ = F_{12} + F_{13} + …

Each pair is computed as if the others were absent, then the vectors are added tip-to-tail (component-wise in a basis). Superposition is a linear property of classical electrostatic forces in vacuum.

## Worked pattern

1. Choose a coordinate system.
2. Compute each contribution’s magnitude from Coulomb’s law.
3. Assign direction with unit vectors or geometry (angles).
4. Add components: F_x = Σ F_{ix}, F_y = Σ F_{iy}.

## Check yourself

Two equal positive charges sit at (1,0) and (−1,0). What is the direction of the total force on a positive test charge at the origin?
''',
            keyTakeaways: [
              'Vector Coulomb force: F₁₂ = k_e (q₁ q₂ / r²) r̂ along the joining line.',
              'Opposite forces on the two charges: Newton\'s third law.',
              'Superposition: total force is the vector sum of pairwise forces.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m1-u4-q1',
                question: 'The superposition principle says that the total force on a charge is',
                options: [
                  'The product of all pairwise forces',
                  'The vector sum of forces from each other charge',
                  'Always zero',
                  'Independent of distance',
                ],
                correctIndex: 1,
                explanation: 'Electrostatic forces add as vectors.',
              ),
              QuizQuestion(
                id: 'phy702-m1-u4-q2',
                question: 'If q₁ q₂ > 0, the force on q₁ due to q₂ is',
                options: [
                  'Attractive (toward q₂)',
                  'Repulsive (away from q₂)',
                  'Perpendicular to the joining line always',
                  'Zero',
                ],
                correctIndex: 1,
                explanation: 'Like signs produce repulsion along the line joining the charges.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy702-m2',
        title: 'Electric Fields and Gauss\' Law',
        summary:
            'Electric field concept, flux, Gauss\'s law, and applications to point charge, line, and sheet.',
        units: [
          Unit(
            id: 'phy702-m2-u1',
            title: 'Electric field concept',
            content: r'''
## Learning goal

Replace “action at a distance” with the electric field as a local property of space around charges.

## From force to field

Coulomb’s law says a charge q₂ feels a force due to q₁ even when they are separated. One modern way to think about that is: q₁ alters the space around it by creating an **electric field** E. Then the force on a test charge q at a point is

F = q E

so

E = F/q

(for a small test charge that does not disturb the sources).

## Field of a point charge

At a displacement r from a point charge Q (unit vector r̂ from the source toward the field point),

E = k_e (Q / r²) r̂ = (1/(4πϵ₀)) (Q / r²) r̂

Direction: away from Q if Q > 0, toward Q if Q < 0.

## Superposition for fields

Fields from several sources add as vectors:

E_total = E₁ + E₂ + …

That is the same superposition principle as for forces, divided by the test charge.

## Check yourself

If the force on a +2 μC test charge is 0.01 N east, what is E at that point?
''',
            keyTakeaways: [
              'E is force per unit charge: F = q E.',
              'Point charge: E = k_e Q/r² radially.',
              'Fields superpose vectorially.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m2-u1-q1',
                question: 'The electric field E is defined so that the force on a charge q is',
                options: [
                  'F = E only',
                  'F = q E',
                  'F = E/q',
                  'F = q² E',
                ],
                correctIndex: 1,
                explanation: 'By definition F = q E in electrostatics for a test charge.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m2-u2',
            title: 'Electric flux intuition',
            content: r'''
## Learning goal

Define electric flux through a surface using a flow-through-a-net picture and the formula Φ_E = ∫ E · dA.

## Water-through-a-net analogy

Imagine water flowing through a butterfly net. The amount of water per time that passes through the net depends on:

- how fast the water flows (field strength)
- how large the net is (area)
- whether the net faces the flow or is tilted edge-on (angle)

Electric **flux** is the analogous quantity for the electric field “flowing” through a surface.

## Mathematical definition

For a small patch of surface with area vector dA (magnitude = area, direction = local normal),

dΦ_E = E · dA = E dA cos θ

where θ is the angle between E and the normal. For a finite surface,

Φ_E = ∫_S E · dA

## Closed surfaces

For a closed surface (a “bubble”), the normal is usually chosen **outward**. Positive flux means net field lines leaving the volume; negative means net lines entering.

## Check yourself

If E is everywhere tangent to a surface, what is the flux through that surface?
''',
            keyTakeaways: [
              'Flux measures field “flow” through a surface: Φ_E = ∫ E · dA.',
              'Tilt and strength both matter (cosine of the angle).',
              'Closed surfaces use an outward normal by convention.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m2-u2-q1',
                question: 'Electric flux through a surface is',
                options: [
                  'Always equal to the charge only',
                  '∫ E · dA',
                  'E × A with no integral ever',
                  'Independent of orientation',
                ],
                correctIndex: 1,
                explanation: 'Flux is the surface integral of E · dA.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m2-u3',
            title: 'Gauss\'s law',
            content: r'''
## Learning goal

State Gauss’s law in integral form and translate every part into plain English.

## Statement

The total electric flux out of any closed surface equals the enclosed charge divided by ϵ₀:

∮_S E · dA = Q_enc / ϵ₀

## English translation

- ∮_S — integral over a **closed** surface S (the Gaussian surface)
- E · dA — local contribution to flux
- Q_enc — total charge inside the volume bounded by S (not charges outside)
- ϵ₀ — permittivity of free space

Only enclosed charge appears on the right. Charges outside can affect E on the surface, but their net contribution to the total flux cancels.

## Link to Coulomb

For a point charge at the centre of a sphere of radius r, symmetry gives constant |E| on the sphere and E parallel to dA, so

∮ E · dA = E · 4π r² = Q/ϵ₀ ⇒ E = Q/(4πϵ₀ r²)

Gauss’s law recovers Coulomb’s field for a point charge.

## Check yourself

If a closed surface encloses zero net charge, must E be zero everywhere on the surface?
''',
            keyTakeaways: [
              'Gauss: ∮ E · dA = Q_enc / ϵ₀.',
              'Only enclosed charge counts for the total flux.',
              'Symmetric cases turn the integral into algebra for E.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m2-u3-q1',
                question: 'Gauss\'s law states that the flux through a closed surface equals',
                options: [
                  'Zero always',
                  'Q_enc / ϵ₀',
                  'Q_enc × ϵ₀',
                  'Only the potential',
                ],
                correctIndex: 1,
                explanation: '∮ E · dA = Q_enc / ϵ₀.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m2-u4',
            title: 'Applications: point charge, line, and sheet',
            content: r'''
## Learning goal

Use Gauss’s law with symmetry to find E for a point charge, an infinite line charge, and an infinite sheet.

## Point charge

Gaussian surface: sphere of radius r centred on Q. By symmetry E is radial and constant on the sphere.

E · 4π r² = Q/ϵ₀ ⇒ E = Q/(4πϵ₀ r²) radially outward if Q > 0.

## Infinite line charge (linear density λ)

Symmetry: E is radial from the line, depends only on perpendicular distance r.  
Gaussian surface: cylinder of radius r and length L centred on the line.  
Flux through the curved wall: E · 2π r L (ends contribute zero if E is perpendicular to the axis).  
Enclosed charge: λ L.

E · 2π r L = λ L / ϵ₀ ⇒ E = λ / (2π ϵ₀ r)

## Infinite sheet (surface density σ)

Symmetry: E is perpendicular to the sheet, same magnitude on both sides, independent of distance (ideal infinite sheet).  
Gaussian surface: pillbox piercing the sheet, end area A.  
Flux: 2 E A (both ends). Enclosed charge: σ A.

2 E A = σ A / ϵ₀ ⇒ E = σ / (2 ϵ₀)

## Method checklist

1. Argue the direction and dependence of E from symmetry.  
2. Choose a Gaussian surface adapted to that symmetry.  
3. Evaluate flux as E times a simple area factor.  
4. Set equal to Q_enc/ϵ₀ and solve for E.

## Check yourself

Why does the field of an infinite sheet not fall off with distance in this idealization?
''',
            keyTakeaways: [
              'Point charge: E = Q/(4πϵ₀ r²).',
              'Infinite line: E = λ/(2πϵ₀ r).',
              'Infinite sheet: E = σ/(2ϵ₀), independent of distance.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m2-u4-q1',
                question: 'The field magnitude of an infinite line charge λ at distance r is',
                options: [
                  'λ/(4πϵ₀ r²)',
                  'λ/(2πϵ₀ r)',
                  'σ/(2ϵ₀)',
                  '0',
                ],
                correctIndex: 1,
                explanation: 'Cylindrical Gaussian surface yields E = λ/(2πϵ₀ r).',
              ),
              QuizQuestion(
                id: 'phy702-m2-u4-q2',
                question: 'An infinite sheet with surface charge σ has field magnitude',
                options: [
                  'σ/ϵ₀',
                  'σ/(2ϵ₀)',
                  'σ/(4πϵ₀)',
                  'Depends on 1/r² always',
                ],
                correctIndex: 1,
                explanation: 'Pillbox argument gives E = σ/(2ϵ₀) on each side.',
              ),
            ],
          ),
        ],
      ),
      skeletonModule(
        id: 'phy702-m3',
        title: 'Electric Potential, Poisson, and Laplace Equations',
        summary: 'Electric Potential, Poisson, and Laplace Equations',
        units: [
          skeletonUnit(id: 'phy702-m3-u1', title: 'Electric Potential (Voltage)'),
          skeletonUnit(id: 'phy702-m3-u2', title: 'Relationship Between Electric Field and Potential'),
          skeletonUnit(id: 'phy702-m3-u3', title: 'Poisson and Laplace Equations'),
          skeletonUnit(id: 'phy702-m3-u4', title: 'Boundary Value Problems'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m4',
        title: 'Magnetostatics and Magnetic Fields',
        summary: 'Magnetostatics and Magnetic Fields',
        units: [
          skeletonUnit(id: 'phy702-m4-u1', title: 'Permanent Magnets vs. Moving Charges'),
          skeletonUnit(id: 'phy702-m4-u2', title: 'Biot-Savart Law'),
          skeletonUnit(id: 'phy702-m4-u3', title: 'Ampere\'s Law'),
          skeletonUnit(id: 'phy702-m4-u4', title: 'Magnetic Fields in Matter'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m5',
        title: 'Electric and Magnetic Energy Storage',
        summary: 'Electric and Magnetic Energy Storage',
        units: [
          skeletonUnit(id: 'phy702-m5-u1', title: 'Energy Stored in Electric Fields'),
          skeletonUnit(id: 'phy702-m5-u2', title: 'Energy Stored in Magnetic Fields'),
          skeletonUnit(id: 'phy702-m5-u3', title: 'Energy Density in Fields'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m6',
        title: 'Faraday\'s Law of Induction & Lenz\'s Law',
        summary: 'Faraday\'s Law of Induction & Lenz\'s Law',
        units: [
          skeletonUnit(id: 'phy702-m6-u1', title: 'Electromagnetic Induction Discovery'),
          skeletonUnit(id: 'phy702-m6-u2', title: 'Faraday\'s Law'),
          skeletonUnit(id: 'phy702-m6-u3', title: 'Lenz\'s Law (Nature\'s Inertia)'),
          skeletonUnit(id: 'phy702-m6-u4', title: 'Practical Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m7',
        title: 'Motion of Charges in Electric and Magnetic Fields',
        summary: 'Motion of Charges in Electric and Magnetic Fields',
        units: [
          skeletonUnit(id: 'phy702-m7-u1', title: 'Lorentz Force Law'),
          skeletonUnit(id: 'phy702-m7-u2', title: 'Motion in Pure Electric Field'),
          skeletonUnit(id: 'phy702-m7-u3', title: 'Motion in Pure Magnetic Field'),
          skeletonUnit(id: 'phy702-m7-u4', title: 'Velocity Selector & Mass Spectrometer Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy702-m8',
        title: 'Maxwell\'s Equations and Spherical Wave Propagation',
        summary: 'Maxwell\'s Equations and Spherical Wave Propagation',
        units: [
          skeletonUnit(id: 'phy702-m8-u1', title: 'The Missing Link'),
          skeletonUnit(id: 'phy702-m8-u2', title: 'The Four Maxwell Equations Unified'),
          skeletonUnit(id: 'phy702-m8-u3', title: 'Electromagnetic Waves'),
          skeletonUnit(id: 'phy702-m8-u4', title: 'Introduction to Spherical Waves'),
        ],
      ),
    ],
  );
}
