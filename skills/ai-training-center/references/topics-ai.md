# Adaptive AI-topics track — catalog & guidance

Ada uses this file for **session type B**: a level-aware tour of AI topics from
fundamentals to advanced, not tied to the learner's SAP role. Teach one topic at
a time, adapt to their level, keep turns short, check understanding, and follow
their interest instead of a fixed order.

Sourcing rule: cite `SOURCES.md` tags where a claim maps to them
(`[GOOGLE-PROMPTING]`, `[ANTHROPIC-AGENTS]`, `[DEEPMIND-SAFETY]`). Much of this
catalog is **standard, widely-accepted industry knowledge** — when a point isn't
tied to a cited source, say so plainly. Never invent a citation or a statistic.

**Emphasis:** whatever their level, make sure they leave with (1) a solid grip on
**agents — what they are and what they can do**, (2) the **core vocabulary**
below, and (3) **trust built through their own questions** ("how does it know
that?"). Weave the glossary and the trust questions into every topic; don't save
them for the end.

---

## Place the learner's level

Offer three levels and let them self-select:

- **Curious / beginner** — new to AI; wants the mental model and confidence.
- **Practitioner / intermediate** — already uses AI tools; wants the how, the
  why, and the tradeoffs.
- **Builder / advanced** — wants architecture, agents, governance, and the
  unsettled edges.

If unsure, ask these **3 calibration questions** and place them yourself:

1. "In one sentence, what is a large language model doing when it answers you?"
   (Blank → beginner; "predicts text / next word" → intermediate; mentions
   tokens/probability/training → advanced.)
2. "Have you used retrieval, tools/function-calling, or an agent that takes
   actions — or mostly chat?" (Chat only → beginner/intermediate; yes to
   tools/agents → intermediate/advanced.)
3. "Do you care more about *using* AI well, or *building/architecting* AI
   systems?" (Using → keep it practical; building → go to the advanced tier.)

Show them the tier for their level **plus one tier up** as a stretch, then ask:
pick topics, or let Ada guide a path.

---

## Tier 1 — Fundamentals (beginner)

**1. The AI family tree.** AI ⊃ machine learning ⊃ deep learning ⊃ generative AI
⊃ large language models (LLMs). "AI" is the umbrella; today's chat tools are one
branch. *Why:* stops people conflating "AI" with "ChatGPT."

**2. What an LLM actually does.** It predicts the next chunk of text (a *token*)
over and over, based on patterns learned from huge amounts of text. It has no
database of facts and no live view of your systems. *Why:* explains both its
fluency and its mistakes. *Hook:* ask it the same question twice, notice the
wording differs.

**3. Tokens & context window.** Text is split into tokens; the *context window*
is how much it can "hold in mind" at once (your prompt + its answer). Overflow =
it forgets the start. *Why:* explains length limits and why pasting a whole
manual can backfire.

**4. Training vs inference.** *Training* = the slow, expensive process that made
the model (done once, by the vendor). *Inference* = each fast answer it gives
you. Your chats don't retrain it. *Why:* clears up "does it learn from me?"

**5. Prompting basics.** A prompt is an instruction; specificity, context,
format, and one example do most of the work. Pattern: **Role · Task · Context ·
Constraints · Format · Example.** [GOOGLE-PROMPTING] *Hook:* re-ask a vague
prompt with this structure and compare.

**6. Hallucination — confident and wrong.** Because it predicts plausible text,
it can state false things in a confident tone. It optimizes for *sounding right*,
not *being right*. Factuality is an active, unsolved research problem.
[DEEPMIND-SAFETY] *Why:* the #1 reason to verify.

**7. Non-determinism & verification.** Same prompt can give different answers;
there's randomness by design. So treat output as a **draft to verify**, never as
ground truth. *Hook:* run one prompt 3× and compare.

**8. Data, privacy & what never to paste.** Assume anything you paste may leave
your control unless your tool is contractually enterprise-scoped. Never paste
secrets, personal data, or client-confidential content into an unapproved tool.
*Why:* the one rule that keeps them out of trouble.

---

## Tier 2 — Intermediate (practitioner)

**9. Embeddings & semantic search.** Text becomes vectors (lists of numbers) so
similar meaning sits close together — search by *meaning*, not keywords. *Why:*
the engine under "chat with your documents."

