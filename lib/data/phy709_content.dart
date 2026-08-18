import 'package:pgd_physics/models/course.dart';

/// PHY 709 — Electronic Devices and Fabrication
/// Structure from content_prompts/PHY709 (placeholder lesson bodies only).
Course buildPhy709() {
  return Course(
    id: 'phy-709',
    code: 'PHY 709',
    title: 'Electronics Devices Design and Fabrication',
    description: 'Micro-circuits, doping and fabrication of junctions, LEDs and transistors.',
    semester: 'First Semester',
    units: 3,
    icon: '🏭',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy709-m1',
        title: 'Silicon Substrates & Wafer Preparation',
        summary: 'Silicon Substrates & Wafer Preparation',
        units: [
          skeletonUnit(id: 'phy709-m1-u1', title: 'From Sand to Pure Silicon'),
          skeletonUnit(id: 'phy709-m1-u2', title: 'Single-Crystal Growth (Czochralski Method)'),
          skeletonUnit(id: 'phy709-m1-u3', title: 'Wafer Ingot Slicing & Polishing'),
          skeletonUnit(id: 'phy709-m1-u4', title: 'Cleanroom Standards'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m2',
        title: 'Thermal Oxidation & Insulating Films',
        summary: 'Thermal Oxidation & Insulating Films',
        units: [
          skeletonUnit(id: 'phy709-m2-u1', title: 'Silicon Dioxide (SiO2) as a Physical Barrier'),
          skeletonUnit(id: 'phy709-m2-u2', title: 'Thermal Oxidation ("Baking Silicon")'),
          skeletonUnit(id: 'phy709-m2-u3', title: 'Deal-Grove Model Intuition'),
          skeletonUnit(id: 'phy709-m2-u4', title: 'Chemical Vapor Deposition (CVD)'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m3',
        title: 'Photolithography & Pattern Transfer',
        summary: 'Photolithography & Pattern Transfer',
        units: [
          skeletonUnit(id: 'phy709-m3-u1', title: 'The Stencil-Painting Analogy'),
          skeletonUnit(id: 'phy709-m3-u2', title: 'Photoresist Chemistry'),
          skeletonUnit(id: 'phy709-m3-u3', title: 'The Lithography Pipeline'),
          skeletonUnit(id: 'phy709-m3-u4', title: 'Optical Resolution Limits'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m4',
        title: 'Semiconductor Doping (Diffusion & Ion Implantation)',
        summary: 'Semiconductor Doping (Diffusion & Ion Implantation)',
        units: [
          skeletonUnit(id: 'phy709-m4-u1', title: 'Purpose of Doping'),
          skeletonUnit(id: 'phy709-m4-u2', title: 'Thermal Diffusion ("Soaking in Dye")'),
          skeletonUnit(id: 'phy709-m4-u3', title: 'Ion Implantation ("Firehosing Impurity Atoms")'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m5',
        title: 'Etching Processes (Subtractive Manufacturing)',
        summary: 'Etching Processes (Subtractive Manufacturing)',
        units: [
          skeletonUnit(id: 'phy709-m5-u1', title: 'What is Etching?'),
          skeletonUnit(id: 'phy709-m5-u2', title: 'Wet Chemical Etching'),
          skeletonUnit(id: 'phy709-m5-u3', title: 'Dry Plasma Etching (Reactive Ion Etching - RIE)'),
          skeletonUnit(id: 'phy709-m5-u4', title: 'Selective Etching'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m6',
        title: 'Physical Fabrication of Diodes and Light Emitting Diodes (LEDs)',
        summary: 'Physical Fabrication of Diodes and Light Emitting Diodes (LEDs)',
        units: [
          skeletonUnit(id: 'phy709-m6-u1', title: 'Step-by-Step PN Junction Diode Fabrication'),
          skeletonUnit(id: 'phy709-m6-u2', title: 'LED Fabrication'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m7',
        title: 'Transistor Physical Manufacturing (MOSFET & BJT)',
        summary: 'Transistor Physical Manufacturing (MOSFET & BJT)',
        units: [
          skeletonUnit(id: 'phy709-m7-u1', title: 'MOSFET Layer-by-Layer Fabrication'),
          skeletonUnit(id: 'phy709-m7-u2', title: 'BJT Layer-by-Layer Fabrication'),
          skeletonUnit(id: 'phy709-m7-u3', title: 'CMOS Fabrication Process (N-Well Process)'),
        ],
      ),
      skeletonModule(
        id: 'phy709-m8',
        title: 'Interconnect Metallization, Wafer Dicing, and Chip Packaging',
        summary: 'Interconnect Metallization, Wafer Dicing, and Chip Packaging',
        units: [
          skeletonUnit(id: 'phy709-m8-u1', title: 'Metallization & Interconnects'),
          skeletonUnit(id: 'phy709-m8-u2', title: 'Chemical Mechanical Planarization (CMP)'),
          skeletonUnit(id: 'phy709-m8-u3', title: 'Wafer Dicing & Inspection'),
          skeletonUnit(id: 'phy709-m8-u4', title: 'Packaging & Wire Bonding'),
        ],
      ),
    ],
  );
}
