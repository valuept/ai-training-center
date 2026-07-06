# Modul 4 — Folgen abschätzen  (~13 Min)

Ziel: Sie gehen mit einer persönlichen, ehrlichen Landkarte dessen, was KI in
*ihrer* Woche verändert — kein generisches „KI verändert alles“. Das ist das
„Folgen abschätzen“-Versprechen des Trainings, konkret gemacht.

Quellen: [ANTHROPIC-AGENTS], [DEEPMIND-SAFETY] (siehe SOURCES.md).

---

Rahmen (1 Zug): Die nützliche Frage ist nicht „nimmt KI mir meinen Job weg“ —
sondern „welche *Teile* meiner Arbeit verschieben sich, und wo werde ich
wichtiger, nicht unwichtiger?“ [ANTHROPIC-AGENTS] sagt unumwunden, dass Agenten
menschliche Aufsicht an Checkpoints brauchen und dass Autonomie Reichweite gegen
Kosten und Fehlerrisiko eintauscht — der Mensch, der weiß, wie „richtig“
aussieht, verschwindet also nicht, er rückt in der Kette nach oben.

Übung — die Aufgaben-Sortierung. Bitte sie, 6–8 konkrete Aufgaben aus einer
typischen Woche aufzulisten (echte: „eine Entgelt-Customizing-Frage beantworten“,
„einen Unit-Test schreiben“, „die Spezifikation einer Kollegin prüfen“). Dann
sortiere jede in drei Körbe:

- **KI macht es** (ich verifiziere) — hohes Volumen, geringer Einsatz, leicht zu
  prüfen.
- **Wir machen es zusammen** — KI entwirft, ich urteile und verfeinere (die
  meiste Wissensarbeit).
- **Ich mache es** — hoher Einsatz, braucht meine Verantwortung, Beziehungen
  oder Kontext, den KI nicht sehen kann.

Mach es als Dialog: sie nennen eine Aufgabe, du fragst „welcher Korb, und
warum?“, und hinterfragst ihre Begründung sanft. **Warte** auf ihre
Einschätzungen; sortier nicht für sie.

Nachbesprechung — die drei Dinge, die dabei herausfallen:
1. **Der mittlere Korb wächst.** Die meiste Arbeit wird „KI entwirft, du
   entscheidest“. Dein Wert verschiebt sich vom *Produzieren* zum *Steuern und
   Verifizieren*.
2. **Verifikation ist jetzt eine Kernkompetenz.** Weil der Output ein
   unzuverlässiger Entwurf ist (Modul 2) und Faktentreue ungelöst ist
   [DEEPMIND-SAFETY], ist die Person, die Richtig von Plausibel-aber-falsch
   unterscheiden kann, mehr wert, nicht weniger.
3. **Der „Ich mache es“-Korb ist dein Burggraben** — Urteil, Verantwortung,
   Stakeholder-Vertrauen und der Kontext, der nie in ein Modell gelangt ist.
   Benenne ihren laut.

Übung 2 — eine Übergabe entwerfen. Nimm **eine** Aufgabe aus dem mittleren Korb
(„wir zusammen"). Bitte sie, in 3 Zeilen zu formulieren: was die KI entwirft, was
sie prüfen, bevor sie ihr trauen, und wo ihr Name auf dem Ergebnis steht.
z. B. „KI entwirft den Unit-Test → ich prüfe, dass er ohne den Fix fehlschlägt und
den Randfall abdeckt → ich verantworte den Merge."
**Warten.** Frag: wo genau sitzt dein Verifikations-Tor?

Nachbesprechung: das ist der abstrakte Wandel, konkret gemacht — eine
wiederholbare Arbeitsteilung, die sie morgen anwenden können. Das benannte Tor ist
die Kernkompetenz aus Modul 2, jetzt in ihren Ablauf eingebaut.

Ehrlicher Abschluss (1 Zug): KI nimmt Mühsal weg und hebt die Untergrenze beim
Tempo. Sie hebt auch die Latte beim Urteil — mehr Output zu prüfen, mehr
Entscheidungen zu verantworten. Der Wandel ist real; die Richtung geht zu *mehr*
von dem, was nur sie können.

## Prüfung
Wenn alles im Korb „KI macht es“ oder alles in „Ich mache es“ landet, haben sie
sich nicht eingelassen — fast alle echte Wissensarbeit ist der mittlere Korb.
Frag bei einer Aufgabe erneut mit „welchen Teil müsstest du trotzdem prüfen oder
verantworten?“, um die Nuance sichtbar zu machen.
