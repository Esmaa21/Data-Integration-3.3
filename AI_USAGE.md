# KI-Nutzung im Gruppenprojekt

Dieses Dokument protokolliert, wo wir im Gruppenprojekt KI-Tools (Chatbots, Coding-Agents) genutzt haben.
Grundlage sind die Regeln des Kurses ([Folien Lab 1, „Generative AI in this course“](https://github.com/breuert/data-integration)):
selbst versuchen, Tool/Modell/Prompt/Output dokumentieren, festhalten was übernommen, geändert oder verworfen
wurde und wie es geprüft wurde. Jedes Teammitglied muss jede übernommene Zeile erklären können.

KI-Nutzung in den einzelnen Labs steht in den `AI_USAGE.md` der persönlichen Lab-Repositories.

## Übersicht

| Person | Verwendete Tools (Modell) | Bereiche im Projekt |
| --- | --- | --- |
| Melissa | Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`; ChatGPT (OpenAI) nur in Lab 1 | GDELT: Kandidatensuche, Deutschland-Filter, SQL-Abfragen, Qualitätsprüfungen |
| Idman | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Wikimedia Pageviews |
| Tanja | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Destatis |
| Esma | [BITTE ERGÄNZEN oder „keine KI genutzt“] | Repository, README |
| Muhammed | [BITTE ERGÄNZEN oder „keine KI genutzt“] | – |

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
- **Prompt:** u. a. „Ich möchte die fünf Künstler für unser Data-Integration-Projekt nicht willkürlich auswählen.“
- **Output:** BigQuery-Abfrage (Stichprobe: 15. jedes Monats 2017–2025), Auswertung der Ergebnisse, Vorschlag von fünf Künstlern
- **Betroffene Dateien:** Melissas Lab-Repo `data/gdelt_kandidaten_stichprobe_2017-2025.sql/.csv`
- **Übernommen, geändert, verworfen:** ausführlich in Melissas Lab-Repo `AI_USAGE.md` (Eintrag 09.11.2026). Der weltweite Vorschlag wurde später verworfen (siehe nächster Eintrag)
- **Wie geprüft:** Abfrage selbst in BigQuery ausgeführt (Dry Run 25,22 GB)

### 09.11.2026 · GDELT: Deutschland-Filter und Kandidatensuche Deutschland · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt:** u. a. „Ich möchte meine gesamte GDELT-Datenerhebung für unser Gruppenprojekt DIS 3.3 methodisch korrigieren und neu aufsetzen.“
- **Output:** Prüfabfragen (Sprachcode, Domain-Endungen, Quellen ohne .de), Liste von 6 zugeordneten deutschen Medien ohne .de, Methodentest Persons vs. URL/Titel, neue Kandidatensuche mit Deutschland-Filter
- **Betroffene Dateien:** Melissas Lab-Repo `data/gdelt_pruefungen_deutschland_2017-2025.sql`, `data/pruefung_1…3_*.csv`, `data/gdelt_kandidaten_stichprobe_deutschland_*.sql/.csv`
- **Übernommen, geändert, verworfen:** [BITTE ERGÄNZEN] – verworfen wurde die Namenssuche über das Feld Persons (Methodentest)
- **Wie geprüft:** Alle Abfragen selbst in BigQuery ausgeführt. Die Zuordnung der 6 Medien ohne .de beruht auf Claude-Recherche; Impressen [selbst geprüft: ja/nein – BITTE ERGÄNZEN]

### 09.11.2026 · Qualitätsprüfung gdelt_articles.sql/.csv und Konzertpreise_Aufmerksamkeit.xlsx · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt:** u. a. „Ich möchte, dass du eine vollständige Qualitätskontrolle unserer aktuellen GDELT-Auswertung und der zusammengeführten Projektdaten durchführst.“
- **Output:** Prüfbericht (Bewertung C): CSV enthält 18 Nullmonate, die die SQL nicht erzeugt; Zeitraum bis 01/2026; fehlende Normierung; Ausreißer
- **Übernommen, geändert, verworfen:** [BITTE ERGÄNZEN]
- **Wie geprüft:** Zweitprüfung durch [Person/Tool BITTE ERGÄNZEN], die die Hauptbefunde bestätigt hat

### 09.11.2026 · SQL-Entwürfe für Monatswerte Deutschland (Entwurf 1–3) · Melissa
- **Tool und Modell:** Claude (Anthropic), eingestelltes Modell `claude-opus-5-5`
- **Prompt:** u. a. „Bitte überprüfe deinen neuen SQL-Entwurf noch einmal anhand dieser drei Punkte …“
- **Output:** drei Entwurfsfassungen (Kalender mit Nullmonaten, Normierung, URL-Bereinigung, Ausfallmarkierung, nur einmal referenzierte CTEs)
- **Übernommen, geändert, verworfen:** Noch nicht ausgeführt. [Entscheidung zu Variante tage_mit_daten und Pfadsuche BITTE ERGÄNZEN]
- **Wie geprüft:** Syntax nur mit einem SQL-Parser geprüft, nicht in BigQuery. [Zweitprüfung durch Person/Tool BITTE ERGÄNZEN]

### [Datum] · gdelt_articles.sql und Konzertpreise_Aufmerksamkeit.xlsx erstellt · [Person BITTE ERGÄNZEN]
- **Tool und Modell:** [BITTE ERGÄNZEN oder „ohne KI“]
- …

### [Datum] · Wikimedia Pageviews · Idman
[BITTE ERGÄNZEN oder „keine KI genutzt“]

### [Datum] · Destatis · Tanja
[BITTE ERGÄNZEN oder „keine KI genutzt“]
