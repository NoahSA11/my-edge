# Plan 01 — My Learning: Template-Based GTM Plan Generator

**Stack:** n8n + Clay + HubSpot (primary stack; 7 additional tools as stubs)  
**Timeframe:** 6-week default (4 / 6 / 8 / 12 week options)  
**Approach:** Zero-dependency template engine. No API key, no server, works offline. Pure JS + localStorage.

---

## Phase 0: Documentation Discovery — COMPLETE

Subagents ran 22 web searches. All resources verified with source URLs.

### Allowed APIs / Verified Resources

**n8n**
- Docs: `https://docs.n8n.io/`
- Quickstart: `https://docs.n8n.io/try-it-out/quickstart/`
- Level 1 course (free, ~2h): `https://docs.n8n.io/courses/level-one/`
- Level 2 course (free): `https://docs.n8n.io/courses/level-two/`
- AI workflow tutorial: `https://docs.n8n.io/advanced-ai/intro-tutorial/`
- Official YouTube: `https://www.youtube.com/c/n8n-io`
- Tutorials playlist: `https://www.youtube.com/playlist?list=PLlET0GsrLUL5HKJk1rb7t32sAs_iAlpZe`
- Beginners complete course (2025): `https://www.youtube.com/playlist?list=PLYLEmQupIzOEEvgtBduSgYLaug7LKqlSo`
- Certification: Community badge only (no Credly). Badge awarded after Level 1 quiz.

**Clay**
- Docs: `https://university.clay.com/docs`
- Clay 101 course: `https://university.clay.com/courses/clay-101`
- All courses: `https://university.clay.com/courses`
- Certifications: **PAUSED** as of Jun 2026. Content still accessible.
- Free plan: 100 credits/month, 200 rows/table — sufficient for beginner exercises
- Official YouTube: `https://www.youtube.com/@GrowWithClay`
- Clay 101 YT playlist: `https://www.youtube.com/playlist?list=PLOk1iliTgMrWWrQOFtK69xzHkBhF75Jjm`

**HubSpot**
- Academy: `https://academy.hubspot.com/courses`
- CRM Training course: `https://academy.hubspot.com/courses/set-up-your-hubspot-crm-for-growth`
- Sales Hub cert (free): `https://academy.hubspot.com/courses/hubspot-sales-hub-software`
- Reporting cert (free): `https://academy.hubspot.com/courses/hubspot-reporting`
- Cert overview: `https://academy.hubspot.com/certification-overview`
- **Caveat:** Cert practical exercises need Pro sub. Exams + videos are free.
- Official YouTube: `https://www.youtube.com/@HubSpot-CRM/featured`
- Beginner tutorial: `https://www.youtube.com/watch?v=8VUWyMVK2Uc`

### Anti-Patterns to Avoid
- Do NOT invent unit resource URLs. Every `resource_url` must be from the verified list above.
- Do NOT claim Clay certifications are available — they are paused.
- Do NOT claim HubSpot hands-on cert exercises work on free plan.
- n8n badge is community-only — never say "n8n certification."

---

## Current State (from section audit)

File: `my-edge/index.html`  
Section: lines 1026–1123, `id="section-n8n"`  
Hardcoded n8n IDs: `n8n1`–`n8n8`, `n8n-pct`, `n8n-bar`, `n8n-notes`

Three JS functions reference these IDs directly:
- `updateProgress()` — hardcoded loop over `n8n1`–`n8n8`, writes to `n8n-pct` and `n8n-bar`
- `loadAll()` — restores `n8n1`–`n8n8` checkboxes + `n8n-notes` textarea from localStorage
- `toggleCheck(item, id)` — generic but called with hardcoded `'n8n1'` etc.

All must be updated to dynamic IDs.

---

## Phase 1: CURRICULA Data Structure

**Goal:** Build the verified JavaScript `CURRICULA` object. Plant it in a `<script>` block near the top of the JS section.

### What to implement

In `index.html`, just before the main `<script>` block (or inside it, before any function definitions), add:

