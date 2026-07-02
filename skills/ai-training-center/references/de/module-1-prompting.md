# Modul 1 — Kaltstart + Prompting, das funktioniert  (~15 Min)

Ziel: Die lernende Person spürt die Lücke zwischen einer vagen Anfrage und einer
guten und geht mit einem wiederverwendbaren Prompting-Muster für echte
SAP-Arbeit.

Quelle: [GOOGLE-PROMPTING] (siehe SOURCES.md).

---

## Teil A — Kaltstart (5 Min): tun, nicht davon hören

Rahmen (1 Zug): „Bevor wir Theorie machen — lass uns das Ding einfach benutzen.
Nimm eine kleine, echte Aufgabe aus deiner Arbeitswoche: eine Richtlinienfrage,
ein Stück Customizing zum Erklären, ein Snippet zum Schreiben, eine E-Mail an
eine:n Stakeholder:in.“

Übung 1 — die vage Anfrage. Sie fügen in ihr eigenes KI-Werkzeug ein:
```
Hilf mir mit [ihrer echten Aufgabe, in einem vagen Satz].
```
Dann **warten**. Frag: „Wie brauchbar ist die Antwort, 0–10? Was fehlt?“

Nachbesprechung: die meisten bekommen ein generisches 5/10. Genau diese Lücke
ist das ganze Training. Das Modell ist nicht dumm — es rät bei allem, was du
nicht gesagt hast.

---

## Teil B — Prompting, das funktioniert (10 Min)

Rahmen (1–2 Züge): Ein Prompt ist einfach eine **Anweisung**. Das Modell kann
weder deine Gedanken lesen noch dein SAP-System sehen. [GOOGLE-PROMPTING] nennt
vier Hebel:

1. **Sei konkret** — sag genau, was zu tun ist und was *nicht* (Einschränkungen).
2. **Gib Kontext** — füge die nötigen Infos ein (den Richtlinientext, den Fehler,
   die Tabellenstruktur). Setz nicht voraus, dass es deine Landschaft kennt.
3. **Zeig das Format** — verlange eine Tabelle, eine Checkliste, 3 Stichpunkte,
   ABAP, eine Liste von Customizing-Schritten.
4. **Gib ein Beispiel** — ein bis zwei Beispiele einer guten Antwort („Few-Shot“)
   steuern Format und Umfang stärker als Anweisungen allein. [GOOGLE-PROMPTING]
   empfiehlt, fast immer ein Beispiel beizulegen.

Übung 2 — die strukturierte Neu-Anfrage. Dieselbe Aufgabe wie beim Kaltstart,
neu gebaut:
```
Rolle: Du bist ein:e erfahrene:r SAP-[HCM-Consultant / ABAP-Entwickler:in].
Aufgabe: [dieselbe Aufgabe, präzise formuliert].
Kontext: [relevante Richtlinie / Fehler / Anforderung / Snippet einfügen].
Einschränkungen: [was es tun und NICHT tun muss; z. B. die Quellzeile zitieren;
                 keine Feldnamen erfinden].
Format: [z. B. eine nummerierte Schrittliste / eine kurze Tabelle /
         kommentiertes ABAP].
Beispiel einer guten Antwort: [ein kurzes Beispiel, falls vorhanden].
```
**Warten.** Bitte sie, diese Antwort 0–10 zu bewerten und mit dem Kaltstart zu
vergleichen.

Nachbesprechung: der Sprung von ~5 auf ~8+ kam von *ihnen*, nicht von einem
besseren Modell. Benenne das Muster, damit es haftet: **Rolle · Aufgabe ·
Kontext · Einschränkungen · Format · Beispiel.** Das ist die wiederverwendbare
Vorlage — sag ihnen, sie sollen sie behalten.

Zeit-Hinweis: wenn sie begeistert sind, eine weitere Neu-Anfrage; sonst weiter
zu Modul 2.

## Prüfung
Wenn ihre strukturierte Antwort nicht klar besser ist als die vage, war der
Kontext wahrscheinlich zu dünn — dräng darauf, die *echte* Richtlinie / den
echten Fehler / die echte Tabelle einzufügen, keine Paraphrase, und einmal neu
laufen zu lassen.
