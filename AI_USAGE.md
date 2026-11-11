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
| Idman | Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`, mit der Browser-Erweiterung Claude in Chrome | Wikimedia Pageviews; Künstlerliste; GDELT-Monatswerte und Excel-Arbeitstabelle; README (gemeinsam mit Melissa) |
| Tanja | Claude (Anthropic), eingestelltes Modell `claude-sonnet-5-5`; ChatGPT (OpenAI), Modell GPT-6, als unterstützendes Werkzeug zur Recherche, Informationssuche und zum Brainstorming | Destatis |
| Esma | Claude (Anthropic), eingestelltes Modell `claude-sonnet-5-` | Repository; Wikipedia-Tourtabellen (optional, noch nicht als Datengrundlage beschlossen) |
| Muhammed | [keine KI genutzt] | Eurostat HICP (optional, noch nicht als Datengrundlage beschlossen) |

**Arbeitsweise Melissa:** Claude hat Abfragen, Prüfungen und Texte vorgeschlagen. Ich habe Claudes Vorschläge und Ergebnisse teilweise mit ChatGPT auf Plausibilität und mögliche Fehler gegengeprüft. Alle BigQuery-Abfragen habe ich selbst ausgeführt und die Ergebnisse exportiert.

**Arbeitsweise Idman:** Claude hat Daten abgerufen, Abfragen und Skripte geschrieben und Texte vorgeschlagen. Mit meiner Zustimmung hat Claude dafür über die Chrome-Erweiterung in meinem Browser gearbeitet (Wikimedia-API, BigQuery-Sandbox in meinem Projekt, GitHub). Passwörter hat Claude nicht eingegeben. Die Entscheidungen (Künstler, Methode, was ins Repository kommt) habe ich getroffen. Vor dem Hochladen habe ich mir die Änderungen zeigen lassen.

**Arbeitsweise Tanja**: Claude hat mir Vorschläge für das Datensatzprofil und die Formulierungen gemacht. Die hochgeladenen Destatis-Dateien hat Claude mit Python ausgewertet, also zum Beispiel Zeilen, Platzhalter und Wertebereiche geprüft. Diese Ergebnisse habe ich anschließend selbst kontrolliert und mit eigenen Berechnungen in Excel nachgerechnet.

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

### 09.11.2026 · gdelt_articles.sql/.csv und Konzertpreise_Aufmerksamkeit.xlsx erstellt · Idman
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`, mit Claude in Chrome
- **Prompt (sinngemäß):** Eine Excel-Tabelle aufbauen, die Tanjas, Melissas und meine Daten zusammenführt (Tabellen A–E). GDELT-Daten direkt in die Tabelle einfügen. Melissas Dateien mit meiner Version vergleichen und die bessere Methode übernehmen.
- **Output:**
  - Erste GDELT-Abfrage über das Feld `Persons` und `.de`-Domains (294 GB)
  - Vergleich mit Melissas Methode
  - Neue Abfrage nach Melissas Methode für alle Tage 01/2017–01/2026, nur Name in der URL (282 GB statt 734 GB mit Seitentitel)
  - Python-Skript für die Excel-Datei (openpyxl, Formeln für D und Analyse)
- **Betroffene Dateien:** `data/gdelt_articles.sql`, `data/gdelt_articles.csv`, `data/wikimedia_pageviews.csv`, `data/Konzertpreise_Aufmerksamkeit.xlsx`
- **Übernommen, geändert, verworfen:**
  - Die erste Abfrage über `Persons` ist verworfen, weil sie deutsche Artikel stark unterzählt. Übernommen ist Melissas Methode. Helene Fischer habe ich nicht aufgenommen.
  - Die Abfragen hat Claude in meinem BigQuery-Projekt ausgeführt.
  - Monate ohne Treffer liefert die Abfrage nicht. Sie wurden danach per Python-Skript als 0 ergänzt (527 Zeilen aus BigQuery → 545 Zeilen in der CSV).
  - Destatis-Werte stammen aus Tanjas Dateien.