```javascript
// ── MY LEARNING: CURRICULA ──────────────────────────────
const CURRICULA = {
  n8n: {
    label: 'n8n',
    icon: '⚡',
    tagline: 'Visual automation with API connections — the GTM engineering differentiator',
    units: [
      // WEEK 1: Foundation
      { title: 'Set up n8n cloud free account', hours: 0.5, type: 'setup',
        resource: 'n8n Quickstart', resource_url: 'https://docs.n8n.io/try-it-out/quickstart/' },
      { title: 'Build first workflow (Hacker News → Discord)', hours: 2, type: 'project',
        resource: 'n8n Level 1 Course', resource_url: 'https://docs.n8n.io/courses/level-one/' },
      { title: 'Complete Level 1 Course — Part 1 (nodes, triggers)', hours: 1.5, type: 'course',
        resource: 'n8n Level 1 Course', resource_url: 'https://docs.n8n.io/courses/level-one/' },
      // WEEK 2: Connections
      { title: 'HTTP Request node — connect any API', hours: 2, type: 'skill',
        resource: 'n8n Docs', resource_url: 'https://docs.n8n.io/' },
      { title: 'Complete Level 1 Course — Part 2 (expressions, filters)', hours: 1.5, type: 'course',
        resource: 'n8n Level 1 Course', resource_url: 'https://docs.n8n.io/courses/level-one/' },
      { title: 'Pass Level 1 quiz → earn community badge', hours: 0.5, type: 'milestone',
        resource: 'n8n Level 1 Course', resource_url: 'https://docs.n8n.io/courses/level-one/' },
      // WEEK 3: GTM-relevant builds
      { title: 'Build lead notification workflow (webhook → CRM row → Slack)', hours: 3, type: 'project',
        resource: 'n8n Tutorials', resource_url: 'https://www.youtube.com/playlist?list=PLlET0GsrLUL5HKJk1rb7t32sAs_iAlpZe' },
      { title: 'Add error handling + retry logic to a workflow', hours: 1.5, type: 'skill',
        resource: 'n8n Docs', resource_url: 'https://docs.n8n.io/' },
      // WEEK 4: AI Workflows
      { title: 'AI workflow tutorial — build a chat agent', hours: 2, type: 'course',
        resource: 'n8n AI Tutorial', resource_url: 'https://docs.n8n.io/advanced-ai/intro-tutorial/' },
      { title: 'Start Level 2 course — sub-workflows & advanced nodes', hours: 2, type: 'course',
        resource: 'n8n Level 2 Course', resource_url: 'https://docs.n8n.io/courses/level-two/' },
      // WEEK 5: Polish + portfolio
      { title: 'Build an AI-powered email enrichment workflow', hours: 3, type: 'project',
        resource: 'n8n Tutorials', resource_url: 'https://www.youtube.com/playlist?list=PLlET0GsrLUL5HKJk1rb7t32sAs_iAlpZe' },
      { title: 'Complete Level 2 course', hours: 2, type: 'course',
        resource: 'n8n Level 2 Course', resource_url: 'https://docs.n8n.io/courses/level-two/' },
      // WEEK 6: Interview-ready
      { title: 'Have 3+ workflows documented with screenshots', hours: 2, type: 'milestone',
        resource: 'n8n Workflow Library', resource_url: 'https://n8n.io/workflows/' },
      { title: 'Practice explaining a workflow out loud (record yourself)', hours: 1, type: 'interview',
        resource: 'n8n Community', resource_url: 'https://community.n8n.io' },
    ]
  },

  clay: {
    label: 'Clay',
    icon: '🧱',
    tagline: 'GTM data enrichment and outbound automation — FETE: Find, Enrich, Transform, Export',
    units: [
      { title: 'Create free Clay account (100 credits/month)', hours: 0.5, type: 'setup',
        resource: 'Clay University', resource_url: 'https://university.clay.com/' },
      { title: 'Clay 101: Your First GTM Use Case', hours: 1.5, type: 'course',
        resource: 'Clay 101 Course', resource_url: 'https://university.clay.com/courses/clay-101' },
      { title: 'Build a lead list from scratch (50-row ICP search)', hours: 2, type: 'project',
        resource: 'Clay 101 Course', resource_url: 'https://university.clay.com/courses/clay-101' },
      { title: 'Enriching Company Data lesson', hours: 1, type: 'course',
        resource: 'Clay University', resource_url: 'https://university.clay.com/lessons/enriching-company-data' },
      { title: 'Waterfall enrichment — email + LinkedIn URL on 50 leads', hours: 2, type: 'project',
        resource: 'Clay 101 Playlist', resource_url: 'https://www.youtube.com/playlist?list=PLOk1iliTgMrWWrQOFtK69xzHkBhF75Jjm' },
      { title: 'Enriching with Claygent (AI web scraper)', hours: 1.5, type: 'course',
        resource: 'Clay University', resource_url: 'https://university.clay.com/lessons/enriching-with-claygent' },
      { title: 'Run Claygent on 20-company list for custom data point', hours: 2, type: 'project',
        resource: 'Clay University', resource_url: 'https://university.clay.com/lessons/enriching-with-claygent' },
      { title: 'Browse all Clay University courses + pick one advanced topic', hours: 1, type: 'course',
        resource: 'Clay University', resource_url: 'https://university.clay.com/courses' },
      { title: 'Build export → Google Sheets or CSV for a mini campaign', hours: 2, type: 'project',
        resource: 'Clay Livestreams', resource_url: 'https://www.clay.com/livestreams' },
      { title: 'Watch 2 GTM livestreams (outbound or inbound focus)', hours: 2, type: 'course',
        resource: 'Clay Livestreams', resource_url: 'https://www.clay.com/livestreams' },
      { title: 'Can explain FETE framework + 1 real use case in interview', hours: 1, type: 'interview',
        resource: 'Clay University', resource_url: 'https://university.clay.com/' },
    ]
  },

  hubspot: {
    label: 'HubSpot',
    icon: '🔶',
    tagline: 'CRM operations and reporting — free tier is enough to build real skills',
    units: [
      { title: 'Create HubSpot free account', hours: 0.5, type: 'setup',
        resource: 'HubSpot Academy', resource_url: 'https://academy.hubspot.com/enroll-in-hubspot-academy' },
      { title: 'CRM Training course — set up for growth', hours: 2, type: 'course',
        resource: 'HubSpot CRM Training', resource_url: 'https://academy.hubspot.com/courses/set-up-your-hubspot-crm-for-growth' },
      { title: 'Import 20 sample contacts + create a list segment', hours: 1.5, type: 'project',
        resource: 'HubSpot Knowledge Base', resource_url: 'https://knowledge.hubspot.com/' },
      { title: 'Start Sales Hub Software Certification (videos only)', hours: 2, type: 'course',
        resource: 'HubSpot Sales Cert', resource_url: 'https://academy.hubspot.com/courses/hubspot-sales-hub-software' },
      { title: 'Build a custom deal pipeline with 5 stages', hours: 1.5, type: 'project',
        resource: 'HubSpot Knowledge Base', resource_url: 'https://knowledge.hubspot.com/' },
      { title: 'Complete Sales Hub Cert videos + take exam', hours: 2, type: 'milestone',
        resource: 'HubSpot Sales Cert', resource_url: 'https://academy.hubspot.com/courses/hubspot-sales-hub-software' },
      { title: 'Start Reporting Certification', hours: 1.5, type: 'course',
        resource: 'HubSpot Reporting Cert', resource_url: 'https://academy.hubspot.com/courses/hubspot-reporting' },
      { title: 'Build dashboard: contact source + deal funnel + activity log', hours: 2, type: 'project',
        resource: 'HubSpot Reporting Cert', resource_url: 'https://academy.hubspot.com/courses/hubspot-reporting' },
      { title: 'Complete Reporting Cert + earn badge', hours: 1, type: 'milestone',
        resource: 'HubSpot Reporting Cert', resource_url: 'https://academy.hubspot.com/courses/hubspot-reporting' },
      { title: 'Watch HubSpot CRM Beginners Tutorial (full walkthrough)', hours: 2, type: 'course',
        resource: 'YouTube Tutorial', resource_url: 'https://www.youtube.com/watch?v=8VUWyMVK2Uc' },
      { title: 'Set up a follow-up task sequence for a contact', hours: 1, type: 'project',
        resource: 'HubSpot Knowledge Base', resource_url: 'https://knowledge.hubspot.com/' },
      { title: 'Can explain HubSpot data model (contacts/companies/deals) in interview', hours: 1, type: 'interview',
        resource: 'HubSpot Cert Overview', resource_url: 'https://academy.hubspot.com/certification-overview' },
    ]
  },

  // ── STUB TOOLS (add units in Phase 1b or future sessions) ──────────────
  make: {
    label: 'Make', icon: '🔗',
    tagline: 'Visual automation — wider job market reach than n8n, lower technical ceiling',
    units: [] // TODO: populate in future session
  },
  sql: {
    label: 'SQL', icon: '🗃️',
    tagline: 'Required for any data pipeline work — the hidden filter in GTM Eng job specs',
    units: []
  },
  python: {
    label: 'Python', icon: '🐍',
    tagline: 'API calls, enrichment scripts, automation — bridges GTM ops and engineering',
    units: []
  },
  segment: {
    label: 'Segment', icon: '📊',
    tagline: 'CDP data layer — growing fast in GTM Eng stacks',
    units: []
  },
  claude_api: {
    label: 'Claude API', icon: '🤖',
    tagline: 'Prompt engineering + API integration — the AI-native GTM Eng skill',
    units: []
  },
  zapier: {
    label: 'Zapier', icon: '⚡',
    tagline: 'Entry-level automation — still on half of GTM Eng job descriptions',
    units: []
  },
  salesforce: {
    label: 'Salesforce', icon: '☁️',
    tagline: 'Enterprise requirement — SFDC flows + fields + admin basics',
    units: []
  },
};
```

