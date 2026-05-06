# Demo Script — AI Orchestration Talk

Live-demo runbook for the 17 April 2026 session. **Rehearse twice before the day.**
Everything below assumes the seeded demo repo at
`crmitchelmore/orchestration-demo` is ready — see §0 for setup.

---

## 0. Pre-demo setup *(do this the day before)*

### Demo repo contents

A small React + Node notes/TODO app with seeded tasks:

- `frontend/` — React (Vite), `NoteList.tsx`, `Settings.tsx`
- `backend/` — Node/Express, SQLite
- Five GitHub issues pre-created on the repo:
  1. `#1` — **Add tag filtering to notes list** *(parallel 1)*
  2. `#2` — **Bulk-complete shortcut ⇧⌘D** *(parallel 2)*
  3. `#3` — **Tidy settings page layout** *(parallel 3)*
  4. `#4` — **Fix flaky `archive.test.ts`** *(landmine: test is racey, passes ~80%)*
  5. `#7` — **Archived notes in search?** *(landmine: ambiguous spec — hide or grey out?)*

All branches on a known-good commit. `main` builds green. Pre-commit the flaky test in
a deterministic-enough state that it reliably flakes in CI.

### Auth & pre-warm

| What | How | Check |
|---|---|---|
| Copilot CLI | `copilot login` | `copilot --version`; `/fleet` and `/tasks` available |
| OpenClaw | Start the Gateway; pre-pair one sender/channel; open Control UI | `http://127.0.0.1:18789/` loads |
| GitHub `gh` CLI | `gh auth status` | has `repo`, `workflow` scopes |
| Gas Town | `gt install ~/gt-demo --git`; add the rig; run `gt mayor attach` once | Mayor responds to "hello" |
| gh-aw | `gh extension install github/gh-aw`; compile the demo workflow once | `.lock.yml` exists in repo |
| Browser tabs | Repo PRs, repo Actions, OpenClaw Control UI, GitHub issue tab | Pinned in left-most window |
| Models | Prompt-prime them with a trivial `ls` call to burn cold-start | Any response |

### Backup plan

- **If live demo fails:** every demo has a prerecorded 60-second screen capture in
  `./recordings/demo-N-backup.mp4`. Cut to that and narrate over it.
- **If internet dies:** have local screenshots of each end-state (PR opened, worktree
  list, `gt convoy status` output). Don't ad-lib; speak to the screenshots.
- **If a model rate-limits:** fall back to Sonnet (from Opus) across the board.

---

## 1. Demo 1 — Copilot CLI *(~5 min)*

### Narrative beat

> "This is the baseline. Most of the time this is the only orchestration you need."

### Script

1. **Open** the demo repo in VS Code. Show `.github/agents/` already has a planner /
   reviewer agent pair ready.
2. In a terminal, quickly prove the scripting mode exists:

   ```bash
   copilot -p "Summarise the five prepared issues in this repo in one paragraph." \
     --allow-all-tools -s
   ```

3. Start the real session:

   ```bash
   copilot -i "Read the repo, then help me coordinate issues #1, #2, and #3. \
   Don't touch #4 or #7 yet."
   ```

4. In-session:
   - `/agent` if you want to show the repo-local custom agent
   - `/fleet` to enable parallel subagent execution
   - prompt:

     > *"Use the planner/reviewer setup and fan out the three low-conflict tasks in
     > parallel. Show me the workers in `/tasks` when they're running."*

5. Run `/tasks` once the workers are live. Narrate:
   > *"Each of those is a fresh context window. This is orchestration without needing a
   > whole extra platform."*
6. Optional close:
   - `/review` if you want a fast local quality gate
   - `/delegate` if you want to turn the session into a GitHub PR
7. **Scorecard moment:** zero setup, context-level isolation, verifier is still mainly
   your tests and review surface, human still acts as scheduler.

### Failure modes

- `/fleet` not obviously doing anything → use `/tasks` immediately so the audience sees
  the background workers.
- Non-interactive prompt needs approval → that is expected; `-p` needs `--allow-all-tools`.
- One child returns a compressed summary → that's fine, it's actually the point.

### Time budget: **5 min** including `/tasks`.

---

## 2. Demo 2 — OpenClaw *(~5 min)*

### Narrative beat

