# AI Training Center

A **one-hour, hands-on AI-agent literacy training** for SAP HCM consultants and
SAP developers, packaged as a **custom agent for GitHub Copilot** (VS Code
desktop). Also works as a Copilot CLI plugin.

A facilitator agent — **Ada** — runs the session: it presents a
concept in a couple of sentences, gives you an exercise to run in **your own AI
tool** (GitHub Copilot, SAP Joule, ChatGPT — whatever you have, in a second
window), waits, and debriefs. No backend, no API keys, no setup beyond having an
AI tool open.

## What it teaches (≈60 min)

| # | Module | Min |
|---|--------|-----|
| 1 | Cold open + Prompting that works | 15 |
| 2 | Why it sometimes lies (reliability) | 10 |
| 3 | Chatbot → Agent | 10 |
| 4 | Foreseeing consequences | 10 |
| 5 | Branch: HCM track **or** Developer track | 10 |
| 6 | Monday takeaway | 5 |

Concepts: prompting & context, few-shot examples, hallucination,
non-determinism & verification, tools/memory/the agent loop, guardrails &
human-in-the-loop, augmentation vs replacement, and the **agentic development
cycle**. Every non-obvious claim is cited from vendor-neutral primary sources
(Anthropic, Google, Google DeepMind) in `skills/ai-training-center/references/SOURCES.md`.

## Install in GitHub Copilot desktop (VS Code)

1. **Download the repo:** clone or download-ZIP this repo and open the folder in
   **VS Code** with the GitHub Copilot extension.
   ```
   git clone https://github.com/valuept/ai-training-center
   ```
   VS Code auto-detects the custom agent in `.github/agents/ai-trainer.agent.md`
   — no other setup.
2. Open **Copilot Chat**, switch the agent picker (top of the chat box) to
   **AI Trainer** (English) or **KI-Trainer** (German).
3. Open a **second window** with any AI tool you can type into (Copilot in
   another file, SAP Joule, ChatGPT).
4. Type `start` (or anything) to begin. Ada greets you, confirms your role
   (HCM consultant or developer), and runs the hour. Say "skip", "go deeper",
   or "pause" any time.

> Keep the repo folder open as your workspace — Ada reads the module content
> from `skills/ai-training-center/references/`. To make the agent available in
> **every** workspace instead, copy `.github/agents/ai-trainer.agent.md` into
> your user agents folder (`~/.copilot/agents/`), but then open this repo folder
> when you run the session so the references are reachable.

## Also works in Copilot CLI

The repo is also a standard Copilot CLI plugin (`.github/plugin/plugin.json` +
`agents/` + `skills/`). Drop the folder into `~/.copilot/installed-plugins/…`,
restart Copilot CLI, and run `@ai-trainer` (English) or `@ai-trainer-de`
(German).

## Languages / Sprachen

The training ships in **English** and **German (Deutsch)** — same curriculum,
same sources.

| | VS Code agent | CLI agent | Module references |
|---|---|---|---|
| English | **AI Trainer** | `@ai-trainer` | `skills/ai-training-center/references/` |
| Deutsch | **KI-Trainer** | `@ai-trainer-de` | `skills/ai-training-center/references/de/` |

Ada uses the informal **du** in the German version (warm 1:1 coaching tone). The
cited sources (`references/SOURCES.md`) stay in their original English.

## Optional live demo (presenter-led)

Module 3 can show real agent anatomy using the `agent0` CLI in this repo
(plan → execute → policy → memory). Commands are in
`skills/ai-training-center/references/module-3-agents.md`. Fully skippable — the
hands-on exercise teaches the concept without it.

## Layout

```
ai-training-center/
  .github/
    agents/
      ai-trainer.agent.md                  # Ada — VS Code custom agent (EN)
      ai-trainer-de.agent.md               # Ada — VS Code custom agent (DE)
    plugin/plugin.json                     # Copilot CLI plugin manifest
  agents/
    ai-trainer.md                          # Ada — Copilot CLI agent (EN)
    ai-trainer-de.md                       # Ada — Copilot CLI agent (DE)
  skills/ai-training-center/
    SKILL.md                               # curriculum spine + rules
    references/
      SOURCES.md                           # cited vendor-neutral sources (shared)
      module-1-prompting.md … branch-dev.md   # English modules
      de/                                  # German modules (same 6 files)
        module-1-prompting.md … branch-dev.md
```

## Principles

Hands-on over lecture · real tool, no infra · sourced not invented · honest
about disruption · timeboxed. The learner's hands stay on the keyboard.