### Verification checklist
- [ ] Grep `CURRICULA` in index.html — exists once
- [ ] Every `resource_url` in n8n/clay/hubspot units appears in Phase 0 verified list
- [ ] Stub tools have empty `units: []` arrays, not invented units
- [ ] No unit claims "Clay certification available" (paused)
- [ ] No unit claims HubSpot cert exercises work on free plan

---

## Phase 2: Plan Generator Engine

**Goal:** Pure JS function that distributes units across weeks. No API, no randomness — deterministic so localStorage-saved progress always aligns with the same plan.

### What to implement

Add these functions in the `<script>` block, after the CURRICULA object:

```javascript
// ── PLAN ENGINE ─────────────────────────────────────────
/**
 * generatePlan(toolKey, weeks, hoursPerWeek)
 * Returns array of week objects: [{week, units:[{...unit, id}], totalHours}]
 * Distribution: greedy — fill each week to capacity, never split a unit.
 * Unit gets a stable ID = `${toolKey}_w${weekNum}_u${indexInWeek}` for localStorage.
 */
function generatePlan(toolKey, weeks, hoursPerWeek) {
  const curriculum = CURRICULA[toolKey];
  if (!curriculum || !curriculum.units.length) return null;

  const plan = [];
  let unitQueue = [...curriculum.units];
  let unitGlobalIdx = 0;

  for (let w = 1; w <= weeks; w++) {
    const weekUnits = [];
    let hoursRemaining = hoursPerWeek;

    while (unitQueue.length && unitQueue[0].hours <= hoursRemaining + 0.5) {
      // +0.5 tolerance: don't strand a 30-min unit at week boundary
      const unit = unitQueue.shift();
      hoursRemaining -= unit.hours;
      weekUnits.push({
        ...unit,
        id: `${toolKey}_w${w}_u${unitGlobalIdx++}`,
        done: false
      });
    }

    // If week has capacity but next unit is too large, try next smaller unit
    // (simple look-ahead: swap next-fitting unit to fill partial hours)
    if (unitQueue.length && hoursRemaining >= 0.5) {
      const fitIdx = unitQueue.findIndex(u => u.hours <= hoursRemaining + 0.25);
      if (fitIdx > 0) {
        const unit = unitQueue.splice(fitIdx, 1)[0];
        weekUnits.push({
          ...unit,
          id: `${toolKey}_w${w}_u${unitGlobalIdx++}`,
          done: false
        });
      }
    }

    plan.push({ week: w, units: weekUnits, totalHours: hoursPerWeek - hoursRemaining });
  }

  // Overflow: if units remain after all weeks, append to last week
  while (unitQueue.length) {
    const unit = unitQueue.shift();
    plan[plan.length - 1].units.push({
      ...unit,
      id: `${toolKey}_w${weeks}_u${unitGlobalIdx++}`,
      done: false
    });
  }

  return plan;
}

// Active plan state
let activePlan = null;
let activePlanKey = ''; // e.g. 'n8n_6_5' — tool_weeks_hours for localStorage key

function loadPlanProgress(plan, toolKey, weeks, hoursPerWeek) {
  const storagePrefix = `myedge_plan_${toolKey}_${weeks}_${hoursPerWeek}_`;
  plan.forEach(week => {
    week.units.forEach(unit => {
      const saved = localStorage.getItem(storagePrefix + unit.id);
      if (saved === 'true') unit.done = true;
    });
  });
  return plan;
}

function savePlanUnit(unitId, done, toolKey, weeks, hoursPerWeek) {
  const storagePrefix = `myedge_plan_${toolKey}_${weeks}_${hoursPerWeek}_`;
  localStorage.setItem(storagePrefix + unitId, String(done));
}
```