> "Same orchestration pattern. Different payload. This one routes conversations, not repos."

### Script

1. Show the Gateway running and the Control UI.
2. Send a message from the already-paired channel:

   > *"Summarise what this gateway is connected to and tell me which workspace I'm in."*

3. Open the trace / dashboard view so the audience can see the session appear.
4. Send a second message from a different sender or channel.
5. Show the pairing / approval moment for the unknown sender, or narrate the allow-list
   if you're using a pre-approved account.
6. Ask a deliberately different question on the second route:

   > *"Give me a short brief on today's AI orchestration talk."*

7. Point out that the Gateway is acting as the scheduler:
   - one control plane
   - multiple surfaces
   - explicit human gate for new senders
   - per-session isolation and observability
8. **Scorecard moment:** setup medium, visibility high via dashboard/trace, guardrails
   are pairing and allow-lists, persistence sits in the gateway/session layer, best fit
   is "personal assistant from anywhere".

### Failure modes

- Second channel unavailable → use WebChat or a second browser session and keep the same
  point: one gateway, two routes.
- Pairing already completed → show the allow-list config and narrate the approval model.
- Response is slow → keep the dashboard on screen and explain the routing model first.

### Time budget: **5 min**.

---

## 3. Demo 3 — Gas Town *(~10 min — the longest demo, pre-run to checkpoint)*

### Narrative beat

> "Here's what it looks like when someone takes 'fleet of agents' fully seriously."

### Pre-run checkpoint *(do this 2 min before stage)*

You do NOT cold-dispatch the Mayor live. Dead air while Claude plans for 3 min is the
single biggest demo-killer. Instead:

1. Off-stage: `gt mayor attach`, give it the brief, let it dispatch 3 polecats.
2. Pause playback the moment the third polecat starts running.
3. On stage: open with `gt convoy status` showing 3 polecats in flight.
4. Narrate the dispatch as replay: *"two minutes ago I told the Mayor X; here's what
   it did while I was talking."*

This is honest — you're showing the real tool doing real work. You're just skipping
the "watch an LLM think" dead minute. Every experienced demo'er does this.

### Script

1. Terminal pane 1: `cd ~/gt-demo`; `gt rig list` — show the todoapp rig.
2. `gt mayor attach`.
3. Brief the Mayor:

   > *"Inside the todoapp rig, dispatch polecats to handle beads `gt-001`, `gt-002`,
   > `gt-003`. If you hit ambiguity on bead `gt-007`, escalate with severity HIGH
   > rather than guessing."*

4. Split terminal. Pane 2: `watch -n 2 'gt convoy status && gt polecat list'`.
5. Point out polecats spawning into worktrees: `ls ~/gt-demo/todoapp/worktrees/`.
6. When the first worker completes, watch the **Refinery** log: `gt refinery status`.
   Narrate the Bors-style batching.
7. **Landmine moment 1 — flaky test:** dispatch a polecat to bead `gt-004`. When the
   Refinery verification gate fails, show the escalation bead that gets created.
   `gt escalate list`.
8. **Landmine moment 2 — ambiguous spec:** if the Mayor correctly escalates `gt-007`,
   cheer. If it silently picks one interpretation, that's *also* a talking point:
   > *"Notice the orchestrator's personality here — it chose rather than asked."*
9. Close with `gt convoy status` — three merged, one escalated, one blocked.

### Failure modes

- Dolt/Beads not initialised → fall back to `gt up --reset` (rehearse it).
- Polecat session hangs → `gt polecat kill <id>` and re-dispatch.
- Refinery merge conflict on `settings.tsx` → *that's great*, narrate: "real orchestrators
  have to deal with this. Refinery isolates the failed MR and requeues it."

### Time budget: **10 min**. Hard cap at 11.

---

## 4. Demo 4 — GitHub Agentic Workflows *(~6 min)*

### Narrative beat

> "Same primitives. Different runtime. No laptop involved."

### Script

1. Show `.github/workflows/implement-issue.md` (the Markdown workflow from the slide).
2. Walk the YAML frontmatter line by line:
   - `on: issues: [opened, labeled]` — trigger.
   - `permissions: read-only` — default stance.
   - `tools:` — allow-list.
   - `safe-outputs: create-pull-request, add-comment` — the narrow escape hatch.