**10. RAG — retrieval-augmented generation.** Fetch relevant snippets from *your*
data and paste them into the prompt so the model answers from facts, not memory.
Cuts hallucination, keeps answers current. *Why:* the most common enterprise
pattern.

**11. Prompting vs RAG vs fine-tuning.** Reach for them in that order: prompt
first (cheap, instant); add RAG when it needs *your* facts; fine-tune only to
bake in *style/format/behavior* at scale (expensive, rarely first). *Why:*
prevents "let's fine-tune" as a reflex.

**12. Tool use / function calling.** The model can call tools (search, run code,
hit an API, read a file) and use the result. This is what turns a talker into a
doer. [ANTHROPIC-AGENTS] *Hook:* notice when your assistant "looked something up."

**13. Agents & the agent loop.** An agent is "an LLM using tools based on
environmental feedback **in a loop**" — plan → act → observe → repeat until done.
It gains *ground truth* from the environment each step. [ANTHROPIC-AGENTS]

**14. Workflows vs agents.** Workflows follow **predefined** code paths (more
predictable); agents let the model **direct its own** steps (more flexible,
higher cost and error risk). Start simple; add autonomy only when it pays off.
[ANTHROPIC-AGENTS]

**15. Multimodality.** Modern models handle text, images, audio, and code — e.g.
read a screenshot, describe a chart, transcribe a call. *Why:* expands what a
single prompt can do.

**16. Context engineering / system prompts.** The *system prompt* sets the role
and rules; good context (the right documents, examples, constraints) beats a
cleverer model. "Garbage in, garbage out" still rules. [GOOGLE-PROMPTING]

**17. Evaluation — how you know it's good (evals).** You can't improve what you
don't measure. Evals = a repeatable test set with expected outcomes, so you catch
regressions instead of vibes. Factuality benchmarks exist because this is hard.
[DEEPMIND-SAFETY]

**18. Guardrails & human-in-the-loop.** Autonomy raises cost and the risk of
**compounding errors**; mitigate with guardrails, sandboxed testing, stopping
conditions, and a human checkpoint on consequential actions. [ANTHROPIC-AGENTS]

---

## Tier 3 — Advanced (builder)

**19. Transformers & attention (high level).** The architecture behind modern
LLMs; *attention* lets the model weigh which earlier tokens matter for the next
one. You don't need the math to reason about behavior — but know the name.
*(General industry knowledge.)*

**20. Reasoning models & test-time compute.** Some models "think" in steps
(chain-of-thought) or spend more compute at answer time to solve harder problems.
Better on reasoning, but slower and pricier — a real tradeoff. *(General industry
knowledge; frame cost/quality honestly.)*

**21. Model Context Protocol (MCP) & tool ecosystems.** An open standard for
connecting models to tools and data sources in a uniform way, so capabilities
plug in without bespoke glue. *Why:* where agent tooling is standardizing.
*(General industry knowledge.)*

**22. Multi-agent orchestration.** Splitting work across specialized agents
(planner, worker, reviewer) that coordinate. More power, but more moving parts
and more ways to fail — apply the "start simple" rule hard. [ANTHROPIC-AGENTS]

**23. Fine-tuning methods, distillation, quantization.** *LoRA* = cheap targeted
fine-tuning; *distillation* = train a small model to mimic a big one; *quantization*
= shrink a model to run cheaper/faster. All trade some quality for cost/speed.
*(General industry knowledge.)*

**24. RLHF & alignment.** Models are tuned with human feedback to be more helpful
and safe; *alignment* is the open problem of making systems reliably do what we
intend. Oversight and factuality are active, unsolved work. [DEEPMIND-SAFETY]

**25. Prompt injection & AI security.** Untrusted text (a web page, a document,
an email) can carry hidden instructions that hijack an agent. Treat model input
as untrusted; constrain tools and permissions. *Why:* the top new attack surface.
*(General security knowledge; ties to the guardrails theme in [ANTHROPIC-AGENTS].)*

**26. AI governance & the EU AI Act.** Regulation classifies uses by **risk**
(e.g. unacceptable / high / limited / minimal) with duties that scale to risk;
HR/hiring uses often land in higher tiers. Responsible AI means anticipating and
evaluating against a **broad spectrum of risks**. [DEEPMIND-SAFETY] *(Cite the
Act as general regulatory knowledge; don't quote specific article numbers unless
certain.)*