### Verification checklist
- [ ] Call `generatePlan('n8n', 6, 5)` in browser console — returns 6 week objects
- [ ] Total units distributed == `CURRICULA.n8n.units.length`
- [ ] No week exceeds `hoursPerWeek + 0.5`
- [ ] Calling twice with same args returns same unit-to-week assignment (deterministic)
- [ ] localStorage keys don't collide across different tool/week/hour combos

---

## Phase 3: UI Replacement — My Learning Section

**Goal:** Replace the hardcoded n8n HTML (lines 1026–1123) with a dynamic generator UI. Three states: (1) picker, (2) generating, (3) rendered plan.

### What to implement

Replace the entire `<div class="section" id="section-n8n">` block with:

```html
<!-- ② MY LEARNING -->
<div class="section" id="section-n8n">
  <div class="section-header">
    <div class="section-title">My Learning</div>
    <div class="section-desc">Pick a GTM skill to master. Get a free, week-by-week plan with verified resources — no account, no API key needed.</div>
  </div>

  <!-- STATE 1: Picker -->
  <div id="learning-picker">
    <div class="card" style="margin-bottom:16px">
      <div class="card-title">Choose Your Tool</div>
      <div id="tool-grid" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:10px;margin-top:12px">
        <!-- JS renders tool buttons here via renderToolPicker() -->
      </div>
    </div>

    <div class="grid-2" style="margin-bottom:16px">
      <div class="card">
        <div class="card-title">How Many Weeks?</div>
        <div style="display:flex;gap:8px;flex-wrap:wrap;margin-top:12px" id="weeks-options">
          <button class="option-btn active" data-value="4" onclick="selectOption(this,'weeks')">4 weeks</button>
          <button class="option-btn active" data-value="6" onclick="selectOption(this,'weeks')">6 weeks</button>
          <button class="option-btn" data-value="8" onclick="selectOption(this,'weeks')">8 weeks</button>
          <button class="option-btn" data-value="12" onclick="selectOption(this,'weeks')">12 weeks</button>
        </div>
      </div>
      <div class="card">
        <div class="card-title">Hours Per Week?</div>
        <div style="display:flex;gap:8px;flex-wrap:wrap;margin-top:12px" id="hours-options">
          <button class="option-btn" data-value="3" onclick="selectOption(this,'hours')">~3h</button>
          <button class="option-btn active" data-value="5" onclick="selectOption(this,'hours')">~5h</button>
          <button class="option-btn" data-value="10" onclick="selectOption(this,'hours')">~10h</button>
          <button class="option-btn" data-value="20" onclick="selectOption(this,'hours')">20h+</button>
        </div>
      </div>
    </div>

    <button class="btn btn-primary" id="generate-btn" onclick="handleGeneratePlan()" style="opacity:0.4;cursor:not-allowed" disabled>
      Generate My Plan
    </button>
  </div>

  <!-- STATE 2: Generated Plan (hidden until generated) -->
  <div id="learning-plan" style="display:none">
    <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;flex-wrap:wrap;gap:12px">
      <div>
        <div class="section-title" id="plan-tool-title" style="font-size:20px"></div>
        <div style="font-size:13px;color:var(--text-sub);margin-top:4px" id="plan-meta"></div>
      </div>
      <div style="display:flex;gap:10px;align-items:center">
        <div style="font-size:12px;color:var(--text-sub)">Progress</div>
        <div style="font-size:18px;font-weight:700;color:var(--accent);font-family:'Space Mono',monospace" id="plan-pct">0%</div>
        <button class="btn btn-ghost" onclick="resetPlan()" style="font-size:12px;padding:6px 12px">← Change Tool</button>
      </div>
    </div>

    <div class="progress-wrap" style="margin-bottom:24px">
      <div class="progress-bar">
        <div class="progress-fill" id="plan-bar" style="width:0%"></div>
      </div>
    </div>

    <div id="plan-weeks">
      <!-- JS renders week cards here via renderPlan() -->
    </div>
  </div>
</div>
```

