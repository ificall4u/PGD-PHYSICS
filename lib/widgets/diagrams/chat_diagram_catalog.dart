import 'package:flutter/material.dart';
import 'package:pgd_physics/widgets/diagrams/pn_junction_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/field_lines_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/logic_gate_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/energy_band_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/decay_curve_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/solar_cell_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/mosfet_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/diagram_registry.dart';
import 'package:pgd_physics/widgets/diagrams/extra_course_diagrams.dart';

/// On-demand vector diagrams for Nova chat only (not auto-shown on lesson pages).
class ChatDiagramSpec {
  final String id;
  final String title;
  final List<String> keywords;
  final Widget Function() builder;

  const ChatDiagramSpec({
    required this.id,
    required this.title,
    required this.keywords,
    required this.builder,
  });
}

class ChatDiagramCatalog {
  static final List<ChatDiagramSpec> all = [
    // ── Existing core ──────────────────────────────────────────
    ChatDiagramSpec(
      id: 'energy_bands',
      title: 'Energy bands — metal, semiconductor, insulator',
      keywords: [
        'energy band', 'energy bands', 'band gap', 'bandgap',
        'conduction band', 'valence band', 'metal semiconductor insulator',
      ],
      builder: () => const EnergyBandDiagram(),
    ),
    ChatDiagramSpec(
      id: 'pn_junction',
      title: 'p–n junction and depletion region',
      keywords: [
        'pn junction', 'p-n junction', 'p–n', 'depletion region',
        'diode diagram', 'junction diode',
      ],
      builder: () => const PnJunctionDiagram(),
    ),
    ChatDiagramSpec(
      id: 'field_lines',
      title: 'Electric field lines around charges',
      keywords: [
        'field line', 'field lines', 'electric field diagram',
        'electric field lines', 'point charge field',
      ],
      builder: () => const FieldLinesDiagram(),
    ),
    ChatDiagramSpec(
      id: 'logic_gates',
      title: 'Basic logic gate symbols',
      keywords: [
        'logic gate', 'logic gates', 'and gate', 'or gate',
        'not gate', 'nand', 'nor gate', 'xor',
      ],
      builder: () => const LogicGateDiagram(),
    ),
    ChatDiagramSpec(
      id: 'decay_curve',
      title: 'Radioactive decay curve and half-life',
      keywords: [
        'decay curve', 'half-life', 'half life',
        'radioactive decay', 'exponential decay',
      ],
      builder: () => const DecayCurveDiagram(),
    ),
    ChatDiagramSpec(
      id: 'solar_cell',
      title: 'Solar cell — light creates and separates charges',
      keywords: [
        'solar cell', 'photovoltaic', 'pv cell', 'solar panel diagram',
      ],
      builder: () => const SolarCellDiagram(),
    ),
    ChatDiagramSpec(
      id: 'mosfet',
      title: 'MOSFET cross-section (gate · oxide · channel)',
      keywords: [
        'mosfet', 'fet diagram', 'transistor channel', 'gate oxide',
      ],
      builder: () => const MosfetDiagram(),
    ),

    // ── Math / methods (PHY 701) ───────────────────────────────
    ChatDiagramSpec(
      id: 'axes_curve',
      title: 'Coordinate axes with a sample curve',
      keywords: [
        'coordinate axes', 'xy axes', 'graph axes', 'plot a curve',
        'cartesian axes', 'function graph',
      ],
      builder: () => const SimpleAxesDiagram(),
    ),
    ChatDiagramSpec(
      id: 'spherical_coords',
      title: 'Spherical coordinates (r, θ, φ)',
      keywords: [
        'spherical coordinate', 'spherical coordinates', 'r theta phi',
        'r θ φ', 'spherical system',
      ],
      builder: () => const CoordinateSphericalDiagram(),
    ),

    // ── Mechanics (PHY 702 / 703) ──────────────────────────────
    ChatDiagramSpec(
      id: 'vector_2d',
      title: '2D vector with components',
      keywords: [
        'vector diagram', 'vector components', 'vector resolution',
        'ax ay', 'resultant vector',
      ],
      builder: () => const Vector2DDiagram(),
    ),
    ChatDiagramSpec(
      id: 'free_body',
      title: 'Free-body diagram (forces on a block)',
      keywords: [
        'free body', 'free-body', 'fbd', 'force diagram',
        'normal force', 'forces on a block',
      ],
      builder: () => const FreeBodyDiagram(),
    ),

    // ── Waves / optics ─────────────────────────────────────────
    ChatDiagramSpec(
      id: 'wave',
      title: 'Transverse wave (amplitude & wavelength)',
      keywords: [
        'wave diagram', 'sine wave', 'wavelength', 'amplitude wave',
        'transverse wave', 'wave form',
      ],
      builder: () => const WaveDiagram(),
    ),
    ChatDiagramSpec(
      id: 'lens_rays',
      title: 'Convex lens ray diagram',
      keywords: [
        'lens diagram', 'ray diagram', 'convex lens', 'focal length',
        'thin lens', 'optical diagram',
      ],
      builder: () => const LensRayDiagram(),
    ),

    // ── Circuits / electronics (PHY 705, 706, 707, 709) ────────
    ChatDiagramSpec(
      id: 'rc_circuit',
      title: 'Series RC circuit',
      keywords: [
        'rc circuit', 'series rc', 'resistor capacitor', 'charging circuit',
      ],
      builder: () => const CapacitorResistorDiagram(),
    ),
    ChatDiagramSpec(
      id: 'rlc_series',
      title: 'Series RLC circuit',
      keywords: [
        'rlc', 'series rlc', 'r l c', 'resonant circuit', 'rlc circuit',
      ],
      builder: () => const RlcSeriesDiagram(),
    ),
    ChatDiagramSpec(
      id: 'transformer',
      title: 'Transformer (primary & secondary)',
      keywords: [
        'transformer', 'primary secondary', 'step up transformer',
        'step down transformer', 'mutual induction diagram',
      ],
      builder: () => const TransformerDiagram(),
    ),
    ChatDiagramSpec(
      id: 'op_amp',
      title: 'Operational amplifier symbol',
      keywords: [
        'op amp', 'op-amp', 'operational amplifier', 'opamp',
      ],
      builder: () => const OpAmpDiagram(),
    ),
    ChatDiagramSpec(
      id: 'binary_wave',
      title: 'Digital bit stream (1s and 0s)',
      keywords: [
        'binary wave', 'digital signal', 'bit stream', 'square wave digital',
        'logic levels', 'digital waveform',
      ],
      builder: () => const BinaryWaveDiagram(),
    ),

    // ── Quantum (PHY 704) ──────────────────────────────────────
    ChatDiagramSpec(
      id: 'bohr_atom',
      title: 'Bohr atom energy levels',
      keywords: [
        'bohr atom', 'bohr model', 'electron orbits', 'energy levels atom',
        'hydrogen atom orbits',
      ],
      builder: () => const BohrAtomDiagram(),
    ),
    ChatDiagramSpec(
      id: 'photoelectric',
      title: 'Photoelectric effect',
      keywords: [
        'photoelectric', 'photoelectric effect', 'photon electron',
        'work function diagram',
      ],
      builder: () => const PhotoelectricDiagram(),
    ),
    ChatDiagramSpec(
      id: 'potential_well',
      title: 'Infinite potential well',
      keywords: [
        'potential well', 'infinite well', 'particle in a box',
        'square well', 'infinite square well',
      ],
      builder: () => const PotentialWellDiagram(),
    ),

    // ── Nuclear (PHY 708) ──────────────────────────────────────
    ChatDiagramSpec(
      id: 'fission',
      title: 'Nuclear fission schematic',
      keywords: [
        'fission', 'nuclear fission', 'split nucleus', 'uranium fission',
        'chain reaction diagram',
      ],
      builder: () => const FissionDiagram(),
    ),

    // ── Energy (PHY 712) ───────────────────────────────────────
    ChatDiagramSpec(
      id: 'fuel_cell',
      title: 'Hydrogen fuel cell schematic',
      keywords: [
        'fuel cell', 'hydrogen fuel', 'h2 fuel cell', 'fuel cell diagram',
      ],
      builder: () => const HydrogenFuelCellDiagram(),
    ),
  ];

