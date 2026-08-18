import 'package:pgd_physics/models/course.dart';

/// PHY 707 — content shell for postgraduate rewrite.
/// Full notes will be authored from prompts in content_prompts/PHY707/
Course buildPhy707() {
  return Course(
    id: 'phy-707',
    code: 'PHY 707',
    title: 'Digital Electronics',
    description: 'Logic and digital systems — shells.',
    semester: 'First Semester',
    units: 3,
    icon: '▣',
    colorHint: ColorHint.orange,
    modules: [
      skeletonModule(
        id: 'phy-707-m1',
        title: 'Number systems & gates',
        summary: 'Binary and basic logic.',
        units: [
          skeletonUnit(id: 'phy-707-m1-u1', title: 'Binary & hexadecimal'),
          skeletonUnit(id: 'phy-707-m1-u2', title: 'AND OR NOT'),
          skeletonUnit(id: 'phy-707-m1-u3', title: 'NAND NOR XOR'),
        ],
      ),
      skeletonModule(
        id: 'phy-707-m2',
        title: 'Boolean algebra & simplification',
        summary: 'Cleaner logic.',
        units: [
          skeletonUnit(id: 'phy-707-m2-u1', title: 'Boolean identities'),
          skeletonUnit(id: 'phy-707-m2-u2', title: 'De Morgan'),
          skeletonUnit(id: 'phy-707-m2-u3', title: 'Karnaugh map idea'),
        ],
      ),
      skeletonModule(
        id: 'phy-707-m3',
        title: 'Combinational blocks',
        summary: 'Mux, adders, and friends.',
        units: [
          skeletonUnit(id: 'phy-707-m3-u1', title: 'Adders'),
          skeletonUnit(id: 'phy-707-m3-u2', title: 'Multiplexers'),
          skeletonUnit(id: 'phy-707-m3-u3', title: 'Encoders / decoders'),
        ],
      ),
      skeletonModule(
        id: 'phy-707-m4',
        title: 'Sequential logic',
        summary: 'Memory in time.',
        units: [
          skeletonUnit(id: 'phy-707-m4-u1', title: 'Latches & flip-flops'),
          skeletonUnit(id: 'phy-707-m4-u2', title: 'Counters'),
          skeletonUnit(id: 'phy-707-m4-u3', title: 'Registers'),
        ],
      ),
      skeletonModule(
        id: 'phy-707-m5',
        title: 'Logic families & converters',
        summary: 'Real hardware notes.',
        units: [
          skeletonUnit(id: 'phy-707-m5-u1', title: 'TTL vs CMOS idea'),
          skeletonUnit(id: 'phy-707-m5-u2', title: 'ADC / DAC sketch'),
        ],
      ),
    ],
  );
}
