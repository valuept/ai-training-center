# Modul 3 — Chatbot → Agent  (~10 Min)

Ziel: Sie verstehen, was aus einem Chat-Assistenten einen *Agenten* macht, damit
das Wort „Agent“ aufhört, Magie zu sein, und zu einer Checkliste wird, über die
sie nachdenken können.

Quelle: [ANTHROPIC-AGENTS] (siehe SOURCES.md).

---

Rahmen (1–2 Züge): Ein Chatbot antwortet. Ein **Agent handelt**.
[ANTHROPIC-AGENTS] beschreibt den Baustein als das **augmentierte LLM** — ein LLM
plus:
- **Werkzeuge** — es kann Dinge *tun* (eine API aufrufen, Code ausführen, eine
  Datei lesen), nicht nur reden.
- **Gedächtnis / Retrieval** — es kann Informationen hereinholen und behalten.
- **Eine Schleife** — „LLMs, die Werkzeuge auf Basis von Umgebungs-Feedback in
  einer Schleife nutzen“: es handelt, sieht das echte Ergebnis (Ground Truth),
  entscheidet den nächsten Schritt, wiederholt.
- **Leitplanken + menschliche Checkpoints** — weil Autonomie Kosten und das
  Risiko **aufsummierter Fehler** erhöht, haben gute Agenten Grenzen und halten
  an Checkpoints für menschliches Urteil an.

Die Checkliste für „Ist das ein Agent?“ lautet also: **Ziel · Werkzeuge ·
Gedächtnis · Schleife · Leitplanken.**

Übung — bring ihr Werkzeug zum *Handeln*, nicht nur zum Antworten. Sie nutzen den
Agenten-/Werkzeug-Modus ihres Werkzeugs (Copilot-Agentenmodus, Joule usw.) an
einer kleinen, mehrstufigen Aufgabe:
```
Ziel: Finde in diesem Projekt jede Datei, die „[einen Begriff]“ erwähnt,
fasse zusammen, was jede tut, und schlage eine konkrete Verbesserung vor.
Zeig mir zuerst deinen Plan, dann führe ihn Schritt für Schritt aus.
```
**Warten.** Frag: „Wo hat es geplant? Wo hat es ein Werkzeug genutzt und ein
echtes Ergebnis gelesen? Wo hätte es anhalten und dich fragen sollen?“

Nachbesprechung: bilde das Gesehene auf die Checkliste ab. Das „zeig mir zuerst
deinen Plan“ ist **Transparenz** — das zweite Kernprinzip von [ANTHROPIC-AGENTS].
Die Stelle, an der sie es anhalten lassen wollten, ist der **menschliche
Checkpoint**.

Ehrliche Note: [ANTHROPIC-AGENTS] sagt, fang einfach an — der meiste Wert kommt
aus einem guten Einzel-Prompt; greif erst zu vollen Agenten, wenn die Aufgabe
sich wirklich nicht skripten lässt. Agenten sind nicht automatisch besser, nur
autonomer.

---

## Optionale Vorführung durch Moderator:in — echte Agenten-Anatomie mit Agent0 (2–3 Min)

Wenn ein:e Moderator:in dieses Repo eingerichtet hat, zeig das Skelett eines
echten Agenten. Vom Repo-Stammverzeichnis:
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -e .
agent0 run --objective "Design a deployment pipeline for service X" --constraint "no downtime" --acceptance-criterion "rollback in under 5 min"
agent0 memory --objective "deployment pipeline" --limit 3
```
Falls der Befehl `agent0` nicht im PATH ist, nutze die Modul-Form (identischer
Output):
```powershell
python -m agent0.cli run --objective "Design a deployment pipeline for service X" --constraint "no downtime" --acceptance-criterion "rollback in under 5 min"
python -m agent0.cli memory --objective "deployment pipeline" --limit 3
```
Zeig im JSON-Output: den **Plan** (Schritte), die **Ausführung**, die
**Policy**-Leitplankenprüfung und dass der Lauf ins **Gedächtnis** geschrieben
wird — dann ruft `agent0 memory` ihn ab. Das ist Ziel · Plan · Werkzeuge ·
Leitplanken · Gedächtnis in ~30 Zeilen echtem Code — dieselbe Anatomie wie in der
Checkliste oben.

Überspring das komplett für eine reine Selbstlern-Session; die Übung vermittelt
das Konzept bereits.

## Prüfung
Wenn ihr Werkzeug nur „geantwortet“ und nie eine Aktion ausgeführt oder ein
echtes Ergebnis gelesen hat, lief es als Chatbot, nicht als Agent — lass sie den
Agenten-/Werkzeug-Modus einschalten und neu laufen, bevor du nachbesprichst.