- **Wie geprüft:**
  - Zeilenzahl und Summen je Künstler zwischen BigQuery-Ergebnis und CSV/Excel abgeglichen, sie sind identisch.
  - Die Excel wurde mit LibreOffice neu berechnet: 0 Formelfehler.
  - Danach Qualitätsprüfung durch Melissa (Eintrag oben). Ihre offenen Punkte (Normierung, Auswertung pro Künstler, Ausreißer) stehen in der Roadmap.

### 03.11. und 09.11.2026 · Wikimedia Pageviews und Künstlerliste · Idman
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`, mit Claude in Chrome
- **Prompt (sinngemäß):** Monatliche Seitenaufrufe der deutschsprachigen Wikipedia-Artikel abrufen (zuerst Taylor Swift und Oasis, dann die fünf Künstler). Künstler vorschlagen, die in Melissas und meinen Daten passen, und prüfen, ob sie im Zeitraum in Deutschland Konzerte gegeben haben.
- **Output:**
  - Abruf über die Wikimedia Pageviews API (de.wikipedia, agent=user, monatlich), Umwandlung in CSV per Python
  - Kennzahlen und Entwurf des Datensatzprofils (`labs/01/dataset.md` in meinem Lab-Repo)
  - Recherche der Deutschland-Konzerte mit Quellen
- **Betroffene Dateien:** `data/wikimedia_pageviews.csv`, Tabellenblatt `E_Künstlerliste`, Profil in meinem Lab-Repo
- **Übernommen, geändert, verworfen:**
  - Die Künstler habe ich selbst festgelegt: Taylor Swift, Ed Sheeran, Elton John, Bruce Springsteen, Lady Gaga.
  - Oasis ist verworfen, weil es im Zeitraum keine Konzerte in Deutschland gab.
  - Der zuerst geratene Artikeltitel `Oasis_(Band)` lieferte Nullen statt eines Fehlers. Er wurde durch den richtigen Titel `Oasis` ersetzt.
- **Wie geprüft:**
  - Je Künstler 109 Monate, keine Lücken. Summen nach dem Umwandeln mit den API-Werten abgeglichen.
  - Konzertdaten mit verlinkten Quellen belegt (Spalte „Quelle“ in `E_Künstlerliste`).
  - Offen: der Ausreißer Elton John 04/2021 (Prüfung der Tageswerte).

### 08.11.2026-09.11.2026 · Datensatzprofil Verbraucherpreisindex (Tabelle 61111-0004 -> CC13-09421, Flat-CSV) · Tanja
- **Tool und Modell:** Claude (Anthropic), Claude Sonnet 5.5
- **Prompt:** (sinngemäß) Ich habe mein bestehendes Datensatzprofil (Wide-Format) und die Destatis-Datei im Flat-Format hochgeladen und gebeten, das Profil für das neue Format zu aktualisieren. Danach sollte Claude mein FAIR-Review, den Abschnitt zum zweiten Datensatz an das Flat-Format anpassen und die Next steps als Mermaid-Flussdiagramm darstellen.
- **Output:** Claude hat die Flat-CSV mit Python (pandas) ausgewertet (Zeilen, Spalten, Platzhalter `...`, Flags, Min/Max/Mittelwert) und daraus ein neues Profil entworfen. Dazu kamen eine angepasste FAIR-Tabelle und ein Mermaid-Flussdiagramm für die Next steps (zwei parallele Zweige, die in einem Join zusammenlaufen).
- **Betroffene Dateien:** `labs/01/dataset.md` in meinem Lab-Repo.
- **Übernommen, geändert, verworfen:** Übernommen: Berechnungen, Tabellen, Absatz zur Dokumentation, Formulierungen im FAIR-Review, Mermaid-Diagramm. Verworfen: Claudes Bewertung „~“ für R1 (ich habe „✗“ beibehalten, weil die einzelnen Spalten nirgends beschrieben sind).
- **Wie geprüft:** Min/Max/Mittelwert in Excel nachgerechnet (Formeln, z. B. MINIFS, MAXIFS, AVERAGEIFS), Lizenz- und Quellenlinks selbst geöffnet, Werte der Flags und Platzhalter in der Zeichenerklärung von GENESIS nachgelesen.
- *Offen:* Klassifikation der Codes (COICOP oder SEA 2013) noch nicht abschließend geklärt.

### 09.11.2026 · Datensatzprofil Gesamtindex (Tabelle 61111-0002, Flat-CSV) · Tanja
- **Tool und Modell:** Claude (Anthropic), Claude Sonnet 5.5
- **Prompt:** (sinngemäß) Ich habe die zweite Destatis-Datei (Gesamtindex) hochgeladen und gebeten, nach dem Muster meines endgültigen ersten Profils ein Profil zu erstellen. Danach sollte Claude die Next steps als Mermaid-Flussdiagramm darstellen.
- **Output:** Claude hat die Datei mit Python (pandas) ausgewertet: 360 Zeilen und 18 Spalten, je Monat drei Werte (Index, Veränderung zum Vorjahresmonat, Veränderung zum Vormonat), Platzhalter `...` und `-`, Flags. Die beiden Prozentzeilen sind in der Datei nicht gekennzeichnet; Claude hat sie über die Zeilenreihenfolge zugeordnet und durch Nachrechnen aus dem Index bestätigt. Dazu kam ein Mermaid-Flussdiagramm für die Next steps (zwei parallele Zweige, die in einem Join zusammenlaufen).
- **Betroffene Dateien:** `labs/01/dataset_2.md` in meinem Lab-Repo.
- **Übernommen, geändert, verworfen:** Übernommen: Berechnungen, Tabellen, Auffälligkeiten (u. a. die Reihenfolge der drei Werte je Monat) und Mermaid-Diagramm. Geändert: Erklärung des Platzhalters `-`; das FAIR-Review habe ich selbst auf Basis des Reviews für Tabelle 61111-0004 erstellt. Verworfen: Claudes Vorschlag, die Prozentwerte als eigene Spalten `change_yoy_pct` und `change_mom_pct` zu benennen (stattdessen eine Spalte `measure`).
- **Wie geprüft:** Werte in Excel nachgerechnet, Bedeutung von `-` und `...` in der Zeichenerklärung nachgelesen, Links geöffnet.
- *Offen:* R1.3 im FAIR-Review noch zu ergänzen.

### 10.11.2026 · Recherche zu Künstlern, die Deutschland zwischen 2017 und 2025 besucht haben · Tanja
- **Tool und Modell:** **ChatGPT (GPT-6)**
- **Prompts (wörtlich)**:
    - „when and where (in which German cities) were the shows of Cirque du Soleil between 01.01.2017 - 01.12.2025 in Germany? Provide the links to prove"
    - „and when did Johnny Depp visit Germany during this period of time?"
    - „was there any famous theater actor or actress who was in Germany during this period of time? give me a list as well"
- **Output:**
    - Liste der Cirque-du-Soleil-Tourneen in Deutschland (OVO, TOTEM, CRYSTAL, CORTEO, ALIZÉ) mit Städten, Terminen und Quellenlinks. Dazu die Helene-Fischer-Arena-Touren 2017-2018 und 2023, bei denen Cirque du Soleil die Produktion gestaltet hat, und eine Liste von 14 deutschen Städten
    - Chronologie der Deutschlandbesuche von Johnny Depp (2018, 2020, 2022, 2023) mit Quellen
    - Liste bekannter Theaterschauspieler in Deutschland (John Malkovich, Isabelle Huppert, Ingeborga Dapkūnaitė, Sophie von Kessel) mit Terminen, Orten und Quellen, dazu eine Übersicht nach Jahren
- **Übernommen, geändert, verworfen:** Als Theaterschauspieler habe ich nur John Malkovich übernommen. Die Termine habe ich nicht vollständig übernommen: z.B. Die Liste der Konzerte von Johnny Depp in Deutschland war fehlerhaft und unvollständig. Bei einigen genannten Terminen hat nach meiner Recherche kein Auftritt stattgefunden, und einige Konzerte hat die KI nicht genannt (zum Beispiel Mainz am 30.06.2023 und Oberhausen am 20.06.2023). Diese habe ich selbst ergänzt.
- **Wie geprüft:** Die Termine habe ich selbst durch eine Internetrecherche nachgeprüft.
