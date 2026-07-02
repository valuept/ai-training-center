# Zweig — Entwickler-Spur  (~10 Min)

Für SAP-Entwickler:innen. Ziel: KI auf den Software-Lebenszyklus abbilden, damit
sie den **agentischen Entwicklungszyklus** sehen — was sich ändert und was die
Entwicklerin bzw. der Entwickler weiterhin verantwortet.

Quelle: [ANTHROPIC-AGENTS] (siehe SOURCES.md).

---

Rahmen (1–2 Züge): Dein SDLC — Spezifikation → Code → Test → Review → Ausliefern
— verschwindet nicht; ein Agent kann jetzt jede Stufe einmal durchlaufen.
[ANTHROPIC-AGENTS] beschreibt Coding-Agenten, die aus einer Aufgabenbeschreibung
viele Dateien bearbeiten, in einer Schleife mit Ground Truth aus laufendem Code
und Tests arbeiten und an menschlichen Checkpoints anhalten. Der Zyklus wird
**agentisch**: du setzt Absicht und Einschränkungen, der Agent entwirft über die
Stufen hinweg, und **du prüfst, verifizierst und verantwortest den Merge.**

## Übung 1 — ein agentischer Coding-Durchlauf (5 Min)
Im Agenten-/Werkzeug-Modus ihres Werkzeugs, an einer kleinen echten (oder
Beispiel-)Aufgabe:
```
Ziel: Füge [ein kleines, klar umrissenes Feature oder einen Fix] zu dieser
Codebasis hinzu. Zeig mir zuerst einen Plan (zu ändernde Dateien + Ansatz).
Implementiere es dann, schreibe einen Test, der ohne die Änderung fehlschlägt
und mit ihr besteht, und führe ihn aus. Halte an und frag mich, bevor du
irgendetwas außerhalb von [dem vorgesehenen Bereich] änderst.
```
**Warten.** Besprich nach, indem du das Geschehene auf den Zyklus abbildest:
- **Spezifikation** → dein Prompt = die Absicht + Einschränkungen (die eigentliche
  Kompetenz jetzt).
- **Code** → der Agent entwirft über Dateien hinweg (die augmentierte
  LLM-Schleife).
- **Test** → „schlägt ohne fehl, besteht mit“ ist dein Korrektheits-Tor — besteh
  darauf; so fängst du die Unzuverlässigkeit aus Modul 2 im Code ab.
- **Review** → du liest den Diff. Hier konzentriert sich deine Expertise.
- **Checkpoint** → „halte an und frag, bevor du X anfasst“ = die Leitplanke, die
  [ANTHROPIC-AGENTS] gegen aufsummierte Fehler fordert.

## Übung 2 — finde, wo es falsch ist (3 Min)
Sie prüfen den eigenen Output des Agenten kritisch:
```
Prüfe den Code, den du gerade geschrieben hast. Was könnte subtil falsch,
unsicher oder ungetestet sein? Sei konkret und skeptisch.
```
**Warten.** Nachbesprechung: der Agent kann beim Review *helfen*, aber nicht der
*finale* Prüfer seiner eigenen Arbeit sein — Nicht-Determiniertheit und
aufsummierte Fehler bedeuten, dass ein menschliches Tor Pflicht bleibt. Du bist
die verantwortliche Prüfinstanz.

## Nachbesprechung — was die Entwicklung weiterhin verantwortet (2 Min)
- **Absicht & Architektur** — zu entscheiden, *was* gebaut wird, und die
  Einschränkungen; der Agent optimiert innerhalb der Box, die du zeichnest —
  schlecht, wenn die Box falsch ist.
- **Verifikation** — Tests, Diff-Review, Sicherheit. Das Volumen an zu prüfendem
  Code steigt; gut zu reviewen wird zur Kernkunst.
- **Verantwortung** — du merged es, du verantwortest es in Produktion.
- **Einfachheits-Urteil** — [ANTHROPIC-AGENTS]: füge Komplexität nur hinzu, wenn
  sie nachweislich hilft. Zu wissen, wann man den Agenten *nicht* laufen lässt,
  ist Senior-Können.

Ehrlicher Abschluss: der agentische Zyklus macht dich schneller und lässt dich
auf höherem Niveau arbeiten (orchestrieren + reviewen) — während er Urteil und
Verifikation zentraler macht, nicht weniger. Speise einen konkreten
Übernahme-Punkt in Modul 6 ein.

## Prüfung
Wenn der Agent den Test übersprungen oder Dateien außerhalb des vorgesehenen
Bereichs geändert hat und sie nicht widersprochen haben, spiel diesen Moment noch
einmal ab — die ganze Entwickler-Geschichte ist, dass *sie* das Test-Tor und den
Checkpoint halten, nicht der Agent.
