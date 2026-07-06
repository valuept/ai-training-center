---
name: ai-training-center
description: 'Hands-on AI-agent literacy training for SAP HCM consultants and SAP developers. Use when someone wants to learn AI/agent fundamentals (prompting, reliability, agents, agentic SDLC) and foresee AI''s impact on their SAP work. Offers a guided ~1-hour SAP-tailored hour, or an adaptive AI-topics track that assesses the learner''s level and teaches AI concepts from fundamentals to advanced (agents-first, with vocabulary and trust-building). Provides the curriculum spine, facilitation rules, per-module talking points, exercises, and cited vendor-neutral sources for the @ai-trainer agent.'
---

# AI Training Center

A facilitated, hands-on hour that teaches SAP colleagues the AI concepts that
matter for their work and helps them foresee how AI reshapes it. The learner
does every exercise in **their own AI tool** (Copilot / Joule); the facilitator
(`@ai-trainer`, "Ada") frames, sets the exercise, waits, and debriefs.

## When to use
- A SAP HCM consultant or SAP developer wants practical AI/agent literacy.
- Onboarding a team to the agents you've built and to agentic ways of working.
- Any "help me understand AI for my job, hands-on, in about an hour" request.

## Audience
- **SAP HCM consultants** — HR process experts; care about correctness, data
  privacy, and how their advisory role changes.
- **SAP developers** — care about how the software development lifecycle becomes
  an **agentic development cycle** and what they still own.
Shared hour, with a short role-specific branch near the end.

## Design principles (the non-negotiables)
1. **Hands-on over lecture.** ≤2 short concept turns, then an exercise. The
   learner's tool does the talking.
2. **Real tool, no infra.** They use their own Copilot/Joule — right here in the
   session, or in a second window only when an exercise needs one. No backend, no
   API keys, no microsite.
3. **Sourced, not invented.** Every non-obvious claim ties to
   `references/SOURCES.md` (Anthropic, Google, Google DeepMind — vendor-neutral
   primary sources).
4. **Honest about disruption.** Name the real change; don't oversell or scare.
5. **Timeboxed.** ~60 minutes total; each module has a budget.

## The hour

| # | Module | Min | Concept |
|---|--------|-----|---------|
| 1 | Cold open + Prompting that works | 18 | a prompt is an instruction; specificity, context, examples |
| 2 | Why it sometimes lies | 13 | hallucination, non-determinism, verification |
| 3 | Chatbot → Agent | 13 | augmented LLM, tools, memory, the loop, guardrails |
| 4 | Foreseeing consequences | 13 | augmentation vs replacement, human-in-the-loop |
| 5 | Branch (HCM or Dev) | 14–15 | role-specific application |
| 6 | Monday takeaway | 10 | one prompt/workflow to use tomorrow |

All six live in one file: `references/guided-hour.md` (German:
`references/de/guided-hour.md`). The facilitator reads it once per session,
not once per module — see `agents/ai-trainer.md` for the full facilitation
loop (turn rhythm, role handling, timing).

## Two session types
At the start `@ai-trainer` asks language, then offers:
- **A — Guided hour** (the table above): SAP-tailored, HCM/Dev branch.
- **B — Adaptive AI-topics track**: profession-independent. Places the learner's
  level (beginner / intermediate / advanced), then teaches AI topics from
  fundamentals to advanced, **agents-first**, weaving in a **core vocabulary**
  (agent, agent loop, harness, ground truth, tool use…) and **"how does it know
  that?" trust questions**. Catalog: `references/topics-ai.md`
  (German: `references/de/themen-ki.md`).
- **Optional add-on (after A or B) — Copilot power tools**: useful slash commands,
  and how to build a Skill and a Hook, each with a micro-exercise.
  Reference: `references/copilot-power-tools.md`
  (German: `references/de/copilot-power-tools.md`).

## Optional live demo (presenter-led)
For module 3, a presenter can run the real `agent0` CLI in this repo to show
agent anatomy (plan → execute → policy → memory) on actual code. See the
Module 3 section of `references/guided-hour.md` for the exact commands.
Skippable for a purely self-run session.

## Files
- `agents/ai-trainer.md` — the facilitator agent (persona, turn rhythm, full loop)
- `references/guided-hour.md` — all 6 modules + both branches, one file (session type A)
- `references/topics-ai.md` — adaptive AI-topics catalog (session type B)
- `references/copilot-power-tools.md` — slash commands + how to build skills & hooks (optional add-on)
- `references/de/` — German equivalents (`guided-hour.md`, `themen-ki.md`, `copilot-power-tools.md`)
- `references/SOURCES.md` — cited vendor-neutral sources

Reference files are read silently by the agent — a session touches at most
two of them (the guided hour or the topics catalog, plus optionally the power
tools file), which keeps file-access prompts to a minimum.
