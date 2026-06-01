# My Edge — AI Skills Hub

A personal, single-file job-search command center for people repositioning into **AI-native MOPs / GTM Engineering roles**.

Built from a real career coaching session. Zero dependencies. Runs entirely in your browser. All data stays local.

**[→ Live demo](https://noahsa11.github.io/my-edge/)**

---

## What it is

A dark, high-contrast single-page app with six sections:

| Section | What it does |
|---|---|
| **My Unique Edge** | Write and refine your USP, differentiation angle, and 30-second pitch |
| **n8n Learning** | Checklist + progress bar for building n8n skills from scratch |
| **AI Portfolio** | Log every automation project you ship — personal projects count |
| **Interview Prep** | Vision pitch builder + scripted gap-answer templates |
| **Elana's Insights** | 9 key insights from a senior recruiter call |
| **6-Week GTM Plan** | Week-by-week build plan: Clay → Make → HubSpot → n8n → Python |

Everything saves automatically to `localStorage`. No server, no account, no data leaves your machine.

---

## How to use it

### Option A — GitHub Pages (zero setup)

Fork this repo → Settings → Pages → deploy from `main` → done.  
Your personal instance is live at `https://yourusername.github.io/my-edge/`

### Option B — Local

```bash
git clone https://github.com/NoahSA11/my-edge.git
cd my-edge
open index.html   # macOS
start index.html  # Windows
```

No build step. No `npm install`. Just open the file.

---

## Customising it for your situation

All content lives directly in `index.html`. The sections you'd want to change:

- **Elana's Insights** — replace with insights from your own calls or research
- **6-Week Plan** — the week cards are self-contained; swap the projects for your actual learning goals
- **Sidebar footer** — update the name and date to your own reference call
- **USP placeholders** — the placeholder text reflects my situation; rewrite for yours

The design system uses CSS custom properties at the top of `<style>` — swap the accent color (`--accent`) and you're done.

---

## Design

**Signal** direction: full dark (`#0D0D10`), violet accent (`#818CF8`), [Space Grotesk](https://fonts.google.com/specimen/Space+Grotesk) + [Space Mono](https://fonts.google.com/specimen/Space+Mono).

- Elevation-only card system — no borders as decoration, background levels only
- Progress bars glow with `box-shadow`
- Section transitions use `fadeUp` keyframe animation
- All interactive elements (checkboxes, workflow items, insight cards) have motion

---

## Built with

- Vanilla HTML/CSS/JS — no framework, no build tool
- Google Fonts (Space Grotesk + Space Mono)
- `localStorage` for persistence
- Built with [Claude Code](https://claude.ai/claude-code)

---

## License

MIT — take it, fork it, make it yours. See [LICENSE](./LICENSE).

---

*Started from a real job search. The insights in section 5 came from a coaching call with Elana Shama on May 31, 2026. Replace them with your own.*
