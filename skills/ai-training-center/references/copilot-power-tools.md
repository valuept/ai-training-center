# Power up your Copilot — slash commands, skills & hooks

An optional practical add-on for either session type. Once colleagues can *use*
AI, this shows them how to *shape their own tool*: quick slash commands, then how
to build a **skill** (reusable instructions) and a **hook** (automation at key
moments). All facts here are from GitHub's own docs. [GITHUB-COPILOT-DOCS]

Teach it hands-on: have them run a command or create one small file in their own
Copilot, not just read. Slash commands and file locations below are for **GitHub
Copilot** (CLI and the desktop app share the same engine and `~/.copilot` config).

---

## 1. Useful slash commands

Type these at the start of a message in an interactive session. [GITHUB-COPILOT-DOCS]

Everyday:
- **`/help`** — list the available commands.
- **`/clear`** — start a fresh conversation (drop the current context).
- **`/model`** — switch the AI model you're using.
- **`/login`** — authenticate with GitHub.

Context & files:
- **`@path/to/file`** — attach a file's contents as context (type `@`, pick from
  the list). Not a slash command, but the most-used shortcut.
- **`!command`** — run a shell command directly, without calling the model
  (e.g. `!git status`).
- **`/add-dir /path`** — trust and include another directory.
- **`/cwd /path`** (or **`/cd`**) — switch the working directory mid-session.

Managing the session:
- **`/context`** — visual overview of how much of the context window you're using.
- **`/compact`** — compress the conversation history to free up context.
- **`/usage`** — session stats: credits used, duration, lines edited, tokens per
  model.
- **`/resume`** — reopen a previous session with its saved context
  (`copilot --continue` reopens the most recent one).

Power features:
- **`/agent`** — pick a custom agent (like `@ai-trainer`) for this task.
- **`/mcp add`** — connect a new MCP server (extra tools/data sources).
- **`/every 1h <prompt>`** / **`/after 30m <prompt>`** — schedule a prompt to run
  repeatedly, or once after a delay.
- **`/sandbox enable`** — restrict Copilot's filesystem/network access for safety.

*Micro-exercise:* have them run `/context`, attach a file with `@`, then run
`!git status` (or any shell command) — three shortcuts in 60 seconds.

---

## 2. Create a skill (reusable instructions)

A **skill** is a folder of instructions (and optional scripts) that Copilot loads
**automatically when relevant** — so a repeatable task ("review our ABAP against
our checklist", "draft a status update in our format") is done consistently every
time, without re-pasting the instructions. This very training is a skill.
[GITHUB-COPILOT-DOCS]

**Where it lives:**
- Project skill (one repo): `.github/skills/<skill-name>/SKILL.md`
- Personal skill (all your projects): `~/.copilot/skills/<skill-name>/SKILL.md`

Use a lowercase, hyphenated folder name. The file **must** be named `SKILL.md`.

**Minimum `SKILL.md`:** YAML frontmatter (`name`, `description`) + a Markdown body
of instructions. The `description` is how Copilot decides when to use it — say
*what it does and when to use it*.

```markdown
---
name: status-update-writer
description: Writes a weekly status update in our team's format. Use when asked to draft a status update or weekly report.
---

When asked for a status update, produce exactly these sections:
1. **Done this week** — bullets, past tense, each with the ticket ID.
2. **In progress** — bullets with an ETA.
3. **Blocked / needs a decision** — who you need it from.
Keep it under 150 words. Ask for the ticket list if it wasn't given.
```

**Optional: add a script.** Drop any file in the skill folder and reference it in
`SKILL.md`; Copilot makes it available. To let it run without a prompt each time,
add `allowed-tools: shell` to the frontmatter — **only if you fully trust the
skill and its scripts**, because that removes the confirmation step.
[GITHUB-COPILOT-DOCS]

```text
.github/skills/image-convert/
├── SKILL.md
└── convert-svg-to-png.sh
```

*Micro-exercise:* have them create `~/.copilot/skills/hello/SKILL.md` with a
two-line instruction, start a new chat, and watch Copilot pick it up.

---

## 3. Create a hook (automation at key moments)

A **hook** runs a shell command **automatically at a specific point** in a Copilot
session — e.g. log every prompt, run tests after a file changes, or play a sound
when the agent finishes. Hooks are how you wire Copilot into your own guardrails
and workflow. [GITHUB-COPILOT-DOCS]

**Where it lives:**
- Project hook: `.github/hooks/<name>.json`
- Personal hook: `~/.copilot/hooks/<name>.json` (Windows:
  `%USERPROFILE%\.copilot\hooks\`)

Hook config changes load when Copilot **starts**, so restart after editing.

**The events you can hook** (put a command under any of these):
`sessionStart`, `sessionEnd`, `userPromptSubmitted`, `preToolUse`, `postToolUse`,
`errorOccurred`, `agentStop`. [GITHUB-COPILOT-DOCS]

**Shape of the file** — a `version` and a `hooks` map. Give each command a `bash`
key (Linux/macOS) and/or a `powershell` key (Windows); Copilot picks the right one
for the OS.

```json
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": "echo \"Session started: $(date)\" >> logs/session.log",
        "powershell": "Add-Content -Path logs/session.log -Value \"Session started: $(Get-Date)\"",
        "timeoutSec": 10
      }
    ]
  }
}
```

You can also point a hook at a script file instead of an inline command, and pass
`env` variables to it. [GITHUB-COPILOT-DOCS]

**Note for SAP developers:** a `postToolUse` hook that runs your linter/tests
after Copilot edits a file is exactly the kind of guardrail that makes an
**agentic development cycle** safe — the loop gets automatic feedback every step.

*Windows prerequisite:* PowerShell 7+ (`pwsh --version`; install with
`winget install Microsoft.PowerShell`). [GITHUB-COPILOT-DOCS]

---

## Why this matters (tie it back)

Slash commands = speed. Skills = *your* knowledge, reused reliably. Hooks = *your*
guardrails, applied automatically. Together they turn Copilot from a generic
assistant into a tool that works the way your team works — the same
"augmented LLM + tools + a loop with feedback" idea from the agents topic, but
under your control. [ANTHROPIC-AGENTS]