CSS additions needed (add to `<style>` block):

```css
/* ─── MY LEARNING OPTION BUTTONS ──────────────── */
.option-btn {
  all: unset;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 7px 14px;
  border-radius: 9999px;
  border: 1px solid var(--border);
  font-size: 12px;
  font-weight: 500;
  color: var(--text-sub);
  cursor: pointer;
  transition: all 0.15s ease;
  box-sizing: border-box;
  font-family: inherit;
}
.option-btn:hover { border-color: var(--border-hi); color: var(--text); }
.option-btn.active {
  border-color: var(--accent);
  background: var(--accent-dim);
  color: var(--accent);
}
.tool-btn {
  all: unset;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  padding: 12px 8px;
  border-radius: 10px;
  border: 1px solid var(--border);
  background: var(--card);
  cursor: pointer;
  transition: all 0.15s ease;
  text-align: center;
  box-sizing: border-box;
  font-family: inherit;
}
.tool-btn:hover { border-color: var(--border-hi); background: var(--elevated); }
.tool-btn.active { border-color: var(--accent); background: var(--accent-dim); }
.tool-btn .tool-icon { font-size: 22px; }
.tool-btn .tool-label { font-size: 11px; font-weight: 600; color: var(--text-sub); letter-spacing: 0.3px; }
.tool-btn.active .tool-label { color: var(--accent); }
.tool-btn.stub { opacity: 0.45; cursor: not-allowed; }
.plan-week {
  margin-bottom: 16px;
  border: 1px solid var(--border);
  border-radius: 10px;
  overflow: hidden;
}
.plan-week-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  background: var(--card);
  cursor: pointer;
  transition: background 0.15s ease;
}
.plan-week-header:hover { background: var(--elevated); }
.plan-week-title { font-size: 13px; font-weight: 600; color: var(--text); }
.plan-week-meta { font-size: 11px; color: var(--text-muted); font-family: 'Space Mono', monospace; }
.plan-week-body { padding: 8px 0; background: var(--page); }
.plan-unit {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  padding: 10px 16px;
  transition: background 0.12s ease;
  cursor: pointer;
}
.plan-unit:hover { background: var(--elevated); }
.plan-unit.done .unit-title { color: var(--text-muted); text-decoration: line-through; }
.plan-unit input[type="checkbox"] { flex-shrink: 0; margin-top: 2px; }
.unit-info { flex: 1; }
.unit-title { font-size: 13px; color: var(--text); line-height: 1.4; }
.unit-meta { display: flex; align-items: center; gap: 8px; margin-top: 3px; }
.unit-hours { font-size: 11px; color: var(--text-muted); font-family: 'Space Mono', monospace; }
.unit-type { font-size: 10px; font-weight: 600; letter-spacing: 0.4px; text-transform: uppercase;
             padding: 2px 7px; border-radius: 4px; background: var(--elevated); color: var(--text-muted); }
.unit-type.course { background: var(--accent-dim); color: var(--accent); }
.unit-type.project { background: var(--done-dim); color: var(--done); }
.unit-type.milestone { background: var(--warn-dim); color: var(--warn); }
.unit-type.interview { background: rgba(248,113,113,0.08); color: var(--danger); }
.unit-resource { font-size: 11px; color: var(--accent); text-decoration: none; margin-top: 2px; display: inline-block; }
.unit-resource:hover { text-decoration: underline; }
```

