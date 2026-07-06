# Modul 2 — Warum es manchmal lügt  (~13 Min)

Ziel: Die lernende Person kann vorhersagen, *wann* KI unzuverlässig ist, und hat
eine Gewohnheit, um es zu erkennen. Dieses Modul bewahrt SAP-Profis vor Ärger.

Quellen: [ANTHROPIC-AGENTS], [DEEPMIND-SAFETY] (siehe SOURCES.md).

---

Rahmen (1–2 Züge): Das Modell sagt wahrscheinlichen Text voraus; es schlägt
nichts nach, außer du gibst ihm eine Quelle oder ein Werkzeug. Es kann also eine
selbstbewusste, gut formatierte Antwort produzieren, die **falsch** ist — eine
„Halluzination“. Es ist außerdem **nicht deterministisch**: derselbe Prompt kann
verschiedene Antworten liefern. Faktentreue ist ein offenes, aktiv erforschtes
Problem — Google DeepMind pflegt genau deshalb einen Faktentreue-Benchmark und
ein Frontier Safety Framework [DEEPMIND-SAFETY]. Und bei Agenten, die in einer
Schleife handeln, können sich kleine Fehler Schritt für Schritt **aufsummieren**
[ANTHROPIC-AGENTS].

Übung 1 — eine Halluzination provozieren. Sie fragen ihr eigenes Werkzeug etwas
Präzises und Überprüfbares aus ihrer Welt, wo Erfindung wahrscheinlich ist:
```
Wie lautet die exakte SAP-OSS-Hinweisnummer und der Titel, die [einen konkreten
Nischenfehler, den sie kennen] beheben, und zitiere die erste Zeile des Hinweises?
```
oder (Entwicklung):
```
Gib mir die exakte Signatur von [ein obskurer oder erfundener SAP-BAPI /
eine Klassenmethode], inklusive aller Parameter.
```
**Warten.** Frag: „Glaubst du es? Kannst du es gegen das echte System prüfen?“

Nachbesprechung: oft erfindet es eine plausible Hinweisnummer / Signatur. Die
Gefahr ist nicht, dass es falsch ist — sondern dass es *selbstbewusst und im
richtigen Format* falsch ist.

Übung 2 — die Nicht-Determiniertheit sehen. Derselbe Prompt, 2–3 Mal ausgeführt
(jedes Mal ein neuer Chat):
```
[dieselbe Frage erneut einfügen]
```
**Warten.** Frag, was sich zwischen den Durchläufen geändert hat.

Nachbesprechung: verschiedene Antworten = es gibt keine einzige „die Antwort“ in
ihm. Behandle Output als **Entwurf zum Verifizieren**, nie als Beleg.

Übung 3 — Verankern behebt es. Nimm **dieselbe** Frage aus Übung 1, aber gib
diesmal die echte Quelle mit und erzwing ein Zitat (neuer Chat):
```
Beantworte [dieselbe Frage] NUR mit dem Text unten. Zitiere die exakte Zeile, die
du genutzt hast; steht die Antwort nicht im Text, sag „nicht in der Quelle".
---
[echten OSS-Hinweis / echte Methodensignatur aus dem System / echten
Richtlinien-Absatz einfügen]
```
**Warten.** Frag: ist die Antwort jetzt überprüfbar? Woher kam vorher die
Selbstsicherheit?

Nachbesprechung: im echten Text verankert wird aus dem Raten etwas, das du Zeile
für Zeile prüfen kannst — das ist Punkt 2 der Vertrauens-Checkliste, live. Die
Gewohnheit, die skaliert: nie aus dem Gedächtnis fragen, wenn du die Quelle
einfügen kannst.

## Die Vertrauens-Checkliste (gib ihnen diese — sie ist ihre Leitplanke)
Bevor du auf eine KI-Antwort hin handelst:
1. **Ist es prüfbar?** Verifiziere Fakten, Zahlen, Hinweis-IDs, Signaturen gegen
   das echte System / die Doku — versende nie ein ungeprüftes Detail.
2. **Habe ich die Quelle mitgegeben?** In deinem Text verankerte Antworten
   schlagen Antworten aus dem Gedächtnis. Füge die Richtlinie / Spezifikation
   ein; bitte es, daraus zu zitieren.
3. **Einsatz-Check** — je höher die Konsequenz (Entgeltabrechnung,
   personenbezogene Daten, Produktion), desto mehr Verifikation. [DEEPMIND-SAFETY]:
   passe die Prüftiefe dem Risiko an.
4. **Würde ich meinen Namen darunter setzen?** Wenn nicht, verifizieren oder
   verwerfen.

## Prüfung
Falls die provozierte Antwort zufällig korrekt war, wisch es nicht weg — lass sie
trotzdem gegen das echte System prüfen. Die Lektion ist die *Gewohnheit des
Prüfens*, nicht dass das Modell dieses eine Mal versagt hat.
