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
            Module(
        id: 'phy702-m3',
        title: 'Electric Potential, Poisson, and Laplace Equations',
        summary:
            'Electric potential, E = −grad V, Poisson and Laplace equations, uniqueness and method of images.',
        units: [
          Unit(
            id: 'phy702-m3-u1',
            title: 'Electric potential (voltage)',
            content: r'''
## Learning goal

Distinguish potential energy from electric potential and use a topographic “height” analogy for voltage.

## Potential energy vs potential

A charge q in an electric field has electric **potential energy** U. The **electric potential** (voltage) V is defined so that

U = q V

for a test charge (with a chosen zero of potential). V is potential energy per unit charge, measured in volts (1 V = 1 J/C).

## Topographic analogy

Think of V as the “height” of a landscape. A positive charge is like a ball that rolls downhill — toward lower V. Contours of constant V are equipotentials (level curves). Steep slopes mean rapid change of height with distance — large |E|, as the next unit makes precise.

## Potential difference

Only differences in V are physically measured. We often set V = 0 at infinity for localized charge distributions, or at a grounded conductor.

## Check yourself

If a +1 C charge loses 5 J of potential energy moving from A to B, what is V(A) − V(B)?
''',
            keyTakeaways: [
              'Potential V is potential energy per unit charge: U = q V.',
              'Voltage differences matter; the zero of V is conventional.',
              'Equipotentials are like contour lines on a height map of V.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m3-u1-q1',
                question: 'Electric potential V relates to potential energy U of charge q by',
                options: [
                  'U = V only',
                  'U = q V',
                  'U = V/q',
                  'U = q² V',
                ],
                correctIndex: 1,
                explanation: 'By definition U = q V for the electrostatic potential energy.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m3-u2',
            title: 'Relationship between E and V',
            content: r'''
## Learning goal

Relate the electric field to the gradient of potential: E = −∇V, with the minus sign meaning “downhill.”

## Line integral definition

The potential difference is the negative of the work per unit charge by the field along a path:

V(b) − V(a) = −∫_a^b E · dr

For electrostatic fields this integral is path-independent (conservative field).

## Local form

In differential form,

E = −∇V

Component-wise: E_x = −∂V/∂x, and so on.

## Physical reading of the minus sign

∇V points toward increasing V (uphill). The force on a positive charge is qE and points toward decreasing V (downhill). Hence E points opposite to ∇V.

On the topographic map: E points down the steepest slope of the voltage hill.

## Check yourself

If V increases in the +x direction only, which way does E point?
''',
            keyTakeaways: [
              'V(b) − V(a) = −∫_a^b E · dr.',
              'E = −∇V in electrostatics.',
              'E points downhill on the potential landscape.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m3-u2-q1',
                question: 'The relation between E and V is',
                options: [
                  'E = ∇V',
                  'E = −∇V',
                  'E = V²',
                  'E independent of V always',
                ],
                correctIndex: 1,
                explanation: 'Electrostatic field is the negative gradient of potential.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m3-u3',
            title: 'Poisson and Laplace equations',
            content: r'''
## Learning goal

Derive Poisson’s equation from Gauss’s law and the gradient relation, and interpret Laplace’s equation as a local averaging property.

## From Gauss to divergence form

Differential form of Gauss’s law:

∇ · E = ρ / ϵ₀

Substitute E = −∇V:

∇ · (−∇V) = ρ / ϵ₀ ⇒ −∇²V = ρ / ϵ₀

so

∇²V = −ρ / ϵ₀

This is **Poisson’s equation**. Here ∇² is the Laplacian (sum of second pure derivatives in Cartesian coordinates).

## Charge-free regions: Laplace’s equation

Where ρ = 0,

∇²V = 0

**Laplace’s equation.** Solutions are called harmonic functions.

## Plain-English reading of Laplace

In free space, the value of V at a point is the average of V over any small sphere (or circle in 2D) centred on that point. There are no local bumps or pits in V without charge — charge is what sources curvature of V through Poisson’s equation.

## Check yourself

If ρ > 0 in a region, what can you say about the sign of ∇²V from Poisson’s equation?
''',
            keyTakeaways: [
              'Poisson: ∇²V = −ρ/ϵ₀.',
              'Laplace: ∇²V = 0 where ρ = 0.',
              'Laplace means V equals its local spatial average.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m3-u3-q1',
                question: 'Poisson\'s equation is',
                options: [
                  '∇ · E = 0',
                  '∇²V = −ρ/ϵ₀',
                  '∇ × E = 0 only as the full story',
                  'V = 0 always',
                ],
                correctIndex: 1,
                explanation: 'Combining Gauss and E = −∇V yields Poisson\'s equation.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m3-u4',
            title: 'Boundary value problems: uniqueness and images',
            content: r'''
## Learning goal

State the uniqueness idea for Laplace/Poisson problems with boundary data, and introduce the method of images as a visual problem-solving tool.

## Boundary value problems

To find V in a region one needs:

- Poisson or Laplace’s equation inside the region
- Boundary conditions on the surface (specified V, or specified normal derivative related to surface charge, or mixed conditions)

## Uniqueness (intuition)

If two candidate potentials satisfy the same PDE and the same boundary conditions on the closed boundary of a region, their difference satisfies Laplace’s equation with zero boundary values and must vanish — so the solution is unique. (Standard theorems make this precise for Dirichlet, Neumann with compatibility, etc.)

Practically: once you find any V that satisfies the equation and the boundaries, you have the answer.

## Method of images (visual idea)

Some problems with conductors can be solved by inventing **image charges** outside the region of interest so that the equipotential boundary conditions on the conductor are automatically met. Inside the physical region, the potential of the real plus image charges solves Laplace/Poisson with the correct boundaries; the images themselves are not physical charge in that region.

Classic example: point charge above an infinite grounded conducting plane — an opposite image charge mirrored below the plane makes V = 0 on the plane.

## Check yourself

Why must image charges be placed outside the region where you claim the solution is valid?
''',
            keyTakeaways: [
              'PDE + boundary conditions determine V uniquely (under standard conditions).',
              'Any valid solution is the solution.',
              'Method of images uses fictitious charges to enforce conductor boundary conditions.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m3-u4-q1',
                question: 'The method of images is used to',
                options: [
                  'Violate Gauss\'s law',
                  'Satisfy boundary conditions with fictitious charges outside the region of interest',
                  'Replace Poisson\'s equation with F = ma',
                  'Eliminate the need for any boundary data',
                ],
                correctIndex: 1,
                explanation: 'Images are a technique to meet boundary conditions analytically.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy702-m4',
        title: 'Magnetostatics and Magnetic Fields',
        summary:
            'Currents as sources of B, Biot–Savart, Ampere\'s law, magnetism in materials.',
        units: [
          Unit(
            id: 'phy702-m4-u1',
            title: 'Permanent magnets vs moving charges',
            content: r'''
## Learning goal

Connect magnetic fields to moving electric charge and contrast that with permanent magnets as atomic-scale current loops.

## Oersted’s discovery

A steady electric current in a wire deflects a nearby compass needle. Moving charges (current) produce a magnetic field B in the surrounding space.

## Permanent magnets

Bar magnets and lodestones produce B without an obvious external circuit. At the microscopic level their magnetism comes from atomic magnetic moments — orbiting and spinning electrons that behave like tiny current loops. When many moments align, the material has a macroscopic magnetic field.

## Steady currents: magnetostatics

When currents are steady (no changing charge density), the magnetic field is constant in time: **magnetostatics**. The basic sources are current elements and steady current distributions.

## Check yourself

In what sense is a permanent magnet still “about moving charge” even with no battery attached?
''',
            keyTakeaways: [
              'Steady currents produce magnetic fields (Oersted).',
              'Permanent magnets arise from aligned atomic magnetic moments.',
              'Magnetostatics treats steady currents and constant B.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m4-u1-q1',
                question: 'Oersted\'s discovery linked magnetic effects to',
                options: [
                  'Only stationary charges',
                  'Electric currents (moving charges)',
                  'Gravity only',
                  'Temperature only',
                ],
                correctIndex: 1,
                explanation: 'A current-carrying wire affects a compass.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m4-u2',
            title: 'Biot–Savart law',
            content: r'''
## Learning goal

State the Biot–Savart law for the magnetic field of a current element and read every factor.

## Current element

A small piece of wire carries current I and has vector length dl (direction of conventional current). At a point whose position relative to the element is r (magnitude r, unit vector r̂),

dB = (μ₀ / 4π) (I dl × r̂) / r²

## Symbol reading

- dB — infinitesimal magnetic field contribution
- μ₀ — permeability of free space
- I dl — current element
- dl × r̂ — direction by right-hand rule; magnitude involves sin θ
- 1/r² — falls with distance (same geometric dilution idea as Coulomb, but vector structure differs)

Total field: integrate dB along the wire.

## Example structure: long straight wire

For an infinite straight wire, integration of Biot–Savart yields

B = μ₀ I / (2π s)

at perpendicular distance s, with circles of B around the wire (right-hand rule).

## Check yourself

If dl is parallel to r̂, what is dB from that element?
''',
            keyTakeaways: [
              'Biot–Savart: dB = (μ₀/4π) I dl × r̂ / r².',
              'Direction from the cross product (right-hand rule).',
              'Integrate along the wire for total B.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m4-u2-q1',
                question: 'The Biot–Savart law gives dB proportional to',
                options: [
                  'I dl · r̂ only',
                  'I dl × r̂ / r²',
                  'q₁ q₂ only',
                  'E only',
                ],
                correctIndex: 1,
                explanation: 'The cross product and 1/r² structure define Biot–Savart.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m4-u3',
            title: 'Ampere\'s law',
            content: r'''
## Learning goal

State Ampere’s law in integral form and use the “loop around a current” picture to find B in symmetric situations.

## Statement

For a steady current distribution,

∮_C B · dl = μ₀ I_enc

where C is a closed curve and I_enc is the total current piercing any surface bounded by C.

## Hula-hoop analogy

Think of a closed path as a hula hoop. Ampere’s law says the line integral of B around the hoop is fixed by how much net current goes through the hoop — not by currents that miss the hoop’s interior.

## Plain English

Walk around a closed loop, adding up the component of B along your path. That total equals μ₀ times the current enclosed by the loop.

## Symmetric applications

- Long straight wire: circle of radius s ⇒ B · 2π s = μ₀ I ⇒ B = μ₀ I /(2π s)
- Solenoid (ideal, n turns per length): rectangular Amperian loop ⇒ B ≈ μ₀ n I inside, along the axis

## Check yourself

If you enlarge a circular Amperian loop around a single long wire, why does B fall as 1/s while the left side ∮ B · dl stays constant?
''',
            keyTakeaways: [
              'Ampere: ∮ B · dl = μ₀ I_enc for steady currents.',
              'Only enclosed current appears on the right-hand side.',
              'Symmetry turns the integral into a simple expression for B.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m4-u3-q1',
                question: 'Ampere\'s law states that ∮ B · dl equals',
                options: [
                  'Q_enc / ϵ₀',
                  'μ₀ I_enc',
                  '0 always',
                  'E only',
                ],
                correctIndex: 1,
                explanation: 'For magnetostatics, ∮ B · dl = μ₀ I_enc.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m4-u4',
            title: 'Magnetic fields in matter',
            content: r'''
## Learning goal

Describe diamagnetism, paramagnetism, and ferromagnetism in terms of atomic magnetic dipoles and their response to an applied B.

## Atomic moments

Electrons contribute magnetic moments from orbital motion and spin. Materials differ in how these moments respond to an external field and to each other.

## Diamagnetism

Present in all materials. Induced moments oppose the applied field (Lenz-like microscopic response), producing a weak magnetization opposite to B. Dominant when atoms have no permanent moments.

## Paramagnetism

Materials with permanent atomic moments that are randomly oriented when B = 0. An applied field partially aligns them, producing weak magnetization along B. Thermal disorder competes with alignment.

## Ferromagnetism

Strong interaction between neighbouring moments can lock large domains into alignment even without an external field (spontaneous magnetization). Iron, cobalt, nickel are familiar examples. Domain rearrangement explains permanent magnets and hysteresis.

## Check yourself

Why does heating a magnet past a critical temperature often destroy its permanent magnetism?
''',
            keyTakeaways: [
              'Diamagnetism: weak induced moments oppose the applied field.',
              'Paramagnetism: permanent moments partially align with the field.',
              'Ferromagnetism: cooperative alignment of domains; strong residual magnetization possible.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m4-u4-q1',
                question: 'Ferromagnetism is characterized by',
                options: [
                  'No atomic moments at all',
                  'Strong cooperative alignment of magnetic moments (domains)',
                  'Only diamagnetic response',
                  'Zero response to all fields',
                ],
                correctIndex: 1,
                explanation: 'Ferromagnets have spontaneous order of moments in domains.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy702-m5',
        title: 'Electric and Magnetic Energy Storage',
        summary:
            'Energy in capacitors and E fields, energy in inductors and B fields, field energy densities.',
        units: [
          Unit(
            id: 'phy702-m5-u1',
            title: 'Energy stored in electric fields',
            content: r'''
## Learning goal

Relate the work needed to assemble charges to energy stored in a capacitor and to the energy density of the electric field.

## Assembling charges

Bringing like charges together against repulsion takes work. That work is stored as electrostatic potential energy of the configuration. For a capacitor charged to voltage V with charge Q,

U_E = (1/2) Q V = (1/2) C V² = Q² / (2C)

depending on which pair of variables is convenient.

## Field form

The same energy can be written as an integral over space of a density depending on E. In vacuum,

U_E = (ϵ₀ / 2) ∫ E² dV

so the **electric energy density** is

u_E = (1/2) ϵ₀ E²

## Capacitor picture

Between the plates of a parallel-plate capacitor E is roughly uniform and concentrated in the gap; the formula (1/2)ϵ₀ E² times the gap volume recovers (1/2) C V².

## Check yourself

If E is doubled everywhere in a region (same volume), by what factor does the electric field energy increase?
''',
            keyTakeaways: [
              'Capacitor energy: (1/2) Q V = (1/2) C V².',
              'In vacuum, u_E = (1/2) ϵ₀ E².',
              'Assembling charges stores energy in the electric field configuration.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m5-u1-q1',
                question: 'The electric energy density in vacuum is',
                options: [
                  'ϵ₀ E',
                  '(1/2) ϵ₀ E²',
                  'E² / ϵ₀',
                  '0 always',
                ],
                correctIndex: 1,
                explanation: 'u_E = (1/2) ϵ₀ E².',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m5-u2',
            title: 'Energy stored in magnetic fields',
            content: r'''
## Learning goal

Connect the work done against induced emf while building a current to energy stored in an inductor and to magnetic energy density.

## Building a current

When current in an inductor increases, the changing flux induces an emf that opposes the increase (Lenz). The power supply must work against that emf. The cumulative work is stored in the magnetic field of the inductor:

U_B = (1/2) L I²

for inductance L carrying current I.

## Field form

In vacuum the magnetic energy can be written

U_B = (1/(2 μ₀)) ∫ B² dV

so the **magnetic energy density** is

u_B = B² / (2 μ₀)

## Solenoid picture

Inside a long solenoid B ≈ μ₀ n I is roughly uniform; integrating u_B over the interior volume recovers (1/2) L I² for the solenoid’s inductance.

## Check yourself

Why must you do net positive work to establish a steady current in an inductor from zero, even though a steady current in a resistance-free circuit needs no ongoing power against resistance?
''',
            keyTakeaways: [
              'Inductor energy: (1/2) L I².',
              'In vacuum, u_B = B² / (2 μ₀).',
              'Work against self-inductance while current rises is stored in B.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m5-u2-q1',
                question: 'The magnetic energy density in vacuum is',
                options: [
                  'μ₀ B²',
                  'B² / (2 μ₀)',
                  '(1/2) ϵ₀ B²',
                  'B only',
                ],
                correctIndex: 1,
                explanation: 'u_B = B² / (2 μ₀).',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m5-u3',
            title: 'Energy density in fields',
            content: r'''
## Learning goal

Treat electromagnetic fields as physical systems that store energy in space, not merely as mathematical aids for computing forces.

## Fields as a medium

The expressions

u_E = (1/2) ϵ₀ E²,    u_B = B² / (2 μ₀)

assign energy to each region of space where the fields are nonzero. In this view, a charged capacitor’s energy lives primarily in the gap field; an inductor’s energy lives in the B field of the coil.

## Elastic analogy

Think of the field configuration as a stressed elastic medium: changing the configuration takes work, and that work is recoverable when the fields return to a less energetic arrangement (with care about radiation and resistance in real circuits).

## Total electromagnetic energy

In vacuum, with both fields present,

U = ∫ [ (1/2) ϵ₀ E² + B² / (2 μ₀) ] dV

(This is the static or quasi-static bookkeeping; full electrodynamics also involves energy flow described by the Poynting vector.)

## Check yourself

Where is most of the energy “located” for a parallel-plate capacitor with a large plate separation compared to plate size — between the plates or far outside?
''',
            keyTakeaways: [
              'Field energy densities localize stored energy in space.',
              'Capacitors store energy mainly in E; inductors mainly in B.',
              'Total U integrates u_E + u_B over volume.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m5-u3-q1',
                question: 'Electromagnetic energy in vacuum is associated with',
                options: [
                  'Charges only, never fields',
                  'Integrals of E² and B² over space',
                  'Mass only',
                  'Temperature only',
                ],
                correctIndex: 1,
                explanation: 'Energy densities (1/2)ϵ₀ E² and B²/(2μ₀) integrate to total field energy.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy702-m6',
        title: 'Faraday\'s Law of Induction & Lenz\'s Law',
        summary:
            'Induction experiments, Faraday\'s law, Lenz\'s law, generators transformers cooktops.',
        units: [
          Unit(
            id: 'phy702-m6-u1',
            title: 'Electromagnetic induction discovery',
            content: r'''
## Learning goal

Describe the basic induction experiment: a changing magnetic situation in a circuit produces an electric current or voltage even with no chemical battery in the loop.

## Classic observations

- Push a bar magnet into a coil of wire connected to a galvanometer: the meter flicks while the magnet moves.
- Pull the magnet out: the meter flicks the other way.
- Hold the magnet still: no steady current.

A **changing** magnetic environment through the loop is essential. Steady B through a stationary circuit does not induce a continuous current.

## Relative motion

Moving the coil instead of the magnet works too. What matters is relative motion that changes the magnetic flux through the circuit (next unit).

## Check yourself

Why does a magnet sitting motionless inside a loop produce no induced current (ideal resistance, steady B)?
''',
            keyTakeaways: [
              'Changing magnetic conditions through a circuit induce voltage/current.',
              'Steady flux through a stationary loop does not drive continuous current.',
              'Relative motion of magnet and coil is a common way to change flux.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m6-u1-q1',
                question: 'A steady magnet at rest inside a stationary loop produces',
                options: [
                  'A large continuous current always',
                  'No continuous induced current',
                  'Only electric charge creation from nothing',
                  'Infinite flux always',
                ],
                correctIndex: 1,
                explanation: 'Induction requires changing flux, not merely nonzero B.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m6-u2',
            title: 'Faraday\'s law',
            content: r'''
## Learning goal

State Faraday’s law and translate every symbol into plain English.

## Magnetic flux

For a magnetic field through a surface bounded by a circuit,

Φ_B = ∫_S B · dA

For uniform B perpendicular to area A, Φ_B = B A. More generally, orientation and nonuniformity enter through the integral.

## Faraday’s law

The induced emf around a closed loop is

ℰ = − dΦ_B / dt

## Symbol translation

- ℰ — electromotive force around the loop (work per unit charge available to drive current)
- Φ_B — magnetic flux through a surface edged by the loop
- d/dt — rate of change with time
- minus sign — direction fixed by Lenz’s law (next unit)

Flux can change because B changes, the area changes, or the orientation changes (or the circuit moves).

## Check yourself

If flux through a loop increases steadily with time, what can you say about ℰ?
''',
            keyTakeaways: [
              'Φ_B = ∫ B · dA is the magnetic flux.',
              'Faraday: ℰ = −dΦ_B/dt.',
              'Any mechanism that changes flux can induce emf.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m6-u2-q1',
                question: 'Faraday\'s law states that induced emf equals',
                options: [
                  'Φ_B only',
                  '−dΦ_B/dt',
                  'B · A with no time derivative',
                  'μ₀ I_enc only',
                ],
                correctIndex: 1,
                explanation: 'ℰ = −dΦ_B/dt.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m6-u3',
            title: 'Lenz\'s law (nature\'s inertia)',
            content: r'''
## Learning goal

State Lenz’s law and connect the opposing induced current to energy conservation.

## Statement

The induced current (or the direction of ℰ) is such that the magnetic field it produces **opposes the change** in flux that caused it.

## Examples

- Magnet’s north pole approaches a loop: flux “into” the loop increases; induced current creates its own field that tries to push the magnet back (repel).
- Magnet withdrawn: induced effects try to maintain the flux (attract the retreating magnet).

## Energy conservation

If the induced current helped the change rather than opposing it, you could amplify flux with no work and extract unlimited energy. Opposition means you must do mechanical work to push the magnet in (against magnetic drag), and that work shows up as electrical energy in the circuit (and heat in resistors).

## Check yourself

When you pull a magnet away from a conducting loop, does the loop attract or repel the magnet, and why?
''',
            keyTakeaways: [
              'Induced effects oppose the change in flux (Lenz).',
              'Opposition enforces energy conservation.',
              'The minus sign in Faraday\'s law encodes Lenz\'s direction.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m6-u3-q1',
                question: 'Lenz\'s law says the induced current',
                options: [
                  'Always maximizes flux change',
                  'Opposes the change in flux that produced it',
                  'Is independent of flux',
                  'Violates energy conservation',
                ],
                correctIndex: 1,
                explanation: 'Induced effects fight the change in Φ_B.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m6-u4',
            title: 'Practical applications',
            content: r'''
## Learning goal

Connect Faraday and Lenz to generators, transformers, and induction cooktops at a conceptual level.

## Generators

A coil rotates in a magnetic field (or magnets rotate past coils). The flux through the coil varies periodically with time, so ℰ is alternating. Mechanical work turns the rotor; electrical energy is delivered to the load.

## Transformers

An alternating current in a primary coil produces a changing flux in a shared core. That changing flux links a secondary coil and induces an alternating emf. The turns ratio sets the voltage step-up or step-down (ideal transformer relation).

## Induction cooktops

A coil under the cooktop surface carries high-frequency alternating current. The changing B induces eddy currents in a conducting pot. Resistive heating in the pot cooks the food; the cooktop surface itself need not get as hot as a traditional element.

## Check yourself

Why does a transformer fail to step voltage for steady DC on the primary (after initial transients die)?
''',
            keyTakeaways: [
              'Generators: mechanical rotation → changing flux → emf.',
              'Transformers: changing flux shared between coils → secondary emf.',
              'Induction cooktops: eddy currents from changing B heat the pan.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m6-u4-q1',
                question: 'A transformer requires on the primary',
                options: [
                  'Only steady DC forever',
                  'Time-varying current (typically AC) to produce changing flux',
                  'No current at all',
                  'Only permanent magnets with no coils',
                ],
                correctIndex: 1,
                explanation: 'Changing flux is required for continuous induction in the secondary.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy702-m7',
        title: 'Motion of Charges in Electric and Magnetic Fields',
        summary:
            'Lorentz force, motion in pure E, motion in pure B, velocity selector and mass spectrometer.',
        units: [
          Unit(
            id: 'phy702-m7-u1',
            title: 'Lorentz force law',
            content: r'''
## Learning goal

State the Lorentz force law and explain each term: electric part and magnetic part.

## The law

A particle with charge q, velocity v, in fields E and B experiences

F = q (E + v × B)

## Electric term: q E

Independent of velocity. Parallel (or anti-parallel) to E for positive (negative) q. Does work on the charge when the particle moves parallel to E: changes kinetic energy.

## Magnetic term: q (v × B)

Perpendicular to both v and B (right-hand rule for the cross product, then sign of q). Magnitude q |v| |B| sin θ. Because F_B is always perpendicular to v, the magnetic force does **no work**: it changes direction of motion, not speed.

## Check yourself

If v is parallel to B and E = 0, what is the magnetic force?
''',
            keyTakeaways: [
              'F = q(E + v × B).',
              'qE can change kinetic energy; q(v × B) cannot (perpendicular to v).',
              'Direction of v × B from the right-hand rule.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m7-u1-q1',
                question: 'The magnetic part of the Lorentz force is always',
                options: [
                  'Parallel to v',
                  'Perpendicular to v',
                  'Independent of B',
                  'Zero if v is nonzero',
                ],
                correctIndex: 1,
                explanation: 'v × B is perpendicular to v, so magnetic force does no work.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m7-u2',
            title: 'Motion in a pure electric field',
            content: r'''
## Learning goal

Describe the trajectory of a charge in a uniform electric field with no magnetic field — the projectile analogy.

## Setup

Uniform E, say in the −y direction (like near-Earth gravity for a positive mass). Initial velocity with a component across the field.

## Acceleration

a = (q/m) E — constant acceleration parallel to E. No acceleration perpendicular to E from the electric force alone.

## Trajectory

In coordinates: uniform motion in the direction of the initial velocity component perpendicular to E; constant acceleration along E. The path is a **parabola**, exactly analogous to a ball thrown in a uniform gravitational field.

## Energy

Speed changes: the field does work. Kinetic energy increases when the charge moves in the direction of the force qE.

## Check yourself

If a positive charge enters a region of uniform E pointing down, with initial velocity horizontal, which way does its path curve?
''',
            keyTakeaways: [
              'Uniform E ⇒ constant acceleration a = (q/m) E.',
              'Trajectory is parabolic when there is a transverse initial velocity.',
              'Electric fields change the speed of the particle.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m7-u2-q1',
                question: 'In a pure uniform electric field, the path of a charge with transverse initial velocity is typically',
                options: [
                  'A perfect circle',
                  'A parabola',
                  'A straight line at constant speed always',
                  'A random walk',
                ],
                correctIndex: 1,
                explanation: 'Constant acceleration like projectile motion yields a parabola.',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m7-u3',
            title: 'Motion in a pure magnetic field',
            content: r'''
## Learning goal

Show that a charge in a uniform B field moves in a circle or helix, with magnetic force providing the centripetal force.

## Perpendicular velocity only

If v is perpendicular to uniform B, |F| = q v B (constant). Direction always perpendicular to v, so the force is centripetal.

q v B = m v² / R ⇒ R = m v / (q B)

Cyclotron frequency (angular): ω = q B / m (independent of speed in classical nonrelativistic mechanics).

Path: circle of radius R in the plane perpendicular to B.

## Parallel component

Velocity parallel to B is unchanged (F_B has no parallel component). Combined with circular motion in the perpendicular plane → **helix** along the field lines.

## Speed

|v| is constant because F_B ⊥ v. Only direction changes.

## Check yourself

If you double B while keeping v_perp fixed, what happens to the cyclotron radius R?
''',
            keyTakeaways: [
              'Uniform B, v ⊥ B: circular motion with R = mv/(qB).',
              'ω = qB/m (cyclotron frequency).',
              'Parallel velocity + circular motion ⇒ helix; |v| constant.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m7-u3-q1',
                question: 'The cyclotron radius in uniform B (v perpendicular to B) is',
                options: [
                  'R = q B / m v',
                  'R = m v / (q B)',
                  'R = m / q only',
                  'Independent of v',
                ],
                correctIndex: 1,
                explanation: 'Centripetal force qvB = mv²/R gives R = mv/(qB).',
              ),
            ],
          ),
          Unit(
            id: 'phy702-m7-u4',
            title: 'Velocity selector and mass spectrometer',
            content: r'''
## Learning goal

Combine E and B to select speed, then use magnetic bending to separate masses.

## Velocity selector

Crossed uniform E and B (perpendicular). Force balance for straight-line motion:

q E = q v B ⇒ v = E / B

Only particles with this speed pass undeflected; others curve out of the beam.

## Mass spectrometer (concept)

Ions of charge q and mass m, often after a velocity selector so v is known, enter a region of uniform B. They bend in a semicircle of radius

R = m v / (q B)

Detecting where they hit gives R, hence m (for known q, v, B). Different masses separate spatially.

## Check yourself

In the velocity selector, if E is increased while B is fixed, what happens to the selected speed?
''',
            keyTakeaways: [
              'Velocity selector: v = E/B for undeflected particles in crossed fields.',
              'Mass spectrometer: R = mv/(qB) separates masses after speed selection.',
              'Both applications use the Lorentz force structure directly.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy702-m7-u4-q1',
                question: 'In a velocity selector with crossed E and B, the selected speed is',
                options: [
                  'v = B/E',
                  'v = E/B',
                  'v = E B',
                  'v = 0 only',
                ],
                correctIndex: 1,
                explanation: 'Balance qE = qvB gives v = E/B.',
              ),
            ],
          ),
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
