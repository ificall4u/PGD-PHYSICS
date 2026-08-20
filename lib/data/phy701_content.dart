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
            'Exhaustive treatment: Bessel (Frobenius to J_ν), Legendre (Rodrigues, orthogonality), Hermite and Laguerre from QM, Gamma and Beta.',
        units: [
          Unit(
            id: 'phy701-m4-u1',
            title: 'Bessel functions: cylindrical origin and Frobenius series for J_ν',
            content: r'''
## Learning goal

Start from a physical wave or potential problem with cylindrical symmetry, derive Bessel's differential equation for the radial factor, solve it by the method of Frobenius with every recurrence step written out, and obtain the series for the Bessel function of the first kind J_ν(x).

## Physical system: cylindrical waves

Consider a scalar field ψ (for example a fixed-frequency mode of the wave equation, or a separated solution of Laplace's equation in a tube) in cylindrical coordinates (r, θ, z). Here:

- r ≥ 0 is the perpendicular distance from the z-axis
- θ is the azimuthal angle around the axis
- z is the height along the axis

The Laplacian in these coordinates is

∇²ψ = (1/r) ∂/∂r (r ∂ψ/∂r) + (1/r²) ∂²ψ/∂θ² + ∂²ψ/∂z²

For the Helmholtz equation ∇²ψ + k²ψ = 0 (which arises from the wave equation after assuming time dependence e^{-iωt} with k related to ω/c), substitute a separated product

ψ(r, θ, z) = R(r) Θ(θ) Z(z)

Standard separation (periodic in θ with period 2π, exponential or trigonometric in z) produces a radial equation. After introducing a dimensionless radial variable

x = κ r

where κ² combines k² and the z-separation constant, the radial unknown y(x) = R(r) satisfies **Bessel's equation of order ν**:

x² y''(x) + x y'(x) + (x² − ν²) y(x) = 0

Here:

- y(x) is the radial profile as a function of dimensionless radius x
- ν is the separation constant from the θ equation (integer if Θ must be single-valued on a full circle, or real more generally)
- primes denote d/dx

Dividing by x² (for x ≠ 0) gives the equivalent form

y'' + (1/x) y' + (1 − ν²/x²) y = 0

## Why x = 0 is a regular singular point

The coefficients of y' and y, written in standard form y'' + P(x)y' + Q(x)y = 0, are P(x) = 1/x and Q(x) = 1 − ν²/x². Both xP and x²Q are analytic at x = 0, so x = 0 is a **regular singular point**. Frobenius theory therefore applies.

## Frobenius ansatz

Seek a solution of the form

y(x) = x^r Σ_{m=0}^{∞} a_m x^m = Σ_{m=0}^{∞} a_m x^{m+r}

with a_0 ≠ 0. Then

y'(x) = Σ_{m=0}^{∞} (m+r) a_m x^{m+r−1}

y''(x) = Σ_{m=0}^{∞} (m+r)(m+r−1) a_m x^{m+r−2}

## Substitute into x² y'' + x y' + (x² − ν²) y = 0

Compute each term:

x² y'' = Σ_{m=0}^{∞} (m+r)(m+r−1) a_m x^{m+r}

x y' = Σ_{m=0}^{∞} (m+r) a_m x^{m+r}

(x² − ν²) y = Σ_{m=0}^{∞} a_m x^{m+r+2} − ν² Σ_{m=0}^{∞} a_m x^{m+r}

Shift the index in the x² y piece: let m' = m+2 in Σ a_m x^{m+r+2}, so

Σ_{m=0}^{∞} a_m x^{m+r+2} = Σ_{m=2}^{∞} a_{m−2} x^{m+r}

(renaming m' back to m). Collect the coefficient of x^{m+r} for each m.

## Indicial equation (m = 0)

For the lowest power x^r (m = 0), there is no a_{−2} contribution. The coefficient is

[(r)(r−1) + r − ν²] a_0 = 0

That is (r² − ν²) a_0 = 0. Since a_0 ≠ 0,

r² − ν² = 0 ⇒ r = ν    or    r = −ν

## Recurrence for r = ν

For m ≥ 1, the coefficient of x^{m+ν} gives

[(m+ν)(m+ν−1) + (m+ν) − ν²] a_m + a_{m−2} = 0

Simplify the bracket:

(m+ν)(m+ν−1) + (m+ν) − ν² = (m+ν)² − (m+ν) + (m+ν) − ν² = (m+ν)² − ν²

= m² + 2 m ν + ν² − ν² = m(m + 2ν)

So

m(m + 2ν) a_m + a_{m−2} = 0

hence, for m ≥ 1,

a_m = − a_{m−2} / [m (m + 2ν)]

## Even and odd chains

If m = 1:

a_1 = − a_{−1} / [1·(1+2ν)]

With a_{−1} = 0, we get a_1 = 0. Then every odd index vanishes: a_3 = a_5 = … = 0.

Only even indices survive. Set m = 2j with j = 1, 2, 3, …:

a_{2j} = − a_{2j−2} / [(2j)(2j + 2ν)] = − a_{2j−2} / [2j · 2(j + ν)] = − a_{2j−2} / [4 j (j + ν)]

Iterate:

a_2 = − a_0 / [4 · 1 · (1+ν)]

a_4 = − a_2 / [4 · 2 · (2+ν)] = a_0 / [4² · (2·1) · (1+ν)(2+ν)]

a_6 = − a_4 / [4 · 3 · (3+ν)] = − a_0 / [4³ · (3·2·1) · (1+ν)(2+ν)(3+ν)]

In general,

a_{2j} = (−1)^j a_0 / [ 2^{2j} j! (ν+1)(ν+2)⋯(ν+j) ]

Using the Gamma function identity

(ν+1)(ν+2)⋯(ν+j) = Γ(ν+j+1) / Γ(ν+1)

we have

a_{2j} = (−1)^j a_0 Γ(ν+1) / [ 2^{2j} j! Γ(ν+j+1) ]

## Normalization to J_ν

Choose

a_0 = 1 / [ 2^ν Γ(ν+1) ]

Then

y(x) = Σ_{j=0}^{∞} (−1)^j / [ j! Γ(ν+j+1) ] (x/2)^{2j+ν}

This series is the **Bessel function of the first kind of order ν**:

J_ν(x) = Σ_{j=0}^{∞} (−1)^j / [ j! Γ(ν+j+1) ] (x/2)^{2j+ν}

## Second independent solution

If ν is not an integer, r = −ν produces an independent series J_{−ν}(x). If ν = n is an integer, J_{−n} is linearly dependent on J_n; a second independent solution is the Neumann function Y_n(x), which diverges as x → 0⁺. On a disk that includes the axis, finiteness forces the coefficient of Y_ν (and of J_{−ν} when singular) to vanish.

## Check yourself

From a_m = −a_{m−2}/[m(m+2ν)], show that a_1 = 0 implies a_3 = 0.
''',
            keyTakeaways: [
              'Cylindrical Helmholtz/Laplace separation produces Bessel\'s equation in x = κr.',
              'Frobenius with r = ν and the recurrence a_m = −a_{m−2}/[m(m+2ν)] yields only even powers.',
              'Standard normalization gives the series for J_ν(x); Y_ν is needed when the origin is excluded.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u1-q1',
                question: 'The indicial equation for Bessel\'s equation under Frobenius yields',
                options: [
                  'r = 0 only',
                  'r = ±ν',
                  'r = ν²',
                  'r = 1 only',
                ],
                correctIndex: 1,
                explanation: 'From (r² − ν²)a_0 = 0 one gets r = ±ν.',
              ),
              QuizQuestion(
                id: 'phy701-m4-u1-q2',
                question: 'The recurrence for coefficients with r = ν is',
                options: [
                  'a_m = m a_{m−1}',
                  'a_m = −a_{m−2}/[m(m+2ν)]',
                  'a_m = 0 for all m',
                  'a_m = a_0 only',
                ],
                correctIndex: 1,
                explanation: 'Collecting powers of x^{m+ν} gives m(m+2ν)a_m + a_{m−2} = 0.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u2',
            title: 'Legendre polynomials: spherical origin, Rodrigues, orthogonality',
            content: r'''
## Learning goal

Derive Legendre's equation from Laplace's equation in spherical coordinates under axial symmetry, obtain P_ℓ through Rodrigues' formula, and prove orthogonality on [−1, 1] from the Sturm–Liouville structure with explicit boundary-term cancellation.

## Physical system: axisymmetric potential

In electrostatics (or steady temperature), Laplace's equation ∇²u = 0 holds in empty space. In spherical coordinates (r, θ, φ) with no φ dependence (axisymmetry about z),

∇²u = (1/r²) ∂/∂r (r² ∂u/∂r) + (1/(r² sin θ)) ∂/∂θ (sin θ ∂u/∂θ) = 0

Seek product solutions u(r, θ) = R(r) Θ(θ). Substitute and multiply through by r²/(R Θ):

(1/R) d/dr (r² dR/dr) = − (1/Θ) (1/sin θ) d/dθ (sin θ dΘ/dθ)

Both sides equal a constant. Call that constant ℓ(ℓ+1) (the name anticipates polynomial solutions). The angular equation is

(1/sin θ) d/dθ (sin θ dΘ/dθ) + ℓ(ℓ+1) Θ = 0

## Change of variable x = cos θ

Let x = cos θ, so dx = −sin θ dθ. When θ runs from 0 to π, x runs from 1 to −1. Set y(x) = Θ(θ). Then

dΘ/dθ = dy/dx · dx/dθ = −sin θ dy/dx

A standard chain-rule calculation converts the angular equation into

d/dx [ (1 − x²) dy/dx ] + ℓ(ℓ+1) y = 0

Expanded with the product rule:

(1 − x²) y'' − 2x y' + ℓ(ℓ+1) y = 0

This is **Legendre's equation**. Here:

- x = cos θ ∈ [−1, 1] for physical polar angles
- y(x) is the polar angular factor
- ℓ(ℓ+1) is the separation constant

Boundedness of Θ at θ = 0 and θ = π requires y finite at x = ±1. That selects ℓ = 0, 1, 2, … and the Legendre polynomials P_ℓ(x).

## Rodrigues' formula

Define

P_ℓ(x) = (1/(2^ℓ ℓ!)) d^ℓ/dx^ℓ (x² − 1)^ℓ

### Verification for small ℓ

ℓ = 0: P_0(x) = 1.

ℓ = 1: d/dx (x² − 1) = 2x, so P_1(x) = (1/2) · 2x = x.

ℓ = 2: (x² − 1)² = x⁴ − 2x² + 1; second derivative 12x² − 4; P_2 = (1/8)(12x² − 4) = (3x² − 1)/2.

### Why it solves Legendre's equation (structure)

Let w = (x² − 1)^ℓ. Then w satisfies a first-order relation obtained by logarithmic differentiation: w' / w = 2ℓx/(x² − 1). Differentiating ℓ times and using Leibniz's rule leads to Legendre's equation for y = d^ℓ w/dx^ℓ (up to the constant factor in Rodrigues). The factor 1/(2^ℓ ℓ!) is conventional normalization so that P_ℓ(1) = 1.

## Sturm–Liouville form

Legendre's equation is already

d/dx [ (1 − x²) y' ] + ℓ(ℓ+1) y = 0

so p(x) = 1 − x², q(x) = 0, weight w(x) = 1, eigenvalue λ = ℓ(ℓ+1). Note p(±1) = 0.

## Orthogonality proof

Let y_ℓ = P_ℓ and y_m = P_m with ℓ ≠ m. Multiply Legendre's equation for y_ℓ by y_m and for y_m by y_ℓ:

y_m d/dx [(1−x²) y_ℓ'] + ℓ(ℓ+1) y_m y_ℓ = 0

y_ℓ d/dx [(1−x²) y_m'] + m(m+1) y_ℓ y_m = 0

Subtract and integrate from −1 to 1:

∫_{−1}^{1} { y_m d/dx [(1−x²) y_ℓ'] − y_ℓ d/dx [(1−x²) y_m'] } dx + [ℓ(ℓ+1) − m(m+1)] ∫_{−1}^{1} y_ℓ y_m dx = 0

The first integral is a pure boundary term after integration by parts (Lagrange identity):

[ (1−x²) (y_m y_ℓ' − y_ℓ y_m') ]_{−1}^{1}

At x = ±1, the factor (1−x²) = 0, so the boundary term vanishes. Therefore

[ℓ(ℓ+1) − m(m+1)] ∫_{−1}^{1} P_ℓ(x) P_m(x) dx = 0

For ℓ ≠ m the prefactor is nonzero, hence

∫_{−1}^{1} P_ℓ(x) P_m(x) dx = 0

## Normalization (standard result)

∫_{−1}^{1} [P_ℓ(x)]² dx = 2/(2ℓ+1)

(obtained by applying Rodrigues and integrating by parts ℓ times; each time a boundary term vanishes because (x²−1)^ℓ and its first ℓ−1 derivatives vanish at ±1).

## Check yourself

In the boundary term (1−x²)(y_m y_ℓ' − y_ℓ y_m'), why do we not need y_ℓ and y_m to vanish at ±1?
''',
            keyTakeaways: [
              'Axisymmetric spherical Laplace separation yields Legendre\'s equation in x = cos θ.',
              'Rodrigues: P_ℓ(x) = 1/(2^ℓ ℓ!) d^ℓ/dx^ℓ (x²−1)^ℓ.',
              'Orthogonality follows from the S–L identity; boundary terms vanish because p(±1) = 0.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u2-q1',
                question: 'Legendre\'s equation in x = cos θ is',
                options: [
                  'y\'\' + y = 0',
                  '(1−x²)y\'\' − 2x y\' + ℓ(ℓ+1)y = 0',
                  'x y\'\' + y = 0',
                  'y\' − ℓ y = 0 only',
                ],
                correctIndex: 1,
                explanation: 'That is the standard expanded form of Legendre\'s equation.',
              ),
              QuizQuestion(
                id: 'phy701-m4-u2-q2',
                question: '∫_{−1}^{1} P_ℓ P_m dx for ℓ ≠ m equals',
                options: [
                  '1',
                  '0',
                  '2/(2ℓ+1)',
                  'ℓ + m',
                ],
                correctIndex: 1,
                explanation: 'Distinct eigenvalues give orthogonality on [−1, 1].',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u3',
            title: 'Hermite and Laguerre polynomials from quantum mechanics',
            content: r'''
## Learning goal

Derive Hermite's differential equation from the quantum harmonic oscillator Schrödinger equation with every substitution shown, introduce Laguerre polynomials from the radial hydrogen problem, and state generating functions and recurrence relations.

## Part A — Hermite and the oscillator

### Schrödinger equation

A particle of mass m in V(x) = (1/2) m ω² x² obeys

−(ℏ²/(2m)) d²ψ/dx² + (1/2) m ω² x² ψ = E ψ

### Dimensionless coordinate

Define α = √(m ω / ℏ) (units of 1/length) and ξ = α x. Then d/dx = α d/dξ, d²/dx² = α² d²/dξ². Substitute:

−(ℏ²/(2m)) α² ψ'' + (1/2) m ω² (ξ²/α²) ψ = E ψ

where ' = d/dξ. Insert α² = m ω / ℏ:

−(ℏ²/(2m)) (m ω / ℏ) ψ'' + (1/2) m ω² (ℏ/(m ω)) ξ² ψ = E ψ

Simplify:

−(ℏ ω / 2) ψ'' + (ℏ ω / 2) ξ² ψ = E ψ

Divide by ℏ ω / 2:

−ψ'' + ξ² ψ = (2E/(ℏ ω)) ψ

Define ε = 2E/(ℏ ω). Then

ψ'' + (ε − ξ²) ψ = 0

### Factor the Gaussian ground-state behaviour

For large |ξ|, ψ'' ≈ ξ² ψ suggests Gaussian decay. Set

ψ(ξ) = H(ξ) e^{−ξ²/2}

Compute derivatives:

ψ' = (H' − ξ H) e^{−ξ²/2}

ψ'' = (H'' − ξ H' − [H' − ξ H] − ξ (H' − ξ H)) e^{−ξ²/2}

= (H'' − 2ξ H' + (ξ² − 1) H) e^{−ξ²/2}

Substitute into ψ'' + (ε − ξ²) ψ = 0 and cancel the common never-zero factor e^{−ξ²/2}:

H'' − 2ξ H' + (ξ² − 1) H + (ε − ξ²) H = 0

H'' − 2ξ H' + (ε − 1) H = 0

### Polynomial termination

Power-series analysis of this equation shows that H grows too fast unless the series terminates. Termination occurs when

ε − 1 = 2n,    n = 0, 1, 2, …

so ε = 2n + 1, hence

E_n = ℏ ω (n + 1/2)

Then H = H_n satisfies **Hermite's equation**

H'' − 2ξ H' + 2n H = 0

### Generating function and recurrence

The generating function (standard convention)

G(ξ, t) = exp(2 ξ t − t²) = Σ_{n=0}^{∞} H_n(ξ) t^n / n!

Differentiating with respect to t:

∂G/∂t = (2ξ − 2t) G

Coefficient matching yields the recurrence

H_{n+1}(ξ) = 2ξ H_n(ξ) − 2n H_{n−1}(ξ)

Orthogonality weight on (−∞, ∞): e^{−ξ²}, coming from the factor e^{−ξ²/2} in each wavefunction (product of two factors).

## Part B — Laguerre and hydrogen

The radial Schrödinger equation for hydrogen, after writing the radial wave as R(r) = u(r)/r and separating constants, reduces (for bound states) to an equation solvable by associated Laguerre polynomials. The **ordinary Laguerre equation** is

x y'' + (1 − x) y' + n y = 0,    n = 0, 1, 2, …

Polynomial solutions are L_n(x). Weight for orthogonality on (0, ∞): e^{−x}.

Associated Laguerre polynomials L_n^{(k)}(x) satisfy a related equation with an extra k-dependent term; they appear when orbital angular momentum ℓ is nonzero (k related to ℓ).

Generating function for ordinary Laguerre:

exp(−x t /(1−t)) / (1−t) = Σ_{n=0}^{∞} L_n(x) t^n ,    |t| < 1

## Check yourself

In the oscillator reduction, show that ε = 2n+1 implies E_n = ℏω(n+1/2).
''',
            keyTakeaways: [
              'ψ = H(ξ) e^{−ξ²/2} converts the oscillator ODE into Hermite\'s equation.',
              'Termination gives E_n = ℏω(n+1/2) and Hermite polynomials H_n.',
              'Laguerre / associated Laguerre arise in the radial hydrogen problem.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m4-u3-q1',
                question: 'Hermite\'s equation is',
                options: [
                  'H\'\' + H = 0',
                  'H\'\' − 2ξ H\' + 2n H = 0',
                  'ξ H\' = n H',
                  'H\'\' − H = 0',
                ],
                correctIndex: 1,
                explanation: 'Standard form: H\'\' − 2ξ H\' + 2n H = 0.',
              ),
              QuizQuestion(
                id: 'phy701-m4-u3-q2',
                question: 'Oscillator energies for H_n are',
                options: [
                  'n ℏω',
                  'ℏω(n + 1/2)',
                  'ℏω / (n+1)',
                  'Independent of n',
                ],
                correctIndex: 1,
                explanation: 'ε = 2n+1 means 2E/(ℏω) = 2n+1, so E = ℏω(n+1/2).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m4-u4',
            title: 'Gamma and Beta functions',
            content: r'''
## Learning goal

Define the Gamma function by its Euler integral, derive Γ(z+1) = z Γ(z) with boundary terms checked explicitly, relate Γ(n+1) to n!, define the Beta function, and establish B(p,q) = Γ(p)Γ(q)/Γ(p+q).

## Definition of Gamma

For complex z with Re(z) > 0,

Γ(z) = ∫_0^{∞} t^{z−1} e^{−t} dt

Symbols:

- t > 0 is the dummy integration variable
- z is the argument (Re(z) > 0 ensures convergence at t = 0)
- e^{−t} guarantees convergence as t → ∞

## Convergence notes

Near t = 0, t^{z−1} = t^{Re(z)−1} times a phase; ∫_0^1 t^{Re(z)−1} dt converges when Re(z) > 0. At infinity, e^{−t} dominates any power t^{Re(z)−1}.

## Functional equation — full integration by parts

Consider

Γ(z+1) = ∫_0^{∞} t^z e^{−t} dt

Set u = t^z,    dv = e^{−t} dt

Then du = z t^{z−1} dt,    v = −e^{−t}

∫ u dv = u v − ∫ v du:

Γ(z+1) = [ −t^z e^{−t} ]_0^{∞} − ∫_0^{∞} (−e^{−t}) z t^{z−1} dt

= [ −t^z e^{−t} ]_0^{∞} + z ∫_0^{∞} t^{z−1} e^{−t} dt

### Boundary term at infinity

For fixed z, t^z e^{−t} → 0 as t → ∞ because exponential decay beats polynomial (or power) growth of |t^z|.

### Boundary term at zero

t^z → 0 as t → 0 when Re(z) > 0. Thus [ −t^z e^{−t} ]_0^{∞} = 0 − 0 = 0.

Therefore

Γ(z+1) = z Γ(z)

## Factorials

Γ(1) = ∫_0^{∞} e^{−t} dt = [ −e^{−t} ]_0^{∞} = 1

Γ(2) = 1 · Γ(1) = 1 = 1!

Γ(3) = 2 · Γ(2) = 2 = 2!

Γ(4) = 3 · Γ(3) = 6 = 3!

By induction, Γ(n+1) = n! for integers n ≥ 0.

## Beta function

For Re(p) > 0 and Re(q) > 0,

B(p,q) = ∫_0^1 t^{p−1} (1−t)^{q−1} dt

## Relation B(p,q) = Γ(p)Γ(q)/Γ(p+q)

Write

Γ(p)Γ(q) = ∫_0^{∞} ∫_0^{∞} s^{p−1} e^{−s} u^{q−1} e^{−u} ds du

Change variables: s = ξ η,    u = ξ (1 − η), with ξ ∈ (0, ∞) and η ∈ (0, 1). The Jacobian of the transformation (s,u) ← (ξ,η) has absolute value ξ (standard computation: s+u = ξ, u/(s+u) = 1−η, etc.).

Then

Γ(p)Γ(q) = ∫_0^1 η^{p−1} (1−η)^{q−1} dη  ·  ∫_0^{∞} ξ^{p+q−1} e^{−ξ} dξ

= B(p,q) · Γ(p+q)

Hence

B(p,q) = Γ(p)Γ(q) / Γ(p+q)

## Link to Bessel

The series coefficients for J_ν use Γ(ν+j+1) in the denominator — Gamma extends the factorial law to the non-integer orders that appear in cylindrical problems.

## Check yourself

Using only Γ(1) = 1 and Γ(z+1) = z Γ(z), compute Γ(5).
''',
            keyTakeaways: [
              'Γ(z) = ∫_0^{∞} t^{z−1} e^{−t} dt for Re(z) > 0.',
              'Integration by parts gives Γ(z+1) = z Γ(z); Γ(n+1) = n!.',
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
              QuizQuestion(
                id: 'phy701-m4-u4-q2',
                question: 'B(p,q) equals',
                options: [
                  'Γ(p) + Γ(q)',
                  'Γ(p)Γ(q)/Γ(p+q)',
                  'Γ(p+q)',
                  'p q',
                ],
                correctIndex: 1,
                explanation: 'That is the fundamental Beta–Gamma identity.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy701-m5',
        title: 'Distribution Theory & The Dirac Delta Function',
        summary:
            'Delta as a distribution on test functions, nascent sequences, scaling and composition proofs, distributional derivatives, Fourier representation.',
        units: [
          Unit(
            id: 'phy701-m5-u1',
            title: 'Dirac delta as a distribution on test functions',
            content: r'''
## Learning goal

Define the Dirac delta rigorously as a continuous linear functional on the space of compactly supported smooth test functions, and connect that definition to the informal physics integral notation.

## Why ordinary functions are not enough

In physics one often writes identities such as

ρ(x) = q δ(x − x0)

for a point charge, or

∫_{−∞}^{∞} δ(x − x') f(x) dx = f(x')

If δ were an ordinary function, equal to zero everywhere except at one point, its integral against any bounded function would be zero — contradicting the second line. So δ cannot be an ordinary pointwise function. It must be treated as a **generalized function** (distribution).

## Test function space D(ℝ)

A function φ: ℝ → ℝ (or ℂ) belongs to D(ℝ) if:

1. φ is infinitely differentiable: every derivative φ^{(k)} exists and is continuous;
2. φ has **compact support**: there exist finite A < B such that φ(x) = 0 for all x ∉ [A, B].

Examples: a smooth “bump” that is positive on (−1, 1) and identically zero outside [−1, 1]. Non-examples: e^{−x²} (smooth but not compactly supported), and a triangular tent function (compact support but not smooth at the peaks).

## Distributions

A **distribution** T is a linear map

T: D(ℝ) → ℝ (or ℂ)

that is continuous with respect to the natural topology on test functions (if φ_n → φ in that topology, then T(φ_n) → T(φ)). We write the action as

⟨T, φ⟩ := T(φ)

Every locally integrable ordinary function f defines a distribution T_f by

⟨T_f, φ⟩ = ∫_{−∞}^{∞} f(x) φ(x) dx

## Definition of the Dirac delta

The Dirac delta at the origin is the distribution δ defined by

⟨δ, φ⟩ = φ(0)    for every φ ∈ D(ℝ)

Linearity: ⟨δ, c₁ φ₁ + c₂ φ₂⟩ = c₁ φ₁(0) + c₂ φ₂(0) = c₁ ⟨δ, φ₁⟩ + c₂ ⟨δ, φ₂⟩.

There is no locally integrable function f with T_f = δ: if there were, ∫ f φ = φ(0) for all test φ, which is impossible (one can construct test functions supported where f would have to vanish yet φ(0) ≠ 0 after translation arguments, or use standard measure-theory contradictions).

## Shifted delta

For fixed x' ∈ ℝ, define δ_{x'} by

⟨δ_{x'}, φ⟩ = φ(x')

Physics notation:

∫_{−∞}^{∞} δ(x − x') φ(x) dx := φ(x')

## Check yourself

Why does the informal statement “δ(x) = 0 for x ≠ 0 and ∫ δ(x) dx = 1” fail as a definition inside ordinary Riemann or Lebesgue integration?
''',
            keyTakeaways: [
              'Test functions in D(ℝ) are smooth and compactly supported.',
              '⟨δ, φ⟩ = φ(0) defines the delta distribution.',
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
                  '0 for every φ',
                ],
                correctIndex: 1,
                explanation: 'By definition the delta distribution returns the value of the test function at 0.',
              ),
              QuizQuestion(
                id: 'phy701-m5-u1-q2',
                question: 'A function in D(ℝ) must be',
                options: [
                  'Only continuous',
                  'Smooth with compact support',
                  'A polynomial',
                  'Equal to δ itself',
                ],
                correctIndex: 1,
                explanation: 'Test functions are C^∞ and vanish outside a finite interval.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u2',
            title: 'Limit representations: Gaussian, Lorentzian, rectangle, sinc',
            content: r'''
## Learning goal

Construct sequences of ordinary functions that converge to δ in the distributional sense, and verify the mechanism for rectangular, Gaussian, Lorentzian, and sinc-type nascent deltas.

## Distributional convergence

A family of locally integrable functions {f_ε}_{ε>0} is said to satisfy

f_ε → δ    as ε → 0⁺

in the sense of distributions if for every test function φ ∈ D(ℝ),

∫_{−∞}^{∞} f_ε(x) φ(x) dx → φ(0)

## Rectangular nascent delta

Define

f_ε(x) = 1/ε    if |x| < ε/2,
f_ε(x) = 0      if |x| ≥ ε/2

Then ∫_{−∞}^{∞} f_ε(x) dx = 1 for every ε > 0.

For continuous φ,

∫ f_ε(x) φ(x) dx = (1/ε) ∫_{−ε/2}^{ε/2} φ(x) dx

This is the average of φ over [−ε/2, ε/2]. As ε → 0, continuity of φ forces the average → φ(0).

## Gaussian nascent delta

Define

g_ε(x) = (1/(ε √π)) exp(−x²/ε²)

(The constant is chosen so that ∫ g_ε dx = 1; equivalent normalizations use σ = ε/√2.)

As ε → 0, the peak height grows like 1/ε while the width shrinks like ε, keeping unit mass. For φ ∈ D(ℝ), standard analysis (or the substitution u = x/ε) shows

∫ g_ε(x) φ(x) dx → φ(0)

## Lorentzian nascent delta

Define

L_ε(x) = (1/π) · ε / (x² + ε²)

Then ∫_{−∞}^{∞} L_ε(x) dx = 1 (arctangent evaluation). As ε → 0, L_ε peaks at x = 0 with height 1/(π ε) and width of order ε. Against test functions, L_ε → δ.

## Sinc / truncated Fourier integral

Consider

s_K(x) = (1/(2π)) ∫_{−K}^{K} e^{ikx} dk

If x ≠ 0,

s_K(x) = (1/(2π)) [e^{ikx}/(ix)]_{−K}^{K} = (K/π) · (sin(Kx)/(Kx)) 

(up to the usual sinc normalization conventions). As K → ∞, s_K becomes a more and more oscillatory peak concentrated at x = 0 with integral 1, and s_K → δ in the distributional sense. This is the same kernel that appears in Fourier inversion (Unit 4).

## Common pattern

Each representation satisfies:

1. ∫ f_ε = 1 (or tends to 1);
2. for any δ > 0, ∫_{|x|>δ} f_ε(x) dx → 0 as ε → 0 (mass concentrates at 0);
3. f_ε remains controlled enough to pass to the limit against continuous φ.

## Check yourself

Why must the integral of a nascent delta stay equal to 1 (or tend to 1)? What would go wrong if the integral tended to 0?
''',
            keyTakeaways: [
              'Distributional limits are tested by integrating against every test function φ.',
              'Rectangles, Gaussians, Lorentzians, and sinc kernels are standard nascent deltas.',
              'Unit mass and concentration at 0 are the essential mechanisms.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u2-q1',
                question: 'As ε → 0, a nascent delta sequence should',
                options: [
                  'Spread out with fixed height 1',
                  'Narrow while keeping total integral 1',
                  'Tend to the zero function with integral 0',
                  'Equal the Heaviside step pointwise',
                ],
                correctIndex: 1,
                explanation: 'Mass concentrates at a single point while the integral remains 1.',
              ),
              QuizQuestion(
                id: 'phy701-m5-u2-q2',
                question: 'The Lorentzian nascent delta is proportional to',
                options: [
                  'ε / (x² + ε²)',
                  'x² + ε²',
                  'e^{x/ε}',
                  '1 only',
                ],
                correctIndex: 0,
                explanation: 'L_ε(x) = (1/π) ε/(x²+ε²) is the standard Lorentzian approximate identity.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u3',
            title: 'Operational identities: scaling, composition, derivatives',
            content: r'''
## Learning goal

Derive the scaling identity δ(ax) = δ(x)/|a|, the composition rule at simple zeros, and the distributional derivative of δ, each from the definition ⟨δ, φ⟩ = φ(0).

## Scaling property — full derivation

We must define what δ(ax) means as a distribution. For a ≠ 0 and φ ∈ D(ℝ), set

⟨δ(ax), φ⟩ := ⟨δ, φ_a⟩

where φ_a is the test function that makes the change of variables consistent. Compute the ordinary integral pairing against a nascent delta f_ε(ax) and pass to the limit, or directly:

Substitute u = a x. Then dx = du/|a| (the absolute value appears because reversing limits when a < 0 contributes a minus sign that absolute value absorbs).

∫ δ(ax) φ(x) dx = ∫ δ(u) φ(u/a) (du/|a|) = (1/|a|) φ(0)

Therefore

δ(ax) = (1/|a|) δ(x)

as distributions: both sides give (1/|a|) φ(0) when paired with φ.

### Example

δ(2x) = (1/2) δ(x).  
δ(−x) = δ(x) because |−1| = 1.

## Composition δ(g(x)) at simple roots

Let g be continuously differentiable and let x_k be isolated simple zeros: g(x_k) = 0 and g'(x_k) ≠ 0.

Near x_k, g(x) ≈ g'(x_k)(x − x_k). Using the scaling result locally about each root and summing contributions,

δ(g(x)) = Σ_k δ(x − x_k) / |g'(x_k)|

### Sketch of justification

On a small neighbourhood of a single simple root x_k, set u = g(x). Then du = g'(x) dx, so dx = du/g'(x). Accounting for orientation with absolute value and evaluating at the root gives the factor 1/|g'(x_k)|. Roots are isolated, so global contributions add.

### Example

g(x) = x² − 1 = (x−1)(x+1) has simple zeros at ±1 with |g'(±1)| = 2. Thus

δ(x² − 1) = [δ(x − 1) + δ(x + 1)] / 2

## Distributional derivative

For any distribution T, define T' by

⟨T', φ⟩ := −⟨T, φ'⟩

This extends integration by parts: if T = T_f for a smooth compactly supported f, then ∫ f' φ = −∫ f φ' after boundary terms vanish, matching the definition.

Apply to δ:

⟨δ', φ⟩ = −⟨δ, φ'⟩ = −φ'(0)

Higher orders:

⟨δ^{(n)}, φ⟩ = (−1)^n φ^{(n)}(0)

## Heaviside step

Let H(x) = 0 for x < 0 and H(x) = 1 for x > 0 (value at 0 irrelevant for integration). For φ ∈ D(ℝ),

⟨H', φ⟩ = −⟨H, φ'⟩ = −∫_0^{∞} φ'(x) dx = −[φ(∞) − φ(0)] = φ(0) = ⟨δ, φ⟩

since φ(∞) = 0 by compact support. Thus H' = δ in the distributional sense.

## Check yourself

Evaluate ⟨δ', φ⟩ for φ(x) = e^{−x²} formally using −φ'(0).
''',
            keyTakeaways: [
              'δ(ax) = δ(x)/|a| for a ≠ 0.',
              'δ(g(x)) = Σ δ(x−x_k)/|g\'(x_k)| at simple roots x_k.',
              '⟨δ\', φ⟩ = −φ\'(0); H\' = δ distributionally.',
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
                explanation: 'Scaling gives a factor 1/|a| with a = 2.',
              ),
              QuizQuestion(
                id: 'phy701-m5-u3-q2',
                question: '⟨δ\', φ⟩ equals',
                options: [
                  'φ(0)',
                  '−φ\'(0)',
                  'φ\'\'(0)',
                  '∫ φ dx',
                ],
                correctIndex: 1,
                explanation: 'Distributional differentiation places a minus on the test function\'s derivative.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m5-u4',
            title: 'Fourier representation of δ(x − x\')',
            content: r'''
## Learning goal

Derive the plane-wave integral representation of the Dirac delta from the Fourier inversion theorem, with conventions stated explicitly.

## Fourier transform conventions used here

For a sufficiently nice function f (for example Schwartz-class, or L¹ with enough regularity for inversion), define

f̂(k) = ∫_{−∞}^{∞} f(x) e^{−i k x} dx

and the inverse

f(x) = (1/(2π)) ∫_{−∞}^{∞} f̂(k) e^{i k x} dk

(Other common conventions place factors of 2π differently on the forward and inverse transforms; the structure of the argument is the same.)

## Substitute and rearrange

Insert the expression for f̂ into the inversion formula:

f(x) = (1/(2π)) ∫_{−∞}^{∞} [ ∫_{−∞}^{∞} f(y) e^{−i k y} dy ] e^{i k x} dk

Assuming the Fubini-type interchange is justified in the distributional sense (or for the function class at hand),

f(x) = ∫_{−∞}^{∞} f(y) [ (1/(2π)) ∫_{−∞}^{∞} e^{i k (x − y)} dk ] dy

## Reading the kernel

The identity says that the kernel

K(x − y) = (1/(2π)) ∫_{−∞}^{∞} e^{i k (x − y)} dk

acts as δ(x − y): integrating K(x − y) f(y) dy recovers f(x). Therefore, as distributions,

(1/(2π)) ∫_{−∞}^{∞} e^{i k (x − x')} dk = δ(x − x')

## Link to Unit 2

The truncated integral (1/(2π)) ∫_{−K}^{K} e^{i k (x−x')} dk is precisely a sinc-type nascent delta; K → ∞ recovers δ.

## Completeness interpretation

The family of functions x ↦ e^{i k x}, labelled by continuous k ∈ ℝ, is complete on the line in the sense that their continuum superposition can reproduce any (suitable) f — with the completeness relation expressed by the delta function.

## Check yourself

If one defines both the forward and inverse transforms with symmetric factors 1/√(2π), how does the integral representation of δ change?
''',
            keyTakeaways: [
              'Fourier inversion implies (1/(2π))∫ e^{ik(x−x\')} dk = δ(x−x\').',
              'The identity holds in the distributional sense.',
              'Truncated Fourier integrals are nascent deltas.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m5-u4-q1',
                question: 'In the convention of this unit, δ(x − x\') equals',
                options: [
                  '∫ e^{ik(x−x\')} dk with no factor',
                  '(1/(2π)) ∫_{−∞}^{∞} e^{ik(x−x\')} dk',
                  'e^{x−x\'}',
                  '1 only',
                ],
                correctIndex: 1,
                explanation: 'That is the Fourier completeness / inversion kernel for our 2π convention.',
              ),
              QuizQuestion(
                id: 'phy701-m5-u4-q2',
                question: 'The Fourier representation of delta is best understood as',
                options: [
                  'A pointwise ordinary function identity everywhere',
                  'A distributional identity',
                  'True only for x = 0',
                  'Independent of inversion conventions',
                ],
                correctIndex: 1,
                explanation: 'The integral does not converge pointwise as an ordinary function; it acts under the integral against test functions.',
              ),
            ],
          ),
        ],
      ),
            Module(
        id: 'phy701-m6',
        title: 'Fourier Series & Continuous Fourier Transforms',
        summary:
            'Complex Fourier series from real form, continuum limit to transforms, operational theorems, Parseval and Plancherel proofs.',
        units: [
          Unit(
            id: 'phy701-m6-u1',
            title: 'Trigonometric and complex Fourier series',
            content: r'''
## Learning goal

Start from the real sine/cosine Fourier series on an interval of length 2L, derive the complex exponential form, and obtain the formula for the coefficients c_n from orthogonality with every step shown.

## Physical motivation

Periodic signals — a vibrating string with fixed ends extended oddly, a periodic driving force, a crystal lattice potential — invite expansion in sines and cosines that match the period. The Fourier series is that expansion.

## Real form on (−L, L)

Assume f is piecewise smooth on (−L, L) and is extended to a 2L-periodic function on ℝ. The real Fourier series is

f(x) ~ a_0/2 + Σ_{n=1}^{∞} [ a_n cos(n π x / L) + b_n sin(n π x / L) ]

### Coefficient formulas (real)

The set {1/√(2L), cos(nπx/L)/√L, sin(nπx/L)/√L} (with appropriate indexing) is orthonormal on (−L, L). Integrating term by term against cos(mπx/L) and sin(mπx/L) and using

∫_{−L}^{L} cos(nπx/L) cos(mπx/L) dx = L δ_{nm}    (n,m ≥ 1)
∫_{−L}^{L} sin(nπx/L) sin(mπx/L) dx = L δ_{nm}
∫_{−L}^{L} cos(nπx/L) sin(mπx/L) dx = 0

gives

a_n = (1/L) ∫_{−L}^{L} f(x) cos(n π x / L) dx,    n ≥ 0

b_n = (1/L) ∫_{−L}^{L} f(x) sin(n π x / L) dx,    n ≥ 1

(The factor 1/2 in a_0/2 makes the n = 0 formula for a_n match the same integral expression.)

## Euler identity and complex form

Use

cos θ = (e^{iθ} + e^{−iθ})/2,    sin θ = (e^{iθ} − e^{−iθ})/(2i)

Substitute into the real series and regroup coefficients of e^{i n π x / L} for n ∈ ℤ. The series becomes

f(x) ~ Σ_{n=−∞}^{∞} c_n e^{i n π x / L}

## Formula for c_n

Multiply the complex series by e^{−i m π x / L} and integrate over (−L, L). Use the orthogonality relation

∫_{−L}^{L} e^{i (n−m) π x / L} dx = 2L δ_{nm}

Derivation of that integral: if n = m, integrand is 1 and the integral is 2L. If n ≠ m,

∫_{−L}^{L} e^{i (n−m) π x / L} dx = [ L / (i(n−m)π) e^{i (n−m) π x / L} ]_{−L}^{L} = 0

because e^{i(n−m)π} = e^{−i(n−m)π} = (±1) with matching values at the endpoints for integer n−m.

Therefore

c_m · 2L = ∫_{−L}^{L} f(x) e^{−i m π x / L} dx

so

c_n = (1/(2L)) ∫_{−L}^{L} f(x) e^{−i n π x / L} dx

## Relation to a_n, b_n

For real f and n ≥ 1:

c_n = (a_n − i b_n)/2,    c_{−n} = (a_n + i b_n)/2,    c_0 = a_0/2

## Check yourself

If f is real and even, show that each c_n is real.
''',
            keyTakeaways: [
              'Real Fourier series and complex exponential series are equivalent rearrangements.',
              'c_n = (1/(2L)) ∫_{−L}^{L} f(x) e^{−i n π x / L} dx.',
              'Orthogonality of complex exponentials on (−L, L) isolates each c_n.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u1-q1',
                question: 'The analysis formula for c_n uses',
                options: [
                  'e^{i n π x / L} inside the integral only',
                  'e^{−i n π x / L} inside the integral',
                  'Only sin(nπx/L)',
                  'x^n',
                ],
                correctIndex: 1,
                explanation: 'Standard convention pairs e^{i n π x / L} in the series with e^{−i n π x / L} in c_n.',
              ),
              QuizQuestion(
                id: 'phy701-m6-u1-q2',
                question: '∫_{−L}^{L} e^{i (n−m) π x / L} dx equals',
                options: [
                  '0 always',
                  '2L δ_{nm}',
                  '1',
                  'L only when n ≠ m',
                ],
                correctIndex: 1,
                explanation: 'The complex exponentials are orthogonal with norm-squared 2L.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u2',
            title: 'From Fourier series to the continuous Fourier transform',
            content: r'''
## Learning goal

Take the limit L → ∞ of the complex Fourier series carefully and obtain a continuous Fourier transform pair, tracking factors of 2π and the spacing of discrete frequencies.

## Discrete frequencies and spacing

On the interval (−L, L), the allowed wave numbers are

k_n = n π / L,    n ∈ ℤ

The spacing between neighbouring modes is

Δk = k_{n+1} − k_n = π / L

As L → ∞, Δk → 0: the discrete grid of frequencies becomes a continuum.

## Rewrite the series using Δk

From Unit 1,

f(x) ~ Σ_{n=−∞}^{∞} c_n e^{i k_n x}

with

c_n = (1/(2L)) ∫_{−L}^{L} f(y) e^{−i k_n y} dy

Note that

1/(2L) = (π/L) / (2π) = Δk / (2π)

So

f(x) ~ Σ_{n=−∞}^{∞} [ (Δk / (2π)) ∫_{−L}^{L} f(y) e^{−i k_n y} dy ] e^{i k_n x}

= Σ_{n=−∞}^{∞} (Δk) · { (1/(2π)) [∫_{−L}^{L} f(y) e^{−i k_n y} dy] e^{i k_n x} }

## Continuum limit

As L → ∞:

1. The inner integral extends to ∫_{−∞}^{∞} f(y) e^{−i k y} dy, defining the Fourier transform
2. The sum Σ g(k_n) Δk becomes the integral ∫_{−∞}^{∞} g(k) dk

Therefore

f(x) = (1/(2π)) ∫_{−∞}^{∞} f̂(k) e^{i k x} dk

where

f̂(k) = ∫_{−∞}^{∞} f(x) e^{−i k x} dx

## Transform pair (summary)

Forward:    f̂(k) = ∫_{−∞}^{∞} f(x) e^{−i k x} dx

Inverse:    f(x) = (1/(2π)) ∫_{−∞}^{∞} f̂(k) e^{i k x} dk

(Other conventions move the 2π factors; always stay consistent within one calculation.)

## Check yourself

Show algebraically that 1/(2L) = Δk/(2π) when Δk = π/L.
''',
            keyTakeaways: [
              'Frequency spacing Δk = π/L vanishes as L → ∞.',
              '1/(2L) = Δk/(2π) converts the discrete sum into a k-integral.',
              'The Fourier transform pair is the continuum limit of the complex series.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u2-q1',
                question: 'As L → ∞, the discrete Fourier sum becomes',
                options: [
                  'A finite Taylor polynomial',
                  'A continuous integral over k',
                  'Independent of f',
                  'Only a single sine term',
                ],
                correctIndex: 1,
                explanation: 'Densifying frequencies turns Σ (·) Δk into ∫ dk.',
              ),
              QuizQuestion(
                id: 'phy701-m6-u2-q2',
                question: 'In this unit\'s convention, the inverse transform carries the factor',
                options: [
                  '2π in the forward transform only and none in the inverse',
                  '1/(2π) in front of the k-integral for f(x)',
                  'No 2π factors anywhere',
                  '4π always',
                ],
                correctIndex: 1,
                explanation: 'We placed 1/(2π) on the inverse integral.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u3',
            title: 'Operational theorems: shift, derivative, convolution',
            content: r'''
## Learning goal

Derive the spatial shift theorem, the transform of a derivative, and the convolution theorem from the definitions in Unit 2.

## Shift theorem

Let g(x) = f(x − x_0) for fixed x_0. Then

ĝ(k) = ∫_{−∞}^{∞} f(x − x_0) e^{−i k x} dx

Substitute u = x − x_0 (so x = u + x_0, dx = du):

ĝ(k) = ∫_{−∞}^{∞} f(u) e^{−i k (u + x_0)} du = e^{−i k x_0} ∫_{−∞}^{∞} f(u) e^{−i k u} du

= e^{−i k x_0} f̂(k)

A spatial translation multiplies the transform by a pure phase e^{−i k x_0}.

## Derivative theorem

Assume f(x) → 0 as |x| → ∞ and f' is transformable. Integrate by parts:

∫_{−∞}^{∞} f'(x) e^{−i k x} dx = [ f(x) e^{−i k x} ]_{−∞}^{∞} − ∫_{−∞}^{∞} f(x) (−i k) e^{−i k x} dx

Boundary terms vanish by the decay assumption. Therefore

widehat{f'}(k) = i k f̂(k)

Differentiation in x multiplies the transform by i k in this convention.

(Repeated differentiation: n-th derivative ↔ (i k)^n f̂(k).)

## Convolution theorem

Define

(f ∗ g)(x) = ∫_{−∞}^{∞} f(y) g(x − y) dy

Compute the transform:

widehat{f ∗ g}(k) = ∫_{−∞}^{∞} ∫_{−∞}^{∞} f(y) g(x − y) e^{−i k x} dy dx

Change the order of integration (justified for suitable f, g). For fixed y set u = x − y:

∫_{−∞}^{∞} g(x − y) e^{−i k x} dx = ∫_{−∞}^{∞} g(u) e^{−i k (u+y)} du = e^{−i k y} ĝ(k)

Therefore

widehat{f ∗ g}(k) = ∫_{−∞}^{∞} f(y) e^{−i k y} ĝ(k) dy = f̂(k) ĝ(k)

Convolution in space ↔ product in frequency.

## Dual statements (brief)

Multiplication by e^{i k_0 x} in space shifts the transform in k. Multiplication of transforms corresponds to convolution of the original functions (with a 2π factor depending on convention).

## Check yourself

Find the transform of f(x − 2) + f(x + 2) in terms of f̂(k).
''',
            keyTakeaways: [
              'Translation by x_0 multiplies f̂ by e^{−i k x_0}.',
              'f\' transforms to i k f̂ when boundary terms vanish.',
              'Convolution transforms to the product f̂ ĝ.',
            ],
            quiz: [
              QuizQuestion(
                id: 'phy701-m6-u3-q1',
                question: 'The Fourier transform of f(x − x_0) is',
                options: [
                  'f̂(k − x_0)',
                  'e^{−i k x_0} f̂(k)',
                  'f̂(k)/x_0',
                  'i k f̂(k)',
                ],
                correctIndex: 1,
                explanation: 'Shifts become phase factors in k-space.',
              ),
              QuizQuestion(
                id: 'phy701-m6-u3-q2',
                question: 'The transform of f ∗ g is',
                options: [
                  'f̂ + ĝ',
                  'f̂ ĝ',
                  'f̂ / ĝ',
                  'f̂\' ĝ\'',
                ],
                correctIndex: 1,
                explanation: 'Convolution theorem: transforms multiply.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-m6-u4',
            title: 'Parseval and Plancherel theorems',
            content: r'''
## Learning goal

Prove the energy identities linking the mean-square size of f to its Fourier coefficients (Parseval) and to its Fourier transform (Plancherel).

## Parseval for orthonormal expansions

Let {φ_n} be an orthonormal set in L²(I) for an interval I:

∫_I φ_n(x) φ_m^*(x) dx = δ_{nm}

If f = Σ_n c_n φ_n with convergence in L², then

∫_I |f(x)|² dx = ∫_I (Σ_n c_n φ_n) (Σ_m c_m^* φ_m^*) dx = Σ_n Σ_m c_n c_m^* ∫ φ_n φ_m^* = Σ_n |c_n|²

That is **Parseval's identity** for orthonormal series: the energy of f equals the sum of squared coefficient moduli.

### Application to complex Fourier series

With the normalization of Unit 1, the functions (1/√(2L)) e^{i n π x / L} are orthonormal on (−L, L). Writing f = Σ c_n e^{i n π x / L} with the c_n of Unit 1, one obtains the matching form

(1/(2L)) ∫_{−L}^{L} |f(x)|² dx = Σ_{n=−∞}^{∞} |c_n|²

(or an equivalent rearrangement depending on whether c_n absorbs the 1/√(2L) factor — stay consistent with your coefficient convention).

## Plancherel theorem for the continuous transform

Using the transform pair of Unit 2 and the same energy idea in the continuum limit (or by a careful limiting argument from the series Parseval identity as L → ∞),

∫_{−∞}^{∞} |f(x)|² dx = (1/(2π)) ∫_{−∞}^{∞} |f̂(k)|² dk

This is **Plancherel's theorem** in our convention: the Fourier transform is an isometry of L² up to the universal factor 1/(2π) on the frequency side.

### Sketch via the continuum limit

From the series Parseval form, the left side is a mean-square over one period. As L → ∞ for functions that decay at infinity, the mean-square over (−L, L) relates to ∫|f|², while Σ |c_n|² with c_n ~ (Δk/(2π)) f̂(k_n) becomes an integral (1/(2π)) ∫ |f̂|² dk after accounting for Δk.

## Physical reading

Plancherel says that the total “energy” computed in space equals the total energy computed from the spectrum. A pulse that is very narrow in x must be broad in k so that ∫|f̂|² still matches — the quantitative form of bandwidth intuition.

## Check yourself

If f is replaced by f(ax) with a > 1 (compression in x), how must |f̂| change so that Plancherel still holds?
''',
            keyTakeaways: [
              'Parseval: ∫|f|² equals Σ|c_n|² for orthonormal expansions (up to normalization).',
              'Plancherel: ∫|f|² = (1/(2π)) ∫|f̂|² in this unit\'s convention.',
              'Spatial concentration forces spectral spread at fixed energy.',
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
                explanation: 'Plancherel is the L² energy identity between space and frequency.',
              ),
              QuizQuestion(
                id: 'phy701-m6-u4-q2',
                question: 'Parseval for an orthonormal series states that ∫|f|² equals',
                options: [
                  'Σ c_n only',
                  'Σ |c_n|²',
                  'max |c_n|',
                  '0 always',
                ],
                correctIndex: 1,
                explanation: 'Energy of f equals the sum of squared coefficient moduli.',
              ),
            ],
          ),
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