**27. Model selection: cost / latency / quality.** Bigger isn't always right —
match the model to the job (a small fast model for classification, a strong one
for reasoning). Measure with evals, not vibes. *(General industry knowledge.)*

**28. Responsible AI: bias & fairness.** Models reflect biases in their training
data; in people-facing SAP HCM use (hiring, evaluation) this is a live risk that
needs human oversight and testing, not blind trust. [DEEPMIND-SAFETY]

---

## Agents in depth (teach this to everyone)

Agents are the headline. Even a beginner should leave able to explain what an
agent is and name one thing they'd hand to one.

**What an agent is.** Start from the building block: an **augmented LLM** — a
model plus **tools**, **retrieval**, and **memory** it can actively use, choosing
its own searches and tools. [ANTHROPIC-AGENTS] An **agent** wraps that in a
**loop**: it takes a goal, then **plans → acts (calls a tool) → observes the
result → repeats** until the task is done or a stop condition trips. Anthropic's
plain definition: agents are "just LLMs using tools based on environmental
feedback in a loop." [ANTHROPIC-AGENTS]

**Why the loop is the magic.** Each step it gains **ground truth** from the
environment — a real tool result, a code run, a file it read — so it can correct
course instead of guessing in one shot. That feedback is what separates an agent
from a chatbot. [ANTHROPIC-AGENTS]

**Workflows vs. agents (say this clearly).** *Workflows* run LLM steps along
**predefined** paths you wrote — predictable, cheap, easy to debug. *Agents* let
the model **decide its own** steps — flexible and powerful, but higher cost and
more ways to go wrong. Rule of thumb: **start simple, add autonomy only when it
demonstrably pays off.** [ANTHROPIC-AGENTS]

**What you can actually do with an agent** (make this concrete for them):
- **Coding agent** — "fix this failing test / add this feature across files";
  it reads the repo, edits, runs tests, iterates. [ANTHROPIC-AGENTS]
- **Research/search agent** — gather and synthesize from many sources until it
  has enough to answer.
- **Support agent** — chat + real actions (look up an order, issue a refund,
  update a ticket) with success clearly measurable. [ANTHROPIC-AGENTS]
- **Computer use** — drive a browser/UI to complete a multi-step task.
  [ANTHROPIC-AGENTS]
- **Ops/data agent** — pull data, run a check, file the result — the shape most
  SAP back-office tasks take.

**Common agent patterns** (name-drop so the vocabulary sticks): *prompt chaining*
(step feeds the next), *routing* (classify then send to a specialist), *
parallelization* (split work or vote), *orchestrator-workers* (a lead agent
delegates to workers and synthesizes), *evaluator-optimizer* (one generates, one
critiques, loop). [ANTHROPIC-AGENTS]

**The catch — say it honestly.** Autonomy means higher cost and **compounding
errors** (a wrong step feeds the next). Mitigate with **guardrails**, **sandboxed
testing**, **stopping conditions**, and a **human-in-the-loop** checkpoint on
anything consequential. [ANTHROPIC-AGENTS]

*Micro-exercise:* have them give their own Copilot/Joule a small multi-step task
("read this file, summarize it, then draft a reply") and watch it plan → act →
observe. Then map what they saw onto goal · tools · loop · memory · guardrail.

---

## Core vocabulary — the words they need

Teach these **in context**, as each topic comes up, not as a list to memorize.
When you use a term, define it in one line. Terms drawn from current agent
practice. [ANTHROPIC-AGENTS]

Foundations:
- **Model / LLM** — the trained system that predicts text.
- **Token** — a chunk of text (≈¾ of a word) the model reads and writes in.
- **Context window** — how much text it can consider at once (prompt + answer).
- **Prompt** — your instruction to the model. [GOOGLE-PROMPTING]
- **System prompt** — the hidden setup that gives it its role and rules.
- **Training** — building the model (once, by the vendor). **Inference** — one
  answer at run time.
- **Parameters / weights** — the numbers learned in training that hold its
  "knowledge."
- **Temperature** — a randomness dial; higher = more varied, lower = more
  repeatable.
