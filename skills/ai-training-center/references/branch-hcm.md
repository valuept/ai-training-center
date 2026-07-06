# Branch — HCM track  (~14 min)

For SAP HCM consultants. Goal: apply everything to HR work, and feel the one
risk that matters most in their world — **data privacy** — plus how the advisory
role shifts.

Sources: [GOOGLE-PROMPTING], [DEEPMIND-SAFETY] (see SOURCES.md).

---

Frame (1 turn): HR work is high-stakes and personal-data-heavy. AI is genuinely
useful here — drafting policy explanations, job descriptions, config guidance,
first-pass answers to employee questions — *if* you handle the data and the
verification right.

## Exercise 1 — a real HCM assist (4 min)
Have them run, in their own tool, using the module-1 pattern:
```
Role: You are a senior SAP SuccessFactors / HCM consultant.
Task: Explain to a line manager, in plain language, how [a real HR policy or
config topic they handle] works, and list the 3 steps they must take.
Context: [paste the relevant policy text or config note].
Constraints: Only use the pasted policy; if something isn't covered, say
"not specified" instead of guessing. Cite the policy line you used.
Format: A short intro + a numbered 3-step checklist.
```
**Wait.** Debrief: notice it stayed grounded because they pasted the source and
forbade guessing — the module-2 trust habit, applied.

## Exercise 2 — spot the privacy trap (4 min)
This is the point of the HCM branch. Ask them to look at this tempting prompt —
**do NOT run it** — and say what's wrong:
```
Here is the payroll export for our 200 employees (names, salaries, IBANs,
sickness records). Find anomalies and tell me who to investigate.
```
**Wait** for their answer, then confirm the traps:
- **Real PII / special-category data** (health, pay) pasted into an external AI
  tool may leave your controlled environment — a GDPR problem, not just a policy
  nicety.
- Use **anonymized or synthetic** data, or a tool with a proper data-processing
  agreement and no-training guarantee.
- **Accountability stays human:** an "investigate this person" output about a
  real employee, based on an unreliable draft (module 2), is a decision you own —
  match scrutiny to the stakes [DEEPMIND-SAFETY].

Rule of thumb to give them: **never paste real employee PII into a tool that
isn't contractually cleared for it. Anonymize first, verify always.**

## Debrief — the consultant role shift (2 min)
Ada leads a short reflection:
- Your work moves from *producing* config docs and answers to *directing and
  verifying* AI drafts — faster first drafts, your judgment on top.
- Your durable value: knowing what "correct and compliant" looks like, reading
  the org's context, and owning the employee-facing consequences. AI has none
  of that.
- One concrete win they can adopt this week (feed into module 6).

## Exercise 3 — build your reusable HCM template (4 min)

Take the structured prompt from Exercise 1 and strip it to a blank template that
works for *any* HCM question:

```
Role: You are a senior SAP HCM / SuccessFactors consultant.
Task: [ONE SENTENCE — what to explain, draft, or check].
Context: [PASTE the relevant policy / config note / process description here].
Constraints: Only use the pasted text. If something isn't covered → say
"not specified." Don't invent field names or rule details.
Format: [numbered checklist / short plain-language summary / comparison table].
Example of a good answer: [short example if helpful; omit if not needed].
```

Have them fill in one more real task — different from Exercise 1 — and run it in
a fresh Copilot chat.

**Wait.** Ask: is the second output as useful as the first?

Debrief: this template is the multiplier. The [Role · Task · Context ·
Constraints · Format · Example] pattern from Module 1 works for every recurring
HCM task. The fastest place to store it so it auto-loads: a personal skill file
(`~/.copilot/skills/hcm-assist/SKILL.md`) — Copilot picks it up automatically
so you never re-paste the instructions.

---

## Check
If they didn't flag the PII/GDPR issue in exercise 2 unprompted, don't move on —
that's the single most important takeaway for an HCM consultant. Walk them
through why pasting real employee data into an uncleared tool is the trap.
