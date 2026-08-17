import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pgd_physics/theme/app_theme.dart';

/// Light cleanup so users never see raw markdown junk when models misbehave.
String sanitizeNovaText(String raw) {
  var t = raw.trim();
  // Normalize odd separators models sometimes emit
  t = t.replaceAll(RegExp(r'-{3,}'), '—');
  t = t.replaceAll(RegExp(r'_{3,}'), '');
  // Collapse excessive blank lines
  t = t.replaceAll(RegExp(r'\n{3,}'), '\n\n');
  // Common unicode-friendly physics substitutions when models emit TeX-ish bits
  const pairs = <String, String>{
    r'\times': '×',
    r'\cdot': '·',
    r'\pm': '±',
    r'\approx': '≈',
    r'\neq': '≠',
    r'\leq': '≤',
    r'\geq': '≥',
    r'\infty': '∞',
    r'\degree': '°',
    r'^{\circ}': '°',
    r'^2': '²',
    r'^3': '³',
    r'^4': '⁴',
    r'_0': '₀',
    r'_1': '₁',
    r'_2': '₂',
    r'_3': '₃',
    r'_4': '₄',
    r'_n': 'ₙ',
    r'_i': 'ᵢ',
    r'\$': '',
  };
  for (final e in pairs.entries) {
    t = t.replaceAll(e.key, e.value);
  }
  // Strip leftover simple $...$ wrappers after substitutions
  t = t.replaceAllMapped(
    RegExp(r'\$([^\$]{1,40})\$'),
    (m) => m.group(1) ?? '',
  );
  return t.trim();
}

class NovaMessageBody extends StatelessWidget {
  final String text;
  final bool isUser;

  const NovaMessageBody({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final cleaned = sanitizeNovaText(text);
    final baseColor = isUser ? Colors.white : AppTheme.textPrimary;
    final muted = isUser
        ? Colors.white.withOpacity(0.85)
        : AppTheme.textSecondary;

    final sheet = MarkdownStyleSheet(
      p: TextStyle(
        color: baseColor,
        fontSize: 15,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
      strong: TextStyle(
        color: baseColor,
        fontSize: 15,
        height: 1.5,
        fontWeight: FontWeight.w700,
      ),
      em: TextStyle(
        color: baseColor,
        fontSize: 15,
        height: 1.5,
        fontStyle: FontStyle.italic,
      ),
      listBullet: TextStyle(color: baseColor, fontSize: 15, height: 1.5),
      h1: TextStyle(
        color: baseColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      h2: TextStyle(
        color: baseColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      h3: TextStyle(
        color: baseColor,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      code: TextStyle(
        color: isUser ? Colors.white : AppTheme.primaryLight,
        fontSize: 13.5,
        fontFamily: 'monospace',
        backgroundColor: isUser
            ? Colors.white.withOpacity(0.12)
            : AppTheme.surfaceHighlight,
      ),
      codeblockDecoration: BoxDecoration(
        color: isUser
            ? Colors.white.withOpacity(0.12)
            : AppTheme.surfaceHighlight,
        borderRadius: BorderRadius.circular(8),
      ),
      blockquote: TextStyle(color: muted, fontSize: 14.5, height: 1.45),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isUser
                ? Colors.white.withOpacity(0.4)
                : AppTheme.primary.withOpacity(0.5),
            width: 3,
          ),
        ),
      ),
      a: TextStyle(
        color: isUser ? Colors.white : AppTheme.primaryLight,
        decoration: TextDecoration.underline,
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isUser
                ? Colors.white.withOpacity(0.25)
                : AppTheme.cardBorder,
          ),
        ),
      ),
    );

    return MarkdownBody(
      data: cleaned,
      selectable: true,
      softLineBreak: true,
      styleSheet: sheet,
    );
  }
}
