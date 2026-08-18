import 'package:pgd_physics/models/course.dart';

/// PHY 712 — Energy Conversion and Storage
/// Structure from content_prompts/PHY712 (placeholder lesson bodies only).
Course buildPhy712() {
  return Course(
    id: 'phy-712',
    code: 'PHY 712',
    title: 'Energy Conversion and Storage',
    description: 'Conversion pathways, renewables, electrochemical systems, solar, bioenergy and storage grids.',
    semester: 'Second Semester',
    units: 3,
    icon: '🔋',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy712-m1',
        title: 'Fundamentals of Energy Conversion & Transmission',
        summary: 'Fundamentals of Energy Conversion & Transmission',
        units: [
          skeletonUnit(id: 'phy712-m1-u1', title: 'What is Energy Conversion?'),
          skeletonUnit(id: 'phy712-m1-u2', title: 'The Efficiency Limit ("Energy Tolls")'),
          skeletonUnit(id: 'phy712-m1-u3', title: 'Forms of Energy'),
          skeletonUnit(id: 'phy712-m1-u4', title: 'Transmission Losses'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m2',
        title: 'Wind Turbines, Heat Engines, and Ocean Thermal Energy (OTEC)',
        summary: 'Wind Turbines, Heat Engines, and Ocean Thermal Energy (OTEC)',
        units: [
          skeletonUnit(id: 'phy712-m2-u1', title: 'Wind Energy Conversion'),
          skeletonUnit(id: 'phy712-m2-u2', title: 'Heat Engines'),
          skeletonUnit(id: 'phy712-m2-u3', title: 'Ocean Thermal Energy Conversion (OTEC)'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m3',
        title: 'Direct Solid-State Heat-to-Electricity Conversion',
        summary: 'Direct Solid-State Heat-to-Electricity Conversion',
        units: [
          skeletonUnit(id: 'phy712-m3-u1', title: 'Thermoelectric Conversion (Seebeck Effect)'),
          skeletonUnit(id: 'phy712-m3-u2', title: 'Thermoelectric Cooling (Peltier Effect)'),
          skeletonUnit(id: 'phy712-m3-u3', title: 'Thermionic Emission'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m4',
        title: 'Fuel Cells and Hydrogen Technologies',
        summary: 'Fuel Cells and Hydrogen Technologies',
        units: [
          skeletonUnit(id: 'phy712-m4-u1', title: 'What is a Fuel Cell?'),
          skeletonUnit(id: 'phy712-m4-u2', title: 'Hydrogen Production'),
          skeletonUnit(id: 'phy712-m4-u3', title: 'Hydrogen Storage Challenges'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m5',
        title: 'Photovoltaic Solar Cells and Photoelectron Converters',
        summary: 'Photovoltaic Solar Cells and Photoelectron Converters',
        units: [
          skeletonUnit(id: 'phy712-m5-u1', title: 'The Photovoltaic Effect'),
          skeletonUnit(id: 'phy712-m5-u2', title: 'Anatomy of a Solar Cell'),
          skeletonUnit(id: 'phy712-m5-u3', title: 'Solar Efficiency Limits'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m6',
        title: 'Photosynthesis and Biomass Conversion',
        summary: 'Photosynthesis and Biomass Conversion',
        units: [
          skeletonUnit(id: 'phy712-m6-u1', title: 'Natural Photosynthesis'),
          skeletonUnit(id: 'phy712-m6-u2', title: 'Biomass Energy'),
          skeletonUnit(id: 'phy712-m6-u3', title: 'The Carbon Cycle'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m7',
        title: 'Biofuel Production (Ethanol & Methanol)',
        summary: 'Biofuel Production (Ethanol & Methanol)',
        units: [
          skeletonUnit(id: 'phy712-m7-u1', title: 'Biofuel Fermentation'),
          skeletonUnit(id: 'phy712-m7-u2', title: 'Methanol Production'),
          skeletonUnit(id: 'phy712-m7-u3', title: 'Energy Return on Investment (EROI)'),
        ],
      ),
      skeletonModule(
        id: 'phy712-m8',
        title: 'Energy Storage Systems and Renewable Grid Balancing',
        summary: 'Energy Storage Systems and Renewable Grid Balancing',
        units: [
          skeletonUnit(id: 'phy712-m8-u1', title: 'Mechanical Energy Storage'),
          skeletonUnit(id: 'phy712-m8-u2', title: 'Chemical & Electrochemical Storage'),
          skeletonUnit(id: 'phy712-m8-u3', title: 'Thermal Energy Storage'),
          skeletonUnit(id: 'phy712-m8-u4', title: 'Grid Integration'),
        ],
      ),
    ],
  );
}
