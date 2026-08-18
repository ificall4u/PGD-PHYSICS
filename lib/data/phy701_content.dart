import 'package:pgd_physics/models/course.dart';

/// PHY 701 — Mathematical Methods in Physics
/// Structure from content_prompts/PHY701 (placeholder lesson bodies only).
Course buildPhy701() {
  return Course(
    id: 'phy-701',
    code: 'PHY 701',
    title: 'Mathematical Methods',
    description: 'Methods of ODEs and PDEs, Laplace and Fourier methods, special functions, residues and Green functions for physical applications.',
    semester: 'First Semester',
    units: 3,
    icon: '∫',
    colorHint: ColorHint.purple,
    modules: [
      skeletonModule(
        id: 'phy701-m1',
        title: 'Ordinary Differential Equations & Linear Operators',
        summary: 'Ordinary Differential Equations & Linear Operators',
        units: [
          skeletonUnit(id: 'phy701-m1-u1', title: 'Physical Foundations'),
          skeletonUnit(id: 'phy701-m1-u2', title: 'Linear Independence & Phase Space'),
          skeletonUnit(id: 'phy701-m1-u3', title: 'Linear Differential Operators'),
          skeletonUnit(id: 'phy701-m1-u4', title: 'Sturm-Liouville Theory'),
          skeletonUnit(id: 'phy701-m1-u5', title: 'Rigorous Proofs'),
        ],
      ),
      skeletonModule(
        id: 'phy701-m2',
        title: 'Laplace Transforms & Operational Calculus',
        summary: 'Laplace Transforms & Operational Calculus',
        units: [
          skeletonUnit(id: 'phy701-m2-u1', title: 'Physical Intuition'),
          skeletonUnit(id: 'phy701-m2-u2', title: 'Definition & Convergence'),
          skeletonUnit(id: 'phy701-m2-u3', title: 'Derivative & Integral Theorems'),
          skeletonUnit(id: 'phy701-m2-u4', title: 'Convolution Theorem'),
          skeletonUnit(id: 'phy701-m2-u5', title: 'Inversion Mechanics'),
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
