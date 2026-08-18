import 'package:pgd_physics/models/course.dart';

/// PHY 710 — Vacuum Science and Thin Films
/// Structure from content_prompts/PHY710 (placeholder lesson bodies only).
Course buildPhy710() {
  return Course(
    id: 'phy-710',
    code: 'PHY 710',
    title: 'Vacuum Science and Thin Films',
    description: 'Vacuum regimes, pumps, evaporation, sputtering, epitaxy, characterization and applications.',
    semester: 'Second Semester',
    units: 3,
    icon: '🖥️',
    colorHint: ColorHint.cyan,
    modules: [
      skeletonModule(
        id: 'phy710-m1',
        title: 'Vacuum Fundamentals and Pressure Regimes',
        summary: 'Vacuum Fundamentals and Pressure Regimes',
        units: [
          skeletonUnit(id: 'phy710-m1-u1', title: 'What is a Vacuum?'),
          skeletonUnit(id: 'phy710-m1-u2', title: 'Pressure Units & Measurement'),
          skeletonUnit(id: 'phy710-m1-u3', title: 'Mean Free Path'),
          skeletonUnit(id: 'phy710-m1-u4', title: 'Flow Regimes'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m2',
        title: 'Vacuum Pumps and Pressure Gauges',
        summary: 'Vacuum Pumps and Pressure Gauges',
        units: [
          skeletonUnit(id: 'phy710-m2-u1', title: 'Roughing Pumps'),
          skeletonUnit(id: 'phy710-m2-u2', title: 'High & Ultra-High Vacuum Pumps'),
          skeletonUnit(id: 'phy710-m2-u3', title: 'Pressure Gauges (Thermal vs. Ionization)'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m3',
        title: 'Vacuum Heating Techniques',
        summary: 'Vacuum Heating Techniques',
        units: [
          skeletonUnit(id: 'phy710-m3-u1', title: 'Why Heat Material in a Vacuum?'),
          skeletonUnit(id: 'phy710-m3-u2', title: 'Resistive Heating'),
          skeletonUnit(id: 'phy710-m3-u3', title: 'Induction Heating'),
          skeletonUnit(id: 'phy710-m3-u4', title: 'Electron-Bombardment Heating (E-Beam)'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m4',
        title: 'Substrate Preparation and Physical Vapor Deposition (PVD)',
        summary: 'Substrate Preparation and Physical Vapor Deposition (PVD)',
        units: [
          skeletonUnit(id: 'phy710-m4-u1', title: 'Substrate Cleaning Pipelines'),
          skeletonUnit(id: 'phy710-m4-u2', title: 'The Physical Vapor Deposition (PVD) Concept'),
          skeletonUnit(id: 'phy710-m4-u3', title: 'Thermal Evaporation Setup'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m5',
        title: 'Sputtering Techniques (Subtractive to Additive Transfer)',
        summary: 'Sputtering Techniques (Subtractive to Additive Transfer)',
        units: [
          skeletonUnit(id: 'phy710-m5-u1', title: 'What is Sputtering?'),
          skeletonUnit(id: 'phy710-m5-u2', title: 'DC Plasma Sputtering'),
          skeletonUnit(id: 'phy710-m5-u3', title: 'RF (Radio Frequency) Sputtering'),
          skeletonUnit(id: 'phy710-m5-u4', title: 'Magnetron Sputtering'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m6',
        title: 'Epitaxial Growth Processes',
        summary: 'Epitaxial Growth Processes',
        units: [
          skeletonUnit(id: 'phy710-m6-u1', title: 'What is Epitaxy?'),
          skeletonUnit(id: 'phy710-m6-u2', title: 'Molecular Beam Epitaxy (MBE)'),
          skeletonUnit(id: 'phy710-m6-u3', title: 'Chemical Vapor Deposition (CVD) & MOCVD'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m7',
        title: 'Thin Film Characterization & Measurement',
        summary: 'Thin Film Characterization & Measurement',
        units: [
          skeletonUnit(id: 'phy710-m7-u1', title: 'Film Thickness Measurement'),
          skeletonUnit(id: 'phy710-m7-u2', title: 'Electrical Characterization'),
          skeletonUnit(id: 'phy710-m7-u3', title: 'Structural & Surface Analysis'),
        ],
      ),
      skeletonModule(
        id: 'phy710-m8',
        title: 'Applications and Engineering Uses of Thin Films',
        summary: 'Applications and Engineering Uses of Thin Films',
        units: [
          skeletonUnit(id: 'phy710-m8-u1', title: 'Optical Coatings'),
          skeletonUnit(id: 'phy710-m8-u2', title: 'Semiconductor Electronics'),
          skeletonUnit(id: 'phy710-m8-u3', title: 'Energy Applications'),
        ],
      ),
    ],
  );
}
