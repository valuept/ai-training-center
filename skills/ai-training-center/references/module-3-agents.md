# Module 3 — Chatbot → Agent  (~13 min)

Goal: they understand what turns a chat assistant into an *agent*, so the word
"agent" stops being magic and becomes a checklist they can reason about.

Source: [ANTHROPIC-AGENTS] (see SOURCES.md).

---

Frame (1–2 turns): A chatbot answers. An **agent acts**. [ANTHROPIC-AGENTS]
describes the building block as the **augmented LLM** — an LLM plus:
- **Tools** — it can *do* things (call an API, run code, read a file), not just
  talk.
- **Memory / retrieval** — it can pull in and retain information.
- **A loop** — "LLMs using tools based on environmental feedback in a loop": it
  acts, sees the real result (ground truth), decides the next step, repeats.
- **Guardrails + human checkpoints** — because autonomy raises cost and the risk
  of **compounding errors**, good agents have limits and pause for human
  judgment at checkpoints.

So the checklist for "is this an agent?": **goal · tools · memory · loop ·
guardrails.**

Exercise — make their tool *act*, not just answer. Have them use their tool's
agent/tools mode (Copilot agent mode, Joule, etc.) on a small multi-step task:
```
Goal: In this project, find every file that mentions "[a term]", summarize
what each does, and propose one concrete improvement. Show me your plan first,
then do it step by step.
```
**Wait.** Ask: "Where did it plan? Where did it use a tool and read a real
result? Where should it have stopped to ask you?"

Debrief: map what they saw onto the checklist. The "show me your plan first" is
**transparency** — [ANTHROPIC-AGENTS]'s second core principle. The place they
wanted it to pause is the **human checkpoint**.

Exercise 2 — hold the checkpoint. Now practice the human checkpoint deliberately.
In the same agent chat:
```
Before you change anything, show me ONLY your plan as a numbered list — the files
you'd touch and why. Do not execute yet.
```
Read the plan, reply with **one** correction or constraint (e.g. "don't touch the
test files", "handle the empty-input case too"), then let it proceed.
**Wait.** Ask: did steering the plan change the outcome?

Debrief: that pause is the **human checkpoint** made real — you shaped the work
before the loop spent effort in the wrong direction. [ANTHROPIC-AGENTS]: catching
it at the plan stage is how you stop small errors from compounding downstream.

Honest note: [ANTHROPIC-AGENTS] says start simple — most value comes from a good
single prompt; reach for full agents only when the task genuinely can't be
scripted. Agents aren't automatically better, just more autonomous.

---

## Optional presenter demo — real agent anatomy with Agent0 (2–3 min)

If a presenter has this repo set up, show a real agent's skeleton. From the repo
root:
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -e .
agent0 run --objective "Design a deployment pipeline for service X" --constraint "no downtime" --acceptance-criterion "rollback in under 5 min"
agent0 memory --objective "deployment pipeline" --limit 3
```
If the `agent0` command isn't on PATH, use the module form (identical output):
```powershell
python -m agent0.cli run --objective "Design a deployment pipeline for service X" --constraint "no downtime" --acceptance-criterion "rollback in under 5 min"
python -m agent0.cli memory --objective "deployment pipeline" --limit 3
```
Point out in the JSON output: the **plan** (steps), the **execution**, the
**policy** guardrail check, and that the run is written to **memory** — then
`agent0 memory` recalls it. That's goal · plan · tools · guardrails · memory in
~30 lines of real code — the same anatomy from the checklist above.

Skip this entirely for a purely self-run session; the exercise already teaches
the concept.

## Check
If their tool only ever "answered" and never took an action or read a real
result, it ran as a chatbot, not an agent — have them switch on the tool's
agent/tools mode and re-run before debriefing.
