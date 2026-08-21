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
| 5 | PHY 705 Intro Solid State Electronics | `phy705_content.dart` | 8 | Pending ← next |
| 6 | PHY 707 Digital Electronics | `phy707_content.dart` | 8 | Pending |
| 7 | PHY 709 Devices Design & Fabrication | `phy709_content.dart` | 8 | Pending |
| 8 | PHY 706 Measurement & Instrumentation | `phy706_content.dart` | 8 | Pending |
| 9 | PHY 710 Vacuum & Thin Films | `phy710_content.dart` | 8 | Pending |
| 10 | PHY 708 Nuclear & Particle | `phy708_content.dart` | 8 | Pending |
| 11 | PHY 712 Energy Conversion & Storage | `phy712_content.dart` | 8 | Pending |
| 12 | PHY 799 PGD Research Project | `phy799_content.dart` | 4 | Pending |

Prompt packs: `content_prompts/PHY###/`  
Authoring rules: `CONTENT_AUTHORING.md`

---

## Completed course audits

### PHY 701 — COMPLETE
- Modules 01–07 filled; 0 skeletons
- ODEs/SL, Laplace, PDE, special functions, Dirac, Fourier, residues/Green

### PHY 703 — COMPLETE
- Modules 01–09 filled; 0 skeletons
- Conservative forces → continuum waves

### PHY 702 — COMPLETE
- Modules 01–08 filled; 0 skeletons
- Coulomb → Maxwell & spherical waves

### PHY 704 — COMPLETE
- Modules 01–08 filled; 0 skeletons
- State vectors → quantum statistical mechanics

---

## Diagnostics snapshot (latest)

| Check | Result |
|-------|--------|
| phy701–704 skeletons | 0 |
| Brace/paren balance | OK |
| sample_courses wiring | All buildPhy###() present |
| Remaining courses | Still skeleton shells (expected) |

**Next step:** PHY 705 Module 01 only (read `00_Master` + `01_Module1_*.txt` first).
