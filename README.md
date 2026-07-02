# AI Training Center

A **one-hour, hands-on AI-agent literacy training** for SAP HCM consultants and
SAP developers, packaged as a **custom agent for GitHub Copilot desktop**. You
install the folder once, then start a chat session and pick the agent — no
terminal, no setup.

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

## Install in GitHub Copilot desktop

1. **Download the repo** — clone or download-ZIP:
   ```
   git clone https://github.com/valuept/ai-training-center
   ```
2. **Install it as an agent** — copy the whole `ai-training-center` folder into
   your Copilot plugins folder, then restart the app:
   ```
   ~/.copilot/installed-plugins/ai-training-center/
   ```
   (On Windows that's `C:\Users\<you>\.copilot\installed-plugins\`.) The app
   picks up the agent automatically on restart.
3. **Start a new chat** and choose the agent from the picker:
   **ai-trainer** (English) or **ai-trainer-de** (German).
4. Open a **second window** with any AI tool you can type into (Copilot in
   another file, SAP Joule, ChatGPT).
5. Type `start` (or anything) to begin. Ada greets you, confirms your role
   (HCM consultant or developer), and runs the hour. Say "skip", "go deeper",
   or "pause" any time.

> Nothing else to configure — Ada reads the module content straight from the
> installed folder (`skills/ai-training-center/references/`).

## Languages / Sprachen

The training ships in **English** and **German (Deutsch)** — same curriculum,
same sources.

| | Pick this agent | Module references |
|---|---|---|
| English | **ai-trainer** | `skills/ai-training-center/references/` |
| Deutsch | **ai-trainer-de** | `skills/ai-training-center/references/de/` |

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
  .github/plugin/plugin.json                # agent manifest (loaded by Copilot desktop)
  agents/
    ai-trainer.md                          # Ada — English agent
    ai-trainer-de.md                       # Ada — German agent
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
