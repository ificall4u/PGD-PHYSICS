# Content authoring guide — AI app builders

**Read this file completely before writing any lesson.**  
This is the only workflow for filling postgraduate content into PGD Physics.

You are an **app builder / content engineer**, not a UI redesign agent.

---

## 0. Non‑negotiables (read twice)

1. **Do not change UI, themes, navigation, Nova, or widgets** unless a compile error forces a one-line fix in content files only.
2. **One course at a time.** Finish and verify that course before opening another.
3. **One prompt file at a time**, in **numeric order**, inside that course.
4. **Never start the next prompt** until the current prompt is fully and accurately written into the Dart shells and has passed the per-prompt checklist.
5. After the whole course is done, run the **course completion audit** below.
6. **No ASCII art / ASCII schematics** (no `+---+`, `| |`, `-->` wire drawings as “diagrams”).
7. **No diagram shown as a code block** and **no raw SVG source** dumped into lesson Markdown. Diagrams are either:
   - registered **vector widgets** in `lib/widgets/diagrams/` + `diagram_registry.dart`, or
   - short **prose + Unicode** description the reader can follow.
8. **No markdown junk** in student-facing text: no leftover `**`, `__`, `--` used as decoration, no broken emphasis.
9. **Math:** prefer Unicode (x², H₂O, α, ∇², ∫) for readability. If you use TeX, keep it simple (`$E$`, `$$F = ma$$`). Escape `$` in **Dart** strings as `\$` when the `$` is literal TeX delimiters inside single-quoted or interpolated strings. The app runs `mathToPlain()` on display — still write correct math.
10. **Superscripts / subscripts** must look correct to the student (Unicode or clean TeX that converts well) — not `x^2` left raw when it should be x², and not broken markup.

---

## 1. Where prompts live (source of truth)

```
content_prompts/
  README.md                 ← course index
  PHY701/
    00_Master_System_Prompt.txt    ← pedagogy for THIS course (read first)
    01_Module1_....txt
    02_Module2_....txt
    …
  PHY702/ …
  …
  PHY712/
  PHY799/                   ← may be shell-only until prompts exist
```

Each `PHY###/README.md` maps prompt files → app modules.

**Lesson shells (what you fill):**

| Course | Edit this file | Builder function |
|--------|----------------|------------------|
| PHY 701 | `lib/data/phy701_content.dart` | `buildPhy701()` |
| PHY 702 | `lib/data/phy702_content.dart` | `buildPhy702()` |
| … | … | … |
| PHY 712 | `lib/data/phy712_content.dart` | `buildPhy712()` |
| PHY 799 | `lib/data/phy799_content.dart` | `buildPhy799()` |

Hierarchy in code:

```
Course → Module → Unit
  Unit.content        // Markdown string (main lesson)
  Unit.keyTakeaways   // List<String>
  Unit.quiz           // List<QuizQuestion>
```

Stable **ids** (`phy701-m1-u1`, …) already exist — **keep them** so progress keys stay valid. You may refine **titles** to match the prompt if needed; do not rename ids casually.

Curriculum assembly is already wired in `lib/data/sample_courses.dart` — **do not remove courses** from that list.

---

## 2. Mandatory execution order

### 2.1 Course order (default)

Work **one folder** at a time. Suggested sequence unless the user specifies otherwise:

1. PHY701 → 2. PHY702 → 3. PHY703 → 4. PHY704 → 5. PHY705 → 6. PHY706 →  
7. PHY707 → 8. PHY708 → 9. PHY709 → 10. PHY710 → 11. PHY712 → 12. PHY799 (when prompts exist)

**Stop after each course** for the course audit. Do not batch multiple courses in one unsupervised pass.

### 2.2 Inside one course — prompt order

1. Open `content_prompts/PHY###/00_Master_System_Prompt.txt` and **internalize** pedagogy (depth, intuition first, full derivations if the master says so, etc.).
2. List module files: `01_…`, `02_…`, … sorted by number.
3. For **each** module file **in order**:
   - Read **only that file** (plus the master still applies).
   - Map every numbered section in the prompt to existing **units** under that module (or add units if the shell is short — prefer matching existing shells).
   - Write **complete** unit content for that module’s scope only (modular completeness: do not steal content from later modules).
   - Fill `keyTakeaways` and a small `quiz` (2–5 solid questions) per unit where the prompt’s depth warrants it.
   - Run **§3 Per-prompt checklist**. If any item fails, fix before leaving the module.
4. Only then open the next `0N_Module….txt`.

**Never** interleave two module prompts. **Never** partially fill “all modules lightly” — finish module N before module N+1.

---

## 3. Per-prompt checklist (required gate)

Before starting the next prompt file, confirm:

| # | Check |
|---|--------|
| 1 | Every numbered teaching objective in this module prompt appears in at least one unit (or is clearly covered without omission). |
| 2 | No unit still shows the generic placeholder (`Content in progress` / `kContentPlaceholder`) for this module’s units. |
| 3 | Derivations/steps match the master prompt’s depth rules for this course (if master demands full steps, do not write “it is easy to show”). |
| 4 | Physical intuition / motivation appears **before** heavy formalism when the prompt asks for it. |
| 5 | Math is readable (Unicode preferred); Dart strings escape `$` correctly; no broken half-TeX. |
| 6 | No `**`, `__`, `---` decoration junk; headings use proper Markdown (`##`, `###`). |
| 7 | No ASCII schematics; no SVG code; no “diagram” inside a fenced code block. |
| 8 | Any figure needed is either a **registered vector** (see §5) or a clear verbal + Unicode description. |
| 9 | Quizzes: one clear `correctIndex`; explanations short and correct. |
| 10 | Student is not hard-named “Tochi”; neutral address (app injects nickname where needed). |
| 11 | `flutter analyze` / compile still OK for touched files (no unescaped `$` in Dart strings). |

Only when **all** applicable rows pass → proceed to the next module prompt.

---

## 4. Course completion audit (required)

After the **last** module prompt of a course is done:

1. Re-read `00_Master_System_Prompt.txt` and every `0N_Module` file.
2. Skim `lib/data/phy###_content.dart` top to bottom.
3. Confirm:
   - No placeholders left in that course.
   - Module titles/order still match prompt pack.
   - No UI files were edited.
   - No ASCII/SVG-in-Markdown diagrams introduced.
   - Math and emphasis formatting are clean across the course.
   - Quizzes do not contradict the lesson text.
4. Write a short status note for the human (e.g. “PHY701 complete: 7 modules, N units, audit passed”).

Then — and only then — may you start the next course folder.

---

## 5. Diagrams (quality rules)

**Allowed**

- Existing painters in `lib/widgets/diagrams/` wired through `diagram_registry.dart` via unit id.
- New **CustomPainter / vector** diagrams in the same style, registered for specific unit ids — clean educational figures, not clip-art spam.
- Prose descriptions with Unicode symbols.

**Forbidden**

- ASCII schematics as the primary figure.
- Fenced code blocks containing SVG/XML/ASCII art presented as the diagram.
- Low-accuracy decorative pictures that do not match the equation or device being taught.

If a figure is essential and no painter exists yet: either add a proper vector widget + registry entry, or describe the figure carefully in Markdown **without** code-block pseudo-graphics. Prefer accuracy over decoration.

---

## 6. How to write a unit in Dart

Prefer replacing `skeletonUnit(...)` with a full `Unit(...)` when adding quiz + takeaways:

```dart
Unit(
  id: 'phy701-m1-u1', // KEEP existing id
  title: 'Clear title matching the prompt section',
  content: '''
## Learning goal
One or two sentences.

## Why it matters
Physical intuition first.

## Development
Full explanation. Use Unicode math where possible (e.g. ∇²φ = 0, E = mc²).

## Check yourself
One low-stakes conceptual question in prose.
''',
  keyTakeaways: [
    'Takeaway one',
    'Takeaway two',
  ],
  quiz: [
    QuizQuestion(
      id: 'phy701-m1-u1-q1',
      question: '…',
      options: ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      explanation: '…',
    ),
  ],
),
```

**Dart string safety**

- Inside `'...'` or `"..."`, a bare `$` starts interpolation — escape TeX dollars as `\$`.
- Prefer raw multi-line strings carefully, or Unicode to avoid TeX delimiters.
- Apostrophes inside single-quoted strings must be escaped: `\'`.

---

## 7. Pedagogy (from prompt packs)

Each course’s `00_Master_System_Prompt.txt` overrides generic style for **that** course. Typical rules in this repo:

- Ground-up derivations when the master demands them.
- Intuition before pure formalism.
- Symbol-by-symbol clarity for advanced material.
- Modular completeness: only the current module’s scope.

Do not compress away required proofs if the module prompt lists them.

---

## 8. What “done” means for the human

The human should be able to say:

> Read CONTENT_AUTHORING.md and the content_prompts folder. Write the content carefully.

and you execute **this** workflow without redesigning the app.

---

## 9. Quick reference

| Item | Location |
|------|----------|
| This workflow | `CONTENT_AUTHORING.md` |
| Prompt packs | `content_prompts/PHY###/` |
| Shells to fill | `lib/data/phy###_content.dart` |
| Course list | `lib/data/sample_courses.dart` |
| Diagram registry | `lib/widgets/diagrams/diagram_registry.dart` |
| Math display helper | `lib/utils/math_plain.dart` |
| Nova (not lesson prose) | `lib/services/ai_service.dart` |

**Design stays dope. Content gets rigorous. One prompt → verify → next prompt → course audit → next course.**
