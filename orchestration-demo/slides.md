---
marp: true
theme: default
paginate: true
math: katex
style: |
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

  :root {
    --bg-primary: #0d1117;
    --bg-secondary: #161b22;
    --border-subtle: #21262d;
    --border-default: #30363d;
    --text-primary: #e6edf3;
    --text-secondary: #c9d1d9;
    --text-muted: #9ca3af;
    --text-subtle: #8b949e;
    --accent-blue: #58a6ff;
    --accent-blue-light: #79c0ff;
    --accent-purple: #d2a8ff;
    --accent-orange: #f0883e;
    --accent-green: #3fb950;
    --accent-red: #f85149;
    --code-bg: #161b22;
  }

  section {
    font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif;
    font-weight: 400;
    line-height: 1.5;
    background: var(--bg-primary);
    color: var(--text-primary);
    font-size: 28px;
    overflow: hidden;
  }
  section.lead { text-align: center; display: flex; flex-direction: column; justify-content: center; }
  section.lead h1 {
    font-size: 2.8em; color: var(--accent-blue); margin-bottom: 0.2em;
    font-weight: 600; letter-spacing: -0.02em;
  }
  section.lead h2 {
    font-size: 1.4em; color: var(--text-subtle); font-weight: 400;
  }
  h1 { color: var(--accent-blue); font-size: 1.6em; margin-bottom: 0.3em; font-weight: 600; letter-spacing: -0.02em; }
  h2 { color: var(--accent-blue-light); font-size: 1.2em; font-weight: 600; letter-spacing: -0.02em; }
  h3 { color: var(--accent-purple); margin-top: 0.3em; margin-bottom: 0.2em; font-weight: 600; letter-spacing: -0.02em; }
  a { color: var(--accent-blue); }
  abbr[title] {
    text-decoration: underline dotted;
    text-decoration-color: #58a6ff40;
    text-underline-offset: 3px;
    cursor: help;
    font-style: normal;
  }
  abbr[title]:hover { text-decoration-color: var(--accent-blue); }
  code {
    font-family: 'JetBrains Mono', 'Consolas', 'Monaco', monospace;
    font-weight: 400;
    background: var(--code-bg);
    color: var(--accent-blue-light);
    padding: 2px 6px;
    border-radius: 4px;
  }
  pre {
    background: var(--code-bg) !important;
    border: 1px solid var(--border-default);
    border-radius: 10px;
    padding: 16px !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
  }
  pre code { background: transparent; padding: 0; }
  table {
    font-size: 0.72em; border-collapse: collapse; width: 100%;
    color: var(--text-primary) !important; background: var(--bg-primary) !important;
  }
  th { background: var(--bg-secondary) !important; color: var(--accent-blue) !important; border-bottom: 2px solid var(--border-default); }
  td { border-bottom: 1px solid var(--border-subtle); background: var(--bg-primary) !important; color: var(--text-primary) !important; }
  tr:nth-child(even) td { background: var(--bg-secondary) !important; }
  tr:nth-child(odd) td { background: var(--bg-primary) !important; }
  blockquote {
    border-left: 5px solid var(--accent-blue);
    background: var(--bg-secondary);
    padding: 8px 16px;
    margin: 10px 0;
    border-radius: 0 8px 8px 0;
    font-style: italic;
    color: var(--text-secondary);
    font-size: 0.9em;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);
  }
  blockquote strong { color: var(--accent-blue); font-style: normal; }
  .columns { display: flex; gap: 1.5em; }
  .columns > * { flex: 1; }
  .highlight { color: var(--accent-orange); font-weight: bold; }
  .good { color: var(--accent-green); font-weight: 600; }
  .bad { color: var(--accent-red); font-weight: 600; }
  .stat { font-size: 2.2em; color: var(--accent-blue); font-weight: bold; text-shadow: 0 2px 4px rgba(88,166,255,0.3); }
  .stat-label { font-size: 0.8em; color: var(--text-subtle); }
  .small { font-size: 0.6em; color: var(--text-muted); margin-top: 0.5em; }
  ul, ol { margin: 0.3em 0; }
  li { margin: 0.15em 0; }
  p { margin: 0.4em 0; }
  pre { margin: 0.5em 0 !important; }
  img { border-radius: 8px; }
  section.divider {
    text-align: center; display: flex; flex-direction: column; justify-content: center;
    background: linear-gradient(135deg, var(--bg-primary) 0%, var(--bg-secondary) 100%);
  }
  section.divider h1 {
    font-size: 2.4em; color: var(--accent-blue); font-weight: 600; letter-spacing: -0.02em;
  }
  section.divider h2 {
    color: var(--text-subtle); font-weight: 400; font-size: 1.2em;
  }
  .rung {
    background: var(--bg-secondary);
    border-left: 4px solid var(--accent-blue);
    padding: 6px 14px;
    margin: 6px 0;
    border-radius: 0 6px 6px 0;
    font-size: 0.85em;
  }
  .rung strong { color: var(--accent-blue-light); }
  section.agenda ol { font-size: 0.9em; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

![bg opacity:.18](images/opening-01-cover.png)

# AI Orchestration
## Your Personal Product Team

**Friday, 24th April 2026**

<div class="small" style="margin-top: 2em;">

Follow-up to the <em>"AI & GitHub Copilot"</em> series

</div>

---
<!-- _class: agenda -->
# Today's Agenda

![bg right:32% contain](images/opening-03-session-map.png)

1. **Definition** — what are we talking about here?
2. **Progression** from autocomplete to agent armies
3. **Why now?** and what is the impact?
4. **The control plane** — managing orchestration
5. **Demos** — Copilot CLI · OpenClaw · Multica · gh-aw

---

<!-- _class: lead -->
<!-- _paginate: false -->

![bg opacity:.16](images/opening-02-agent-vs-orchestrator.png)

# What is Orchestration?
<h2 style="font-size: 1.8em; font-weight: 400; line-height: 1.6; color: var(--text-primary);">
An <abbr title="Large Language Model">LLM</abbr> in a <strong style="color: var(--accent-blue);">tool loop</strong> is an <strong style="color: var(--accent-blue);">agent</strong>.
</h2>

<h2 style="font-size: 1.8em; font-weight: 400; line-height: 1.6; color: var(--text-primary); margin-top: 0.8em;">
A loop around <strong style="color: var(--accent-orange);">agents</strong> is an <strong style="color: var(--accent-orange);">orchestrator</strong>.
</h2>

---

# Recap from February

![bg opacity:.10](images/opening-09-context-injection.png)

Agents
1. LLMs + tools in a loop.
2. Every "feature" (system prompts, MCPs, RAG, Skills, `AGENTS.md`, etc.) is just choosing **what text goes into the window, when.**

Orchestrator
1. **The same problem, one level up.** What goes into *which* agent, *when*, and who reads what they wrote after.
2. Can be local (e.g. sub-agents, Claude Desktop, OpenHands, etc.)
3. Or remote (e.g. GitHub Agentic Workflows, or running local tools on a server)

---
# From Blue Pill to AI Pilled

![bg right:55% contain](images/ai-progression-ladder.png)

- Don't rush through it too fast; there are learnings at each level
- Build up from **first principles**, context is (still) everything
- The tools are improving continuously

---
# Managing the Cognitive Load

![w:1100px](images/cognitive-load-ladder.png)

 Orchestration can **lower** cognitive load by moving coordination *out of your head* and *into the system*.
 Fewer tabs, fewer decisions, more organisation. Humans stay on the bigger picture.

---
# Why now?

![bg right:32% contain](images/opening-11-multipliers.png)
Early adopters are already there, and it gets easier to use as the underlying capabilities improve. (https://overcast.fm/+AA_pp79voLI)
### The Gains Multiply

```text
model   ≈ algorithm × data × compute
outcome ≈ model × harness × orchestration
```

- Models keep improving
- Better harnesses* **compound** them
- Better orchestration compounds them **again**

---
# Opportunity Everywhere

![bg right:38% contain](images/screenshot-opportunity.png)

Even without better models, huge gains remain: better harnesses, better context, better orchestration.

---
# The Impact

![bg right:32% contain](images/opening-12-bottleneck-shift.png)

```text
code → review → secure → validate → deploy → GTM
```

- Yesterday: **code** was the bottleneck
- Today: for many, **review** is the bottleneck
- Next: **security**, **validation**, **deploy**

> Anything that stays manual is a blocker. What's the best tool we have to automate those phases?

---
# Non-Deterministic Engineering

![bg opacity:.10](images/opening-13-thresholds.png)

- It's not black or white if a task can be completed
- **~70–80%** on SWE-bench Verified (500 curated SE tasks) - 75% of Google Code is generated
- We need to build understanding of what the success rates are for our tasks
- Decide what level of success is ok to automate to the next step

---
# Remote vs Local Agents

![bg right:34% contain](images/opening-06-remote-container.png)

When agents run on runners, VMs, or containers instead of your laptop:

- ✅ Better isolation, persistence, reproducibility, shared auditability
- ⚠️ Your **security boundary moves**
- ⚠️ You now have to reason about **compromised agents, untrusted tools, networked side effects**

---
# The Lethal Trifecta

![bg right:34% contain](images/opening-07-lethal-trifector.png)

Pick two to be safe:
1. Access to **Private data**
2. Outbound **Communication** requests
3. Exposure to **Untrusted content**

But all 3 are usually needed to be useful. Manage with:
- Read-only agents; writes in **separate scoped jobs**
- Domain allow-lists / egress firewalls
- Container / MCP isolation
- **Safe outputs** — a strictly managed output channel

---
# Automation more important than ever

![bg opacity:.10](images/opening-16-cloud-to-ai.png)

<div class="columns">
<div>

![h:210px](images/screenshot-tolerate-1.png)

</div>
<div>

![h:210px](images/screenshot-tolerate-2.png)

</div>
</div>

<div class="small">

| Cloud era     | AI era                                              |
| ------------- | --------------------------------------------------- |
| CI/CD         | **Verification automation**                         |
| IaC           | **Machine-readable systems and permissions**        |
| Observability | **Per-agent traces, evals, runtime signals**        |
| Runbooks      | **Explicit APIs, guardrails, and escalation paths** |

</div>

> What used to be "good engineering hygiene" becomes the **interface agents use to participate.**

---
# The Control Plane

![bg right:46% contain](images/control-plane.png)

Every orchestrator has the same parts:

- **You** — intent, reviews, approvals
- **Planner** — decomposes & assigns
- **Workers** — fresh context, isolated
- **Verifier** — tests, reviewer, gates
- **Integrate** — merge, deploy, release

> Tools may own some or all of these. The parts of the SDLC haven't changed, just who does the work.

---
# Demos

![bg right:30% contain](images/opening-17-paper-shift.png)

| Type                          | Example today | Why?                                                                        |
| ----------------------------- | ------------- | --------------------------------------------------------------------------- |
| **Local CLI**                 | Copilot CLI   | You're probably already using it                                            |
| **Router and Jobs**           | OpenClaw      | Not just for code but any digital task                                      |
| **Todays workflows + Agents** | Multica       | Very similar to how teams operate today, Just adding agents as team members |
| **Unopinionated Primitive**   | gh-aw         | A perfect building block to combine into your own way of working            |


---
# Copilot CLI

- `/fleet` and sub-agents
- `/tasks`
- - Custom agents
- `copilot -p "..."`
- `/delegate` to a PR

---

# OpenClaw

- Local-first, multi-channel personal assistant gateway
- Routes messages into isolated agent sessions

---

# Multica

Opensource Kanban Board with agents

---

# GitHub Agentic Workflows


![bg right:36% contain](images/career-framework-roundtable.png)



<div class="small">

| Role | Persona | Lens |
|---|---|---|
| **Engineering Manager** | Sam Chen | *Facilitator* — routes, synthesises, decides |
| **Architecture** | Morgan Reed | Coupling, boundaries, long-term shape |
| **Product** | Alex Hale | User value, scope, *"why?"* |
| **Design** | Riley Tan | UX, hierarchy, design standards |
| **Code Quality** | Casey Doyle | Testability, clarity, avoidable mess |
| **Reliability** | Jordan Park | Failure modes, *"what breaks at 3am?"* |
| **Security** | Priya Shah | Trust boundaries, threat model |
| **Performance** | Theo Quinn | Hot paths, real numbers |

</div>



---
<!-- _class: agenda -->
# What We Covered

1. **Definition** — agents are tool loops; orchestrators coordinate fleets.
2. **Progression** — the path runs from autocomplete to multi-agent systems.
3. **Why now?** — better models help, but harnesses and orchestration multiply the gains.
4. **The control plane** — planning, isolation, verification, and integration matter more than ever.
5. **Demos** — Copilot CLI, OpenClaw, Multica, and gh-aw show the design space.

**Key point:** agents are already useful, orchestration is already practical, and end-to-end automation is becoming the default.

---

# 📣 Next Time — The Theory

How does agent orchestration work?

<div class="columns">
<div>

### Inside the box
- **Memory** — what persists, where, how it's loaded
- **State** — conversation state vs. world state
- **Personality** — system prompt as configuration
- **Messaging** — how agents talk to each other

</div>
<div>

### Operational questions
- **Verification patterns** — evaluators, judges, consensus
- **Delegation vs approval** — when to interrupt
- **Observability** — tracing across agents
- **Evaluation** — *"is the fleet actually better?"*

</div>
</div>

---

<!-- _class: lead -->
<!-- _paginate: false -->

![bg opacity:.18](images/opening-19-part1-divider.png)

# Thank You
<div style="margin-top: 1.5em; font-size: 1.4em; line-height: 1.5; color: var(--text-primary);">

> *"The future is already here —<br/>it's just not evenly distributed."*

</div>

<div class="small" style="margin-top: 0.4em; font-size: 0.9em; color: var(--text-subtle);">
— William Gibson
</div>

NB: Also looking for more contributors, especially for demos of your orchestration workflows in the third session.
