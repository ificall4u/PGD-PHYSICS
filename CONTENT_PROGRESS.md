# Content writing progress & roadmap

**Rules (mandatory):**
1. One course at a time  
2. One module prompt at a time, numeric order  
3. Full master-prompt depth — no thin stand-ins  
4. No UI / Nova / theme edits for content work  
5. No ASCII schematics; no SVG code blocks in lessons  
6. Prefer Unicode math; clean quizzes + keyTakeaways  
7. Update this file after every step  
8. Course audit after last module of each course  

**CI:** GitHub Actions APK workflow (trigger on push).

---

## Roadmap

| # | Course | File | Modules | Status |
|---|--------|------|---------|--------|
| 1 | PHY 701 Mathematical Methods | `phy701_content.dart` | 7 | **COMPLETE** |
| 2 | PHY 703 Analytical Mechanics | `phy703_content.dart` | 9 | **COMPLETE** |
| 3 | PHY 702 Electromagnetism | `phy702_content.dart` | 8 | **COMPLETE** |
| 4 | PHY 704 Quantum Physics | `phy704_content.dart` | 8 | **COMPLETE** |
| 5 | PHY 705 Intro Solid State Electronics | `phy705_content.dart` | 8 | **COMPLETE** |
| 6 | PHY 707 Digital Electronics | `phy707_content.dart` | 8 | **COMPLETE** |
| 7 | PHY 709 Devices Design & Fabrication | `phy709_content.dart` | 8 | **COMPLETE** |
| 8 | PHY 706 Measurement & Instrumentation | `phy706_content.dart` | — | Pending ← next |
| 9 | PHY 710 Vacuum & Thin Films | `phy710_content.dart` | — | Pending |
| 10 | PHY 708 Nuclear & Particle | `phy708_content.dart` | — | Pending |
| 11 | PHY 712 Energy Conversion & Storage | `phy712_content.dart` | — | Pending |
| 12 | PHY 799 PGD Research Project | `phy799_content.dart` | — | Pending |

Prompt packs: `content_prompts/PHY###/`  
Authoring rules: `CONTENT_AUTHORING.md`

---

## Completed course audits

| Course | Skeletons | Notes |
|--------|-----------|--------|
| PHY 701 | 0 | Math methods full |
| PHY 702 | 0 | EM full |
| PHY 703 | 0 | Analytical mechanics full |
| PHY 704 | 0 | Quantum full |
| PHY 705 | 0 | Solid-state electronics full |
| PHY 707 | 0 | Digital electronics full |
| PHY 709 | 0 | Devices & fabrication full |

---

## Diagnostics snapshot (this commit)

| Check | Result |
|-------|--------|
| phy701–705, 707, 709 skeletons | **0** |
| Brace/paren balance | **OK** |
| sample_courses wiring | All `buildPhy###()` present |
| Remaining (706, 708, 710, 712, 799) | Skeleton shells (expected) |

**Next step:** PHY 706 Module 01 only (read master + module prompt first).
