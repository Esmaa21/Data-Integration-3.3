# KI-Nutzung im Gruppenprojekt

Dieses Dokument protokolliert, wo wir im Gruppenprojekt KI-Tools (Chatbots, Coding-Agents) genutzt haben.
Grundlage sind die Regeln des Kurses ([Folien Lab 1, „Generative AI in this course“](https://github.com/breuert/data-integration)):
selbst versuchen, Tool/Modell/Prompt/Output dokumentieren, festhalten was übernommen, geändert oder verworfen
wurde und wie es geprüft wurde. Jedes Teammitglied muss jede übernommene Zeile erklären können.

KI-Nutzung in den einzelnen Labs steht in den `AI_USAGE.md` der persönlichen Lab-Repositories.

Jede Person trägt ihre eigene KI-Nutzung selbst ein. Angaben über andere Personen machen wir nicht.

## Übersicht

| Person | Verwendete Tools (Modell) | Bereiche im Projekt |
| --- | --- | --- |
| Melissa | Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`, als Hauptwerkzeug; ChatGPT (OpenAI), Modellversion nicht bekannt, zur Gegenprüfung | GDELT; README (gemeinsam mit Idman) |
| Idman | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Wikimedia Pageviews; README (gemeinsam mit Melissa) |
| Tanja | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Destatis |
| Esma | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Repository; Wikipedia-Tourtabellen (optional, noch nicht als Datengrundlage beschlossen) |
| Muhammed | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Eurostat HICP (optional, noch nicht als Datengrundlage beschlossen) |

**Arbeitsweise Melissa:** Claude hat Abfragen, Prüfungen und Texte vorgeschlagen. Ich habe Claudes Vorschläge und Ergebnisse teilweise mit ChatGPT auf Plausibilität und mögliche Fehler gegengeprüft. Alle BigQuery-Abfragen habe ich selbst ausgeführt und die Ergebnisse exportiert.

## Einträge

<!-- Vorlage für neue Einträge:
### TT.MM.JJJJ · Aufgabe · Person
- **Tool und Modell:**
- **Prompt:** (wörtlich oder sinngemäß, kennzeichnen)
- **Output:** (kurz: was hat die KI geliefert?)
- **Betroffene Dateien:**
- **Übernommen, geändert, verworfen:**
- **Wie geprüft:**
-->

### 09.11.2026 · GDELT: Kandidatensuche weltweit · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt (wörtlich, Auszug):** „Ich möchte die fünf Künstler für unser Data-Integration-Projekt nicht willkürlich auswählen.“
- **Output:** BigQuery-Abfrage (Stichprobe: 15. jedes Monats 2017–2025), Auswertung der Ergebnisse, Vorschlag von fünf Künstlern
- **Betroffene Dateien:** Melissas Lab-Repo `data/gdelt_kandidaten_stichprobe_2017-2025.sql/.csv`
- **Übernommen, geändert, verworfen:** Einzelheiten in Melissas Lab-Repo `AI_USAGE.md` (Eintrag 09.11.2026). Die weltweite Methode wurde später durch eine Suche nur in deutschen Quellen ersetzt (nächster Eintrag)
- **Wie geprüft:** Abfrage selbst in BigQuery ausgeführt (Dry Run 25,22 GB)

### 09.11.2026 · GDELT: Deutschland-Filter und Kandidatensuche Deutschland · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`; ChatGPT (OpenAI), Modellversion nicht bekannt, zur Gegenprüfung
- **Prompt (wörtlich, Auszug):** „Ich möchte meine gesamte GDELT-Datenerhebung für unser Gruppenprojekt DIS 3.3 methodisch korrigieren und neu aufsetzen.“
- **Output:** Prüfabfragen (Sprachcode, Domain-Endungen, Quellen ohne .de), Zuordnung von 6 deutschen Medien ohne .de, Methodentest Persons vs. URL/Titel, neue Kandidatensuche mit Deutschland-Filter
- **Betroffene Dateien:** Melissas Lab-Repo `data/gdelt_pruefungen_deutschland_2017-2025.sql`, `data/pruefung_1…3_*.csv`, `data/gdelt_kandidaten_stichprobe_deutschland_*.sql/.csv`
- **Übernommen, geändert, verworfen:** Die Entscheidung, nur deutsche Quellen zu verwenden, habe ich vorgegeben. Den SQL-Text hat Claude geschrieben. Ich habe ihn in BigQuery ausgeführt und anschließend von Claude prüfen lassen, ob die ursprünglichen Abfragen und die Tabellenstruktur nicht unnötig verändert wurden. Verworfen wurde die Namenssuche über das Feld Persons (Ergebnis des Methodentests). Idman und ich hatten zwei verschiedene Abfragen. Wir haben uns gemeinsam für meine entschieden
- **Wie geprüft:** Alle Abfragen selbst in BigQuery ausgeführt, Ergebnisse kontrolliert. Die 6 Medien ohne .de hat Claude anhand der Domainnamen zugeordnet. Zusätzlich habe ich die Zuordnung in einem separaten Chat KI-gestützt geprüft. Eine vollständige eigene Prüfung aller Impressen liegt nicht vor

### 09.11.2026 · Qualitätsprüfung gdelt_articles.sql/.csv und Konzertpreise_Aufmerksamkeit.xlsx · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`; ChatGPT (OpenAI), Modellversion nicht bekannt, für die Zweitprüfung
- **Prompt (wörtlich, Auszug):** „Ich möchte, dass du eine vollständige Qualitätskontrolle unserer aktuellen GDELT-Auswertung und der zusammengeführten Projektdaten durchführst.“
- **Output:** Prüfbericht (Bewertung C, noch nicht auswertungsbereit): Die CSV enthält 18 Nullmonate, die die SQL nicht erzeugt; Zeitraum bis 01/2026; fehlende Normierung; Ausreißer
- **Übernommen, geändert, verworfen:** Befunde übernommen. Daraus sind die SQL-Entwürfe im nächsten Eintrag entstanden. Die Dateien selbst wurden nicht verändert
- **Wie geprüft:** ChatGPT hat Claudes Prüfung mit den Originaldateien abgeglichen und die Hauptbefunde und die Bewertung C bestätigt

### 09.11.2026 · SQL-Entwürfe für Monatswerte Deutschland (Entwurf 1–3) · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt (sinngemäß):** Bitte den neuen SQL-Entwurf noch einmal anhand von drei Punkten prüfen (Juli 2025, Dokumentation der URL-Bereinigung, mehrfach verwendete Zwischenschritte)
- **Output:** drei Entwurfsfassungen (Kalender mit Nullmonaten, Normierung, URL-Bereinigung, Ausfallmarkierung, nur einmal referenzierte Zwischenschritte)
- **Übernommen, geändert, verworfen:** Noch nicht ausgeführt und noch nicht ins Repository übernommen. Offen ist u. a. die Entscheidung zur Spalte `tage_mit_daten`
- **Wie geprüft:** Laut Claude wurde die Syntax mit einem SQL-Parser geprüft. In BigQuery noch nicht getestet

### 09.11.2026 · Prüfung des Gruppen-Repositorys und README · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt (wörtlich, Auszug):** „Bitte überprüfe das gesamte Gruppenrepository“
- **Output:** Statusbericht zu README, LICENSE und .gitignore, Prüfung der Lizenzangaben, Textvorschläge für die README
- **Übernommen, geändert, verworfen:** In meinem Teil der README habe ich Texte von Claude verwendet. Die README haben Idman und ich gemeinsam bearbeitet. Idman ergänzt ihre KI-Nutzung selbst
- **Wie geprüft:** Ich habe die Inhalte gelesen. Das Repository ist privat, deshalb hat Claude nur die Inhalte geprüft, die ich eingefügt habe

### 09.11.2026 · Entwurf dieser AI_USAGE.md · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt (wörtlich, Auszug):** „Bitte ergänze deine bisherige Projektprüfung um einen eigenen Abschnitt zur KI-Nutzungsdokumentation (AI Usage).“
- **Output:** Aufbau und Text dieser Datei, Abgleich mit den Kursvorgaben
- **Übernommen, geändert, verworfen:** Aufbau übernommen. Meine Einträge habe ich mit eigenen Angaben ergänzt und korrigiert (z. B. Rolle von ChatGPT, Prüfung der Impressen)
- **Wie geprüft:** Claude hat die zitierten Prompts in meinen Chat-Anhängen gesucht. Nicht gefundene Prompts sind als „sinngemäß“ gekennzeichnet

### 09.11.2026 · Aufgabenprüfung für Meilenstein 1 · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt (wörtlich, Auszug):** „Abschließende Aufgabenprüfung – Mein persönlicher Beitrag zum Gruppenprojekt DIS 3.3“
- **Output:** Prüfung meines Lab-Repos (`dataset.md`, README, AI_USAGE.md, GDELT-Dateien) und To-do-Liste bis Meilenstein 1
- **Übernommen, geändert, verworfen:** Die To-do-Liste arbeite ich Schritt für Schritt ab
- **Wie geprüft:** Ich prüfe jeden Schritt einzeln, bevor ich ihn übernehme

### [Datum] · gdelt_articles.sql und Konzertpreise_Aufmerksamkeit.xlsx erstellt · [Person BITTE ERGÄNZEN]
- **Tool und Modell:** [BITTE ERGÄNZEN oder „ohne KI“]
- …

### [Datum] · Wikimedia Pageviews · Idman
[BITTE ERGÄNZEN oder „keine KI genutzt“]

### [Datum] · Destatis · Tanja
[BITTE ERGÄNZEN oder „keine KI genutzt“]
