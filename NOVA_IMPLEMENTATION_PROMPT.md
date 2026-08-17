# Nova — Full Implementation Prompt for AI Builders

Use this document to implement **Nova** (or an equivalent BYOK study tutor) in a new app. It captures the design that shipped in **PGD Physics**.

---

## 1. Product definition

**Nova** is a client-side AI study companion:

- **Name:** always “Nova” (never “Nova AI”).
- **Personality:** one display name (Nova), multiple selectable *styles* (warm & devoted, patient professor, study buddy, calm mentor, focused coach, clear & neutral).
- **BYOK (Bring Your Own Key):** user pastes free-tier API keys; the app has **no backend** and **zero inference cost** for the developer.
- **Offline-first:** all lessons, quizzes, progress, and theme work **without internet**. Only live Nova replies need network + a key.
- **Context-aware:** Nova always knows nickname, gender preferences, current screen/course/topic/unit, optional highlighted text, and recent chat turns.
- **Concise-first:** answer briefly and intelligently, then offer a soft “want more?” prompt.
- **Dual mode:** study questions → teach; casual chat → stay in personality without forcing lessons.

---

## 2. Non-negotiable architecture rules

1. **No server for chat.** HTTP from the device straight to provider APIs.
2. **Keys only on device** (local storage). Never log keys.
3. **Lessons do not depend on AI.** If AI is down, studying continues.
4. **Personalization is data-driven** (nickname, genders, personality id) — not hard-coded to one user.
5. **Markdown rendered, not shown raw.** Prefer Unicode for exponents/indices (x², H₂O, v₀).
6. **Multi-provider fallback:** if one key fails (rate limit, auth, timeout), try the next automatically.
7. **Show “Powered by {Provider}”** under successful replies (muted).

---

## 3. User profile (onboarding + settings)

Collect and persist:

| Field | Values | Use |
|--------|--------|-----|
| Nickname | string | Greetings + every system prompt |
| User gender | female / male / unspecified | Tone personalization |
| AI gender presentation | female / male / neutral | How Nova presents |
| Personality id | e.g. `affectionate_nova` | System flavor text |
| Preferred provider | `auto` or provider id | Fallback order |

**Onboarding flow (suggested):**

1. Nickname  
2. User gender  
3. AI gender  
4. Personality (all labeled as Nova + style)  
5. “A few more settings… Nova is ready” → **Complete AI settings now** (open Settings → keys) or **Later**

Remind the user they can change everything in Settings.

---

## 4. Persona catalog pattern

```text
AiPersona {
  id, name: "Nova", shortLabel, description, systemFlavor
}
```

Every persona **`name` is `"Nova"`**. Only `shortLabel` and `systemFlavor` change.

Example styles:

- Warm & devoted (affectionate, supportive tutor)
- Patient professor
- Cheerful study buddy
- Calm mentor
- Focused coach
- Clear & neutral

Store `personality id` only; resolve flavor at request time.

---

## 5. System prompt contract (build every request)

Assemble a system prompt that always includes:

1. **Identity:** “Your name is Nova (never Nova AI).” + selected `systemFlavor`.  
2. **AI gender presentation** line.  
3. **User gender** line (respectful, not heavy-handed).  
4. **Address user as `**{nickname}**` only.**  
5. **Response style rules:**
   - Concise intelligent answer first  
   - Then a soft deepen prompt (step-by-step / analogy / quick check)  
   - Conversation mode vs study mode detection  
   - Light Markdown; Unicode for math indices  
6. **Context block:** page, course, topic, unit, optional highlight/problem (clip long text ~1200 chars).

Keep the prompt moderately short for latency.

---

## 6. Multi-provider BYOK engine

### Providers (example set)

| Id | API style | Notes |
|----|-----------|--------|
| Gemini | Google `generateContent` + `systemInstruction` | Free AI Studio key |
| Groq | OpenAI-compatible chat completions | Very fast |
| OpenRouter | OpenAI-compatible | Use free model ids when possible |
| Cerebras | OpenAI-compatible | Fast inference free tier |

### Engine algorithm

1. Collect providers that have a non-empty local key.  
2. Order by user preference, else default order (e.g. Gemini → Groq → Cerebras → OpenRouter).  
3. For each provider:
   - Call with timeout (~25–30s).  
   - On success with non-empty text → return `{ text, poweredByLabel }`.  
   - On rate limit / invalid key / HTTP error / timeout → **next provider**.  