- **Hallucination** — a confident but false answer. [DEEPMIND-SAFETY]
- **Grounding** — tying answers to real, given facts (e.g. via retrieval).

Agent words:
- **Tool / function calling** — the model invoking an external action (search,
  API, run code) and using the result. [ANTHROPIC-AGENTS]
- **Agent** — an LLM using tools in a loop toward a goal. [ANTHROPIC-AGENTS]
- **Agent loop** — plan → act → observe → repeat until done or stopped.
  [ANTHROPIC-AGENTS]
- **Ground truth** — the real result from the environment the agent checks each
  step. [ANTHROPIC-AGENTS]
- **Harness** — the scaffolding **around** the model that makes it an agent: the
  system prompt, tool definitions, memory, and the loop that runs it. (The model
  is the engine; the harness is the car.) *(General industry term; Anthropic
  calls the tool side the **agent-computer interface / ACI**.)* [ANTHROPIC-AGENTS]
- **Memory** — what the agent keeps across steps (or sessions).
- **Stopping condition** — a limit (max steps, "ask the human") that keeps an
  agent in control. [ANTHROPIC-AGENTS]
- **Guardrail** — a rule or filter that blocks unsafe actions.
  [ANTHROPIC-AGENTS]
- **Human-in-the-loop (HITL)** — a person approves consequential steps.
  [ANTHROPIC-AGENTS]
- **MCP (Model Context Protocol)** — an open standard for plugging tools/data
  into models. [ANTHROPIC-AGENTS]
- **Orchestrator / multi-agent** — a lead agent coordinating specialized ones.
  [ANTHROPIC-AGENTS]

Data & tuning words:
- **Embedding** — text turned into a vector so similar meaning sits close.
- **Vector search** — finding text by meaning, not keywords.
- **RAG** — fetch your facts, put them in the prompt, answer from them.
- **Fine-tuning** — further training to bake in style/behavior.
- **Eval** — a repeatable test set that measures quality. [DEEPMIND-SAFETY]
- **Prompt injection** — hidden malicious instructions smuggled in via input.

---

## Trust-building questions — "how does it know that?"

The fastest way to trust (and to *calibrate* trust) is to interrogate the model.
Give the learner these questions to fire at their own tool, then debrief what the
answer reveals. The goal is not blind faith — it's an accurate mental model.

Ask the model directly:
- **"How do you know that? What's your source?"** — watch whether it cites
  something real or hedges. Teaches: it predicts plausible text; it may not have
  a source. [DEEPMIND-SAFETY]
- **"How confident are you, and what would make you wrong?"** — surfaces its
  uncertainty instead of a confident tone.
- **"Did you look that up or recall it from training?"** — separates retrieval
  (grounded) from memory (may be stale/invented). [ANTHROPIC-AGENTS]
- **"What's your training cutoff — could this be out of date?"** — teaches the
  freshness limit.
- **"Show your steps"** / **"think step by step"** — makes reasoning inspectable.
  [GOOGLE-PROMPTING]

Probes the learner runs to see the seams:
- **Ask the same question twice** — different wording proves non-determinism.
- **Ask about something that doesn't exist** (a made-up SAP transaction, a fake
  API) — provoke a hallucination on purpose, then discuss why it happened.
  [DEEPMIND-SAFETY]
- **Give it a document, then ask something not in it** — see if it admits "not in
  the text" or invents. Teaches grounding vs. guessing.
- **Ask it to do arithmetic or count** — classic weak spot; shows why tools
  (a calculator) beat raw generation. [ANTHROPIC-AGENTS]
- **Paste a wrong fact and ask it to agree** — test whether it pushes back
  (sycophancy check).

Debrief every time with the same beat: *what did that reveal about how it
works, and what does that mean for when you can trust it?* End with the
one-liner: **treat output as a draft to verify, and it becomes a great tool.**

---


- **Beginner:** analogy before the term; one tiny hands-on exercise per topic;
  celebrate the "aha."
- **Intermediate:** the how + the tradeoff; a prompt or mini-experiment they run
  in their own tool.
- **Advanced:** discuss architecture, failure modes, and open problems; it's a
  conversation, not a drill.
- If they breeze through, jump a tier. If they're lost, drop one and re-anchor.
- End by naming the 3 topics they now understand and one concrete next step
  (a thing to try, or a source to read).
