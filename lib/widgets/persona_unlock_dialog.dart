import 'package:flutter/material.dart';
import 'package:pgd_physics/theme/app_theme.dart';
import 'package:pgd_physics/services/persona_catalog.dart';
import 'package:pgd_physics/services/storage_service.dart';

Future<bool> showPersonaUnlockDialog(
  BuildContext context,
  AiPersona persona,
) async {
  if (!persona.isLocked) return true;
  if (StorageService.isPersonaUnlocked(persona.id)) return true;

  final controller = TextEditingController();
  final ok = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      String? error;
      return StatefulBuilder(
        builder: (ctx, setLocal) {
          return AlertDialog(
            backgroundColor: AppTheme.surface,
            title: Text(
              'Unlock “${persona.shortLabel}”',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This Nova style is protected. Enter the access code to use it.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    height: 1.4,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: controller,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Access code',
                    hintText: 'Enter code',
                    errorText: error,
                  ),
                  onSubmitted: (_) {
                    final match = PersonaCatalog.codesMatch(
                      controller.text,
                      persona.unlockCode ?? '',
                    );
                    if (match) {
                      Navigator.pop(ctx, true);
                    } else {
                      setLocal(() => error = 'That code doesn’t match');
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  final match = PersonaCatalog.codesMatch(
                    controller.text,
                    persona.unlockCode ?? '',
                  );
                  if (match) {
                    Navigator.pop(ctx, true);
                  } else {
                    setLocal(() => error = 'That code doesn’t match');
                  }
                },
                child: Text(
                  'Unlock',
                  style: TextStyle(color: AppTheme.primaryLight),
                ),
              ),
            ],
          );
        },
      );
    },
  );

  if (ok == true) {
    await StorageService.unlockPersona(persona.id);
    return true;
  }
  return false;
}
