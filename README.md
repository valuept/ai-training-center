# AI Training Center

A **one-hour, hands-on AI-agent literacy training** for SAP HCM consultants and
SAP developers, packaged as a shareable GitHub Copilot CLI plugin.

A facilitator agent — **Ada** (`@ai-trainer`) — runs the session: it presents a
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

## How a teammate runs it

1. Make sure the plugin is available to Copilot CLI (see **Install** below).
2. Open a **second window** with any AI tool you can type into.
3. Start the facilitator:
   ```
   @ai-trainer
   ```
   Ada greets you, confirms your role (HCM consultant or developer), and runs
   the hour. Say "skip", "go deeper", or "pause" any time.

## Install / share

This is a standard Copilot CLI plugin (`.github/plugin/plugin.json` +
`agents/` + `skills/`). To share it with your team, either:

- **Via repo:** keep the `ai-training-center/` folder in a repo your teammates
  can clone, and have them add it to their Copilot CLI plugins, **or**
- **Copy in:** drop the `ai-training-center/` folder into their Copilot
  installed-plugins directory (`~/.copilot/installed-plugins/…` on the machine)
  so `@ai-trainer` and the `ai-training-center` skill load.

After installing, reload/restart Copilot CLI and confirm `@ai-trainer` is
listed.

## Optional live demo (presenter-led)

Module 3 can show real agent anatomy using the `agent0` CLI in this repo
(plan → execute → policy → memory). Commands are in
`skills/ai-training-center/references/module-3-agents.md`. Fully skippable — the
hands-on exercise teaches the concept without it.

## Layout

```
ai-training-center/
  .github/plugin/plugin.json
  agents/ai-trainer.md                     # Ada — the facilitator
  skills/ai-training-center/
    SKILL.md                               # curriculum spine + rules
    references/
      SOURCES.md                           # cited vendor-neutral sources
      module-1-prompting.md
      module-2-reliability.md
      module-3-agents.md
      module-4-consequences.md
      branch-hcm.md
      branch-dev.md
```

## Principles

Hands-on over lecture · real tool, no infra · sourced not invented · honest
about disruption · timeboxed. The learner's hands stay on the keyboard.
