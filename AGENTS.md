# AGENTS.md

Anweisungen für alle Agenten in diesem Repository. Gilt für alle Tools, die wir im Team nutzen.

## Projekt

Wir untersuchen, ob die Aufmerksamkeit für ausgewählte Künstler (Aufrufe deutschsprachiger Wikipedia-Artikel, Anzahl GDELT-Artikel) mit dem relativen Preisindex für Kino, Theater, Konzert und Zirkus zusammenhängt, in Deutschland von 2017 bis 2025.

## Setup and commands

<!-- TODO Muhammed -->

## Data

### GDELT 2.0 Global Knowledge Graph (Melissa)
- Quelle: https://www.gdeltproject.org/data.html, Codebook: https://data.gdeltproject.org/documentation/GDELT-Global_Knowledge_Graph_Codebook-V2.1.pdf
- Lizenz: GDELT Terms of Use (https://www.gdeltproject.org/about.html#termsofuse), Nutzung mit Zitat und Link auf das GDELT Project
- Zugriff: BigQuery; vor jeder Abfrage einen Dry Run machen und die Datenmenge prüfen (freies Kontingent)
- Abfrage: `data/gdelt_articles.sql`, Ergebnis `data/gdelt_articles.csv` (Tabelle C, 01/2017–01/2026)
- Nur deutsche Quellen: Domain `.de` sowie faz.net, handelsblatt.com, dw.com, finanzen.net, topagrar.com, agrarheute.com
- Ein Artikel zählt, wenn der Künstlername in der URL steht (z. B. `taylor-swift`). Das Feld `V1PERSONS` nicht nutzen: Namen werden durch maschinelle Übersetzung verfälscht
- Fallen: Rohdateien sind tabgetrennt (UTF-8) mit verschachtelten Feldern; Datum als `YYYYMMDDHHMMSS`; Ländercodes im FIPS-Format, nicht ISO 3166 (z. B. `VM` = Vietnam)
- Lücke: 14.06.–01.07.2025 fehlen Daten, Juni 2025 ist zu niedrig
- Einheiten: `article_count` = Anzahl Artikel pro Monat und Künstler; `avg_tone` = mittlerer Ton (GDELT-Tonwert)
- Personenbezogene Daten: `V1PERSONS` und `PAGE_AUTHORS` enthalten echte Namen. Nur Monatswerte pro Künstler behalten, keine Namen von Autorinnen oder Privatpersonen, keine Zitate, keine Rohzeilen

### Wikimedia Pageviews (Idman)

<!-- TODO Idman -->

### Destatis Verbraucherpreisindex (Tanja)

<!-- TODO Tanja -->

### Optional: HICP – Cinemas, theatres and concerts (Muhammed)

<!-- TODO Muhammed -->

### Optional: List of highest-grossing concert tours (Esma)
- Quelle: https://en.wikipedia.org/wiki/List_of_highest-grossing_concert_tours
- Lizenz: CC BY-SA 4.0 (ShareAlike: Weitergabe nur unter gleicher Lizenz)
- Nur bei Bedarf, noch nicht als Datengrundlage beschlossen

## Rules

<!-- TODO Idman -->
