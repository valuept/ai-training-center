# Copilot aufrüsten — Slash-Befehle, Skills & Hooks

Ein optionaler praktischer Zusatz für beide Session-Typen. Sobald die Kolleg:innen
KI *nutzen* können, zeigt das hier, wie sie *ihr eigenes Werkzeug formen*: schnelle
Slash-Befehle, dann wie man einen **Skill** (wiederverwendbare Anweisungen) und
einen **Hook** (Automatisierung an Schlüsselmomenten) baut. Alle Fakten hier
stammen aus der GitHub-Doku. [GITHUB-COPILOT-DOCS]

Vermittle es praktisch: lass sie einen Befehl ausführen oder eine kleine Datei im
eigenen Copilot anlegen, nicht nur lesen. Slash-Befehle und Dateipfade unten
gelten für **GitHub Copilot** (CLI und Desktop-App teilen dieselbe Engine und
`~/.copilot`-Konfiguration).

---

## 1. Nützliche Slash-Befehle

Tipp diese am Anfang einer Nachricht in einer interaktiven Sitzung.
[GITHUB-COPILOT-DOCS]

Alltag:
- **`/help`** — die verfügbaren Befehle auflisten.
- **`/clear`** — eine frische Unterhaltung starten (den aktuellen Kontext
  verwerfen).
- **`/model`** — das genutzte KI-Modell wechseln.
- **`/login`** — bei GitHub anmelden.

Kontext & Dateien:
- **`@pfad/zur/datei`** — den Inhalt einer Datei als Kontext anhängen (`@` tippen,
  aus der Liste wählen). Kein Slash-Befehl, aber die meistgenutzte Abkürzung.
- **`!befehl`** — einen Shell-Befehl direkt ausführen, ohne das Modell aufzurufen
  (z. B. `!git status`).
- **`/add-dir /pfad`** — ein weiteres Verzeichnis vertrauen und einbinden.
- **`/cwd /pfad`** (oder **`/cd`**) — das Arbeitsverzeichnis mitten in der Sitzung
  wechseln.

Sitzung verwalten:
- **`/context`** — visueller Überblick, wie viel vom Kontextfenster du nutzt.
- **`/compact`** — den Gesprächsverlauf komprimieren, um Kontext freizumachen.
- **`/usage`** — Sitzungsstatistik: verbrauchte Credits, Dauer, geänderte Zeilen,
  Tokens pro Modell.
- **`/resume`** — eine frühere Sitzung mit ihrem gespeicherten Kontext wieder
  öffnen (`copilot --continue` öffnet die letzte).

Power-Funktionen:
- **`/agent`** — einen Custom-Agenten (wie `@ai-trainer`) für diese Aufgabe wählen.
- **`/mcp add`** — einen neuen MCP-Server anbinden (zusätzliche Tools/Datenquellen).
- **`/every 1h <prompt>`** / **`/after 30m <prompt>`** — einen Prompt wiederholt
  oder einmalig nach einer Verzögerung planen.
- **`/sandbox enable`** — Copilots Datei-/Netzwerkzugriff zur Sicherheit
  einschränken.

*Mini-Übung:* lass sie `/context` ausführen, mit `@` eine Datei anhängen, dann
`!git status` (oder einen beliebigen Shell-Befehl) — drei Abkürzungen in
60 Sekunden.

---

## 2. Einen Skill erstellen (wiederverwendbare Anweisungen)

