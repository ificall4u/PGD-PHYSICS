# Content prompts (source of truth for rewrite)

Each subfolder matches a course code. **You** upload improved Gemini/professor prompts here.

| Folder | Course |
|--------|--------|
| PHY701 | Mathematical Methods in Physics |
| PHY702 | Classical Mechanics |
| PHY703 | Electromagnetism |
| PHY704 | Quantum Mechanics |
| PHY705 | Solid State / Electronics Foundations |
| PHY706 | Electronics Laboratory / Instrumentation |
| PHY707 | Digital Electronics |
| PHY708 | Nuclear and Particle Physics |
| PHY709 | Electronic Devices and Fabrication |
| PHY710 | Computational / Applied Physics Methods |
| PHY712 | Energy Conversion and Storage |
| PHY799 | Research Project |

App shells already exist under `lib/data/phyXXX_content.dart` as **modules → units** with placeholder text.  
Do not redesign UI to write content — only replace `content`, `keyTakeaways`, and `quiz` fields (and module titles if the new outline demands it).