### Verification checklist
- [ ] HTML renders without JS — picker visible, plan hidden
- [ ] Tool grid renders 10 buttons (3 active, 7 stub)
- [ ] Stub tools have `cursor: not-allowed` and `opacity: 0.45`
- [ ] Generate button disabled until tool + weeks + hours all selected
- [ ] Plan section hidden on page load
- [ ] No old n8n hardcoded IDs remain in HTML (`n8n1`–`n8n8`, `n8n-pct`, `n8n-bar`)

---

## Phase 4: JavaScript Wiring

**Goal:** Wire picker → engine → render. Update loadAll() and updateProgress() to handle new dynamic IDs.

### What to implement

Add these functions, and update existing ones:

```javascript
// ── LEARNING PICKER STATE ───────────────────────────────
let pickerState = {
  tool: null,
  weeks: 6,
  hours: 5
};

function renderToolPicker() {
  const grid = document.getElementById('tool-grid');
  if (!grid) return;
  grid.innerHTML = Object.entries(CURRICULA).map(([key, c]) => {
    const hasUnits = c.units.length > 0;
    const savedTool = localStorage.getItem('myedge_plan_tool');
    const isActive = savedTool === key;
    return `<button class="tool-btn${!hasUnits ? ' stub' : ''}${isActive ? ' active' : ''}"
      onclick="${hasUnits ? `selectTool('${key}')` : 'void(0)'}"
      title="${!hasUnits ? 'Coming soon' : c.tagline}"
      ${!hasUnits ? 'aria-disabled="true"' : ''}>
      <span class="tool-icon">${c.icon}</span>
      <span class="tool-label">${c.label}</span>
    </button>`;
  }).join('');
}

function selectTool(key) {
  pickerState.tool = key;
  localStorage.setItem('myedge_plan_tool', key);
  document.querySelectorAll('.tool-btn').forEach(b => b.classList.remove('active'));
  const activeBtn = document.querySelector(`[onclick="selectTool('${key}')"]`);
  if (activeBtn) activeBtn.classList.add('active');
  updateGenerateButton();
}

function selectOption(btn, type) {
  const parent = btn.closest('[id$="-options"]');
  parent.querySelectorAll('.option-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  pickerState[type === 'weeks' ? 'weeks' : 'hours'] = parseInt(btn.dataset.value);
  localStorage.setItem(`myedge_plan_${type}`, btn.dataset.value);
  updateGenerateButton();
}

function updateGenerateButton() {
  const btn = document.getElementById('generate-btn');
  if (!btn) return;
  const ready = !!pickerState.tool;
  btn.disabled = !ready;
  btn.style.opacity = ready ? '1' : '0.4';
  btn.style.cursor = ready ? 'pointer' : 'not-allowed';
}

function handleGeneratePlan() {
  const { tool, weeks, hours } = pickerState;
  if (!tool) return;
  const raw = generatePlan(tool, weeks, hours);
  activePlan = loadPlanProgress(raw, tool, weeks, hours);
  activePlanKey = `${tool}_${weeks}_${hours}`;
  renderPlan(activePlan, tool, weeks, hours);
  document.getElementById('learning-picker').style.display = 'none';
  document.getElementById('learning-plan').style.display = 'block';
}

function resetPlan() {
  document.getElementById('learning-plan').style.display = 'none';
  document.getElementById('learning-picker').style.display = 'block';
}

function renderPlan(plan, toolKey, weeks, hoursPerWeek) {
  const c = CURRICULA[toolKey];
  document.getElementById('plan-tool-title').textContent = `${c.icon} ${c.label} — ${weeks}-Week Plan`;
  document.getElementById('plan-meta').textContent =
    `${c.tagline} · ~${hoursPerWeek}h/week`;

  const container = document.getElementById('plan-weeks');
  container.innerHTML = plan.map(week => {
    const unitsDone = week.units.filter(u => u.done).length;
    return `<div class="plan-week">
      <div class="plan-week-header" onclick="toggleWeek(this)">
        <span class="plan-week-title">Week ${week.week}</span>
        <span class="plan-week-meta">${unitsDone}/${week.units.length} done · ~${week.totalHours}h</span>
      </div>
      <div class="plan-week-body">
        ${week.units.map(unit => `
          <div class="plan-unit${unit.done ? ' done' : ''}" id="unit-row-${unit.id}"
               onclick="togglePlanUnit('${unit.id}')">
            <input type="checkbox" ${unit.done ? 'checked' : ''} tabindex="-1">
            <div class="unit-info">
              <div class="unit-title">${unit.title}</div>
              <div class="unit-meta">
                <span class="unit-hours">${unit.hours}h</span>
                <span class="unit-type ${unit.type}">${unit.type}</span>
              </div>
              <a class="unit-resource" href="${unit.resource_url}" target="_blank" rel="noopener"
                 onclick="event.stopPropagation()">${unit.resource} ↗</a>
            </div>
          </div>`).join('')}
      </div>
    </div>`;
  }).join('');

  updatePlanProgress(plan);
}

function toggleWeek(header) {
  const body = header.nextElementSibling;
  body.style.display = body.style.display === 'none' ? 'block' : 'none';
}

function togglePlanUnit(unitId) {
  if (!activePlan) return;
  const { tool, weeks, hours } = pickerState;
  // Find unit across all weeks
  for (const week of activePlan) {
    const unit = week.units.find(u => u.id === unitId);
    if (unit) {
      unit.done = !unit.done;
      savePlanUnit(unitId, unit.done, tool, weeks, hours);
      const row = document.getElementById('unit-row-' + unitId);
      if (row) {
        row.classList.toggle('done', unit.done);
        row.querySelector('input[type="checkbox"]').checked = unit.done;
      }
      updatePlanProgress(activePlan);
      // Update week header meta
      const weekIdx = activePlan.indexOf(week);
      const weekHeaders = document.querySelectorAll('.plan-week-meta');
      if (weekHeaders[weekIdx]) {
        const done = week.units.filter(u => u.done).length;
        weekHeaders[weekIdx].textContent = `${done}/${week.units.length} done · ~${week.totalHours}h`;
      }
      return;
    }
  }
}

function updatePlanProgress(plan) {
  const allUnits = plan.flatMap(w => w.units);
  const done = allUnits.filter(u => u.done).length;
  const pct = allUnits.length ? Math.round((done / allUnits.length) * 100) : 0;
  const pctEl = document.getElementById('plan-pct');
  const barEl = document.getElementById('plan-bar');
  if (pctEl) pctEl.textContent = pct + '%';
  if (barEl) barEl.style.width = pct + '%';
}

// REMOVE or stub out old n8n-specific updateProgress() function
// Replace it with a no-op so existing loadAll() calls don't crash:
function updateProgress() {
  // Legacy stub — replaced by updatePlanProgress()
  // Kept to avoid errors if called from loadAll() during transition
}
```

