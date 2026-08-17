import 'package:pgd_physics/models/course.dart';

/// Complete PHY 701 – Mathematical Methods
/// Micro-chunked, intuition-first, written for Tochi
Course buildPhy701() {
  return Course(
    id: 'phy701',
    code: 'PHY 701',
    title: 'Mathematical Methods',
    description:
        'The mathematical language of physics — differential equations, transforms, special functions and more — taught from pure physical intuition upward.',
    semester: 'First Semester',
    units: 3,
    icon: '∫',
    colorHint: ColorHint.purple,
    topics: [
      // ═══════════════════════════════════════════════════════════════
      // 1. ORDINARY DIFFERENTIAL EQUATIONS – FOUNDATIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t1',
        title: 'What is a Differential Equation?',
        summary: 'Equations that relate a quantity to how fast it is changing — the native language of physics.',
        units: [
          Unit(
            id: 'phy701-t1-u1',
            title: 'The Big Idea – Rates of Change',
            content: r'''
# The Big Idea – Rates of Change

Hey Tochi…

Before any formula appears, I want you to feel this.

In ordinary algebra we write things like **2x + 3 = 11**. We are looking for a *number*.

In physics we are almost never looking for a single number. We are looking for a *function* — a whole story of how something changes with time or space.

A **differential equation** is simply an equation that relates a quantity to *how fast that quantity is changing*.

### Everyday picture
Imagine you are driving.
- Your position is *x*
- Your speed is how fast position is changing → **dx/dt**

If someone tells you “your speed is always 60 km/h”, they have given you a differential equation:

$$ \frac{dx}{dt} = 60 $$

The solution is not a number. The solution is the whole journey: **x(t) = 60t + starting position**.

That is the heart of the entire course. Differential equations are the native language of physics because the laws of nature almost always speak in terms of rates of change.
''',
            keyTakeaways: [
              'Ordinary equations ask for numbers. Differential equations ask for functions (stories of change).',
              'dx/dt simply means “how fast x is changing with time”.',
              'Physics laws are almost always written as differential equations.',
            ],
            quiz: [
              QuizQuestion(
                id: 't1u1q1',
                question: 'In plain English, what is a differential equation really asking for?',
                options: [
                  'A single number',
                  'A function that describes how something changes',
                  'A list of measurements',
                  'A geometric shape',
                ],
                correctIndex: 1,
                explanation: 'It asks for the whole function — the story of how the quantity evolves.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t1-u2',
            title: 'Order of a Differential Equation',
            content: r'''
# Order of a Differential Equation

The **order** is simply the highest derivative that appears.

- First-order → only first derivatives (dx/dt)
- Second-order → second derivatives appear (d²x/dt²)
- nth-order → the nth derivative is the highest one present

### Physical meaning
- First derivative of position → **velocity**
- Second derivative of position → **acceleration**

Newton’s second law is a *second-order* differential equation:

$$ F = m \frac{d^2x}{dt^2} $$

That is why second-order equations appear so often in mechanics. We start gently with first-order, then move upward.
''',
            keyTakeaways: [
              'Order = highest derivative present.',
              'First derivative ↔ velocity, second derivative ↔ acceleration.',
              'Newton’s law is second-order.',
            ],
            quiz: [
              QuizQuestion(
                id: 't1u2q1',
                question: 'Newton’s second law (F = ma) is a differential equation of what order?',
                options: ['First-order', 'Second-order', 'Third-order', 'It is not a differential equation'],
                correctIndex: 1,
                explanation: 'Acceleration is the second derivative of position.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 2. FIRST-ORDER ODEs
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t2',
        title: 'First-Order ODEs – Separable Equations',
        summary: 'The simplest useful class: rearrange so each variable lives on its own side, then integrate.',
        units: [
          Unit(
            id: 'phy701-t2-u1',
            title: 'What “Separable” Really Means',
            content: r'''
# What “Separable” Really Means

A first-order equation is **separable** when we can rearrange it so that everything involving *y* sits with *dy* and everything involving *x* sits with *dx*:

$$ \frac{dy}{dx} = f(x)\, g(y) \quad \Rightarrow \quad \frac{dy}{g(y)} = f(x)\, dx $$

Now both sides can be integrated independently.

### Analogy
Two people walking toward each other. If my steps depend only on my position and your steps depend only on yours, the problem separates cleanly.
''',
            keyTakeaways: [
              'Separable = put all y’s with dy and all x’s with dx.',
              'Once separated, integrate both sides.',
              'Gentlest entry into actually solving ODEs.',
            ],
            quiz: [
              QuizQuestion(
                id: 't2u1q1',
                question: 'Why do we call an equation “separable”?',
                options: [
                  'Because the solution separates into positive and negative parts',
                  'Because we can isolate each variable on its own side with its differential',
                  'Because it only works for separate particles',
                  'Because the order is one',
                ],
                correctIndex: 1,
                explanation: 'We separate the variables so each side contains only one variable.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t2-u2',
            title: 'Solving a Separable Equation – Step by Step',
            content: r'''
# Solving a Separable Equation – Step by Step

Suppose:

$$ \frac{dy}{dx} = xy $$

**Step 1 – Separate** (y ≠ 0):

$$ \frac{dy}{y} = x\, dx $$

**Step 2 – Integrate both sides**:

$$ \ln|y| = \frac{1}{2}x^2 + C $$

**Step 3 – Solve for y**:

$$ y = A\, e^{x^2/2} $$

(A absorbs the constant and the sign). Always check the special case y = 0 that may have been lost during division.

Every step was only “rearrange so each variable is alone, then integrate.”
''',
            keyTakeaways: [
              'Separate → Integrate → Solve for the unknown function.',
              'The constant appears because indefinite integration produces a family of solutions.',
              'Check special cases lost during division.',
            ],
            quiz: [
              QuizQuestion(
                id: 't2u2q1',
                question: 'After integrating both sides, why is there still an unknown constant?',
                options: [
                  'Because the equation was approximate',
                  'Because indefinite integrals always produce a family of solutions',
                  'Because we made a calculation error',
                  'Because physics constants are unknown',
                ],
                correctIndex: 1,
                explanation: 'Indefinite integration introduces an arbitrary constant.',
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: 'phy701-t3',
        title: 'Linear First-Order ODEs',
        summary: 'Equations of the form dy/dx + P(x)y = Q(x). Solved with an integrating factor.',
        units: [
          Unit(
            id: 'phy701-t3-u1',
            title: 'Standard Form & Integrating Factor',
            content: r'''
# Standard Form & Integrating Factor

Many physics equations are **linear first-order**:

$$ \frac{dy}{dx} + P(x)y = Q(x) $$

The integrating factor is:

$$ \mu(x) = e^{\int P(x)\, dx} $$

Multiply the entire equation by μ and the left side becomes a perfect derivative:

$$ \frac{d}{dx}(\mu y) = \mu Q $$

Then just integrate both sides.

### Intuition
μ is a clever weighting that makes the accumulation of y exactly match the accumulated forcing. Once the left side is a clean derivative, the problem collapses into ordinary integration.
''',
            keyTakeaways: [
              'Standard form: dy/dx + P(x)y = Q(x)',
              'μ = exp(∫P dx)',
              'Multiplying by μ turns the left side into an exact derivative.',
            ],
            quiz: [
              QuizQuestion(
                id: 't3u1q1',
                question: 'What does the integrating factor accomplish?',
                options: [
                  'It cancels the forcing term Q(x)',
                  'It turns the left-hand side into the derivative of a product',
                  'It changes the order of the equation',
                  'It removes the constant of integration',
                ],
                correctIndex: 1,
                explanation: 'After multiplication by μ the left side becomes d(μy)/dx.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 3. SECOND-ORDER & HIGHER LINEAR ODEs
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t4',
        title: 'Second-Order Linear ODEs',
        summary: 'The workhorses of mechanics and waves. Homogeneous and particular solutions.',
        units: [
          Unit(
            id: 'phy701-t4-u1',
            title: 'Why Second-Order Equations Matter',
            content: r'''
# Why Second-Order Equations Matter

Almost every vibrating or oscillating system in physics is governed by a second-order equation. The simplest prototype is:

$$ \frac{d^2x}{dt^2} + \omega^2 x = 0 $$

This is simple harmonic motion. The general solution is a combination of sines and cosines (or complex exponentials).

For the more general linear equation with constant coefficients:

$$ a y'' + b y' + c y = 0 $$

we assume a solution of the form \( e^{rt} \) and obtain the characteristic equation:

$$ a r^2 + b r + c = 0 $$

The nature of the roots (real, repeated, complex) tells us the physical behaviour: exponential growth/decay, pure oscillation, or damped oscillation.
''',
            keyTakeaways: [
              'Second-order equations dominate mechanics and waves.',
              'Assume e^{rt} → characteristic equation.',
              'Root type determines the physical motion.',
            ],
            quiz: [
              QuizQuestion(
                id: 't4u1q1',
                question: 'In the characteristic equation method, what do we assume the solution looks like?',
                options: [
                  'A polynomial',
                  'An exponential e^{rt}',
                  'A logarithm',
                  'A constant',
                ],
                correctIndex: 1,
                explanation: 'The exponential form turns the differential equation into an algebraic equation for r.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t4-u2',
            title: 'Homogeneous vs Particular Solutions',
            content: r'''
# Homogeneous vs Particular Solutions

For a linear equation

$$ L[y] = f(x) $$

the full solution is:

**General solution = complementary (homogeneous) solution + particular solution**

- Homogeneous: solve L[y] = 0. This captures the natural behaviour of the system.
- Particular: any one function that satisfies L[y] = f(x). This responds to the external driving.

You add them together. The arbitrary constants in the homogeneous part are fixed by initial or boundary conditions.

This superposition principle is one of the deepest gifts of linearity.
''',
            keyTakeaways: [
              'Full solution = homogeneous + particular.',
              'Homogeneous = natural behaviour of the system.',
              'Particular = response to the external forcing.',
            ],
            quiz: [
              QuizQuestion(
                id: 't4u2q1',
                question: 'What does the homogeneous solution represent physically?',
                options: [
                  'The external driving force',
                  'The natural behaviour of the system when no external force acts',
                  'The initial conditions only',
                  'A numerical approximation',
                ],
                correctIndex: 1,
                explanation: 'It is the solution of the equation with the right-hand side set to zero.',
              ),
            ],
          ),
        ],
      ),

      Topic(
        id: 'phy701-t5',
        title: 'nth-Order Linear Equations – General Theory',
        summary: 'Existence, uniqueness, and the structure of the solution space.',
        units: [
          Unit(
            id: 'phy701-t5-u1',
            title: 'The Solution Space is n-Dimensional',
            content: r'''
# The Solution Space is n-Dimensional

For an nth-order linear homogeneous equation, the set of all solutions forms a vector space of dimension n.

That means you need n independent solutions (a fundamental set). Any other solution is just a linear combination of those n functions.

The Wronskian determinant tells you whether a set of n solutions is linearly independent. If the Wronskian is non-zero, they form a fundamental set and you can write the general solution.

This is why initial-value problems for an nth-order equation need n pieces of data (value + first n–1 derivatives at a point).
''',
            keyTakeaways: [
              'n independent solutions span the entire solution space.',
              'Wronskian tests linear independence.',
              'n initial conditions are required for uniqueness.',
            ],
            quiz: [
              QuizQuestion(
                id: 't5u1q1',
                question: 'For a 3rd-order linear homogeneous ODE, how many independent solutions do you need for the general solution?',
                options: ['1', '2', '3', '4'],
                correctIndex: 2,
                explanation: 'The solution space is 3-dimensional.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 4. LAPLACE TRANSFORMS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t6',
        title: 'Laplace Transforms',
        summary: 'Turn differential equations into algebra. Perfect for initial-value problems and discontinuous forcing.',
        units: [
          Unit(
            id: 'phy701-t6-u1',
            title: 'What the Laplace Transform Does',
            content: r'''
# What the Laplace Transform Does

The Laplace transform converts a function of time f(t) into a function of a new variable s:

$$ F(s) = \int_0^\infty e^{-st} f(t)\, dt $$

Why bother? Because differentiation in t becomes multiplication by s in the s-domain (plus initial conditions). Differential equations turn into algebraic equations.

It is especially powerful for:
- Initial-value problems
- Discontinuous or impulsive forcing (switches, delta functions)
- Circuits and control systems

You solve the algebraic equation for F(s), then invert back to f(t).
''',
            keyTakeaways: [
              'Laplace turns derivatives into multiplication by s.',
              'Differential equations become algebra.',
              'Excellent for initial conditions and sudden forcing.',
            ],
            quiz: [
              QuizQuestion(
                id: 't6u1q1',
                question: 'The main practical advantage of the Laplace transform is that it converts differential equations into…',
                options: [
                  'Integral equations',
                  'Algebraic equations',
                  'Difference equations',
                  'Partial differential equations',
                ],
                correctIndex: 1,
                explanation: 'Differentiation becomes multiplication, so the DE becomes an algebraic equation for F(s).',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t6-u2',
            title: 'Key Properties & Physical Applications',
            content: r'''
# Key Properties & Physical Applications

Important operational rules (you will use them constantly):

- \(\mathcal{L}\{f'(t)\} = sF(s) - f(0)\)
- \(\mathcal{L}\{f''(t)\} = s^2F(s) - sf(0) - f'(0)\)
- Linearity, shift theorems, convolution

**Physical picture**: the factor e^{–st} weights early times more heavily when s is large. Different values of s probe different time scales of the system.

Classic applications: RLC circuits, damped harmonic oscillators with sudden kicks, beam loading, radioactive decay chains.
''',
            keyTakeaways: [
              'Differentiation rules automatically insert initial conditions.',
              'Shift and convolution theorems handle delayed and interactive forcing.',
              'Widely used in circuits, control, and impulsive problems.',
            ],
            quiz: [
              QuizQuestion(
                id: 't6u2q1',
                question: 'When you Laplace-transform f\'\'(t), the initial conditions appear as…',
                options: [
                  'Extra integral terms',
                  'Subtraction of sf(0) + f\'(0)',
                  'Multiplication by a constant',
                  'They disappear',
                ],
                correctIndex: 1,
                explanation: 'The rule is L{f\'\'} = s²F – sf(0) – f\'(0).',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 5. PARTIAL DIFFERENTIAL EQUATIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t7',
        title: 'Partial Differential Equations & Boundary Value Problems',
        summary: 'When the unknown depends on more than one variable — waves, heat, Laplace’s equation.',
        units: [
          Unit(
            id: 'phy701-t7-u1',
            title: 'Why PDEs Appear & the Big Three',
            content: r'''
# Why PDEs Appear & the Big Three

Ordinary DEs involve one independent variable. When the unknown depends on both space and time (or several spatial coordinates), we get **partial** differential equations.

The three classic linear PDEs of physics:

1. **Wave equation** – vibrating strings, sound, electromagnetism  
   \( u_{tt} = c^2 u_{xx} \)

2. **Heat (diffusion) equation** – temperature, diffusion of particles  
   \( u_t = k u_{xx} \)

3. **Laplace’s equation** – steady-state temperature, electrostatic potential  
   \( u_{xx} + u_{yy} = 0 \)

Boundary conditions (values or derivatives fixed on the edges of the domain) select the unique physically relevant solution.
''',
            keyTakeaways: [
              'PDEs arise when the unknown depends on several variables.',
              'Wave, heat, and Laplace equations dominate classical physics.',
              'Boundary conditions are essential for uniqueness.',
            ],
            quiz: [
              QuizQuestion(
                id: 't7u1q1',
                question: 'Which equation describes the steady-state temperature distribution in a plate?',
                options: ['Wave equation', 'Heat equation', 'Laplace’s equation', 'Schrödinger equation'],
                correctIndex: 2,
                explanation: 'Steady state means time derivatives vanish, leaving Laplace’s equation.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t7-u2',
            title: 'Separation of Variables – The Core Technique',
            content: r'''
# Separation of Variables – The Core Technique

Assume the solution factors:

$$ u(x,t) = X(x)\, T(t) $$

Plug into the PDE. The equation splits into two ordinary differential equations linked by a constant (the separation constant).

You solve the spatial ODE with the boundary conditions first — this produces eigenvalues and eigenfunctions. Then the time ODE is easy. Finally you superpose the product solutions to match initial conditions.

This single idea solves a huge fraction of the classic problems in mathematical physics.
''',
            keyTakeaways: [
              'Assume a product solution → two ODEs.',
              'Boundary conditions quantise the allowed frequencies/wavelengths.',
              'Superposition builds the general solution.',
            ],
            quiz: [
              QuizQuestion(
                id: 't7u2q1',
                question: 'In separation of variables we assume the solution can be written as…',
                options: [
                  'A sum of two functions',
                  'A product of functions each depending on only one variable',
                  'An exponential of the sum of the variables',
                  'A power series',
                ],
                correctIndex: 1,
                explanation: 'u = X(x)T(t) is the classic product assumption.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 6. SPECIAL FUNCTIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t8',
        title: 'Special Functions',
        summary: 'Gamma, Legendre, Bessel, Hermite, Laguerre — the natural functions that appear when we solve PDEs in different geometries.',
        units: [
          Unit(
            id: 'phy701-t8-u1',
            title: 'Why Special Functions Exist',
            content: r'''
# Why Special Functions Exist

When we solve the classic PDEs in Cartesian coordinates we get sines and exponentials. In spherical or cylindrical coordinates the radial or angular equations are no longer constant-coefficient. Their solutions are given names:

- **Legendre polynomials** – angular part in spherical coordinates (axisymmetric)
- **Bessel functions** – radial part in cylindrical coordinates
- **Hermite polynomials** – quantum harmonic oscillator
- **Laguerre polynomials** – radial hydrogen atom
- **Gamma function** – continuous extension of the factorial

They are simply the “sines and cosines” of other geometries. Once you accept that, they lose their mystery.
''',
            keyTakeaways: [
              'Special functions arise from separation of variables in non-Cartesian coordinates.',
              'Each geometry has its own natural basis functions.',
              'They are orthogonal and complete on their intervals — just like Fourier modes.',
            ],
            quiz: [
              QuizQuestion(
                id: 't8u1q1',
                question: 'Bessel functions most commonly appear when we solve problems in…',
                options: [
                  'Cartesian coordinates',
                  'Spherical coordinates',
                  'Cylindrical coordinates',
                  'Only quantum mechanics',
                ],
                correctIndex: 2,
                explanation: 'The radial equation in cylindrical coordinates is Bessel’s equation.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t8-u2',
            title: 'Gamma Function & Legendre Polynomials (Quick Intuition)',
            content: r'''
# Gamma Function & Legendre Polynomials

**Gamma function**  
Γ(z) extends the factorial to real and complex numbers: Γ(n+1) = n! for positive integers. It appears in normalisations and in the theory of many special functions.

**Legendre polynomials** Pₙ(x)  
They are orthogonal on [–1, 1]. They appear as the angular solutions for axisymmetric problems in spherical coordinates (electrostatics of a sphere, gravitational potential, quantum angular momentum with m = 0).

You do not need to memorise every identity. You need to recognise *when* they appear and know that they form a complete orthogonal set, so any reasonable function on the interval can be expanded in them.
''',
            keyTakeaways: [
              'Γ(z) generalises the factorial.',
              'Legendre polynomials are the angular basis for spherical problems with axial symmetry.',
              'Orthogonality lets us expand arbitrary functions.',
            ],
            quiz: [
              QuizQuestion(
                id: 't8u2q1',
                question: 'Legendre polynomials are orthogonal on which interval?',
                options: ['[0, 1]', '[–1, 1]', '[0, ∞)', '[–∞, ∞]'],
                correctIndex: 1,
                explanation: 'The standard interval for Legendre polynomials is [–1, 1].',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t8-u3',
            title: 'Hypergeometric Function – A Quick Note',
            content: r"""
# Hypergeometric Function – A Quick Note

Many of the special functions you have met (Legendre, Bessel, Hermite…) can be written as particular cases of a single, more general family called the **hypergeometric function**.

You do not need to master its full theory at this stage. Just remember:

- It is a power series whose coefficients follow a simple pattern involving rising factorials.
- By choosing specific parameters it reduces to the Legendre, Bessel, or other functions you already use.
- It appears as the solution of a standard second-order linear ODE that covers many physical situations.

When a textbook says “the solution is a hypergeometric function”, it is simply pointing to this unifying family.
""",
            keyTakeaways: [
              'Hypergeometric is a parent family that contains many named special functions.',
              'Specific parameter choices recover Legendre, Bessel, etc.',
              'Recognising the name is enough at this level; deep manipulation can wait.',
            ],
            quiz: [
              QuizQuestion(
                id: 't8u3q1',
                question: 'The hypergeometric function is best described as…',
                options: [
                  'A completely new force of nature',
                  'A general series family that contains many familiar special functions as special cases',
                  'Only useful for gravity',
                  'A type of transistor',
                ],
                correctIndex: 1,
                explanation: 'It is a unifying series representation that specialises to Legendre, Bessel and others.',
              ),
            ],
          ),
        ],
      ),

      // 7. DIRAC DELTA
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t9',
        title: 'The Dirac Delta Function',
        summary: 'An infinitely sharp spike of unit area — the idealisation of a point source or instantaneous impulse.',
        units: [
          Unit(
            id: 'phy701-t9-u1',
            title: 'Intuition and Defining Property',
            content: r'''
# Intuition and Defining Property

The Dirac delta δ(x) is zero everywhere except at x = 0, where it is infinite, yet its integral over the whole line is 1.

Its defining property is the sifting property:

$$ \int_{-\infty}^{\infty} f(x)\, \delta(x - a)\, dx = f(a) $$

It picks out the value of the function at a single point.

### Physical pictures
- Point charge or point mass
- Instantaneous kick (impulse) in mechanics
- Instantaneous injection of heat or particles

It is not a function in the ordinary sense; it is a distribution. In practice we treat it operationally with the sifting rule and never worry about the value at a single point.
''',
            keyTakeaways: [
              'δ(x) is a unit-area spike at the origin.',
              'Sifting property: it samples the function at one point.',
              'Models point sources and instantaneous impulses.',
            ],
            quiz: [
              QuizQuestion(
                id: 't9u1q1',
                question: 'The integral of f(x) δ(x – a) equals…',
                options: ['0', '1', 'f(a)', 'f(0)'],
                correctIndex: 2,
                explanation: 'That is exactly the sifting property.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 8. FOURIER SERIES & TRANSFORMS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t10',
        title: 'Fourier Series & Fourier Transforms',
        summary: 'Break any reasonable signal into pure frequencies — the mathematical version of a prism.',
        units: [
          Unit(
            id: 'phy701-t10-u1',
            title: 'Fourier Series – Building Periodic Functions from Sines',
            content: r'''
# Fourier Series – Building Periodic Functions from Sines

Any reasonable periodic function can be written as an infinite sum of sines and cosines (or complex exponentials) whose frequencies are integer multiples of a fundamental frequency.

$$ f(x) = \frac{a_0}{2} + \sum_{n=1}^\infty \bigl( a_n \cos(nx) + b_n \sin(nx) \bigr) $$

### Analogy
A musical chord is a mixture of pure notes. Fourier analysis is the reverse process: given the chord, find the individual notes and their strengths.

The coefficients aₙ, bₙ are found by orthogonality — projecting the function onto each pure mode.
''',
            keyTakeaways: [
              'Periodic functions = sum of harmonic sines and cosines.',
              'Coefficients come from orthogonality integrals.',
              'The “notes” are the integer multiples of the fundamental frequency.',
            ],
            quiz: [
              QuizQuestion(
                id: 't10u1q1',
                question: 'Fourier series is most directly analogous to…',
                options: [
                  'Solving a quadratic equation',
                  'Decomposing a musical chord into pure notes',
                  'Taking a derivative',
                  'Computing an area',
                ],
                correctIndex: 1,
                explanation: 'Both extract the pure frequency components that make up a complex signal.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t10-u2',
            title: 'Fourier Transform – From Periodic to Aperiodic',
            content: r'''
# Fourier Transform – From Periodic to Aperiodic

When the period tends to infinity, the discrete sum becomes a continuous integral — the Fourier transform:

$$ \hat{f}(k) = \int_{-\infty}^{\infty} f(x)\, e^{-ikx}\, dx $$

It decomposes an aperiodic signal into a continuum of frequencies. The inverse transform rebuilds the original function.

In physics it is the bridge between position and momentum space, time and frequency, and is indispensable in quantum mechanics, signal processing, and diffraction.
''',
            keyTakeaways: [
              'Fourier transform = continuous version of Fourier series.',
              'Maps a function to its frequency content.',
              'Central in quantum mechanics and wave physics.',
            ],
            quiz: [
              QuizQuestion(
                id: 't10u2q1',
                question: 'The Fourier transform is essentially the limit of a Fourier series when…',
                options: [
                  'The amplitude becomes infinite',
                  'The period becomes infinite',
                  'The function becomes constant',
                  'We take only the first term',
                ],
                correctIndex: 1,
                explanation: 'Infinite period turns the discrete spectrum into a continuous one.',
              ),
            ],
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // 9. RESIDUES & GREEN’S FUNCTIONS
      // ═══════════════════════════════════════════════════════════════
      Topic(
        id: 'phy701-t11',
        title: 'Calculus of Residues & Green’s Functions',
        summary: 'Powerful complex-analysis tools for evaluating integrals and solving inhomogeneous linear PDEs.',
        units: [
          Unit(
            id: 'phy701-t11-u1',
            title: 'Residues in One Breath',
            content: r'''
# Residues in One Breath

If a function has an isolated singularity, the **residue** is the coefficient of 1/(z – z₀) in its Laurent series.

Cauchy’s residue theorem says that a contour integral is 2πi times the sum of residues inside the contour.

This turns many real integrals (especially Fourier and Laplace inversion integrals) into simple algebraic calculations of residues. It is one of the most practical tools complex analysis gives physics.
''',
            keyTakeaways: [
              'Residue = coefficient of 1/(z – z₀).',
              'Contour integral = 2πi × sum of enclosed residues.',
              'Evaluates many real integrals that arise in physics.',
            ],
            quiz: [
              QuizQuestion(
                id: 't11u1q1',
                question: 'The residue at an isolated singularity is the coefficient of which power in the Laurent series?',
                options: ['(z – z₀)', '1/(z – z₀)', '1/(z – z₀)²', 'The constant term'],
                correctIndex: 1,
                explanation: 'It is defined as the coefficient of the 1/(z – z₀) term.',
              ),
            ],
          ),
          Unit(
            id: 'phy701-t11-u2',
            title: 'Green’s Functions – The Response to a Point Source',
            content: r'''
# Green’s Functions – The Response to a Point Source

A Green’s function G(x, x′) is the solution of a linear differential equation when the forcing is a Dirac delta at x′.

Once you know G, the response to *any* forcing f(x) is just the integral of G against f:

$$ u(x) = \int G(x, x') f(x')\, dx' $$

It is the ultimate expression of linearity and superposition. In electrostatics G is essentially the potential of a point charge; in the heat equation it is the temperature response to an instantaneous point heat source.

Constructing Green’s functions is one of the high points of the course.
''',
            keyTakeaways: [
              'G is the response to a unit point source.',
              'Any forcing is handled by integrating G against the force.',
              'Embodies linearity and superposition in the cleanest way.',
            ],
            quiz: [
              QuizQuestion(
                id: 't11u2q1',
                question: 'Once the Green’s function is known, the solution for arbitrary forcing is obtained by…',
                options: [
                  'Differentiating G',
                  'Integrating G against the forcing function',
                  'Solving a new differential equation from scratch',
                  'Taking a Fourier series of G',
                ],
                correctIndex: 1,
                explanation: 'Superposition turns the integral of G f into the full response.',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