  static ChatDiagramSpec? byId(String id) {
    for (final d in all) {
      if (d.id == id) return d;
    }
    return null;
  }

  static String get allowedIdsForPrompt => all.map((d) => d.id).join(', ');

  static List<String> detectIds(String userText) {
    final lower = userText.toLowerCase();
    final hits = <String>[];
    for (final d in all) {
      for (final k in d.keywords) {
        if (lower.contains(k)) {
          hits.add(d.id);
          break;
        }
      }
    }
    return hits.toSet().toList();
  }

  static final _tagRe =
      RegExp(r'\[\[diagram:([a-z0-9_]+)\]\]', caseSensitive: false);

  static (String cleanedText, List<String> ids) parseAssistantText(String raw) {
    final ids = <String>[];
    for (final m in _tagRe.allMatches(raw)) {
      final id = m.group(1)?.toLowerCase();
      if (id != null && byId(id) != null) ids.add(id);
    }
    final cleaned =
        raw.replaceAll(_tagRe, '').replaceAll(RegExp(r'\n{3,}'), '\n\n').trim();
    return (cleaned, ids.toSet().toList());
  }

  static Widget buildCard(String id) {
    final spec = byId(id);
    if (spec == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DiagramCard(
        title: spec.title,
        child: spec.builder(),
      ),
    );
  }
}