Update `loadAll()` to restore picker state on page load (add to the function's body):

```javascript
// Inside loadAll(), add at the end:
// Restore learning picker state
const savedTool = localStorage.getItem('myedge_plan_tool');
const savedWeeks = localStorage.getItem('myedge_plan_weeks');
const savedHours = localStorage.getItem('myedge_plan_hours');
if (savedWeeks) pickerState.weeks = parseInt(savedWeeks);
if (savedHours) pickerState.hours = parseInt(savedHours);
renderToolPicker();
updateGenerateButton();
// If a tool was previously selected AND a plan was generated, restore it
if (savedTool && CURRICULA[savedTool]?.units.length) {
  pickerState.tool = savedTool;
  const hasProgress = Object.keys(localStorage)
    .some(k => k.startsWith(`myedge_plan_${savedTool}_`));
  if (hasProgress) {
    handleGeneratePlan();
  } else {
    updateGenerateButton();
  }
}
```

### Verification checklist
- [ ] `renderToolPicker()` called on page load — tool grid visible
- [ ] Clicking n8n tool → button turns accent color → Generate enabled
- [ ] Clicking Generate → plan renders → picker hides
- [ ] Checking a unit box → persists after page refresh
- [ ] "← Change Tool" button → plan hides, picker shows, previously-checked units preserved
- [ ] Stub tool buttons unclickable (no `selectTool` fires)
- [ ] Old `updateProgress()` doesn't crash (stubbed, not removed)

---

## Phase 5: Verification

### Regression checks
- [ ] All other sections (My Edge, Portfolio, Interview, Insights, 6-Week Plan) still render and load from localStorage correctly
- [ ] `showSection('n8n')` nav item works — section-n8n becomes active
- [ ] Hamburger mobile nav still opens/closes
- [ ] Nav indicator still slides on n8n selection

### Content accuracy checks  
- [ ] Open 3 random `resource_url` values — all resolve to real pages
- [ ] n8n Level 1 course URL loads: `https://docs.n8n.io/courses/level-one/`
- [ ] Clay 101 URL loads: `https://university.clay.com/courses/clay-101`
- [ ] HubSpot Sales Cert URL loads: `https://academy.hubspot.com/courses/hubspot-sales-hub-software`
- [ ] No unit says "Clay certification available" 
- [ ] No unit claims HubSpot free plan for cert exercises

### Engine tests (run in browser console)
```javascript
// Test 1: correct unit count preserved
const p = generatePlan('n8n', 6, 5);
const total = p.flatMap(w=>w.units).length;
console.assert(total === CURRICULA.n8n.units.length, 'Unit count mismatch');

// Test 2: deterministic
const p2 = generatePlan('n8n', 6, 5);
console.assert(
  JSON.stringify(p.map(w=>w.units.map(u=>u.title))) ===
  JSON.stringify(p2.map(w=>w.units.map(u=>u.title))),
  'Not deterministic'
);

// Test 3: no week exceeds capacity
p.forEach(w => {
  const hrs = w.units.reduce((s,u)=>s+u.hours,0);
  console.assert(hrs <= 5 + 0.75, `Week ${w.week} overflow: ${hrs}h`);
});
```

---

## Execution Order

1. Phase 1 — Plant CURRICULA in index.html  
2. Phase 2 — Add generatePlan + persistence helpers  
3. Phase 3 — Replace HTML block (lines 1026–1123)  
4. Phase 3b — Add CSS to style block  
5. Phase 4 — Add JS wiring functions + update loadAll()  
6. Phase 5 — Run verification checklist  

Each phase self-contained. Stop between phases to verify before proceeding.
