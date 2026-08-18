import 'package:pgd_physics/models/course.dart';

/// PHY 706 — Electronics Instrumentation
/// Structure from content_prompts/PHY706 (placeholder lesson bodies only).
Course buildPhy706() {
  return Course(
    id: 'phy-706',
    code: 'PHY 706',
    title: 'Electronics Instrumentation',
    description: 'Measurement, meters, oscilloscopes, sensors, op-amps, and equipment design.',
    semester: 'Second Semester',
    units: 3,
    icon: '🔌',
    colorHint: ColorHint.green,
    modules: [
      skeletonModule(
        id: 'phy706-m1',
        title: 'Principles of Measurement, Errors, and Accuracy',
        summary: 'Principles of Measurement, Errors, and Accuracy',
        units: [
          skeletonUnit(id: 'phy706-m1-u1', title: 'The Core Purpose of Measurement'),
          skeletonUnit(id: 'phy706-m1-u2', title: 'Accuracy vs. Precision'),
          skeletonUnit(id: 'phy706-m1-u3', title: 'Types of Measurement Errors'),
          skeletonUnit(id: 'phy706-m1-u4', title: 'Error Propagation Intuition'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m2',
        title: 'Analog and Digital Measuring Meters',
        summary: 'Analog and Digital Measuring Meters',
        units: [
          skeletonUnit(id: 'phy706-m2-u1', title: 'The Galvanometer Core'),
          skeletonUnit(id: 'phy706-m2-u2', title: 'Ammeters and Voltmeters'),
          skeletonUnit(id: 'phy706-m2-u3', title: 'Digital Multimeters (DMMs)'),
          skeletonUnit(id: 'phy706-m2-u4', title: 'Meter Loading Effect'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m3',
        title: 'Watt-meters and Q-meters',
        summary: 'Watt-meters and Q-meters',
        units: [
          skeletonUnit(id: 'phy706-m3-u1', title: 'Measuring Electrical Power (Watt-meters)'),
          skeletonUnit(id: 'phy706-m3-u2', title: 'The Quality Factor ($Q$) of Circuits'),
          skeletonUnit(id: 'phy706-m3-u3', title: 'The Q-Meter Circuit'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m4',
        title: 'Cathode Ray Oscilloscope (C.R.O.) and Digital Storage Oscilloscopes',
        summary: 'Cathode Ray Oscilloscope (C.R.O.) and Digital Storage Oscilloscopes',
        units: [
          skeletonUnit(id: 'phy706-m4-u1', title: 'What is an Oscilloscope?'),
          skeletonUnit(id: 'phy706-m4-u2', title: 'Cathode Ray Tube (CRT) Anatomy'),
          skeletonUnit(id: 'phy706-m4-u3', title: 'Timebase Generator & Triggering'),
          skeletonUnit(id: 'phy706-m4-u4', title: 'Digital Storage Oscilloscopes (DSOs)'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m5',
        title: 'Semiconductor Testers, X-Y Plotters, and Signal Generators',
        summary: 'Semiconductor Testers, X-Y Plotters, and Signal Generators',
        units: [
          skeletonUnit(id: 'phy706-m5-u1', title: 'Semiconductor Testers & Curve Tracing'),
          skeletonUnit(id: 'phy706-m5-u2', title: 'X-Y Plotters'),
          skeletonUnit(id: 'phy706-m5-u3', title: 'Function Generators'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m6',
        title: 'Transducers and Sensor Applications',
        summary: 'Transducers and Sensor Applications',
        units: [
          skeletonUnit(id: 'phy706-m6-u1', title: 'What is a Transducer?'),
          skeletonUnit(id: 'phy706-m6-u2', title: 'Resistive Transducers'),
          skeletonUnit(id: 'phy706-m6-u3', title: 'Capacitive & Inductive Transducers'),
          skeletonUnit(id: 'phy706-m6-u4', title: 'Piezoelectric & Optical Transducers'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m7',
        title: 'Operational Amplifiers (Op-Amps) in Instrumentation',
        summary: 'Operational Amplifiers (Op-Amps) in Instrumentation',
        units: [
          skeletonUnit(id: 'phy706-m7-u1', title: 'The Op-Amp Concept'),
          skeletonUnit(id: 'phy706-m7-u2', title: 'Golden Rules of Ideal Op-Amps'),
          skeletonUnit(id: 'phy706-m7-u3', title: 'Key Op-Amp Circuits'),
        ],
      ),
      skeletonModule(
        id: 'phy706-m8',
        title: 'Electronic Equipment Design & Signal Conditioning',
        summary: 'Electronic Equipment Design & Signal Conditioning',
        units: [
          skeletonUnit(id: 'phy706-m8-u1', title: 'The Signal Conditioning Pipeline'),
          skeletonUnit(id: 'phy706-m8-u2', title: 'Noise Reduction & Shielding'),
          skeletonUnit(id: 'phy706-m8-u3', title: 'Printed Circuit Board (PCB) Layout Basics'),
          skeletonUnit(id: 'phy706-m8-u4', title: 'Power Supply Design for Test Gear'),
        ],
      ),
    ],
  );
}
