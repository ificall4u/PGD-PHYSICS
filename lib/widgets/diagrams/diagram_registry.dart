import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/widgets/diagrams/pn_junction_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/field_lines_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/logic_gate_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/energy_band_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/decay_curve_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/solar_cell_diagram.dart';
import 'package:pgd_physics/widgets/diagrams/mosfet_diagram.dart';

/// Clean vector diagrams mapped to the units that need them most.
class DiagramRegistry {
  static Widget? forUnit(String unitId) {
    // Energy bands
    if (unitId == 'phy705-t2-u1') {
      return const DiagramCard(
        title: 'Energy bands — metal, semiconductor, insulator',
        child: EnergyBandDiagram(),
      );
    }
    // p–n junction
    if (unitId == 'phy705-t3-u1') {
      return const DiagramCard(
        title: 'p–n junction and depletion region',
        child: PnJunctionDiagram(),
      );
    }
    // Solar cell / photo converters
    if (unitId == 'phy705-t6-u2' || unitId == 'phy712-t6-u1') {
      return const DiagramCard(
        title: 'Solar cell — light creates and separates charges',
        child: SolarCellDiagram(),
      );
    }
    // Electric field
    if (unitId == 'phy702-t2-u1') {
      return const DiagramCard(
        title: 'Electric field lines around charges',
        child: FieldLinesDiagram(),
      );
    }
    // Logic gates
    if (unitId == 'phy707-t1-u2' || unitId == 'phy707-t1-u3') {
      return const DiagramCard(
        title: 'Basic logic gate symbols',
        child: LogicGateDiagram(),
      );
    }
    // Radioactive decay / half-life
    if (unitId == 'phy708-t3-u2') {
      return const DiagramCard(
        title: 'Radioactive decay curve and half-life',
        child: DecayCurveDiagram(),
      );
    }
    // MOSFET
    if (unitId == 'phy709-t6-u3') {
      return const DiagramCard(
        title: 'MOSFET cross-section (gate · oxide · channel)',
        child: MosfetDiagram(),
      );
    }
    return null;
  }
}

class DiagramCard extends StatelessWidget {
  final String title;
  final Widget child;

  const DiagramCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.schema_rounded,
                    size: 16, color: AppTheme.primaryLight),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Quick visual — optional, the text is enough',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              color: const Color(0xFF0D1219),
              padding: const EdgeInsets.all(12),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