3. Show the compiled `.lock.yml` briefly — note SHA-pinning on actions.
4. Switch to browser → open issue `#7` (the ambiguous one) with a label trigger.
5. Refresh Actions tab. Live run starts.
6. While it's running, show `.github/workflows/implement-issue.lock.yml` security notes.
7. When it completes:
   - Open the resulting PR (draft). Show the diff.
   - Open the comment the agent posted on the issue: *"I think archived notes should be
     greyed out in search results but still clickable — confirm before I build?"*
8. **Scorecard moment:** setup minimal, visibility via Actions UI, isolation is the
   ephemeral runner, verifier is CI + PR review, guardrails are safe-outputs and repo
   policy, escalation is literally a comment, persistence is perfect, GitHub provides
   the sandbox but you still own the blast radius.

### Failure modes

- Actions queue cold start → have a "pre-warmed" run already half-way through a
  rebuild; switch to narrating *that*.
- `gh aw compile` errors on stage → you already compiled. Just commit.
- Agent picks an interpretation instead of asking → talking point: *"note the failure
  mode — prompt said 'ask if ambiguous' and it didn't. This is why you still need the
  human gate."*

### Time budget: **6 min**.

---

## 5. Transitions & timings

| Slide block | Live budget |
|---|---|
| Intro (definition → ladder → recap) | 5 min |
| Part 1 (what / baseline / modes / architecture / verification / humans) | 7 min |
| Part 2 preamble (landscape, scorecard, demo app) | 3 min |
| Demo 1 — Copilot CLI | 5 min |
| Demo 2 — OpenClaw | 5 min |
| Demo 3 — Gas Town | 10 min |
| Local → remote bridge | 1 min |
| Demo 4 — gh-aw | 6 min |
| Across-the-four + production reality + decision framework + wrap | 3 min |
| **Total content** | **45 min** |
| **Budgeted buffer / Q&A signal** | **5 min** |

Real talks run 10-15% over. **Plan for 45 min of content.** If Demo 3 overruns past
11 min, skip straight to landmines and cut the `gt convoy status` closing. Protect
Demo 4 — it's the reveal.

Leaves ~5 min for 1-2 live questions. If you're not clearly under time, push the rest
to Teams chat and do a follow-up thread.

---

## 6. Things to say out loud *(the memorable lines)*

- *"An agent is an LLM running tools in a loop. An orchestrator is the system that runs
  agents in a loop."*
- *"Tokens are often cheap. Your working memory isn't."*
- *"Five Claude tabs isn't orchestration. You're still the control plane."*
- *"Every orchestrator's personality shows up in what it trusts without a human."*
- *"Same control-plane idea. Different operating constraints."*
- *"Remote pays a guardrail tax to survive."*
- *"Orchestration is just context engineering with more windows."*
- *"Default to the smallest orchestrator that makes the next week easier."*

---

## 7. Q&A ammo *(prep answers, in case)*

- **"Should we standardise on one of these for the team?"** — Not yet. Let people on
  different ladders pick different rungs. Standardise on `AGENTS.md` + MCP, not on
  the orchestrator.
- **"What about cost?"** — 15× tokens is Anthropic's published number for research
  tasks. Coding is usually lower, but still materially higher once you fan out workers
  and re-run checks. Treat 3–6× as a rough rule of thumb, not a benchmark.
- **"Is Gas Town production-ready?"** — No, Yegge says so himself. It's a reference
  implementation and a provocation. Use it to *think*, not necessarily to *deploy*.
- **"Why include OpenClaw in a software talk?"** — Because the orchestration pattern
  generalises beyond code. A gateway routing sessions across channels is still a control
  plane; the payload just happens to be messages instead of pull requests.
- **"Security of gh-aw?"** — Strong guardrails: read-only default, safe-outputs
  allow-list, AWF firewall, SHA-pinned deps, MCP Gateway. But GitHub only gives you
  the sandbox — you still own permissions, review policy, and blast radius.
- **"What happens when two agents touch the same file?"** — That's why the merge queue
  exists. Gas Town's Refinery, Multica's worktree model, Vibe Kanban's Kanban mode.
  Worst case: a human resolves.
- **"Does this replace Copilot?"** — No. Copilot is your L2–L5. Orchestrators are L6+.
  They stack.
