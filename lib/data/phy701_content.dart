import 'package:pgd_physics/models/course.dart';

/// PHY 701 — Mathematical Methods
/// Module 1 filled from content_prompts/PHY701/01_Module1 (Boas-aligned).
Course buildPhy701() {
  return Course(
    id: 'phy-701',
    code: 'PHY 701',
    title: 'Mathematical Methods',
    description:
        'Methods of ODEs and PDEs, Laplace and Fourier methods, special functions, residues and Green functions for physical applications.',
    semester: 'First Semester',
    units: 3,
    icon: '∫',
    colorHint: ColorHint.purple,
    modules: [
      Module(
        id: 'phy701-m1',
        title: 'Ordinary Differential Equations & Linear Operators',
        summary:
            'Physical ODEs, Wronskian and Abel, L² spaces, Sturm–Liouville form, real eigenvalues and orthogonal eigenfunctions.',
        units: [
          Unit(
            id: 'phy701-m1-u1',
            title: 'Physical foundations of 1st and 2nd-order ODEs',
            content: r'''
## Learning goal

See how Newton’s laws and simple restoring forces produce first- and second-order ordinary differential equations (ODEs), and read every symbol as a physical quantity before treating the equation as abstract math.

## Why it matters

Almost every later topic in PHY 701 — Laplace transforms, special functions, Green’s functions — exists to solve ODEs and PDEs that encode real physics. If the ODE is not grounded in a system you can picture, the algebra later will feel empty.

## First-order ODE from a physical system

Consider a particle of mass m moving in one dimension under a force that depends only on velocity, for example linear drag:

F = −b v

where b > 0 is a drag coefficient and v = dx/dt is velocity. Newton’s second law says

m dv/dt = −b v

Divide by m (m ≠ 0):

dv/dt = −(b/m) v

Write γ = b/m > 0. Then

dv/dt + γ v = 0

This is a **first-order linear homogeneous ODE** for the unknown function v(t).

### Separating variables (full steps)

If v ≠ 0, rewrite:

(1/v) dv/dt = −γ

Multiply both sides by dt:

(1/v) dv = −γ dt

Integrate both sides between an initial time t₀ with velocity v(t₀) = v₀ and a later time t with velocity v(t):

∫_{v₀}^{v} (1/v′) dv′ = −γ ∫_{t₀}^{t} dt′

Left side: ln|v| − ln|v₀| = ln|v/v₀|  
Right side: −γ (t − t₀)

So

ln|v/v₀| = −γ (t − t₀)

Exponentiate:

|v/v₀| = e^{−γ(t−t₀)}

For physical drag with v₀ > 0 and continuous motion, v stays positive:

v(t) = v₀ e^{−γ(t−t₀)}

Every step came from F = ma and separation of variables — no appeal to “standard forms” yet.

## Second-order ODE: undamped harmonic oscillator

A mass m on a spring with constant k > 0, displacement x(t) from equilibrium, experiences

F = −k x

Newton:

m d²x/dt² = −k x

Define ω₀² = k/m > 0 (so ω₀ = √(k/m) is the natural angular frequency). Then

d²x/dt² + ω₀² x = 0

This is a **second-order linear homogeneous ODE with constant coefficients**.

### Reading the symbols

- t — independent variable (time)
- x(t) — dependent variable (displacement)
- d²x/dt² — acceleration
- ω₀² x — restoring term proportional to displacement

The equation says: acceleration is always opposite to displacement and proportional to it.

## Damped oscillator (still second order)

With linear damping −b v = −b dx/dt:

m d²x/dt² = −b dx/dt − k x

Divide by m:

d²x/dt² + (b/m) dx/dt + (k/m) x = 0

Write 2β = b/m and ω₀² = k/m:

d²x/dt² + 2β dx/dt + ω₀² x = 0

The single second-order equation encodes inertia, damping, and restoring force together.

## General pattern

A large class of physical laws reduce to

a_n(t) dⁿy/dtⁿ + … + a₁(t) dy/dt + a₀(t) y = f(t)

For constant coefficients and f = 0 we recover the standard constant-coefficient theory (Boas, ODE chapters). The physics always enters by identifying what y is and what the coefficients mean.

## Check yourself

If you double the mass m but keep k and b fixed in the damped oscillator, which coefficients in  
d²x/dt² + (b/m) dx/dt + (k/m) x = 0  
change, and do they increase or decrease?
''',
            keyTakeaways: [
              'First-order linear ODEs arise naturally from velocity-dependent forces such as linear drag.',
              'Second-order ODEs arise from Newton’s law with position-dependent restoring forces (springs).',
              'Every coefficient in a physical ODE has a meaning (mass, damping, stiffness, etc.).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m1-u1-q1',
                question:
                    'The equation dv/dt + γv = 0 with γ = b/m comes from which physical balance?',
                options: [
                  'Energy conservation alone with no forces',
                  'Newton’s second law with linear drag F = −bv',
                  'Gauss’s law for electrostatics',
                  'The ideal gas law',
                ],
                correctIndex: 1,
                explanation:
                    'm dv/dt = −b v is Newton’s law with linear drag; dividing by m gives dv/dt + (b/m)v = 0.',
              ),
              QuizQuestion(
                id: 'phy701-m1-u1-q2',
                question:
                    'For the undamped spring–mass system, ω₀² in x″ + ω₀²x = 0 equals',
                options: [
                  'k/m',
                  'm/k',
                  'b/m',
                  'km',
                ],
                correctIndex: 0,
                explanation:
                    'From m x″ = −kx one gets x″ + (k/m)x = 0, so ω₀² = k/m.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m1-u2',
            title: 'Linear independence, Wronskian, and Abel’s identity',
            content: r'''
## Learning goal

Decide when two solutions of a second-order linear ODE are genuinely independent, construct the Wronskian from scratch, and prove Abel’s identity with every derivative written out.

## Why it matters

The general solution of a second-order linear homogeneous ODE is a linear combination of two independent solutions. The Wronskian is the standard test of independence used throughout Boas and later Sturm–Liouville theory.

## Linear homogeneous second-order ODE

Consider

y″ + p(x) y′ + q(x) y = 0

on an interval where p and q are continuous. The set of solutions is a two-dimensional vector space: if y₁ and y₂ solve the ODE, so does c₁ y₁ + c₂ y₂.

## Linear independence

Two solutions y₁, y₂ are **linearly independent** on an interval I if the only constants satisfying

c₁ y₁(x) + c₂ y₂(x) = 0 for all x in I

are c₁ = c₂ = 0. Otherwise they are dependent (one is a constant multiple of the other).

## The Wronskian

Define the **Wronskian** determinant

W(y₁, y₂)(x) = y₁(x) y₂′(x) − y₂(x) y₁′(x)

If W is not identically zero on I, then y₁ and y₂ are linearly independent on I. (For this ODE class, W is either always zero or never zero on I — that follows from Abel’s identity below.)

## Abel’s identity — full derivation

Differentiate W:

W′ = y₁′ y₂′ + y₁ y₂″ − (y₂′ y₁′ + y₂ y₁″)  
   = y₁ y₂″ − y₂ y₁″

(the y₁′ y₂′ terms cancel).

From the ODE, y₁″ = −p y₁′ − q y₁ and y₂″ = −p y₂′ − q y₂. Substitute:

W′ = y₁(−p y₂′ − q y₂) − y₂(−p y₁′ − q y₁)  
   = −p y₁ y₂′ − q y₁ y₂ + p y₂ y₁′ + q y₂ y₁  
   = −p (y₁ y₂′ − y₂ y₁′)  
   = −p W

(the q terms cancel). So

W′ + p(x) W = 0

This is a first-order ODE for W. If W ≠ 0,

dW/W = −p(x) dx

Integrate from x₀ to x:

ln|W(x)/W(x₀)| = −∫_{x₀}^{x} p(s) ds

Hence

W(x) = W(x₀) exp( −∫_{x₀}^{x} p(s) ds )

That is **Abel’s identity**. If W(x₀) = 0 then W vanishes everywhere; if W(x₀) ≠ 0 then W never vanishes on the interval of continuity of p.

## Phase-space picture (intuition)

For an autonomous second-order equation written as a first-order system in (y, y′), two solution curves that are scalar multiples in function space correspond to trajectories that never supply a full basis of initial data (y(x₀), y′(x₀)). A non-vanishing Wronskian means the map from coefficients (c₁, c₂) to initial data is invertible.

## Check yourself

If p(x) = 0 in the ODE y″ + q(x)y = 0, what does Abel’s identity say about W(x)?
''',
            keyTakeaways: [
              'The Wronskian W = y₁ y₂′ − y₂ y₁′ tests linear independence of two solutions.',
              'Abel’s identity: W(x) = W(x₀) exp(−∫_{x₀}^{x} p(s) ds) for y″ + p y′ + q y = 0.',
              'For this ODE class, W is either identically zero or nowhere zero on the interval.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m1-u2-q1',
                question: 'Abel’s identity is derived by',
                options: [
                  'Guessing an integrating factor for y only',
                  'Differentiating W and substituting y″ from the ODE',
                  'Using Fourier transforms',
                  'Setting p(x) = 0 always',
                ],
                correctIndex: 1,
                explanation:
                    'W′ = y₁ y₂″ − y₂ y₁″; replace second derivatives using the ODE to get W′ = −p W.',
              ),
              QuizQuestion(
                id: 'phy701-m1-u2-q2',
                question:
                    'If W(y₁, y₂)(x₀) ≠ 0 at one point, then on the interval of continuity of p',
                options: [
                  'W may still vanish at some other points',
                  'W is nowhere zero',
                  'y₁ must equal y₂',
                  'The ODE becomes nonlinear',
                ],
                correctIndex: 1,
                explanation:
                    'Abel’s formula factors W(x₀) times a never-zero exponential, so W cannot cross zero.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m1-u3',
            title: 'Linear operators, L² spaces, and weight functions',
            content: r'''
## Learning goal

Treat differentiation-plus-coefficients as a linear operator on a space of functions, and define the weighted inner product that later makes Sturm–Liouville operators self-adjoint.

## Why it matters

Sturm–Liouville theory is not only about ODEs; it is about **operators** on inner-product spaces. Eigenfunctions of self-adjoint operators behave like orthogonal axes — the backbone of Fourier, Bessel, and Legendre expansions.

## Function space L²[a, b]

Fix a finite interval [a, b]. A (real) function f is square-integrable on [a, b] if

∫_a^b |f(x)|² dx < ∞

The space of such functions (completed with respect to the L² norm) is written L²[a, b]. Two functions that differ only on a set of measure zero are identified.

## Inner product without weight

The standard inner product is

⟨f, g⟩ = ∫_a^b f(x) g(x) dx

It is linear in each slot (over the reals), symmetric, and ⟨f, f⟩ ≥ 0.

## Weight function

Many physical problems (especially in radial coordinates) need a **weight** w(x) > 0 on (a, b):

⟨f, g⟩_w = ∫_a^b f(x) g(x) w(x) dx

Examples:

- w(x) = 1 on [−1, 1] for Legendre
- w(x) = x on (0, 1) for certain Bessel forms on a finite interval
- w(x) = e^{−x²} on (−∞, ∞) for Hermite

The weight is part of the geometry of the space, not an optional decoration.

## Linear differential operator

A second-order operator has the schematic form

L[y] = α₂(x) y″ + α₁(x) y′ + α₀(x) y

Linearity means L[c₁ y₁ + c₂ y₂] = c₁ L[y₁] + c₂ L[y₂]. The ODE L[y] = 0 is a homogeneous linear problem; L[y] = f is nonhomogeneous.

## Domain and boundary conditions

An operator on L² is not fully specified until you state the **domain**: functions smooth enough for L[y] to make sense and satisfying boundary conditions at a and b (e.g. y(a) = y(b) = 0). Different boundary conditions produce different operators even if the expression for L looks the same.

## Formal adjoint (preview)

Integration by parts relates ⟨L[y], z⟩ to ⟨y, L†[z]⟩ plus boundary terms. When boundary terms vanish and L† = L, the operator is **formally self-adjoint**. Sturm–Liouville form is exactly the shape that makes this transparent (next unit).

## Check yourself

Why is the weight w(x) inside the integral for ⟨f, g⟩_w, rather than multiplying f after integration?
''',
            keyTakeaways: [
              'L²[a, b] is the space of square-integrable functions on [a, b].',
              'A weight w(x) > 0 defines ⟨f, g⟩_w = ∫ f g w dx used in orthogonal expansions.',
              'A linear differential operator L acts on a domain that includes boundary conditions.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m1-u3-q1',
                question: 'The weighted inner product ⟨f, g⟩_w equals',
                options: [
                  'f(a)g(b) w(a)',
                  '∫_a^b f(x) g(x) w(x) dx',
                  '∫_a^b f′(x) g′(x) dx',
                  'max(f g w)',
                ],
                correctIndex: 1,
                explanation:
                    'By definition ⟨f, g⟩_w = ∫_a^b f g w dx with w > 0 on the open interval.',
              ),
              QuizQuestion(
                id: 'phy701-m1-u3-q2',
                question:
                    'Linearity of L means that for constants c₁, c₂',
                options: [
                  'L[y₁ y₂] = L[y₁] L[y₂]',
                  'L[c₁ y₁ + c₂ y₂] = c₁ L[y₁] + c₂ L[y₂]',
                  'L[y′] = L[y]′ always',
                  'L must have constant coefficients',
                ],
                correctIndex: 1,
                explanation:
                    'Linearity is preservation of linear combinations, independent of whether coefficients are constant.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m1-u4',
            title: 'Casting ODEs into Sturm–Liouville form',
            content: r'''
## Learning goal

Rewrite a general second-order linear ODE in self-adjoint (Sturm–Liouville) form and recognize the weight and eigenvalue parameter.

## Why it matters

Classical “special function” equations (Legendre, Bessel, Hermite, …) are Sturm–Liouville eigenvalue problems in disguise. Putting an ODE into S–L form unlocks orthogonality and eigenfunction expansions.

## General second-order linear ODE

Start with

A(x) y″ + B(x) y′ + C(x) y + λ D(x) y = 0

with A(x) ≠ 0 on the interval. (λ is a parameter we will treat as an eigenvalue.)

## Integrating factor to self-adjoint form

Divide by A:

y″ + (B/A) y′ + (C/A) y + λ (D/A) y = 0

Let P(x) = B(x)/A(x). Multiply through by the integrating factor

μ(x) = exp( ∫ P(x) dx ) = exp( ∫ B/A dx )

A standard calculation (product rule) shows

μ y″ + μ (B/A) y′ = d/dx ( μ y′ )

So the equation becomes

d/dx [ μ(x) y′ ] + μ(x) (C/A) y + λ μ(x) (D/A) y = 0

Define

p(x) = μ(x),  
q(x) = μ(x) C(x)/A(x),  
w(x) = μ(x) D(x)/A(x)

(assuming D/A gives a positive weight after absolute values/sign choices appropriate to the problem). Then

d/dx [ p(x) y′ ] + q(x) y + λ w(x) y = 0

or

d/dx [ p(x) y′ ] + q(x) y = −λ w(x) y

This is **Sturm–Liouville form**. Equivalently one writes

L[y] = −(1/w) ( d/dx [p y′] + q y ) = λ y

when w ≠ 0.

## Regular Sturm–Liouville problem

On a finite interval [a, b] with p, p′, q, w continuous and p > 0, w > 0, together with separated boundary conditions

α₁ y(a) + α₂ y′(a) = 0,  
β₁ y(b) + β₂ y′(b) = 0

one obtains a **regular** S–L eigenvalue problem. Eigenvalues λ and eigenfunctions y_n are then constrained strongly (next unit).

## Physical reading

- p(x) weights the “slope energy” in variational language
- q(x) is a potential-like term
- w(x) is the weight in the orthogonality integral
- λ labels allowed modes (frequencies, energy levels, decay constants, …)

## Check yourself

If B = 0 and A = 1 already, what is the integrating factor μ(x)?
''',
            keyTakeaways: [
              'Multiplying by μ = exp(∫ B/A dx) converts a second-order linear ODE to self-adjoint form.',
              'Sturm–Liouville form: d/dx[p y′] + q y + λ w y = 0.',
              'The weight w(x) in S–L form is the weight used for orthogonality of eigenfunctions.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m1-u4-q1',
                question:
                    'The integrating factor that produces S–L form from y″ + (B/A)y′ + … = 0 is',
                options: [
                  'μ = A/B',
                  'μ = exp(∫ B/A dx)',
                  'μ = exp(−∫ A dx)',
                  'μ = B only',
                ],
                correctIndex: 1,
                explanation:
                    'μ = exp(∫ P dx) with P = B/A makes μ y″ + μ P y′ a perfect derivative.',
              ),
              QuizQuestion(
                id: 'phy701-m1-u4-q2',
                question: 'In standard S–L form, the eigenvalue λ multiplies',
                options: [
                  'Only y″',
                  'The weight term w(x) y',
                  'Only the boundary values',
                  'p(x) alone',
                ],
                correctIndex: 1,
                explanation:
                    'The term λ w(x) y (or −λ w y depending on sign convention) carries the eigenvalue.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m1-u5',
            title: 'S–L eigenvalues are real; eigenfunctions are orthogonal',
            content: r'''
## Learning goal

Prove that eigenvalues of a regular self-adjoint Sturm–Liouville problem are real, and that eigenfunctions belonging to distinct eigenvalues are orthogonal with respect to the weight w.

## Why it matters

These two theorems justify expanding physical fields as Σ c_n y_n(x) with real modal “energies” λ_n and coefficients from weighted integrals — the pattern behind Fourier, Fourier–Bessel, and Legendre series.

## Setup

Let L be the Sturm–Liouville operator

L[y] = (1/w) ( − d/dx [p y′] − q y )

so the eigenvalue equation is L[y] = λ y, i.e.

− d/dx [p y′] − q y = λ w y

Assume a regular problem on [a, b] with p > 0, w > 0, continuous coefficients, and separated self-adjoint boundary conditions so that all boundary terms arising in integration by parts vanish.

## Lagrange identity (Green’s formula)

For two smooth functions u, v,

∫_a^b ( v (−(p u′)′) − u (−(p v′)′) ) dx = [ −v p u′ + u p v′ ]_a^b

More completely, including q:

∫_a^b (v L[u] − u L[v]) w dx = boundary terms involving p, u, v, u′, v′

Self-adjoint boundary conditions are exactly those that make the boundary terms zero. Then

⟨L[u], v⟩_w = ⟨u, L[v]⟩_w

## Eigenvalues are real

Let L[y] = λ y with y not identically zero and y complex allowed for the argument. Take the weighted inner product with y:

⟨L[y], y⟩_w = λ ⟨y, y⟩_w

Also ⟨L[y], y⟩_w = ⟨y, L[y]⟩_w = ⟨y, λ y⟩_w = λ* ⟨y, y⟩_w  
if we use complex conjugation in the first slot of the inner product in the complex case.

More elementarily for real L and real-valued solutions: if λ were complex, conjugate the ODE and use self-adjointness to show λ = λ*. In the real theory used in Boas’s applied chapters, one works with real eigenfunctions and obtains real λ by noting

λ ∫ y² w dx = ∫ y (−(p y′)′ − q y) dx

and integrating by parts to

λ ∫ y² w dx = ∫ p (y′)² dx − ∫ q y² dx + boundary terms (zero)

The right-hand side is real, and ∫ y² w dx > 0, so λ is real.

## Orthogonal eigenfunctions

Let L[y_m] = λ_m y_m and L[y_n] = λ_n y_n with λ_m ≠ λ_n. Then

⟨L[y_m], y_n⟩_w = λ_m ⟨y_m, y_n⟩_w  
⟨y_m, L[y_n]⟩_w = λ_n ⟨y_m, y_n⟩_w

Self-adjointness equates the left sides, so

(λ_m − λ_n) ⟨y_m, y_n⟩_w = 0

Hence ⟨y_m, y_n⟩_w = 0: eigenfunctions for distinct eigenvalues are orthogonal with weight w.

## Normalization

One often scales y_n so that ⟨y_n, y_n⟩_w = 1. Coefficients of an expansion f = Σ c_n y_n become

c_n = ⟨f, y_n⟩_w / ⟨y_n, y_n⟩_w

## Check yourself

Where did the boundary conditions enter the orthogonality proof?
''',
            keyTakeaways: [
              'Self-adjoint S–L problems have real eigenvalues.',
              'Eigenfunctions for distinct eigenvalues satisfy ∫ y_m y_n w dx = 0.',
              'Boundary conditions are essential so integrated boundary terms vanish.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m1-u5-q1',
                question:
                    'If λ_m ≠ λ_n for two S–L eigenfunctions, then',
                options: [
                  '∫ y_m y_n w dx = 0',
                  'y_m = y_n everywhere',
                  'w must be zero',
                  'p(x) must be negative',
                ],
                correctIndex: 0,
                explanation:
                    'Self-adjointness implies (λ_m − λ_n)⟨y_m, y_n⟩_w = 0, so the inner product vanishes.',
              ),
              QuizQuestion(
                id: 'phy701-m1-u5-q2',
                question:
                    'Real eigenvalues ultimately use that, after integration by parts, λ is a ratio of',
                options: [
                  'Complex contour integrals only',
                  'Real integrals involving p, q, w and y',
                  'Determinants of random matrices',
                  'Unrelated time averages',
                ],
                correctIndex: 1,
                explanation:
                    'The Rayleigh-type identity expresses λ as a quotient of real integrals when boundary terms vanish.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy701-m2',
        title: 'Laplace Transforms & Operational Calculus',
        summary:
            'Unilateral Laplace transform, ROC, derivative/integral theorems, convolution, and inversion ideas.',
        units: [
          Unit(
            id: 'phy701-m2-u1',
            title: 'Physical intuition: time domain to s-domain',
            content: r'''
## Learning goal

Understand the unilateral Laplace transform as a systematic change of representation: from functions of time to functions of a complex frequency s, motivated by linear circuits and damped oscillators.

## Why it matters

Many PGD physics and electronics problems are linear constant-coefficient ODEs in time. The Laplace transform turns differentiation in t into multiplication by s, so the ODE becomes algebra, then one returns to time by inversion.

## A physical system

Take the series RL circuit with resistance R, inductance L, and applied voltage v(t) for t >= 0. Current i(t) obeys

L di/dt + R i = v(t)

With zero initial current this is a first-order linear ODE. Solving in the time domain needs an integrating factor. Solving after a Laplace transform uses algebra in the s-domain and inversion at the end.

## What the transform does (intuition)

Think of a signal f(t) that is zero for t < 0 (switched on at t = 0). The unilateral Laplace transform builds a weighted average of f against exponential probes e^{-st}:

F(s) = integral from 0 to infinity of f(t) e^{-st} dt

- If s = sigma is real and positive, e^{-sigma t} damps the future; the integral emphasizes early times more when sigma is large.
- If s = sigma + i omega, the factor e^{-i omega t} oscillates while e^{-sigma t} still damps. So s encodes both decay/growth (real part) and oscillation (imaginary part).

That is the frequency domain for Laplace: not only pure sinusoids (Fourier), but exponentially weighted sinusoids suited to transients.

## Domain language

- Time domain: f(t), t >= 0, differential equations, initial conditions.
- s-domain: F(s), algebraic equations, initial conditions appear as extra terms when derivatives transform.

## Check yourself

Why is the unilateral transform (integral from 0 to infinity) more natural for circuits switched on at t = 0 than a bilateral integral from -infinity to infinity?
''',
            keyTakeaways: [
              'Laplace maps time-domain linear ODEs into algebraic equations in s.',
              'The factor e^{-st} probes both exponential growth/decay and oscillation.',
              'Unilateral transforms match initial-value problems with t >= 0.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m2-u1-q1',
                question:
                    'In F(s) = integral of f(t) e^{-st} dt from 0 to infinity, the real part of s mainly controls',
                options: [
                  'Only the units of f',
                  'Exponential weighting (growth or decay) in the integrand',
                  'Whether f is a vector',
                  'The value of f at infinity only',
                ],
                correctIndex: 1,
                explanation:
                    'Writing s = sigma + i omega, e^{-st} = e^{-sigma t} e^{-i omega t}; sigma sets the exponential weight.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m2-u2',
            title: 'Definition, existence, and region of convergence',
            content: r'''
## Learning goal

State the unilateral Laplace transform precisely, and explain the region of convergence (ROC) with a worked exponential example.

## Definition

For a function f(t) defined for t >= 0 (and typically taken as 0 for t < 0 in applications), the unilateral Laplace transform is

F(s) = L{f}(s) = integral from 0 to infinity of f(t) e^{-st} dt

whenever the integral converges. Here s is complex.

## Existence (sufficient condition)

A practical sufficient condition: if there exist constants M > 0 and alpha such that

|f(t)| <= M e^{alpha t} for all t >= 0

(exponential order alpha), and f is piecewise continuous on finite intervals, then the integral converges absolutely whenever Re(s) > alpha.

## Region of convergence (ROC)

The set of s for which the integral converges is the ROC. For many elementary signals the ROC is a half-plane Re(s) > sigma_0.

### Example: f(t) = e^{at} (t >= 0, a real)

F(s) = integral_0^infinity e^{at} e^{-st} dt = integral_0^infinity e^{-(s-a)t} dt

If Re(s - a) > 0, i.e. Re(s) > a,

F(s) = 1/(s - a)

ROC: Re(s) > a. Outside that half-plane the integral diverges even though the algebraic expression 1/(s-a) exists as a formula. The transform is the integral, not merely the closed form.

### Example: unit step u(t) = 1 for t >= 0

This is e^{at} with a = 0, so L{u} = 1/s with ROC Re(s) > 0.

## Linearity

L{c1 f + c2 g} = c1 F + c2 G on the intersection of ROCs (with care at boundaries).

## Check yourself

If f(t) = e^{2t} for t >= 0, can you use F(s) = 1/(s-2) at s = 0? Why or why not?
''',
            keyTakeaways: [
              'L{f}(s) equals the integral from 0 to infinity of f(t) e^{-st} dt when it converges.',
              'Exponential order of f determines a half-plane ROC.',
              'Closed forms are valid only inside the ROC of the defining integral.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m2-u2-q1',
                question: 'For f(t) = e^{at} (t >= 0, a real), the ROC of L{f} is',
                options: [
                  'The entire complex plane',
                  'Re(s) > a',
                  'Re(s) < a',
                  'Only pure imaginary s',
                ],
                correctIndex: 1,
                explanation:
                    'The integral of e^{-(s-a)t} from 0 to infinity converges when Re(s - a) > 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m2-u3',
            title: 'Derivative and integral theorems',
            content: r'''
## Learning goal

Derive the Laplace transforms of f', f'', and higher derivatives using integration by parts, and state the integral theorem.

## First derivative

Assume f and f' are of exponential order so boundary terms at infinity vanish in the ROC.

L{f'} = integral_0^infinity f'(t) e^{-st} dt

Integrate by parts with u = e^{-st}, dv = f'(t) dt, so du = -s e^{-st} dt, v = f(t):

= [f(t) e^{-st}]_0^infinity + s integral_0^infinity f(t) e^{-st} dt

At infinity: f(t) e^{-st} -> 0 in the ROC.
At 0: f(0).

So L{f'} = 0 - f(0) + s F(s) = s F(s) - f(0)

## Second derivative

Apply the same rule to f':

L{f''} = s L{f'} - f'(0) = s(s F - f(0)) - f'(0) = s^2 F(s) - s f(0) - f'(0)

## nth derivative

By induction:

L{f^{(n)}} = s^n F(s) - s^{n-1} f(0) - s^{n-2} f'(0) - ... - f^{(n-1)}(0)

Initial conditions enter as polynomial terms in s.

## Integral theorem

Let g(t) = integral_0^t f(tau) d tau. Then g' = f and g(0) = 0, so

L{g'} = s L{g} = F(s)  =>  L{g} = F(s)/s

## Check yourself

For the ODE y' + gamma y = 0 with y(0) = y0, write the Laplace transform of both sides using the derivative theorem.
''',
            keyTakeaways: [
              'L{f\'} = s F(s) - f(0); initial data appear automatically.',
              'L{f\'\'} = s^2 F - s f(0) - f\'(0).',
              'L{integral_0^t f} = F(s)/s when the integral starts at 0.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m2-u3-q1',
                question: 'L{f\'} equals',
                options: [
                  'F(s)/s',
                  's F(s) - f(0)',
                  's F(s) + f(0)',
                  'dF/ds',
                ],
                correctIndex: 1,
                explanation:
                    'Integration by parts yields s F(s) - f(0) when the boundary term at infinity vanishes.',
              ),
              QuizQuestion(
                id: 'phy701-m2-u3-q2',
                question: 'L{f\'\'} uses which initial values?',
                options: [
                  'Only f at infinity',
                  'f(0) and f\'(0)',
                  'Only F(0)',
                  'None',
                ],
                correctIndex: 1,
                explanation: 'L{f\'\'} = s^2 F - s f(0) - f\'(0).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m2-u4',
            title: 'Convolution theorem',
            content: r'''
## Learning goal

Define convolution on the half-line and derive that the Laplace transform turns convolution into multiplication.

## Convolution for causal signals

For functions that vanish for negative arguments,

(f * g)(t) = integral_0^t f(tau) g(t - tau) d tau

## Theorem

L{f * g} = F(s) G(s)

on an appropriate intersection of ROCs.

## Derivation

L{f * g} = integral_0^infinity [integral_0^t f(tau) g(t-tau) d tau] e^{-st} dt

Change the region to tau from 0 to infinity and t from tau to infinity:

= integral_0^infinity f(tau) [integral_tau^infinity g(t-tau) e^{-st} dt] d tau

Substitute u = t - tau:

inner integral = e^{-s tau} G(s)

Hence L{f * g} = G(s) integral_0^infinity f(tau) e^{-s tau} d tau = F(s) G(s)

## Why physicists care

A linear time-invariant system with impulse response h(t) produces y = h * x. In the s-domain, Y(s) = H(s) X(s).

## Check yourself

If G(s) = 1 in the distributional sense corresponding to a delta at 0, what is f * g?
''',
            keyTakeaways: [
              '(f * g)(t) = integral_0^t f(tau) g(t-tau) d tau for causal signals.',
              'L{f * g} = F(s) G(s).',
              'LTI systems: output transform equals product of transfer function and input transform.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m2-u4-q1',
                question: 'The Laplace transform of a convolution f * g is',
                options: [
                  'F(s) + G(s)',
                  'F(s) G(s)',
                  'F(s)/G(s)',
                  'F\'(s) G\'(s)',
                ],
                correctIndex: 1,
                explanation: 'The convolution theorem states L{f * g} = F G.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m2-u5',
            title: 'Inversion: Bromwich integral and residues',
            content: r'''
## Learning goal

State the Bromwich inversion integral, interpret the complex s-plane, and explain why residues recover elementary inverse transforms.

## Inversion formula

Under suitable conditions, if F(s) = L{f}, then

f(t) = (1/(2 pi i)) integral from (gamma - i infinity) to (gamma + i infinity) of F(s) e^{st} ds

The path is a vertical line Re(s) = gamma lying inside the ROC, to the right of singularities of F that affect the integral. This is the Bromwich contour.

## Complex frequency plane

Poles of F(s) mark natural behaviours e^{s0 t} in the inverse. For a simple pole at s0 with residue R, the contribution is proportional to R e^{s0 t}.

- Pole on the negative real axis: pure exponential decay.
- Complex conjugate poles: damped or growing oscillation.
- Pole at the origin: step-like constant term.

## Inversion by residues

For t > 0 one closes the Bromwich line with a large arc in the left half-plane when F(s) e^{st} decays on that arc. Then

f(t) = sum of residues of [F(s) e^{st}] at poles to the left of the Bromwich line

for the usual rational transforms in ODE problems.

### Example pattern

F(s) = 1/(s - a) with ROC Re(s) > a has a single pole at s = a. Residue of F(s) e^{st} at s = a is e^{at}. Hence f(t) = e^{at} for t > 0.

## Partial fractions first

In circuit and oscillator problems one almost always: (1) solve for Y(s) algebraically, (2) partial fractions, (3) invert term by term using a short table. Residue calculus justifies the table.

## Check yourself

Why must the Bromwich line sit to the right of the poles you enclose when closing to the left for t > 0?
''',
            keyTakeaways: [
              'Bromwich inversion integrates F(s) e^{st} along a vertical line in the ROC.',
              'Residues of F(s) e^{st} at poles give the time-domain modes.',
              'Partial fractions plus tables implement residue inversion for rational F.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m2-u5-q1',
                question: 'The Bromwich contour is',
                options: [
                  'Any circle around the origin',
                  'A vertical line Re(s) = gamma inside the ROC',
                  'The real axis only',
                  'A path that must avoid the ROC',
                ],
                correctIndex: 1,
                explanation:
                    'Inversion integrates along a vertical line in the region of convergence.',
              ),
              QuizQuestion(
                id: 'phy701-m2-u5-q2',
                question:
                    'A simple pole of F at s0 contributes a time factor proportional to',
                options: [
                  'e^{s0 t}',
                  't^{s0}',
                  'log t only',
                  '1/s0 independent of t',
                ],
                correctIndex: 0,
                explanation:
                    'Residue of F(s) e^{st} at s0 produces a multiple of e^{s0 t}.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy701-m3',
        title: 'Partial Differential Equations (PDEs) & Boundary Value Problems',
        summary:
            'Classification of second-order PDEs, separation of variables, Laplacian in curvilinear coordinates, Dirichlet/Neumann/Robin conditions.',
        units: [
          Unit(
            id: 'phy701-m3-u1',
            title: 'Classification: elliptic, parabolic, hyperbolic',
            content: r'''
## Learning goal

Classify a second-order linear PDE by its discriminant and connect each type to a physical regime: equilibrium, diffusion, or wave propagation.

## General second-order linear PDE in two variables

A(x,y) u_xx + B(x,y) u_xy + C(x,y) u_yy + lower-order terms = 0

Here subscripts denote partial derivatives: u_xx = ∂²u/∂x², and so on. The principal part is the second-order piece with coefficients A, B, C.

## Discriminant

Define

Δ = B² − 4AC

Classification at a point (where the coefficients are evaluated):

- **Hyperbolic** if Δ > 0
- **Parabolic** if Δ = 0
- **Elliptic** if Δ < 0

This mirrors the conic-section classification of Ax² + Bxy + Cy² + … = 0.

## Canonical physical examples

### Wave equation (hyperbolic)

u_tt = c² u_xx

Rewrite: c² u_xx − u_tt = 0. Take x as one variable and t as the other: A = c², B = 0, C = −1.

Δ = 0 − 4(c²)(−1) = 4c² > 0 → hyperbolic.

Physics: finite propagation speed, sharp signals, characteristics carry initial data.

### Heat (diffusion) equation (parabolic)

u_t = κ u_xx

As a second-order equation in (x,t): only u_xx appears among second derivatives, so A = κ, B = 0, C = 0 (if t is the “y” variable and we count only pure second derivatives in the principal part in the standard two-variable form treating t like y with no u_tt).

Standard placement: A = κ, B = 0, C = 0 → Δ = 0 → parabolic.

Physics: smoothing, infinite formal propagation in the ideal model, approach to equilibrium.

### Laplace equation (elliptic)

u_xx + u_yy = 0

A = 1, B = 0, C = 1 → Δ = −4 < 0 → elliptic.

Physics: equilibrium (steady temperature, electrostatic potential in free space), boundary values determine the interior, no marching in a time-like direction.

## Why the names matter

You do not solve these three classes with the same instincts:

- Hyperbolic: initial-value problems on a time-like direction, domains of dependence.
- Parabolic: initial data plus boundary data in space, smooth forward in time.
- Elliptic: boundary-value problems on a closed domain; no “initial time.”

## Check yourself

Classify u_xx + 2u_xy + u_yy = 0 using Δ = B² − 4AC.
''',
            keyTakeaways: [
              'Discriminant Δ = B² − 4AC classifies second-order linear PDEs.',
              'Hyperbolic (Δ > 0) ~ waves; parabolic (Δ = 0) ~ diffusion; elliptic (Δ < 0) ~ equilibrium.',
              'The type guides what data (initial vs boundary) the problem needs.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m3-u1-q1',
                question: 'The wave equation u_tt = c² u_xx is',
                options: [
                  'Elliptic',
                  'Parabolic',
                  'Hyperbolic',
                  'Not second order',
                ],
                correctIndex: 2,
                explanation:
                    'With A = c², B = 0, C = −1 one gets Δ = 4c² > 0 (hyperbolic).',
              ),
              QuizQuestion(
                id: 'phy701-m3-u1-q2',
                question: 'Laplace’s equation u_xx + u_yy = 0 is',
                options: [
                  'Hyperbolic',
                  'Parabolic',
                  'Elliptic',
                  'First order only',
                ],
                correctIndex: 2,
                explanation: 'A = C = 1, B = 0 gives Δ = −4 < 0 (elliptic).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m3-u2',
            title: 'Separation of variables for the heat equation',
            content: r'''
## Learning goal

Carry out a complete separation-of-variables solution for the one-dimensional heat equation on a finite rod with homogeneous Dirichlet ends, including eigenvalues and the Fourier sine series for the initial data.

## Problem

Solve

∂u/∂t = κ ∂²u/∂x²,    0 < x < L,    t > 0

u(0,t) = 0,    u(L,t) = 0

u(x,0) = f(x)

with κ > 0 constant.

## Product assumption

Seek nontrivial products u(x,t) = X(x) T(t). Substitute:

X T′ = κ X″ T

Divide by κ X T (where nonzero):

T′/(κ T) = X″/X = −λ

(the separation constant is written −λ so that spatial eigenfunctions oscillate under Dirichlet conditions).

## Spatial eigenvalue problem

X″ + λ X = 0,    X(0) = 0,    X(L) = 0

This is a regular Sturm–Liouville problem (Module 1).

- If λ ≤ 0, only the trivial solution satisfies both boundary conditions (standard check).
- If λ > 0, write λ = μ². Then X = A cos(μx) + B sin(μx).
  X(0) = 0 ⇒ A = 0.
  X(L) = 0 ⇒ B sin(μL) = 0 ⇒ μL = nπ for n = 1, 2, 3, …
  So λ_n = (nπ/L)²,    X_n(x) = sin(nπx/L)

## Time factors

T′ + κ λ T = 0 ⇒ T_n(t) = e^{−κ (nπ/L)² t}

## Superposition

u(x,t) = Σ_{n=1}^∞ b_n sin(nπx/L) e^{−κ (nπ/L)² t}

## Initial condition

u(x,0) = f(x) = Σ b_n sin(nπx/L)

So b_n are Fourier sine coefficients on (0, L):

b_n = (2/L) ∫_0^L f(x) sin(nπx/L) dx

## Reading the physics

Each mode n decays at rate κ (nπ/L)². Higher spatial frequencies die faster — diffusion smooths fine detail first.

## Check yourself

If the rod is insulated at both ends (Neumann: u_x(0,t) = u_x(L,t) = 0), what changes in the spatial eigenvalue problem?
''',
            keyTakeaways: [
              'Separation u = X(x)T(t) splits the heat equation into X″ + λX = 0 and T′ + κλT = 0.',
              'Dirichlet ends on [0, L] give λ_n = (nπ/L)² and sin(nπx/L) modes.',
              'Coefficients b_n come from the Fourier sine series of f(x).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m3-u2-q1',
                question:
                    'For u_t = κ u_xx with u(0,t) = u(L,t) = 0, the decay rate of mode n is',
                options: [
                  'κ n π / L',
                  'κ (nπ/L)²',
                  '(nπ/L)/κ',
                  'Independent of n',
                ],
                correctIndex: 1,
                explanation:
                    'T_n(t) = exp(−κ λ_n t) with λ_n = (nπ/L)².',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m3-u3',
            title: 'Laplacian in cylindrical and spherical coordinates',
            content: r'''
## Learning goal

Write ∇² in cylindrical and spherical coordinates and see how scale factors (metric coefficients) produce the familiar radial pieces.

## Cartesian reminder

∇²u = u_xx + u_yy + u_zz

## Orthogonal curvilinear idea

In orthogonal coordinates (q1, q2, q3) with scale factors h1, h2, h3 (so a physical displacement satisfies ds² = h1² dq1² + h2² dq2² + h3² dq3²),

∇²u = (1/(h1 h2 h3)) Σ_i ∂/∂qi [ (h1 h2 h3 / h_i²) ∂u/∂qi ]

(Boas / vector-calculus standard form for orthogonal systems.)

## Cylindrical coordinates (r, θ, z)

x = r cos θ,    y = r sin θ,    z = z

Scale factors: h_r = 1,    h_θ = r,    h_z = 1

Product h_r h_θ h_z = r.

Then

∇²u = (1/r) ∂/∂r ( r ∂u/∂r ) + (1/r²) ∂²u/∂θ² + ∂²u/∂z²

### Where the factors come from (sketch)

The θ direction stretches with r, so the physical gradient component in θ is (1/r) ∂u/∂θ. Divergence of a radial flux picks up a 1/r ∂(r · )/∂r structure from the area of cylindrical shells. Together they yield (1/r) ∂(r ∂u/∂r)/∂r for the radial part of the Laplacian.

## Spherical coordinates (r, θ, φ)

Use the physics convention: r ≥ 0, polar angle θ ∈ [0, π], azimuth φ ∈ [0, 2π].

Scale factors: h_r = 1,    h_θ = r,    h_φ = r sin θ

Product h_r h_θ h_φ = r² sin θ.

Then

∇²u = (1/r²) ∂/∂r ( r² ∂u/∂r ) + (1/(r² sin θ)) ∂/∂θ ( sin θ ∂u/∂θ ) + (1/(r² sin² θ)) ∂²u/∂φ²

## Why this matters for PHY 701

Separation of variables in these coordinates produces Bessel (cylindrical radial), Legendre (polar θ), and spherical Bessel / spherical harmonic structure — the special functions of Module 4.

## Check yourself

In cylindrical coordinates, if u depends only on r, what does ∇²u reduce to?
''',
            keyTakeaways: [
              'Orthogonal curvilinear Laplacians are built from scale factors h_i.',
              'Cylindrical: ∇²u = (1/r)∂/∂r(r ∂u/∂r) + (1/r²)∂²u/∂θ² + ∂²u/∂z².',
              'Spherical: radial piece (1/r²)∂/∂r(r² ∂u/∂r) plus angular Legendre/Fourier pieces.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m3-u3-q1',
                question: 'In cylindrical coordinates the scale factor h_θ equals',
                options: [
                  '1',
                  'r',
                  'r sin θ',
                  '1/r',
                ],
                correctIndex: 1,
                explanation:
                    'Arc length in the θ direction is r dθ, so h_θ = r.',
              ),
              QuizQuestion(
                id: 'phy701-m3-u3-q2',
                question:
                    'The radial part of ∇² in spherical coordinates involves',
                options: [
                  '(1/r) ∂/∂r (r ∂u/∂r) only as in 2D polar without the extra r',
                  '(1/r²) ∂/∂r (r² ∂u/∂r)',
                  '∂²u/∂r² with no first-derivative term ever',
                  'Only ∂u/∂r',
                ],
                correctIndex: 1,
                explanation:
                    'With h_θ h_φ ∝ r², the radial contribution is (1/r²)∂/∂r(r² ∂u/∂r).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m3-u4',
            title: 'Dirichlet, Neumann, and Robin boundary conditions',
            content: r'''
## Learning goal

State Dirichlet, Neumann, and Robin conditions clearly and match each to a physical example on the boundary of a domain.

## Dirichlet condition

The value of the unknown is prescribed on the boundary ∂Ω:

u = g    on ∂Ω

### Physical examples

- Fixed temperature on the surface of a body.
- Electrostatic potential specified on a conducting surface held at fixed voltage (idealized).
- Transverse displacement of a string fixed at an end: u(0,t) = 0.

## Neumann condition

The normal derivative is prescribed:

∂u/∂n = h    on ∂Ω

where n is the outward unit normal.

### Physical examples

- Specified heat flux through a surface (Fourier’s law: flux ∝ −∇u).
- Insulated boundary: ∂u/∂n = 0 (no heat flow through the wall).
- In electrostatics, specifying normal derivative relates to surface charge in appropriate formulations.

## Robin (mixed) condition

A linear combination of value and normal derivative is prescribed:

α u + β ∂u/∂n = γ    on ∂Ω

with α, β not both zero.

### Physical example

Newton’s law of cooling: heat flux out of the body proportional to the difference between surface temperature and exterior temperature u_ext,

−κ ∂u/∂n = h_c (u − u_ext)

which rearranges to a Robin condition relating u and ∂u/∂n.

## Well-posedness intuition

- Elliptic problems (Laplace/Poisson) need boundary data of Dirichlet, Neumann, or Robin type on the closed boundary; pure Neumann data require a compatibility condition (e.g. total flux matches sources).
- Parabolic problems need boundary data in space for all t > 0 plus initial data at t = 0.
- Hyperbolic wave problems need two pieces of initial data in time (u and u_t) plus boundary conditions in space.

## Check yourself

A rod with one end held at 0 °C and the other end insulated mixes which two boundary types?
''',
            keyTakeaways: [
              'Dirichlet: u prescribed on the boundary.',
              'Neumann: ∂u/∂n prescribed (insulation is the homogeneous case).',
              'Robin: αu + β ∂u/∂n prescribed (e.g. Newton cooling).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m3-u4-q1',
                question: 'An insulated thermal boundary is modeled by',
                options: [
                  'Dirichlet u = 0 only',
                  'Neumann ∂u/∂n = 0',
                  'Requiring u infinite',
                  'Dropping the PDE',
                ],
                correctIndex: 1,
                explanation:
                    'No heat flux through the boundary means vanishing normal derivative of temperature.',
              ),
              QuizQuestion(
                id: 'phy701-m3-u4-q2',
                question: 'Newton cooling at a surface is typically a',
                options: [
                  'Pure Dirichlet condition with no derivative',
                  'Robin condition mixing u and ∂u/∂n',
                  'Condition only at t = infinity',
                  'Hyperbolic characteristic condition only',
                ],
                correctIndex: 1,
                explanation:
                    'Flux proportional to (u − u_ext) yields a linear relation between u and ∂u/∂n.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy701-m4',
        title: 'Special Functions of Mathematical Physics',
        summary:
            'Bessel, Legendre, Hermite/Laguerre, and Gamma/Beta functions for classical mathematical physics.',
        units: [
          Unit(
            id: 'phy701-m4-u1',
            title: 'Bessel functions from cylindrical symmetry',
            content: r'''
## Learning goal

See how cylindrical problems produce Bessel's equation, and construct J_ν by the Frobenius method.

## From separation in cylindrical coordinates

For Helmholtz or Laplace problems with cylindrical symmetry, the radial factor, after x = κr, satisfies

x² y'' + x y' + (x² − ν²) y = 0

This is Bessel's equation of order ν.

## Frobenius series

Assume y = x^r Σ_{m=0}^∞ a_m x^m with a_0 ≠ 0. The indicial equation gives r = ±ν.

For r = ν the recurrence yields the Bessel function of the first kind

J_ν(x) = Σ_{m=0}^∞ (−1)^m /(m! Γ(m+ν+1)) · (x/2)^{2m+ν}

(standard normalization). For integer n ≥ 0, J_n is regular at 0; the second solution Y_n is singular at the origin.

## Physical reading

Keep J_ν when the axis r = 0 is included. Use Y_ν only on domains that exclude the origin.

## Check yourself

Why is Y_0 discarded for a full disk including r = 0?
''',
            keyTakeaways: [
              'Bessel\'s equation arises from radial separation in cylindrical geometry.',
              'Frobenius with root r = ν produces J_ν(x).',
              'J_ν is origin-regular; Y_ν is singular at 0.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u1-q1',
                question: 'Bessel\'s equation of order ν has the form',
                options: [
                  'y\'\' + y = 0',
                  'x² y\'\' + x y\' + (x² − ν²) y = 0',
                  'y\'\' − ν² y = 0',
                  'Only a first-order equation in x',
                ],
                correctIndex: 1,
                explanation:
                    'The standard form is x² y\'\' + x y\' + (x² − ν²) y = 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u2',
            title: 'Legendre polynomials and Rodrigues formula',
            content: r'''
## Learning goal

Connect Legendre's equation to spherical geometry, state Rodrigues' formula, and record orthogonality on [-1, 1].

## Spherical origin

Axisymmetric Laplace separation with x = cos θ produces

(1 − x²) y'' − 2x y' + ℓ(ℓ+1) y = 0

Legendre's equation. Polynomial solutions regular at x = ±1 exist for ℓ = 0, 1, 2, …: the Legendre polynomials P_ℓ(x).

## Rodrigues formula

P_ℓ(x) = 1/(2^ℓ ℓ!) · d^ℓ/dx^ℓ (x² − 1)^ℓ

Gives P_0 = 1, P_1 = x, P_2 = (3x² − 1)/2, …

## Orthogonality

∫_{-1}^{1} P_ℓ(x) P_m(x) dx = 0 if ℓ ≠ m, and 2/(2ℓ+1) if ℓ = m.

Reason: Sturm–Liouville form with p = 1−x² and weight 1; distinct ℓ(ℓ+1) imply orthogonality.

## Check yourself

Why must solutions stay finite at x = ±1 (the poles θ = 0, π)?
''',
            keyTakeaways: [
              'Legendre\'s equation comes from axisymmetric spherical separation.',
              'Rodrigues formula builds P_ℓ from derivatives of (x²−1)^ℓ.',
              'P_ℓ are orthogonal on [-1, 1] with weight 1.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u2-q1',
                question: 'Rodrigues\' formula differentiates which function ℓ times?',
                options: [
                  'e^{-x²}',
                  '(x² − 1)^ℓ',
                  'sin(ℓx)',
                  '1/x',
                ],
                correctIndex: 1,
                explanation: 'P_ℓ involves the ℓ-th derivative of (x²−1)^ℓ.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u3',
            title: 'Hermite and Laguerre polynomials',
            content: r'''
## Learning goal

Identify Hermite and Laguerre equations, their quantum origins, and basic structural tools.

## Hermite — harmonic oscillator

After nondimensionalizing the Schrödinger equation for a quadratic potential, one meets Hermite's equation. Polynomial solutions H_n(ξ) exist for n = 0, 1, 2, … and label energies E_n = ℏω(n + 1/2).

Generating function:

exp(2ξt − t²) = Σ_{n=0}^∞ H_n(ξ) t^n / n!

Recurrence: H_{n+1}(ξ) = 2ξ H_n(ξ) − 2n H_{n−1}(ξ).

Orthogonality weight on (−∞, ∞): e^{−ξ²}.

## Laguerre — radial hydrogen

The radial hydrogen problem produces Laguerre and associated Laguerre polynomials. Ordinary Laguerre:

x y'' + (1 − x) y' + n y = 0

Weight on (0, ∞): e^{−x}. Associated Laguerre functions appear when angular momentum shifts the equation.

## Check yourself

Why does the oscillator problem naturally live on the whole real line with a Gaussian weight?
''',
            keyTakeaways: [
              'Hermite polynomials solve the oscillator problem and label E_n = ℏω(n+1/2).',
              'Laguerre polynomials arise in the radial hydrogen problem.',
              'Generating functions and recurrences organize these families.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u3-q1',
                question: 'Hermite polynomials are orthogonal on (−∞,∞) with weight',
                options: [
                  '1',
                  'e^{-ξ²}',
                  'e^{-ξ}',
                  'ξ²',
                ],
                correctIndex: 1,
                explanation: 'The Gaussian weight e^{-ξ²} matches the oscillator ground-state factor.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u4',
            title: 'Gamma and Beta functions',
            content: r'''
## Learning goal

Define Γ(z), prove Γ(z+1) = z Γ(z), connect to factorials, and relate Beta to Gamma.

## Gamma function

For Re(z) > 0,

Γ(z) = ∫_0^∞ t^{z−1} e^{−t} dt

## Functional equation

Γ(z+1) = ∫_0^∞ t^z e^{−t} dt

Integrate by parts with u = t^z, dv = e^{−t} dt:

Γ(z+1) = z ∫_0^∞ t^{z−1} e^{−t} dt = z Γ(z)

(boundary terms vanish for Re(z) > 0).

Hence Γ(n+1) = n! for integers n ≥ 0, using Γ(1) = 1.

## Beta function

B(p,q) = ∫_0^1 t^{p−1} (1−t)^{q−1} dt = Γ(p)Γ(q)/Γ(p+q)

for Re(p) > 0, Re(q) > 0.

## Check yourself

Using Γ(1) = 1, compute Γ(4).
''',
            keyTakeaways: [
              'Γ(z) = ∫_0^∞ t^{z−1} e^{-t} dt for Re(z) > 0.',
              'Γ(z+1) = z Γ(z) and Γ(n+1) = n!.',
              'B(p,q) = Γ(p)Γ(q)/Γ(p+q).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u4-q1',
                question: 'Γ(z+1) equals',
                options: [
                  'Γ(z)/z',
                  'z Γ(z)',
                  'Γ(z)²',
                  '1/Γ(z)',
                ],
                correctIndex: 1,
                explanation: 'The functional equation is Γ(z+1) = z Γ(z).',
              ),
            ],
          ),
        ],
      ),
      Module(
        id: 'phy701-m5',
        title: 'Distribution Theory & The Dirac Delta Function',
        summary:
            'Delta as a distribution, limit sequences, operational identities, and Fourier representation.',
        units: [
          Unit(
            id: 'phy701-m5-u1',
            title: 'Dirac delta as a distribution',
            content: r'''
## Learning goal

Define the Dirac delta as a continuous linear functional on test functions, not as an ordinary pointwise function.

## Test functions

Let D(ℝ) be the space of smooth functions φ: ℝ → ℝ with compact support (vanishing outside some finite interval). These are **test functions**.

## Distribution definition

The Dirac delta at the origin is the functional

⟨δ, φ⟩ = φ(0)

for every φ ∈ D(ℝ). More generally ⟨δ_{x'}, φ⟩ = φ(x').

It is linear and continuous in the distributional sense. There is no ordinary locally integrable function f such that ∫ f(x) φ(x) dx = φ(0) for all test φ — delta is a **generalized function**.

## Informal physics notation

Physicists write ∫ δ(x − x') φ(x) dx = φ(x'). That is shorthand for the pairing above.

## Check yourself

Why does "δ(0) = ∞" fail as a mathematical definition?
''',
            keyTakeaways: [
              'δ acts on test functions by ⟨δ, φ⟩ = φ(0).',
              'It is not an ordinary pointwise function.',
              'Physics integral notation is shorthand for the distributional pairing.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u1-q1',
                question: '⟨δ, φ⟩ equals',
                options: [
                  '∫ φ(x) dx over all ℝ',
                  'φ(0)',
                  'φ\'(0)',
                  '0 always',
                ],
                correctIndex: 1,
                explanation: 'By definition the delta distribution returns the test function at 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u2',
            title: 'Limit representations of delta',
            content: r'''
## Learning goal

See δ as a limit of ordinary peaked functions whose integrals stay 1 while the peak narrows.

## Idea

A family f_ε(x) represents δ as ε → 0⁺ if for every test φ,

∫ f_ε(x) φ(x) dx → φ(0)

## Common sequences

1. Rectangular pulse of width ε and height 1/ε centered at 0.
2. Gaussian: (1/(ε√π)) e^{−x²/ε²} (constants normalized so integral is 1).
3. Lorentzian: (1/π) ε/(x² + ε²).
4. Sinc-type integrals arising from truncated Fourier integrals.

Each is a smooth or piecewise smooth function for ε > 0; the limit is not a classical function.

## Check yourself

Why must ∫ f_ε(x) dx stay equal to 1 (or tend to 1) as ε → 0?
''',
            keyTakeaways: [
              'Delta arises as a limit of unit-integral peaked functions.',
              'Gaussians, Lorentzians, and narrow pulses are standard representations.',
              'The limit is taken inside pairings against test functions.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u2-q1',
                question: 'A good nascent delta sequence should',
                options: [
                  'Have integral tending to 0',
                  'Peak more narrowly while keeping unit integral',
                  'Spread to infinity with fixed height 1',
                  'Equal the Heaviside function pointwise',
                ],
                correctIndex: 1,
                explanation: 'Mass concentrates at 0 while total integral remains 1.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u3',
            title: 'Operational identities for delta',
            content: r'''
## Learning goal

Derive scaling and composition rules and define distributional derivatives.

## Scaling

For a ≠ 0, ⟨δ(ax), φ⟩ = ∫ δ(ax) φ(x) dx. Set u = ax, du = |a| dx carefully with orientation:

⟨δ(ax), φ⟩ = (1/|a|) φ(0) = ⟨(1/|a|) δ, φ⟩

Thus δ(ax) = (1/|a|) δ(x).

## Composition

If g is smooth and g(x_k) = 0 are simple roots (g'(x_k) ≠ 0), then

δ(g(x)) = Σ_k δ(x − x_k) / |g'(x_k)|

## Distributional derivative

⟨δ', φ⟩ = −φ'(0)

More generally ⟨f', φ⟩ = −⟨f, φ'⟩ for a distribution f, extending integration by parts when boundary terms vanish.

## Check yourself

Evaluate δ(2x) in terms of δ(x).
''',
            keyTakeaways: [
              'δ(ax) = (1/|a|) δ(x) for a ≠ 0.',
              'δ(g(x)) sums contributions at simple roots weighted by 1/|g\'|.',
              '⟨δ\', φ⟩ = −φ\'(0).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u3-q1',
                question: 'δ(2x) equals',
                options: [
                  '2 δ(x)',
                  '(1/2) δ(x)',
                  'δ(x)',
                  '0',
                ],
                correctIndex: 1,
                explanation: 'Scaling gives δ(ax) = δ(x)/|a|, so a = 2 yields (1/2) δ(x).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u4',
            title: 'Fourier representation of the delta',
            content: r'''
## Learning goal

Connect the delta function to the continuous Fourier inversion theorem.

## Formal plane-wave completeness

In the theory of Fourier transforms on the line (Module 6), inversion implies the distributional identity

(1/(2π)) ∫_{−∞}^{∞} e^{ik(x−x')} dk = δ(x − x')

(conventions differ by placement of 2π; the structure is the same).

## Reading

Every frequency contributes a pure phase e^{ik(x−x')}; integrating over all k reconstructs a spike at x = x'. This is the continuous analogue of orthogonal completeness of Fourier modes on a finite interval.

## Check yourself

Why is this equality understood distributionally rather than pointwise?
''',
            keyTakeaways: [
              'Delta is the integral kernel of Fourier completeness on the line.',
              '∫ e^{ik(x−x')} dk is proportional to δ(x−x\').',
              'The identity holds in the distributional sense.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u4-q1',
                question: 'The Fourier integral over all k of e^{ik(x−x\')} is proportional to',
                options: [
                  '1',
                  'δ(x − x\')',
                  'e^{x−x\'}',
                  'The Heaviside step only',
                ],
                correctIndex: 1,
                explanation: 'Plane-wave completeness yields a delta in (x − x\').',
              ),
            ],
          ),
        ],
      ),
      Module(
        id: 'phy701-m6',
        title: 'Fourier Series & Continuous Fourier Transforms',
        summary:
            'Complex Fourier series, continuum limit to transforms, operational theorems, Parseval/Plancherel.',
        units: [
          Unit(
            id: 'phy701-m6-u1',
            title: 'Trigonometric and complex Fourier series',
            content: r'''
## Learning goal

Pass from real sine/cosine series on an interval of length 2L to complex exponential coefficients c_n.

## Real form on (−L, L)

For a piecewise smooth f,

f(x) ~ a0/2 + Σ_{n=1}^∞ [a_n cos(nπx/L) + b_n sin(nπx/L)]

with a_n, b_n the usual integrals against cos and sin.

## Complex form

Using e^{iθ} = cos θ + i sin θ,

f(x) ~ Σ_{n=−∞}^{∞} c_n e^{i n π x / L}

with

c_n = (1/(2L)) ∫_{−L}^{L} f(x) e^{−i n π x / L} dx

The real coefficients are recoverable from c_n and c_{−n}.

## Check yourself

What is c_n for a purely odd function on (−L, L)?
''',
            keyTakeaways: [
              'Complex series use frequencies nπ/L with coefficients c_n.',
              'c_n = (1/(2L)) ∫ f e^{-i n π x / L} dx over one period.',
              'Real sine/cosine forms are equivalent rearrangements.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u1-q1',
                question: 'The complex coefficient c_n involves the integral of f(x) times',
                options: [
                  'e^{i n π x / L}',
                  'e^{-i n π x / L}',
                  'Only cos(nπx/L)',
                  'x^n',
                ],
                correctIndex: 1,
                explanation: 'Standard convention uses e^{-i n π x / L} in the analysis formula for c_n.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u2',
            title: 'From Fourier series to the Fourier transform',
            content: r'''
## Learning goal

See the continuous Fourier transform as the L → ∞ limit of a discrete series on (−L, L).

## Spacing of frequencies

Modes sit at k_n = nπ/L with spacing Δk = π/L. As L → ∞, Δk → 0 and the sum Σ c_n e^{i k_n x} becomes an integral over k.

## Transform pair (one common convention)

f̂(k) = ∫_{−∞}^{∞} f(x) e^{−ikx} dx

f(x) = (1/(2π)) ∫_{−∞}^{∞} f̂(k) e^{ikx} dk

(Other 2π placements are equivalent after rescaling.)

## Check yourself

What happens to the discrete label n when L becomes very large?
''',
            keyTakeaways: [
              'Frequency spacing Δk = π/L vanishes as L → ∞.',
              'The series becomes an integral over continuous k.',
              'Fourier transform and inverse form a consistent pair.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u2-q1',
                question: 'As the period 2L tends to infinity, the Fourier series becomes',
                options: [
                  'A Taylor series only',
                  'A continuous Fourier transform integral',
                  'A finite polynomial',
                  'Independent of f',
                ],
                correctIndex: 1,
                explanation: 'Discrete modes densify into a continuous k-integral.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u3',
            title: 'Operational theorems for Fourier transforms',
            content: r'''
## Learning goal

State shift and derivative rules and the convolution theorem in the continuous setting.

## Shift in space

If g(x) = f(x − x0), then ĝ(k) = e^{−ik x0} f̂(k).

## Derivative

Under suitable decay, the transform of f'(x) is ik f̂(k) (sign depends on the e^{±ikx} convention chosen above).

## Convolution

(f ∗ g)(x) = ∫ f(y) g(x − y) dy

transforms to a product f̂(k) ĝ(k) (again up to 2π conventions). Multiplication in space becomes convolution in frequency, and vice versa.

## Check yourself

How does a pure translation in x show up in the transform?
''',
            keyTakeaways: [
              'Translation in x multiplies the transform by a phase e^{-ik x0}.',
              'Differentiation in x multiplies by a factor proportional to ik.',
              'Convolution in x becomes multiplication in k.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u3-q1',
                question: 'A spatial shift x → x − x0 multiplies the Fourier transform by',
                options: [
                  'A real Gaussian only',
                  'A phase factor e^{-ik x0}',
                  'Zero',
                  'k²',
                ],
                correctIndex: 1,
                explanation: 'Shifts become phase factors in k-space.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u4',
            title: 'Parseval and Plancherel',
            content: r'''
## Learning goal

Connect energy in space to energy in frequency.

## Parseval (series form)

For an orthonormal Fourier basis on a finite interval,

(1/period) ∫ |f|² = Σ |c_n|²

(up to the exact normalization of c_n).

## Plancherel (transform form)

∫_{−∞}^{∞} |f(x)|² dx = (1/(2π)) ∫_{−∞}^{∞} |f̂(k)|² dk

(in the convention used in the previous units). This is unitarity of the Fourier transform on L²: the map preserves energy.

## Check yourself

If a pulse narrows in x, what must happen to its frequency content by Plancherel/intuition?
''',
            keyTakeaways: [
              'Parseval equates mean-square size of f to sum of |c_n|².',
              'Plancherel equates ∫|f|² to an integral of |f̂|².',
              'Fourier transformation is an L² isometry (up to normalization).',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u4-q1',
                question: 'Plancherel\'s theorem relates',
                options: [
                  'Only the phase of f̂ to f',
                  '∫|f|² to an integral of |f̂|²',
                  'Zeros of f only',
                  'Taylor coefficients only',
                ],
                correctIndex: 1,
                explanation: 'Plancherel is the energy identity between space and frequency.',
              ),
            ],
          ),
        ],
      ),
      Module(
        id: 'phy701-m7',
        title: 'Complex Analysis, Residue Calculus, and Green\'s Functions',
        summary:
            'Residue theorem, contour integrals, Green\'s functions as impulse responses, jump construction in 1D.',
        units: [
          Unit(
            id: 'phy701-m7-u1',
            title: 'Cauchy and residue theorems',
            content: r'''
## Learning goal

State Cauchy's theorem and the residue theorem for isolated poles.

## Cauchy's theorem (informal statement)

If f is holomorphic inside and on a simple closed positively oriented contour C, then

∮_C f(z) dz = 0

## Residues

If f has an isolated singularity at z0, the residue is the coefficient of 1/(z−z0) in the Laurent series:

f(z) = … + a_{−1}/(z−z0) + a_0 + …

Res(f; z0) = a_{−1}.

For a simple pole, Res(f; z0) = lim_{z→z0} (z−z0) f(z).

For a pole of order m,

Res(f; z0) = (1/(m−1)!) lim_{z→z0} d^{m−1}/dz^{m−1} [ (z−z0)^m f(z) ]

## Residue theorem

If f is holomorphic on and inside C except for isolated singularities z_k inside C,

∮_C f(z) dz = 2πi Σ_k Res(f; z_k)

## Check yourself

What is Res(1/z; 0)?
''',
            keyTakeaways: [
              'Cauchy: integral of a holomorphic f over a simple closed curve vanishes.',
              'Residue is the Laurent coefficient a_{-1}.',
              'Contour integral = 2πi × sum of enclosed residues.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m7-u1-q1',
                question: '∮_C f dz equals 2πi times',
                options: [
                  'The maximum of |f| on C',
                  'The sum of residues inside C',
                  'f\' at one point only always',
                  'Zero always even with poles inside',
                ],
                correctIndex: 1,
                explanation: 'The residue theorem sums 2πi Res at enclosed singularities.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m7-u2',
            title: 'Real integrals via contours',
            content: r'''
## Learning goal

Outline evaluation of a real improper integral by a semicircular contour and Jordan's lemma.

## Template: rational function of cos/sin or e^{ix}

Example class: ∫_{−∞}^{∞} R(x) e^{ix} dx with R rational, suitable degree, poles off the real axis.

1. Integrate R(z) e^{iz} over [−R, R] plus upper semicircle Γ_R (for the e^{iz} factor when the upper half-plane is appropriate).
2. Apply the residue theorem inside the closed contour.
3. Show the arc contribution → 0 as R → ∞ (Jordan's lemma when the exponential decays on Γ_R).
4. The real integral equals 2πi × sum of residues in the upper half-plane.

## Jordan's lemma (role)

Controls integrals of e^{iz} f(z) on large semicircles so the arc vanishes under degree conditions on f.

## Check yourself

For e^{iz} with z = x+iy, why does the upper half-plane help when the real exponent is +ix on the real axis?
''',
            keyTakeaways: [
              'Close contours where the exponential factor decays.',
              'Residues inside the contour evaluate the real line integral in the limit.',
              'Jordan\'s lemma justifies vanishing arc contributions.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m7-u2-q1',
                question: 'Jordan\'s lemma is used to',
                options: [
                  'Prove every function is entire',
                  'Show large-arc integrals of e^{iz} f(z) vanish under conditions',
                  'Compute real antiderivatives only by inspection',
                  'Avoid residues entirely',
                ],
                correctIndex: 1,
                explanation: 'Jordan estimates kill the semicircle contribution for suitable f.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m7-u3',
            title: 'Green\'s functions as impulse responses',
            content: r'''
## Learning goal

Define the Green's function of a linear differential operator as the response to a delta source.

## Definition

For a linear operator L_x acting in the variable x,

L_x G(x, x') = δ(x − x')

with G required to satisfy the same homogeneous boundary conditions in x as the original BVP (as appropriate).

## Meaning

G(x, x') is the field at x due to a unit point source at x'. For a general source f,

u(x) = ∫ G(x, x') f(x') dx'

solves L u = f when interchange of L and integral is justified — the continuous superposition of impulse responses.

## Check yourself

If L is translation invariant on the whole line, why might G depend only on x − x'?
''',
            keyTakeaways: [
              'L_x G(x,x\') = δ(x−x\') defines the Green\'s function.',
              'G is the impulse response of the linear system.',
              'Solutions for general sources are integrals against G.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m7-u3-q1',
                question: 'The Green\'s function satisfies',
                options: [
                  'L_x G = 0 everywhere including x = x\'',
                  'L_x G(x,x\') = δ(x−x\')',
                  'G = 1 always',
                  'Only algebraic equations in x',
                ],
                correctIndex: 1,
                explanation: 'By definition G is the fundamental solution for L.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m7-u4',
            title: 'Jump construction of 1D Green\'s functions',
            content: r'''
## Learning goal

Construct G for a second-order Sturm–Liouville operator using continuity and derivative jump at x = x'.

## Operator

Consider L[y] = −(p y')' − q y  (or the equivalent form with weight), on [a, b] with homogeneous boundary conditions at a and b.

## Homogeneous solutions

Let y_L(x) solve L[y] = 0 and the left boundary condition at a.  
Let y_R(x) solve L[y] = 0 and the right boundary condition at b.

## Piecewise definition

G(x, x') = A(x') y_L(x) for x < x'  
G(x, x') = B(x') y_R(x) for x > x'

## Matching

1. Continuity at x = x': G continuous ⇒ A y_L(x') = B y_R(x').
2. Jump in p G_x: integrate L G = δ across an infinitesimal interval about x' to obtain

p(x') (∂G/∂x|_{x'+} − ∂G/∂x|_{x'−}) = −1

(with sign consistent with the form L = −(p y')' + …).

These two conditions fix A and B. The Wronskian of y_L and y_R appears in the denominator — the same Wronskian structure as Module 1.

## Check yourself

Why is a jump in the derivative required while G itself stays continuous for a second-order operator?
''',
            keyTakeaways: [
              'Build G from left and right homogeneous solutions satisfying the BCs.',
              'G is continuous at x\'; p G_x jumps by an amount fixed by the delta.',
              'The Wronskian of the two homogeneous solutions normalizes G.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m7-u4-q1',
                question: 'Across x = x\', a standard 1D second-order Green\'s function is',
                options: [
                  'Discontinuous in G itself always with no rule',
                  'Continuous in G, with a fixed jump in p ∂G/∂x',
                  'C^∞ smooth through x\' with no feature',
                  'Zero for all x',
                ],
                correctIndex: 1,
                explanation: 'Integrating the ODE across x\' yields a jump in the derivative term.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
