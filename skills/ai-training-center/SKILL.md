---
name: ai-training-center
description: 'One-hour hands-on AI-agent literacy training for SAP HCM consultants and SAP developers. Use when someone wants to learn AI/agent fundamentals (prompting, reliability, agents, agentic SDLC) and foresee AI''s impact on their SAP work. Provides the curriculum spine, facilitation rules, per-module talking points, exercises, and cited vendor-neutral sources for the @ai-trainer agent.'
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
2. **Real tool, no infra.** They use their own Copilot/Joule in a second window.
   No backend, no API keys, no microsite.
3. **Sourced, not invented.** Every non-obvious claim ties to
   `references/SOURCES.md` (Anthropic, Google, Google DeepMind — vendor-neutral
   primary sources).
4. **Honest about disruption.** Name the real change; don't oversell or scare.
5. **Timeboxed.** ~60 minutes total; each module has a budget.

## The hour

| # | Module | Min | Concept | Reference |
|---|--------|-----|---------|-----------|
| 1 | Cold open + Prompting that works | 15 | a prompt is an instruction; specificity, context, examples | `references/module-1-prompting.md` |
| 2 | Why it sometimes lies | 10 | hallucination, non-determinism, verification | `references/module-2-reliability.md` |
| 3 | Chatbot → Agent | 10 | augmented LLM, tools, memory, the loop, guardrails | `references/module-3-agents.md` |
| 4 | Foreseeing consequences | 10 | augmentation vs replacement, human-in-the-loop | `references/module-4-consequences.md` |
| 5 | Branch (HCM or Dev) | 10 | role-specific application | `references/branch-hcm.md` / `references/branch-dev.md` |
| 6 | Monday takeaway | 5 | one prompt/workflow to use tomorrow | (in `agents/ai-trainer.md`) |

## How the facilitator runs a module
Frame (1–2 turns, cite source) → give the copy-pasteable exercise → **stop and
wait** → debrief against what they saw → keep to the minute budget. Full agent
behavior is in `agents/ai-trainer.md`.

## Optional live demo (presenter-led)
For module 3, a presenter can run the real `agent0` CLI in this repo to show
agent anatomy (plan → execute → policy → memory) on actual code. See
`references/module-3-agents.md` for the exact commands. Skippable for a purely
self-run session.

## Files
- `agents/ai-trainer.md` — the facilitator agent (persona + loop + Monday close)
- `references/module-1-prompting.md` … `module-4-consequences.md` — shared blocks
- `references/branch-hcm.md`, `references/branch-dev.md` — the two tracks
- `references/SOURCES.md` — cited vendor-neutral sources
