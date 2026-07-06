# Zweig — HCM-Spur  (~14 Min)

Für SAP-HCM-Consultants. Ziel: alles auf HR-Arbeit anwenden und das eine Risiko
spüren, das in ihrer Welt am meisten zählt — **Datenschutz** — plus, wie sich die
beratende Rolle verschiebt.

Quellen: [GOOGLE-PROMPTING], [DEEPMIND-SAFETY] (siehe SOURCES.md).

---

Rahmen (1 Zug): HR-Arbeit ist einsatzstark und voller personenbezogener Daten.
KI ist hier echt nützlich — Richtlinien erklären, Stellenbeschreibungen,
Customizing-Anleitungen, Erst-Antworten auf Mitarbeiterfragen entwerfen —
*sofern* du die Daten und die Verifikation richtig handhabst.

## Übung 1 — eine echte HCM-Unterstützung (4 Min)
Sie führen in ihrem eigenen Werkzeug aus, mit dem Muster aus Modul 1:
```
Rolle: Du bist ein:e erfahrene:r SAP-SuccessFactors-/HCM-Consultant.
Aufgabe: Erkläre einer Führungskraft in einfacher Sprache, wie [ein echtes
HR-Richtlinien- oder Customizing-Thema, das sie betreuen] funktioniert, und
liste die 3 Schritte, die sie unternehmen muss.
Kontext: [den relevanten Richtlinientext oder Customizing-Hinweis einfügen].
Einschränkungen: Nutze nur die eingefügte Richtlinie; wenn etwas nicht abgedeckt
ist, sag „nicht spezifiziert“ statt zu raten. Zitiere die genutzte Richtlinienzeile.
Format: Eine kurze Einleitung + eine nummerierte 3-Schritt-Checkliste.
```
**Warten.** Nachbesprechung: es blieb geerdet, weil sie die Quelle eingefügt und
das Raten verboten haben — die Vertrauens-Gewohnheit aus Modul 2, angewendet.

## Übung 2 — die Datenschutz-Falle erkennen (4 Min)
Das ist der Kern der HCM-Spur. Bitte sie, sich diesen verlockenden Prompt
anzusehen — **NICHT ausführen** — und zu sagen, was falsch ist:
```
Hier ist der Entgelt-Export unserer 200 Mitarbeitenden (Namen, Gehälter, IBANs,
Krankheitsdaten). Finde Auffälligkeiten und sag mir, wen ich prüfen soll.
```
**Warte** auf ihre Antwort, dann bestätige die Fallen:
- **Echte personenbezogene / besondere Kategorien** von Daten (Gesundheit,
  Bezahlung), in ein externes KI-Werkzeug eingefügt, können deine kontrollierte
  Umgebung verlassen — ein DSGVO-Problem, nicht nur eine Richtlinien-Feinheit.
- Nutze **anonymisierte oder synthetische** Daten oder ein Werkzeug mit
  ordentlichem Auftragsverarbeitungsvertrag und Kein-Training-Garantie.
- **Verantwortung bleibt menschlich:** ein „prüfe diese Person“-Output über
  eine:n echte:n Mitarbeitende:n, basierend auf einem unzuverlässigen Entwurf
  (Modul 2), ist eine Entscheidung, die du verantwortest — passe die Prüftiefe
  dem Einsatz an [DEEPMIND-SAFETY].

Faustregel, die du ihnen gibst: **Füge nie echte personenbezogene
Mitarbeiterdaten in ein Werkzeug ein, das dafür nicht vertraglich freigegeben
ist. Erst anonymisieren, immer verifizieren.**

## Nachbesprechung — die Rollenverschiebung der Beratung (2 Min)
Ada leitet eine kurze Reflexion:
- Deine Arbeit verschiebt sich vom *Produzieren* von Customizing-Dokumenten und
  Antworten zum *Steuern und Verifizieren* von KI-Entwürfen — schnellere erste
  Entwürfe, dein Urteil obendrauf.
- Dein dauerhafter Wert: zu wissen, wie „richtig und regelkonform“ aussieht, den
  Kontext der Organisation zu lesen und die mitarbeiterseitigen Folgen zu
  verantworten. KI hat nichts davon.
- Ein konkreter Gewinn, den sie diese Woche übernehmen können (fließt in Modul 6).

## Übung 3 — eigene HCM-Vorlage bauen (4 Min)

Nimm den strukturierten Prompt aus Übung 1 und reduziere ihn auf eine leere
Vorlage, die für *jede* HCM-Frage funktioniert:

```
Rolle: Du bist ein:e erfahrene:r SAP-HCM-/SuccessFactors-Consultant.
Aufgabe: [EIN SATZ — was erklärt, entworfen oder geprüft werden soll].
Kontext: [den relevanten Richtlinientext oder Customizing-Hinweis hier einfügen].
Einschränkungen: Nur aus dem eingefügten Text. Wenn nicht abgedeckt → „nicht
spezifiziert." Keine Feldnamen oder Regeldetails erfinden.
Format: [Schrittliste / kurze Klartextfassung / Vergleichstabelle].
Beispiel einer guten Antwort: [kurzes Beispiel, wenn hilfreich; sonst weglassen].
```

Lass sie eine weitere echte Aufgabe — eine andere als in Übung 1 — ausfüllen und
in einem neuen Copilot-Chat ausführen.

**Warten.** Frage: ist der zweite Output genauso nützlich wie der erste?

Nachbesprechung: diese Vorlage ist der Multiplikator. Das [Rolle · Aufgabe ·
Kontext · Einschränkungen · Format · Beispiel]-Muster aus Modul 1 funktioniert
für jede wiederkehrende HCM-Aufgabe. Der schnellste Ort, um sie so zu speichern,
dass sie automatisch geladen wird: eine persönliche Skill-Datei
(`~/.copilot/skills/hcm-hilfe/SKILL.md`) — Copilot liest sie automatisch, nie
wieder neu einfügen.

---

## Prüfung
Wenn sie das Datenschutz-/DSGVO-Problem in Übung 2 nicht von selbst benannt
haben, geh nicht weiter — das ist der wichtigste Mitnehmer für eine:n
HCM-Consultant. Geh mit ihnen durch, warum das Einfügen echter Mitarbeiterdaten
in ein nicht freigegebenes Werkzeug die Falle ist.
