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
      skeletonModule(
        id: 'phy701-m3',
        title: 'Partial Differential Equations (PDEs) & Boundary Value Problems',
        summary: 'Partial Differential Equations (PDEs) & Boundary Value Problems',
        units: [
          skeletonUnit(id: 'phy701-m3-u1', title: 'Classification'),
          skeletonUnit(id: 'phy701-m3-u2', title: 'Separation of Variables'),
          skeletonUnit(id: 'phy701-m3-u3', title: 'Curvilinear Coordinates'),
          skeletonUnit(id: 'phy701-m3-u4', title: 'Boundary Conditions'),
        ],
      ),
      skeletonModule(
        id: 'phy701-m4',
        title: 'Special Functions of Mathematical Physics',
        summary: 'Special Functions of Mathematical Physics',
        units: [
          skeletonUnit(id: 'phy701-m4-u1', title: 'Bessel Functions'),
          skeletonUnit(id: 'phy701-m4-u2', title: 'Legendre Polynomials'),
          skeletonUnit(id: 'phy701-m4-u3', title: 'Hermite & Laguerre Polynomials'),
          skeletonUnit(id: 'phy701-m4-u4', title: 'Gamma & Beta Functions'),
        ],
      ),
      skeletonModule(
        id: 'phy701-m5',
        title: 'Distribution Theory & The Dirac Delta Function',
        summary: 'Distribution Theory & The Dirac Delta Function',
        units: [
          skeletonUnit(id: 'phy701-m5-u1', title: 'Rigorous Definition'),
          skeletonUnit(id: 'phy701-m5-u2', title: 'Limit Representations'),
          skeletonUnit(id: 'phy701-m5-u3', title: 'Operational Identities'),
          skeletonUnit(id: 'phy701-m5-u4', title: 'Fourier Representation'),
        ],
      ),
      skeletonModule(
        id: 'phy701-m6',
        title: 'Fourier Series & Continuous Fourier Transforms',
        summary: 'Fourier Series & Continuous Fourier Transforms',
        units: [
          skeletonUnit(id: 'phy701-m6-u1', title: 'Trigonometric & Complex Fourier Series'),
          skeletonUnit(id: 'phy701-m6-u2', title: 'The Continuous Limit'),
          skeletonUnit(id: 'phy701-m6-u3', title: 'Operational Theorems'),
          skeletonUnit(id: 'phy701-m6-u4', title: 'Energy Conservation'),
        ],
      ),
      skeletonModule(
        id: 'phy701-m7',
        title: 'Complex Analysis, Residue Calculus, and Green\'s Functions',
        summary: 'Complex Analysis, Residue Calculus, and Green\'s Functions',
        units: [
          skeletonUnit(id: 'phy701-m7-u1', title: 'Cauchy\'s Residue Theorem'),
          skeletonUnit(id: 'phy701-m7-u2', title: 'Contour Integration'),
          skeletonUnit(id: 'phy701-m7-u3', title: 'Impulse Response Theory'),
          skeletonUnit(id: 'phy701-m7-u4', title: 'Construction Rules'),
        ],
      ),
    ],
  );
}
