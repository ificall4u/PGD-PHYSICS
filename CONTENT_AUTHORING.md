# Content authoring guide (PGD Physics)

For AI agents and developers filling postgraduate content **without** breaking the app.

## Design rules (do not change lightly)

- Premium study UI already implemented (themes, Nova, modules list, unit reader, quiz).
- **No ASCII schematics** in lesson text.
- Prefer Markdown headings, short paragraphs, lists.
- Math: write readable TeX in `$...$` or `$$...$$`; the app runs `mathToPlain()` for display. Unicode (x², H₂O, α) is also fine.
- Micro-chunking: one small idea per unit; Socratic checks belong in quiz or “pause and think” lines.
- Never hardcode a single student’s name — use neutral wording or the nickname system already in the app.

## Hierarchy

```
Course (PHY 7xx)
  └── Module (was “Topic”)
        └── Unit (one lesson screen)
              ├── content (Markdown string)
              ├── keyTakeaways (List<String>)
              └── quiz (List<QuizQuestion>)
```

## Files to edit

| Course | Dart builder file |
|--------|-------------------|
| PHY 701 | `lib/data/phy701_content.dart` → `buildPhy701()` |
| … | same pattern |
| PHY 799 | `lib/data/phy799_content.dart` |

Register builders in `lib/data/sample_courses.dart` (already wired).

## How to fill a unit

```dart
skeletonUnit(
  id: 'phy701-m1-u1',  // keep stable IDs if possible (progress keys)
  title: 'Clear lesson title',
  content: '''
## Learning goal
...

## Why it matters
...

## The idea
...

## Check yourself
...
''',
)
```

Or replace `skeletonUnit` with a full `Unit(...)` including:

```dart
keyTakeaways: ['...', '...'],
quiz: [
  QuizQuestion(
    id: 'phy701-m1-u1-q1',
    question: '...',
    options: ['A', 'B', 'C', 'D'],
    correctIndex: 0,
    explanation: '...',
  ),
],
```

## Prompts live here

`content_prompts/PHY701/` … `content_prompts/PHY799/`

1. Read the prompt files in the matching folder.  
2. Map prompt sections → modules/units (create extra units if the prompt micro-chunks further).  
3. Write Dart strings carefully (escape `'` as `\'` or use raw/`"""`).  
4. Run `flutter analyze` and a quick device smoke test on one course.

## Optional diagrams

- **Lesson page diagrams:** `lib/widgets/diagrams/diagram_registry.dart` (`forUnit(unitId)`).  
- **Nova on-demand vectors:** `lib/widgets/diagrams/chat_diagram_catalog.dart`.  
Add painters only when a figure is essential; prefer clear prose first.

## Nova

Does not embed course prose offline. It uses BYOK APIs + page context. Content quality still matters for units the student reads without network.

## Checklist before merge

- [ ] No `Topic` type left in new code (use `Module`)  
- [ ] Placeholder `kContentPlaceholder` removed from finished units  
- [ ] Quizzes have one clear correct index  
- [ ] Module summaries are one or two sentences  
- [ ] IDs unique across the app  
- [ ] UI still shows **Modules** on course pages  
