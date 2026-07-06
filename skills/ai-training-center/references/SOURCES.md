# Sources

Vendor-neutral primary sources only. Every non-obvious claim in the modules
cites one of these by its short tag (e.g. `[ANTHROPIC-AGENTS]`). Pulled and
read before the modules were written.

## [ANTHROPIC-AGENTS] — Anthropic, "Building effective agents"
https://www.anthropic.com/engineering/building-effective-agents
Takeaways used:
- The basic building block is the **augmented LLM**: an LLM plus retrieval,
  tools, and memory — it generates its own queries, selects tools, decides what
  to retain.
- **Workflow vs agent:** workflows run LLMs/tools on predefined code paths;
  agents let the LLM dynamically direct its own process and tool use.
- An agent is "typically just LLMs using tools based on environmental feedback
  in a loop"; it gains **ground truth** from the environment each step and can
  pause for human feedback at checkpoints.
- Autonomy raises **cost and the risk of compounding errors**; use guardrails,
  sandboxed testing, and stopping conditions.
- Core principles: **simplicity, transparency (show planning steps), a well-
  documented tool interface.** Start simple; add complexity only when it
  demonstrably improves outcomes.

## [GOOGLE-PROMPTING] — Google, "Prompt design strategies" (Gemini API docs)
https://ai.google.dev/gemini-api/docs/prompting-strategies
Takeaways used:
- **Clear, specific instructions** are the most efficient way to shape output;
  state what to do and what not to do (constraints).
- Specify **response format** (table, list, sentence) to control output shape.
- **Zero-shot vs few-shot:** examples regulate formatting, phrasing, scope;
  "always include few-shot examples… prompts without them are likely less
  effective." Keep example formatting consistent; too many examples can overfit.
- **Add context:** include the info the model needs instead of assuming it has
  it — generic answers become specific ones.

## [DEEPMIND-SAFETY] — Google DeepMind, "Responsibility & Safety"
https://deepmind.google/responsibility-and-safety/
Takeaways used:
- Responsible AI means **anticipating and evaluating systems against a broad
  spectrum of risks** across governance, research, and impact.
- Ongoing work includes a **benchmark for evaluating factuality** of LLMs and a
  **Frontier Safety Framework** to stay ahead of severe risks — i.e. factuality
  and oversight are active, unsolved problems, not afterthoughts.

## [GITHUB-COPILOT-DOCS] — GitHub, "GitHub Copilot CLI" documentation
https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/overview
https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/use-hooks
Takeaways used (product facts, not claims about AI behavior):
- **Slash commands** in an interactive session: `/agent`, `/mcp add`, `/usage`,
  `/context`, `/compact`, `/add-dir`, `/cwd` or `/cd`, `/resume`, `/every`,
  `/after`, `/sandbox enable`, `/login`; plus `@path` to attach a file and `!`
  to run a shell command directly. Verified against the docs 2026-07.
- **Skills** are folders with a `SKILL.md` (YAML frontmatter: `name`,
  `description`, optional `license`, optional `allowed-tools`) plus optional
  scripts/resources. Project skills live in `.github/skills/<name>/`; personal
  skills in `~/.copilot/skills/<name>/`.
- **Hooks** are `.json` files (`.github/hooks/` per repo, `~/.copilot/hooks/`
  per user) with a `version` and a `hooks` map of events — `sessionStart`,
  `sessionEnd`, `userPromptSubmitted`, `preToolUse`, `postToolUse`,
  `errorOccurred`, `agentStop` — each running a `bash` and/or `powershell`
  command at that point.

## Note on the on-hand PDF
An attached "Building Effective AI Agents — Architecture Patterns" PDF exists in
the user's Copilot attachments. Not cited directly; its themes are covered by
[ANTHROPIC-AGENTS], which is the traceable primary. Cite the PDF only if a claim
needs it and it can be traced to a primary source.
