# Module 2 — Why it sometimes lies  (~13 min)

Goal: they can predict *when* AI is unreliable and have a habit for catching it.
This is the module that keeps an SAP professional out of trouble.

Sources: [ANTHROPIC-AGENTS], [DEEPMIND-SAFETY] (see SOURCES.md).

---

Frame (1–2 turns): The model predicts likely text; it does not look anything up
unless you give it a source or a tool. So it can produce a confident,
well-formatted answer that is **wrong** — a "hallucination." It's also
**non-deterministic**: the same prompt can give different answers. Factuality is
an open, actively-researched problem — Google DeepMind even maintains a
factuality benchmark and a Frontier Safety Framework for exactly this reason
[DEEPMIND-SAFETY]. And with agents that act in a loop, small errors can
**compound** step to step [ANTHROPIC-AGENTS].

Exercise 1 — provoke a hallucination. Have them ask their own tool something
precise and checkable from their world, where invention is likely:
```
What is the exact SAP OSS note number and title that fixes [a specific
niche error they know], and quote the note's first line?
```
or (developer):
```
Give me the exact signature of [an obscure or made-up SAP BAPI/class method],
including all parameters.
```
**Wait.** Ask: "Do you believe it? Can you verify it against the real system?"

Debrief: it often invents a plausible note number / signature. The danger isn't
that it's wrong — it's that it's wrong *confidently and in the right format*.

Exercise 2 — see the non-determinism. Same prompt, run 2–3 times (new chat each
time):
```
[re-paste the same question]
```
**Wait.** Ask what changed between runs.

Debrief: different answers = there is no single "the answer" inside it. Treat
output as a **draft to verify**, never a citation.

Exercise 3 — grounding fixes it. Take the **same** question from Exercise 1, but
this time paste the real source and force a citation (new chat):
```
Using ONLY the text below, answer [the same question]. Quote the exact line you
used; if the answer isn't in the text, say "not in the source."
---
[paste the real OSS note / the real method signature from the system / the real
policy paragraph]
```
**Wait.** Ask: is this answer verifiable now? Where did the earlier confidence
come from?

Debrief: grounding it in real text turns a guess into something you can check
line by line — that's trust-checklist item 2, live. The habit that scales: never
ask from memory when you can paste the source.

## The trust checklist (give them this — it's their guardrail)
Before you act on an AI answer:
1. **Is it checkable?** Verify facts, numbers, note IDs, signatures against the
   real system/docs — never ship an unverified specific.
2. **Did I give it the source?** Grounded-in-your-text answers beat from-memory
   answers. Paste the policy/spec; ask it to quote it.
3. **Stakes check** — the higher the consequence (payroll, PII, production),
   the more verification. [DEEPMIND-SAFETY]: match scrutiny to risk.
4. **Would I sign my name under it?** If not, verify or discard.

## Check
If their provoked answer happened to be correct, don't hand-wave it — have them
verify it against the real system anyway. The lesson is the *habit of checking*,
not that the model failed this once.
