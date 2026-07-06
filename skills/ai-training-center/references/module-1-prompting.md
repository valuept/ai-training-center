# Module 1 — Cold open + Prompting that works  (~18 min)

Goal: they feel the gap between a vague ask and a good one, and leave with a
repeatable prompting pattern they can use on real SAP work.

Source: [GOOGLE-PROMPTING] (see SOURCES.md).

---

## Part A — Cold open (5 min): do it, don't hear about it

Frame (1 turn): "Before any theory — let's just use the thing. Pick a small real
task from your actual work this week: a policy question, a bit of config to
explain, a snippet to write, an email to a stakeholder."

Exercise 1 — the vague ask. Have them paste into their own AI tool:
```
Help me with [their real task, in one vague sentence].
```
Then **wait.** Ask: "How usable is that answer, 0–10? What's missing?"

Debrief: most people get a generic 5/10. That gap is the whole training. The
model isn't dumb — it's guessing at everything you didn't say.

---

## Part B — Prompting that works (10 min)

Frame (1–2 turns): A prompt is just an **instruction**. The model can't read
your mind or see your SAP system. [GOOGLE-PROMPTING] gives four levers:

1. **Be specific** — say exactly what to do and what *not* to do (constraints).
2. **Add context** — paste the info it needs (the policy text, the error, the
   table structure). Don't assume it knows your landscape.
3. **Show the format** — ask for a table, a checklist, 3 bullets, ABAP, a
   config step list.
4. **Give an example** — one or two examples of a good answer ("few-shot")
   steer format and scope more than instructions alone. [GOOGLE-PROMPTING]
   recommends almost always including an example.

Exercise 2 — the structured re-ask. Same task as the cold open, rebuilt:
```
Role: You are a senior SAP [HCM consultant / ABAP developer].
Task: [the same task, stated precisely].
Context: [paste the relevant policy / error / requirement / snippet].
Constraints: [what it must and must NOT do; e.g. cite the source line;
             don't invent field names].
Format: [e.g. a numbered step list / a short table / commented ABAP].
Example of a good answer: [one short example, if you have one].
```
**Wait.** Ask them to rate this answer 0–10 and compare to the cold open.

Debrief: the jump from ~5 to ~8+ came from *them*, not a better model. Name the
pattern so it sticks: **Role · Task · Context · Constraints · Format · Example.**
That's the reusable template — tell them to keep it.

Timebox note: don't stop at one rebuild — Part C turns this into a habit.

## Part C — Iterate, don't restart (5 min)

Frame (1 turn): You rarely nail it in one shot, and you don't need to. Prompting
is a conversation: keep the good answer and steer it with **one** targeted
follow-up in the **same** chat, so the model keeps all the context.

Exercise 3 — the follow-up. In the same chat as Exercise 2, send one refinement:
```
Good. Now [one concrete change]: e.g. "trim to the 3 key steps and add error
handling", or "rewrite the table as commented ABAP", or "make the tone fit an
email to a skeptical stakeholder".
```
**Wait.** Ask: did the follow-up land, or did it lose context?

Debrief: notice it kept everything from before — that's the point of staying in
one chat. Two or three small steers beat one giant prompt and are faster to
review. [GOOGLE-PROMPTING] frames prompting as iterative — expect to refine.

## Check
If their structured answer isn't clearly better than the vague one, the context
was probably thin — push them to paste the *actual* policy/error/table, not a
paraphrase, and re-run once.
