# PGD Physics

## Content rewrite (important)

Lesson **prose is being rewritten** from stronger postgraduate prompts.

### For AI app builders — start here

1. Read **[CONTENT_AUTHORING.md](CONTENT_AUTHORING.md)** end-to-end (mandatory workflow).
2. Read **[content_prompts/README.md](content_prompts/README.md)** for the course index.
3. Execute **one course at a time**. Inside a course, execute **one prompt file at a time** in numeric order (`00_Master` → `01_Module` → `02_…`).
4. After each module prompt: run the **per-prompt checklist** in CONTENT_AUTHORING.md. Do not advance until it passes.
5. After each course: run the **course completion audit**. Do not start the next course until the audit passes.
6. **Do not change app design/UI** — only fill `lib/data/phy*_content.dart` (and diagram registry if a real vector figure is required).

| Resource | Purpose |
|----------|---------|
| [CONTENT_AUTHORING.md](CONTENT_AUTHORING.md) | Full rules, order, checklists, math/diagram policy |
| [content_prompts/](content_prompts/) | Master + module prompts per course |
| `lib/data/phy*_content.dart` | Module/unit shells to fill |

Hierarchy is **Course → Module → Unit** (UI label: **Modules**).

**Quality bar:** no ASCII schematics; no SVG/code-block “diagrams”; clean Markdown (no `**`/`__` junk); correct superscripts/subscripts (prefer Unicode); postgraduate depth per each course’s master prompt.


Flutter study companion for the **ABUAD Postgraduate Diploma in Physics (Electronics)** programme.

Offline-first lessons, quizzes, progress tracking, and **Nova** — a client-side BYOK AI tutor with multi-provider fallback, personalities, on-demand diagrams, and optional free-tier image generation.

---

## Requirements

- Flutter SDK **3.2+** (Dart 3)
- Android SDK for APK builds (or Xcode for iOS)
- No backend server required

```bash
flutter pub get
flutter run
# release APK
flutter build apk --release
```

Suggested GitHub Actions: build `app-release.apk` on push/tag and attach as artifact.

---

## App identity

| Item | Value |
|------|--------|
| App name | **PGD Physics** (keep Base44 branding if desired) |
| AI tutor | **Nova** (never “Nova AI”) |
| Creator footer | Tochukwu Victor BSc — WhatsApp `@iam_tochi` |

---

## Architecture overview

```
lib/
  main.dart                 # splash, theme, onboarding gate
  theme/                    # independent light/dark AppTheme + ThemeController
  models/                   # Course, Topic, Unit, QuizQuestion
  data/
    sample_courses.dart     # curriculum assembly
    program_registry.dart   # multi-program scaffold (PGD now; MSc/PhD later)
    phy*_content.dart       # micro-chunked lessons (157 units)
  services/
    storage_service.dart    # SharedPreferences + Hive
    ai_service.dart         # multi-provider text BYOK + system prompt
    ai_providers.dart       # Gemini, Groq, OpenRouter, Cerebras
    image_generation_service.dart  # free image fallback for diagrams
    persona_catalog.dart    # Nova styles (+ locked Warm & devoted)
    notification_service.dart
  screens/                  # home, course, topic, unit, quiz, nova, settings, onboarding
  widgets/
    diagrams/               # lesson + Nova chat vector diagrams
    nova_message_body.dart  # Markdown + sanitization
    persona_unlock_dialog.dart
  utils/page_transitions.dart
```

**Network:** only `ai_service.dart` and `image_generation_service.dart` use HTTP. Everything else is offline.

---

## Offline rules (do not break)

| Feature | Offline |
|---------|---------|
| Lessons, diagrams on units, quizzes | Yes |
| Progress, streak, last lesson | Yes |
| Theme, profile, onboarding | Yes |
| Chat history re-read | Yes |
| Live Nova text | Needs network + API key |
| Generated images | Needs network (+ Gemini key preferred) |

Never gate navigation to lessons on AI availability.

---

## Curriculum

- First semester: PHY 701, 703, 705, 707, 709  
- Second semester: PHY 702, 704, 706, 708, 710, 712  
- Project: PHY 799  

Content follows micro-chunking pedagogy (intuition first, demystified math, key takeaways, quiz per unit). Display replaces author name “Tochi” with the user’s nickname.

### Adding a course unit

1. Edit or add `lib/data/phyXXX_content.dart` with `Course` / `Topic` / `Unit` / `QuizQuestion`.  
2. Register the builder in `sample_courses.dart`.  
3. Keep strings beginner-friendly; avoid ASCII schematics.

### Adding a future programme (MSc / PhD)

Use `ProgramRegistry` — add a program id + course list factory without redesigning home UI. See comments in `program_registry.dart`.

---

## Nova (AI tutor) — feature map

### BYOK multi-provider text
- Keys in **Settings → AI providers** (not only inside chat).  
- Providers: Gemini, Groq, OpenRouter, Cerebras.  
- Preferred provider or **Auto** fallback on rate limit / auth / timeout / empty reply.  
- “Powered by …” under successful replies.  
- Concise-first answers + soft “want more?”; conversation vs study mode; gender + nickname + page context.

### Personalities
- All named **Nova**; styles differ (`persona_catalog.dart`).  
- **Warm & devoted** (`affectionate_nova`) is **code-locked**.  
- Unlock via dialog; persisted in `unlocked_personas`.  
- Default open style: Patient professor.

### Chat UX
- Thread key by page/course/unit; Hive history (trimmed).  
- Long-press: Copy; **Edit** only on latest user message (strips following Nova reply, regenerates).  
- Clear chat (recycle) for current thread.  
- Markdown rendering + sanitization / Unicode exponents.

### Diagrams
1. **Built-in vectors** (`ChatDiagramCatalog`, ~23 ids) — offline, Nova-only (not auto-injected into every lesson page).  
2. Model may emit `[[diagram:id]]`.  
3. If no vector match and user asked for a figure → **ImageGenerationService** (Gemini image models with user key, then Pollinations free fallback).  
4. Else text description only.

### Onboarding
Nickname → genders → personality (with unlock if needed) → optional jump to AI key settings.

---

## Theme

- System default; user can force light/dark.  
- Independent light/dark colour tokens in `AppTheme`.  
- Accessible toggle on major screens.

---

## Storage keys (conceptual)

- Profile: nickname, genders, personality, unlocked personas  
- AI: `api_key_gemini|groq|openrouter|cerebras`, preferred provider  
- Progress: completed units, streak, last lesson  
- Chat: `chat_<safeThreadKey>` in Hive  
- Theme mode, notifications flag, selected program id  

Fail soft on storage errors; never crash the study path.

---

## Build / GitHub

1. Create empty GitHub repo.  
2. Push this project (include `android/`, `lib/`, `pubspec.yaml`, assets).  
3. Optional workflow: `flutter build apk --release` and upload artifact.  
4. Users install APK or use CI artifact — no paid backend.

Do **not** commit real API keys. `.gitignore` should exclude `.dart_tool/`, `build/`, local key files.

---

## Editing safely

- Keep **Nova** behavioural contract if you change models (see `NOVA_COMPLETE_PROMPT.txt`).  
- Prefer vector diagrams for core teaching figures; image gen is a fallback.  
- After large edits: `flutter analyze` and a quick offline + online Nova smoke test.  
- Persona unlock code is in source (`PersonaCatalog.affectionateUnlockCode`) — treat as app secret if you redistribute.

---

## Credits

Content and product direction: **Tochukwu Victor BSc** (Physics and Astronomy, University of Nigeria Nsukka). Contact for consultations: WhatsApp **@iam_tochi**.
