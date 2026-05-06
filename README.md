# Agentic AI Presentations

Talks on context engineering, AI orchestration, and general AI usage patterns and theory.

Three decks, written in [Marp](https://marp.app/) (Markdown). Each folder contains the source `slides.md`, a rendered `slides.html`, a `slides.pdf`, and an `images/` folder.

## Decks

### 1. [`context/`](./context) — How LLMs Work

A first-principles tour of large language models: tokens, embeddings, the context window, next-token prediction, attention, why context shape matters, and where agents fit in. Aimed at engineers who want to understand what is actually happening underneath the API.

- [`slides.md`](./context/slides.md) · [`slides.pdf`](./context/slides.pdf) · [`OUTLINE.md`](./context/OUTLINE.md)

### 2. [`orchestration-demo/`](./orchestration-demo) — AI Orchestration (demo deck)

A practical, demo-driven walkthrough of orchestrating multiple agents to do real work — the landscape of orchestrators, GitHub agentic workflows, and a live demo script.

- [`slides.md`](./orchestration-demo/slides.md) · [`slides.pdf`](./orchestration-demo/slides.pdf) · [`demo-script.md`](./orchestration-demo/demo-script.md)

### 3. [`orchestration-theory/`](./orchestration-theory) — How Your AI Product Team Works

The follow-up theory session. Treats an agent system as a product team: roles, context, memory, state, routing, communication, safety (the lethal trifecta, sandboxes, safe outputs), and the difficult trade-offs around latency, cost, reliability, verification, guardrails and integration.

- [`slides.md`](./orchestration-theory/slides.md) · [`slides.pdf`](./orchestration-theory/slides.pdf)

## Suggested viewing order

1. **Context** — what an LLM actually is.
2. **Orchestration (demo)** — what you can build on top of one.
3. **Orchestration (theory)** — how to reason about the system you have built.

## Rendering

To re-render any deck after editing its `slides.md`:

```bash
./render-slides.sh context/slides.md
./render-slides.sh orchestration-demo/slides.md
./render-slides.sh orchestration-theory/slides.md
```

Requires Node.js (the script uses `npx @marp-team/marp-cli`).

## Licence

Content © Chris Mitchelmore. Code snippets and diagrams in the slides are MIT-licensed; reuse the prose with attribution.
