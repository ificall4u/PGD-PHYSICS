/// Converts common TeX/KaTeX snippets in lesson text into readable plain Unicode.
String mathToPlain(String input) {
  var s = input;

  // Block math $$ ... $$
  s = s.replaceAllMapped(RegExp(r'\$\$([\s\S]*?)\$\$'), (m) {
    return _texToPlain(m.group(1) ?? '');
  });
  // Inline $ ... $ ($$ blocks already removed)
  s = s.replaceAllMapped(RegExp(r'\$([^\$
]+?)\$'), (m) {
    return _texToPlain(m.group(1) ?? '');
  });

  return s;
}

String _texToPlain(String raw) {
  var t = raw.trim();
  // Remove common wrappers
  t = t.replaceAll(RegExp(r'\\left|\\right'), '');
  t = t.replaceAll(RegExp(r'\\[,\;\!]'), ' ');
  t = t.replaceAllMapped(RegExp(r'\\mathrm\{([^}]*)\}'), (m) => m.group(1) ?? '');
  t = t.replaceAllMapped(RegExp(r'\\text\{([^}]*)\}'), (m) => m.group(1) ?? '');
  t = t.replaceAllMapped(RegExp(r'\\mathbf\{([^}]*)\}'), (m) => m.group(1) ?? '');

  const map = {
    r'\infty': '∞',
    r'\pm': '±',
    r'\mp': '∓',
    r'\times': '×',
    r'\cdot': '·',
    r'\div': '÷',
    r'\leq': '≤',
    r'\geq': '≥',
    r'\neq': '≠',
    r'\approx': '≈',
    r'\equiv': '≡',
    r'\rightarrow': '→',
    r'\leftarrow': '←',
    r'\Rightarrow': '⇒',
    r'\leftrightarrow': '↔',
    r'\partial': '∂',
    r'\nabla': '∇',
    r'\sum': 'Σ',
    r'\prod': 'Π',
    r'\int': '∫',
    r'\oint': '∮',
    r'\sqrt': '√',
    r'\alpha': 'α',
    r'\beta': 'β',
    r'\gamma': 'γ',
    r'\delta': 'δ',
    r'\epsilon': 'ε',
    r'\varepsilon': 'ε',
    r'\theta': 'θ',
    r'\lambda': 'λ',
    r'\mu': 'μ',
    r'\nu': 'ν',
    r'\pi': 'π',
    r'\rho': 'ρ',
    r'\sigma': 'σ',
    r'\tau': 'τ',
    r'\phi': 'φ',
    r'\varphi': 'φ',
    r'\omega': 'ω',
    r'\Omega': 'Ω',
    r'\Delta': 'Δ',
    r'\Gamma': 'Γ',
    r'\Sigma': 'Σ',
    r'\Psi': 'Ψ',
    r'\psi': 'ψ',
    r'\hbar': 'ℏ',
    r'\degree': '°',
    r'\circ': '°',
    r'\ldots': '…',
    r'\cdots': '⋯',
  };
  map.forEach((k, v) {
    t = t.replaceAll(k, v);
  });

  // \frac{a}{b} → (a)/(b)
  for (var i = 0; i < 8; i++) {
    final next = t.replaceAllMapped(
      RegExp(r'\\frac\{([^{}]+)\}\{([^{}]+)\}'),
      (m) => '(${m.group(1)})/(${m.group(2)})',
    );
    if (next == t) break;
    t = next;
  }

  // ^{...} and ^x
  t = t.replaceAllMapped(RegExp(r'\^\{([^}]+)\}'), (m) => _toSuper(m.group(1) ?? ''));
  t = t.replaceAllMapped(RegExp(r'\^([A-Za-z0-9+\-])'), (m) => _toSuper(m.group(1) ?? ''));
  // _{...} and _x
  t = t.replaceAllMapped(RegExp(r'_\{([^}]+)\}'), (m) => _toSub(m.group(1) ?? ''));
  t = t.replaceAllMapped(RegExp(r'_([A-Za-z0-9+\-])'), (m) => _toSub(m.group(1) ?? ''));

  // \int_0^\infty already partially handled
  t = t.replaceAll(r'\,', ' ');
  t = t.replaceAll(r'\;', ' ');
  t = t.replaceAll(r'\ ', ' ');
  t = t.replaceAll('\\', '');
  t = t.replaceAll(RegExp(r'\s+'), ' ').trim();
  return t;
}

String _toSuper(String s) {
  const m = {
    '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴',
    '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹',
    '+': '⁺', '-': '⁻', 'n': 'ⁿ', 'i': 'ⁱ', 't': 'ᵗ', 's': 'ˢ',
  };
  final buf = StringBuffer();
  for (final r in s.runes) {
    final ch = String.fromCharCode(r);
    buf.write(m[ch] ?? ch);
  }
  return buf.toString();
}

String _toSub(String s) {
  const m = {
    '0': '₀', '1': '₁', '2': '₂', '3': '₃', '4': '₄',
    '5': '₅', '6': '₆', '7': '₇', '8': '₈', '9': '₉',
    '+': '₊', '-': '₋', 'a': 'ₐ', 'e': 'ₑ', 'i': 'ᵢ',
    'j': 'ⱼ', 'n': 'ₙ', 'r': 'ᵣ', 's': 'ₛ', 't': 'ₜ',
    'x': 'ₓ', 'k': 'ₖ', 'm': 'ₘ', 'p': 'ₚ',
  };
  final buf = StringBuffer();
  for (final r in s.runes) {
    final ch = String.fromCharCode(r);
    buf.write(m[ch] ?? ch);
  }
  return buf.toString();
}