Ein **Skill** ist ein Ordner mit Anweisungen (und optionalen Skripten), den
Copilot **automatisch lädt, wenn er passt** — so wird eine wiederkehrende Aufgabe
(„prüfe unser ABAP gegen unsere Checkliste", „entwirf ein Status-Update in unserem
Format") jedes Mal einheitlich erledigt, ohne die Anweisungen neu einzufügen.
Dieses Training ist selbst ein Skill. [GITHUB-COPILOT-DOCS]

**Wo er liegt:**
- Projekt-Skill (ein Repo): `.github/skills/<skill-name>/SKILL.md`
- Persönlicher Skill (alle Projekte): `~/.copilot/skills/<skill-name>/SKILL.md`

Nutze einen kleingeschriebenen, mit Bindestrichen getrennten Ordnernamen. Die
Datei **muss** `SKILL.md` heißen.

**Minimale `SKILL.md`:** YAML-Frontmatter (`name`, `description`) + ein
Markdown-Körper mit Anweisungen. Die `description` entscheidet, wann Copilot ihn
nutzt — sag *was er tut und wann man ihn verwendet*.

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

**Optional: ein Skript hinzufügen.** Leg eine beliebige Datei in den Skill-Ordner
und referenzier sie in `SKILL.md`; Copilot macht sie verfügbar. Damit sie ohne
Nachfrage läuft, füge `allowed-tools: shell` ins Frontmatter — **nur wenn du dem
Skill und seinen Skripten voll vertraust**, denn das entfernt den
Bestätigungsschritt. [GITHUB-COPILOT-DOCS]

```text
.github/skills/image-convert/
├── SKILL.md
└── convert-svg-to-png.sh
```

*Mini-Übung:* lass sie `~/.copilot/skills/hello/SKILL.md` mit einer
zweizeiligen Anweisung anlegen, einen neuen Chat starten und zusehen, wie Copilot
ihn aufgreift.

---

## 3. Einen Hook erstellen (Automatisierung an Schlüsselmomenten)

Ein **Hook** führt einen Shell-Befehl **automatisch an einem bestimmten Punkt**
einer Copilot-Sitzung aus — z. B. jeden Prompt protokollieren, nach einer
Dateiänderung Tests laufen lassen oder einen Ton abspielen, wenn der Agent fertig
ist. Hooks sind, wie du Copilot in deine eigenen Guardrails und deinen Workflow
einbindest. [GITHUB-COPILOT-DOCS]

**Wo er liegt:**
- Projekt-Hook: `.github/hooks/<name>.json`
- Persönlicher Hook: `~/.copilot/hooks/<name>.json` (Windows:
  `%USERPROFILE%\.copilot\hooks\`)

Hook-Konfigurationsänderungen laden beim **Start** von Copilot — also nach dem
Bearbeiten neu starten.

**Die Ereignisse, die du hooken kannst** (leg einen Befehl unter eines davon):
`sessionStart`, `sessionEnd`, `userPromptSubmitted`, `preToolUse`, `postToolUse`,
`errorOccurred`, `agentStop`. [GITHUB-COPILOT-DOCS]

**Form der Datei** — ein `version` und eine `hooks`-Map. Gib jedem Befehl einen
`bash`-Schlüssel (Linux/macOS) und/oder einen `powershell`-Schlüssel (Windows);
Copilot wählt den passenden fürs Betriebssystem.

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

Du kannst einen Hook auch auf eine Skriptdatei statt eines Inline-Befehls zeigen
lassen und ihm `env`-Variablen übergeben. [GITHUB-COPILOT-DOCS]

**Hinweis für SAP-Entwickler:innen:** ein `postToolUse`-Hook, der deinen
Linter/deine Tests laufen lässt, nachdem Copilot eine Datei geändert hat, ist
genau die Art Guardrail, die einen **agentischen Entwicklungszyklus** sicher
macht — die Schleife bekommt bei jedem Schritt automatisches Feedback.

*Windows-Voraussetzung:* PowerShell 7+ (`pwsh --version`; installieren mit
`winget install Microsoft.PowerShell`). [GITHUB-COPILOT-DOCS]

---

## 4. Abschlussprojekt — ein ABAP-Review-Micro-Workflow  (~5 Min)

Alle drei zusammenbinden: einen kleinen ABAP-Code-Review-Skill bauen, der an einen
`postToolUse`-Audit-Hook gekoppelt ist — eine automatische Guardrail in der
agentischen Schleife.

**Schritt 1 — den Skill anlegen.**
`~/.copilot/skills/abap-review/SKILL.md` erstellen:

```markdown
---
name: abap-review
description: Prüft ABAP-Code auf häufige Qualitätsprobleme. Verwenden, wenn nach Review, Prüfung oder Audit von ABAP-Code gefragt wird.
---

Beim Review von ABAP-Code prüfen auf:
1. Fehlende Fehlerbehandlung (MESSAGE- / CATCH-Blöcke).
2. Hartkodierte Werte, die ins Customizing oder in Konstanten gehören.
3. SELECT * statt expliziter Feldlisten.
4. Fehlendes AUTHORITY-CHECK vor datensensiblen Operationen.
5. Kein Unit-Test referenziert oder erwähnt.

Jedes Problem kennzeichnen als: [BLOCKER] muss behoben werden | [WARNING] sollte behoben werden | [NOTE] zu erwägen.
```

**Schritt 2 — den Audit-Hook hinzufügen.**
`~/.copilot/hooks/abap-audit.json` erstellen:

```json
{
  "version": 1,
  "hooks": {
    "postToolUse": [
      {
        "type": "command",
        "bash": "echo \"[AUDIT $(date)] Tool verwendet\" >> ~/.copilot/abap-audit.log",
        "powershell": "Add-Content -Path \"$env:USERPROFILE\\.copilot\\abap-audit.log\" -Value \"[AUDIT $(Get-Date)] Tool verwendet\"",
        "timeoutSec": 5
      }
    ]
  }
}
```

**Schritt 3 — anwenden.** Copilot neu starten, dann in einem neuen Chat
5–10 Zeilen beliebigen ABAP-Codes einfügen und fragen:

```
Prüfe diesen ABAP-Ausschnitt.
```

**Warten.** Der Skill lädt automatisch, wendet die Checkliste an, und jeder
Tool-Aufruf ergänzt eine Zeile in `~/.copilot/abap-audit.log` (prüfen mit
`!Get-Content $env:USERPROFILE\.copilot\abap-audit.log`). Hat die Checkliste
etwas entdeckt? [GITHUB-COPILOT-DOCS]

Nachbesprechung: die Schleife hat jetzt **automatisches Feedback bei jedem
Schritt** — das ist der agentische Entwicklungszyklus mit eingebauten
Guardrails. [ANTHROPIC-AGENTS]

---

## Warum das zählt (zurückbinden)

Slash-Befehle = Tempo. Skills = *dein* Wissen, zuverlässig wiederverwendet. Hooks
= *deine* Guardrails, automatisch angewandt. Zusammen machen sie aus Copilot statt
eines generischen Assistenten ein Werkzeug, das so arbeitet, wie dein Team
arbeitet — dieselbe Idee „augmentiertes LLM + Tools + eine Schleife mit Feedback"
aus dem Agenten-Thema, aber unter deiner Kontrolle. [ANTHROPIC-AGENTS]
