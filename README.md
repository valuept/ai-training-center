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

This repo is a GitHub Copilot **plugin marketplace**, so you install it from
inside the app — no cloning, no copying folders.

1. In GitHub Copilot desktop, open **plugin / marketplace management** and
   **add a marketplace from GitHub**, pointing at this repo:
   ```
   valuept/ai-training-center
   ```
2. Install the **ai-training-center** plugin from that marketplace and make sure
   it's **enabled**. The app downloads it and registers the agent for you.
3. **Start a new chat** and select **@ai-trainer** from the agent picker.
4. Open a **second window** with any AI tool you can type into (Copilot in
   another file, SAP Joule, ChatGPT).
5. Type `start`. Ada first asks **English or Deutsch**, then which **session
   type** you want:
   - **A — Guided hour**: the SAP-tailored ~60-minute curriculum above (HCM or
     developer branch).
   - **B — AI topics at your level**: Ada checks your AI knowledge level and
     teaches AI concepts from fundamentals to advanced — **agents first**, plus
     the core vocabulary and hands-on "how does it know that?" trust questions.
   Say "skip", "go deeper", or "pause" any time.

> One agent, both languages: **@ai-trainer** asks the learner which language to
> use on the very first message, then runs the whole session in that language.

## Languages / Sprachen

Same curriculum, same sources, in **English** and **German (Deutsch)**. Ada asks
at the start and switches the whole session — informal **du** in German. The
cited sources (`references/SOURCES.md`) stay in their original English; the
German module content lives under `skills/ai-training-center/references/de/`.

## Optional live demo (presenter-led)

Module 3 can show real agent anatomy using the `agent0` CLI in this repo
(plan → execute → policy → memory). Commands are in
`skills/ai-training-center/references/module-3-agents.md`. Fully skippable — the
hands-on exercise teaches the concept without it.

## Layout

```
ai-training-center/
  .github/plugin/
    plugin.json                            # plugin manifest
    marketplace.json                       # makes the repo installable in-app
  agents/
    ai-trainer.md                          # Ada — one agent, asks EN/DE at start
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
