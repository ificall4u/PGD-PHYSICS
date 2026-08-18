import 'package:pgd_physics/models/course.dart';

/// PHY 701 — Mathematical Methods in Physics
/// Structure aligned to content_prompts/PHY701 (Modules 1–7).
/// Lesson prose is intentionally placeholder-only until authoring runs.
Course buildPhy701() {
  return Course(
    id: 'phy-701',
    code: 'PHY 701',
    title: 'Mathematical Methods in Physics',
    description:
        'Graduate mathematical methods: ODEs, transforms, PDEs, special functions, distributions, Fourier analysis, complex methods & Green’s functions.',
    semester: 'First Semester',
    units: 3,
    icon: '∫',
    colorHint: ColorHint.purple,
    modules: [
      // ── Module 1 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m1',
        title: 'Ordinary Differential Equations & Linear Operators',
        summary:
            'Physical ODEs, Wronskian & Abel, L² spaces, Sturm–Liouville form, eigenvalues and orthogonality.',
        units: [
          skeletonUnit(
            id: 'phy701-m1-u1',
            title: 'Physical foundations of 1st & 2nd-order ODEs',
          ),
          skeletonUnit(
            id: 'phy701-m1-u2',
            title: 'Linear independence, Wronskian & Abel’s identity',
          ),
          skeletonUnit(
            id: 'phy701-m1-u3',
            title: 'Linear operators, L² spaces & weight functions',
          ),
          skeletonUnit(
            id: 'phy701-m1-u4',
            title: 'Casting ODEs into Sturm–Liouville form',
          ),
          skeletonUnit(
            id: 'phy701-m1-u5',
            title: 'S–L eigenvalues (real) & orthogonal eigenfunctions',
          ),
        ],
      ),

      // ── Module 2 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m2',
        title: 'Laplace Transforms & Operational Calculus',
        summary:
            'Time–frequency intuition, definition & ROC, derivative theorems, convolution, Bromwich inversion.',
        units: [
          skeletonUnit(
            id: 'phy701-m2-u1',
            title: 'Physical intuition: time domain to transform domain',
          ),
          skeletonUnit(
            id: 'phy701-m2-u2',
            title: 'Definition, ROC & existence conditions',
          ),
          skeletonUnit(
            id: 'phy701-m2-u3',
            title: 'Derivative & integral theorems',
          ),
          skeletonUnit(
            id: 'phy701-m2-u4',
            title: 'Convolution theorem from first principles',
          ),
          skeletonUnit(
            id: 'phy701-m2-u5',
            title: 'Inversion: Bromwich integral & residues',
          ),
        ],
      ),

      // ── Module 3 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m3',
        title: 'PDEs & Boundary Value Problems',
        summary:
            'Elliptic/parabolic/hyperbolic classification, separation of variables, curvilinear Laplacians, BC types.',
        units: [
          skeletonUnit(
            id: 'phy701-m3-u1',
            title: 'Classifying 2nd-order PDEs (discriminant & physics)',
          ),
          skeletonUnit(
            id: 'phy701-m3-u2',
            title: 'Separation of variables (wave or heat equation)',
          ),
          skeletonUnit(
            id: 'phy701-m3-u3',
            title: 'Laplacian in cylindrical & spherical coordinates',
          ),
          skeletonUnit(
            id: 'phy701-m3-u4',
            title: 'Dirichlet, Neumann & Robin conditions',
          ),
        ],
      ),

      // ── Module 4 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m4',
        title: 'Special Functions of Mathematical Physics',
        summary:
            'Bessel, Legendre, Hermite, Laguerre, Gamma & Beta — equations, series, orthogonality.',
        units: [
          skeletonUnit(
            id: 'phy701-m4-u1',
            title: 'Bessel’s equation, Frobenius method & J_ν(x)',
          ),
          skeletonUnit(
            id: 'phy701-m4-u2',
            title: 'Legendre equation, Rodrigues’ formula & orthogonality',
          ),
          skeletonUnit(
            id: 'phy701-m4-u3',
            title: 'Hermite & Laguerre (quantum origins & recurrences)',
          ),
          skeletonUnit(
            id: 'phy701-m4-u4',
            title: 'Gamma & Beta functions and factorials',
          ),
        ],
      ),

      // ── Module 5 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m5',
        title: 'Distribution Theory & The Dirac Delta',
        summary:
            'Delta as a distribution, limit representations, operational identities, Fourier representation.',
        units: [
          skeletonUnit(
            id: 'phy701-m5-u1',
            title: 'Dirac delta as a distribution on test functions',
          ),
          skeletonUnit(
            id: 'phy701-m5-u2',
            title: 'Limit representations (Gaussian, Lorentzian, …)',
          ),
          skeletonUnit(
            id: 'phy701-m5-u3',
            title: 'Scaling, composition & derivative identities',
          ),
          skeletonUnit(
            id: 'phy701-m5-u4',
            title: 'Fourier integral representation of δ(x − x′)',
          ),
        ],
      ),

      // ── Module 6 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m6',
        title: 'Fourier Series & Continuous Fourier Transforms',
        summary:
            'Complex series, continuum limit to FT, operational theorems, Parseval & Plancherel.',
        units: [
          skeletonUnit(
            id: 'phy701-m6-u1',
            title: 'Trigonometric & complex Fourier series',
          ),
          skeletonUnit(
            id: 'phy701-m6-u2',
            title: 'From series to continuous Fourier transform',
          ),
          skeletonUnit(
            id: 'phy701-m6-u3',
            title: 'Shift, differentiation & convolution theorems',
          ),
          skeletonUnit(
            id: 'phy701-m6-u4',
            title: 'Parseval’s & Plancherel’s theorems',
          ),
        ],
      ),

      // ── Module 7 ───────────────────────────────────────────────
      skeletonModule(
        id: 'phy701-m7',
        title: 'Complex Analysis, Residues & Green’s Functions',
        summary:
            'Cauchy & residue theorems, contour integration, Green’s functions for 1D S–L operators.',
        units: [
          skeletonUnit(
            id: 'phy701-m7-u1',
            title: 'Cauchy’s theorem & residue theorem',
          ),
          skeletonUnit(
            id: 'phy701-m7-u2',
            title: 'Contour integration of real improper integrals',
          ),
          skeletonUnit(
            id: 'phy701-m7-u3',
            title: 'Green’s function as impulse response',
          ),
          skeletonUnit(
            id: 'phy701-m7-u4',
            title: 'Jump conditions & constructing G(x, x′)',
          ),
        ],
      ),
    ],
  );
}