4. If none work → friendly message (offline vs bad keys vs rate limits).  
5. If **no keys at all** → block chat with guidance to Settings (do not crash).

### Request hygiene (latency)

- Trim conversation history (~ last 10 turns).  
- **Do not duplicate** the current user message in history.  
- Cap `max_tokens` / `maxOutputTokens` (e.g. 1024).  
- Prefer fast models (Flash / small free models).  
- Optional Gemini model fallback list if one model id 404s.

### Client-side only

Settings UI:

- Separate masked key fields + show/hide  
- Expandable **How to get your key?** with accurate, non-tech steps + open official URL  
- Preferred provider dropdown including **Auto**

---

## 7. Chat UX requirements

- Thread keyed by context (home / course / unit).  
- Persist last N messages locally (Hive or equivalent) for offline **re-read**.  
- **Long-press** message → Copy; **Edit** only on **most recent user** message.  
- Edit removes that user message **and** following assistant reply; regenerates on send.  
- App bar: clear/recycle chat (confirm), title **Nova**.  
- Render assistant text with Markdown + light sanitization (no raw `**` junk).  
- Loading state: “Nova is thinking…”.  
- Optional: stream tokens later; not required for v1.

---

## 8. Offline rule (must remain intact)

| Feature | Offline |
|---------|---------|
| Course content, diagrams, quizzes | Yes |
| Progress, streaks, last lesson | Yes |
| Theme, profile, onboarding flags | Yes |
| Saved chat transcripts | Yes (read) |
| Live Nova completion | **No** (needs network + key) |

When offline, Nova returns a kind message that **study content still works**.

Never gate lesson navigation on AI availability.

---

## 9. Suggested module map

```text
services/
  storage_service.dart      # profile, keys, progress, chat threads
  persona_catalog.dart      # Nova styles
  ai_providers.dart         # provider metadata + guides
  ai_service.dart           # prompt build + fallback calls
screens/
  onboarding_screen.dart
  settings_screen.dart      # AI keys live HERE (not inside chat only)
  nova_chat_screen.dart
widgets/
  nova_message_body.dart    # Markdown + sanitize
```

---

## 10. Acceptance checklist

- [ ] App usable with airplane mode except live chat  
- [ ] Zero keys → clear Settings guidance  
- [ ] One bad key + one good key → auto fallback success  
- [ ] Nickname appears in greetings and model address  
- [ ] Gender and personality change behavior after Settings update  
- [ ] Concise answer + deepen offer on study questions  
- [ ] Casual “hey” does not force a lecture  
- [ ] Long-press copy/edit works; edit regenerates  
- [ ] Clear chat only affects current thread  
- [ ] “Powered by …” shows on success  
- [ ] No raw markdown junk in bubbles  

---

## 11. Copy-paste master prompt

```text
Implement a client-side BYOK AI tutor named Nova for a mobile study app.

Rules:
- Name is always “Nova”, never “Nova AI”.
- No backend. Users paste free-tier API keys (Gemini, Groq, OpenRouter, Cerebras). Keys stay on device.
- Offline-first: all lessons/quizzes/progress work without network. Only live chat needs internet + a key.
- Onboarding + Settings: nickname, user gender, Nova gender presentation, Nova personality style (all named Nova), optional preferred provider.
- System prompt every request: identity + personality flavor + genders + nickname + concise-first answer policy + soft “want more?” offer + conversation-vs-study mode + page/course/unit/highlight context.
- Multi-provider automatic fallback on rate limit, auth error, timeout, or empty response. Show muted “Powered by {Provider}” under successful replies.
- Chat UX: threaded history persisted locally; long-press Copy; Edit only latest user message and delete following assistant reply then regenerate; clear-chat for current thread; Markdown rendering with sanitization and Unicode-friendly math indices.
- Latency hygiene: trim history, no duplicate user message, modest max tokens, short timeouts per provider, fast default models.
- Settings hold API key management with non-technical step-by-step “how to get key” guides and official links—not buried only inside the chat screen.
- Never block studying if AI is unavailable; show a friendly offline/no-key message instead.
```

---

## 12. Origin note

This specification reflects the Nova implementation used in the **PGD Physics** Flutter app (ABUAD PGD companion): Riverpod optional, Hive + SharedPreferences, Flutter Markdown, direct `http` provider calls.

Adapt storage and UI toolkit freely; keep the **behavioral contract** above stable so Nova feels the same across future apps.
