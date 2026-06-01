# Design System

## Theme

Signal dark. Full-dark interface with elevation-only card system (no decorative borders as depth cues). Accent color used exclusively for state and hierarchy — never decoration. Glow effects mark active state and completion. The UI disappears into the task.

## Color Palette

| Token | Value | Role |
|---|---|---|
| `--page` | `#0D0D10` | Page background |
| `--sidebar-bg` | `#0A0A0D` | Sidebar (3 values darker than page) |
| `--card` | `#17171C` | Card surface (elevation level 1) |
| `--elevated` | `#1E1E24` | Inputs, hover targets, elevated elements (level 2) |
| `--hover` | `#22222A` | Hover state fill |
| `--accent` | `#818CF8` | Primary accent: indigo-400, used for active state, focus rings, progress |
| `--accent-dim` | `rgba(129,140,248,0.12)` | Accent tint fill (active nav bg, focus ring fill) |
| `--accent-glow` | `rgba(129,140,248,0.35)` | Glow shadow on accent elements |
| `--accent-deep` | `#4F46E5` | Deeper accent for pressed/active |
| `--done` | `#34D399` | Success / completed state (emerald-400) |
| `--done-dim` | `rgba(52,211,153,0.12)` | Done tint |
| `--done-glow` | `rgba(52,211,153,0.3)` | Done glow shadow |
| `--warn` | `#FBBF24` | Warning / in-progress (amber-400) |
| `--warn-dim` | `rgba(251,191,36,0.12)` | Warning tint |
| `--danger` | `#F87171` | Error / destructive (red-400) |
| `--danger-dim` | `rgba(248,113,113,0.12)` | Danger tint |
| `--text` | `#F1F1F4` | Primary text |
| `--text-sub` | `#A1A1AA` | Secondary text (zinc-400) |
| `--text-muted` | `#52525B` | Tertiary / placeholder (zinc-600) |
| `--border` | `#2A2A32` | Default border |
| `--border-hi` | `#3A3A45` | Elevated border (hover, focused elements) |

**Color strategy:** Restrained. Accent used for state only. Done (green) and warn (amber) carry semantic meaning exclusively — never used decoratively. The accent `#818CF8` never appears as a background fill, only as text, icon color, border rule, or glow.

## Typography

| Role | Family | Weight | Size | Notes |
|---|---|---|---|---|
| Body / UI | Space Grotesk | 400–700 | 12–16px | All labels, body text, buttons |
| Data / Mono | Space Mono | 400, 700 | 10–13px | Numbers, percentages, timestamps, code labels, card-title eyebrows |

**Scale:** Fixed rem, not fluid. Product UI viewed at consistent DPI.
- Section titles: 24px / 700 / -0.5px tracking
- Card titles: 10px / 600 / Space Mono / 1.2px tracking / uppercase
- Body: 13–14px / 400–500
- Sub labels: 12px / 500

**Line length:** 65–75ch on prose (section-desc capped at max-width: 640px).

## Layout

**App shell:** Fixed sidebar (224px) + scrollable main content. `height: 100vh; overflow: hidden` on body; `overflow-y: auto` on `.main`.

**Content max-width:** 900px for section content.

**Grid:** `.grid-2` (1fr 1fr, 14px gap), `.grid-3` (1fr 1fr 1fr, 12px gap).

**Spacing rhythm:** 14–20px card padding, 28–36px section padding, 12–16px between cards.

**Border radius:** 10px on cards, 7px on inputs and buttons, 5px on tags and small elements. No radius above 12px anywhere.

## Components

### Sidebar
- Fixed 224px, `--sidebar-bg`, 1px right border
- Subtle SVG noise texture via `::after` pseudo-element
- Active nav: 2px left `--accent` rule + white label + `--accent-dim` gradient background fill fading right
- Nav hover: `--accent` ghost gradient at 4% opacity

### Cards
- Background `--card`, 1px `--border`, 10px radius
- No box-shadow — elevation is background level only
- Hover: border upgrades to `--border-hi`
- Card title: Space Mono, 10px, uppercase, 1.2px tracking, `--text-muted`

### Inputs (textarea, text input)
- Background `--elevated`, 1px `--border`, 7px radius
- Focus: 1px `--accent` border + `0 0 0 3px --accent-dim` ring + `0 0 16px --accent-glow` outer glow

### Checkboxes
- Custom — `appearance: none`, 16px, 4px radius
- Checked: `--done` fill + 1px `--done` border + `0 0 8px --done-glow` glow
- Checkmark: 2px solid `#0D0D10` rotated 45°

### Progress Bars
- Height: 3px (thin signal line)
- Track: `--border`
- Fill: `--accent` + `box-shadow: 0 0 10px --accent-glow`
- Transition: `width 0.6s cubic-bezier(0.34, 1.56, 0.64, 1)` (slight overshoot)

### Buttons
- Primary: `--accent` fill, `#0D0D10` text. Hover: `#A5B4FC`, `translateY(-1px)`, glow shadow
- Ghost: transparent + 1px `--border`. Hover: `--elevated` fill + `--border-hi` border
- Icon: transparent, `--text-muted`. Hover: `--danger` text + `--danger-dim` fill

### Tags (tool badges)
- 5px radius, Space Mono, 10px, uppercase, 0.4px tracking
- Tinted using tool color at 12% opacity: amber (n8n), accent (claude), blue (make), red (zapier), muted (other)

### Status Dots
- 7px circle
- Done: `--done` + `0 0 6px --done-glow`
- WIP: `--warn` + `0 0 6px amber-glow`
- Idea: `--text-muted`, no glow

### Gap Accordions (Interview Prep)
- Header background `--card`, body background `--elevated`
- Template block: 3px left `--accent` rule + `--accent-dim` fill

### Insight Cards
- 3px left border (accent or warn for Insight 8)
- Hover: `translateX(3px)` + border upgrades to full `--accent` + `-4px 0 20px rgba(129,140,248,0.1)` left glow

## Motion

**Section transitions:** `fadeUp` keyframe — `opacity: 0; transform: translateY(10px)` → normal, 0.22s ease.

**Hover interactions:**
- Workflow items: `translateX(2px)`, 0.15s ease
- Insight cards: `translateX(3px)`, 0.18s ease
- Resource links: `translateX(3px)`, 0.15s ease
- Resource/link icon emoji: `scale(1.15)` on nav-item hover, 0.2s ease

**Progress bars:** `cubic-bezier(0.34, 1.56, 0.64, 1)` overshoot, 0.6s — "signal lock" feel

**Buttons:** Primary hover `translateY(-1px)` + glow, 0.18s. Active: `translateY(0)`.

**Add form:** `fadeUp` 0.18s on toggle open. Gap body: `fadeUp` 0.18s on expand.

**Reduced motion:** All transforms should resolve instantly; opacity crossfades only. `@media (prefers-reduced-motion: reduce)` needed — **currently missing, gap to address.**

## Scrollbar

Custom webkit: 5px width, transparent track, `--border-hi` thumb, `--text-muted` on hover.

## Known Gaps

- `@media (prefers-reduced-motion: reduce)` not implemented — all animations play regardless
- No responsive/mobile layout — fixed 100vh with sidebar + overflow hidden breaks on small screens
- No keyboard navigation for section switching (nav items are divs, not buttons/links)
- No focus-visible styles on custom checkboxes
- `<select>` elements use system styling; inconsistent with the custom input vocabulary
