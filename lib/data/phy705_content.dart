import 'package:pgd_physics/models/course.dart';

/// PHY 705 — Solid State and Electronic Devices
/// Structure from content_prompts/PHY705 (placeholder lesson bodies only).
Course buildPhy705() {
  return Course(
    id: 'phy-705',
    code: 'PHY 705',
    title: 'Solid State and Electronic Devices',
    description: 'Conduction, barriers, Hall effect, emission, junctions, BJT, FET, and IC manufacture.',
    semester: 'First Semester',
    units: 3,
    icon: '🔷',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy705-m1',
        title: 'Electrical Conduction in Metals and Semiconductors',
        summary: 'Electrical Conduction in Metals and Semiconductors',
        units: [
          skeletonUnit(id: 'phy705-m1-u1', title: 'Free Electron Model (Drude Model)'),
          skeletonUnit(id: 'phy705-m1-u2', title: 'Ohm\'s Law from First Principles'),
          skeletonUnit(id: 'phy705-m1-u3', title: 'Energy Band Theory Intuition'),
          skeletonUnit(id: 'phy705-m1-u4', title: 'Metals vs. Semiconductors vs. Insulators'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m2',
        title: 'Energy Barriers and Charge Motion in Fields',
        summary: 'Energy Barriers and Charge Motion in Fields',
        units: [
          skeletonUnit(id: 'phy705-m2-u1', title: 'Physical Meaning of Energy Barriers'),
          skeletonUnit(id: 'phy705-m2-u2', title: 'Motion in Electric Fields'),
          skeletonUnit(id: 'phy705-m2-u3', title: 'Motion in Magnetic Fields'),
          skeletonUnit(id: 'phy705-m2-u4', title: 'Cyclotron Motion'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m3',
        title: 'The Hall Effect & Charge Carrier Diagnostics',
        summary: 'The Hall Effect & Charge Carrier Diagnostics',
        units: [
          skeletonUnit(id: 'phy705-m3-u1', title: 'The Hall Effect Intuition'),
          skeletonUnit(id: 'phy705-m3-u2', title: 'Hall Voltage Derivation'),
          skeletonUnit(id: 'phy705-m3-u3', title: 'Carrier Concentration & Sign Determination'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m4',
        title: 'Photoelectric, Thermionic, and Secondary Electronic Emission',
        summary: 'Photoelectric, Thermionic, and Secondary Electronic Emission',
        units: [
          skeletonUnit(id: 'phy705-m4-u1', title: 'Work Function'),
          skeletonUnit(id: 'phy705-m4-u2', title: 'Photoelectric Emission'),
          skeletonUnit(id: 'phy705-m4-u3', title: 'Thermionic Emission'),
          skeletonUnit(id: 'phy705-m4-u4', title: 'Secondary Emission & Applications'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m5',
        title: 'PN Junction Diodes and Solar Cells',
        summary: 'PN Junction Diodes and Solar Cells',
        units: [
          skeletonUnit(id: 'phy705-m5-u1', title: 'N-type & P-type Doping'),
          skeletonUnit(id: 'phy705-m5-u2', title: 'PN Junction Formation'),
          skeletonUnit(id: 'phy705-m5-u3', title: 'Diode Action (The Turnstile)'),
          skeletonUnit(id: 'phy705-m5-u4', title: 'Solar Cells & Photovoltaic Effect'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m6',
        title: 'Bipolar Junction Transistors (BJT)',
        summary: 'Bipolar Junction Transistors (BJT)',
        units: [
          skeletonUnit(id: 'phy705-m6-u1', title: 'BJT Architecture'),
          skeletonUnit(id: 'phy705-m6-u2', title: 'Current Amplification Mechanism'),
          skeletonUnit(id: 'phy705-m6-u3', title: 'Operating Regions'),
          skeletonUnit(id: 'phy705-m6-u4', title: 'Common Emitter Configuration'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m7',
        title: 'Field-Effect Transistors (FET & MOSFET)',
        summary: 'Field-Effect Transistors (FET & MOSFET)',
        units: [
          skeletonUnit(id: 'phy705-m7-u1', title: 'Voltage Control vs Current Control'),
          skeletonUnit(id: 'phy705-m7-u2', title: 'MOSFET Architecture'),
          skeletonUnit(id: 'phy705-m7-u3', title: 'Channel Formation & Pinch-off'),
          skeletonUnit(id: 'phy705-m7-u4', title: 'MOSFET as Logic Switch'),
        ],
      ),
      skeletonModule(
        id: 'phy705-m8',
        title: 'Thin Films and Integrated Circuit (IC) Fabrication',
        summary: 'Thin Films and Integrated Circuit (IC) Fabrication',
        units: [
          skeletonUnit(id: 'phy705-m8-u1', title: 'What is a Thin Film?'),
          skeletonUnit(id: 'phy705-m8-u2', title: 'Photolithography (Micro-printing)'),
          skeletonUnit(id: 'phy705-m8-u3', title: 'Doping & Etching'),
          skeletonUnit(id: 'phy705-m8-u4', title: 'IC Assembly'),
        ],
      ),
    ],
  );
}
