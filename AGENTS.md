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

### Verbraucherpreisindex: Deutschland, Monate (Tabelle 61111-0002) (Tanja)
- Quelle: https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002
- Lizenz: Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0), https://www.govdata.de/dl-de/by-2-0. Nutzung mit Nennung von Destatis, Lizenzhinweis mit Link, Verweis auf den Datensatz (mit Link) und Vermerk „eigene Berechnung“ bei Veränderung der Daten
- Zugriff: kostenloser Download ohne Registrierung aus GENESIS-Online; die Datei (CSV im Flat-Layout) enthält keinen Exportzeitstempel, daher das Abrufdatum selbst dokumentieren
- Nur Deutschland gesamt (`DG`), keine regionale Gliederung. Drei Maße pro Monat: Index (2020 = 100), Veränderung zum Vorjahresmonat (%), Veränderung zum Vormonat (%)
- Fallen: CSV mit UTF-8 BOM und Semikolon; Dezimalkomma, Werte als Text; die beiden %-Maße sind in keiner Spalte unterscheidbar, nur die Zeilenreihenfolge im Monat trennt sie (Index, dann Vorjahr, dann Vormonat); Zeilen sind nicht nach Zeit sortiert; Jahr und Monat (MONAT02) getrennt, Datum `YYYY-MM` muss gebaut werden; 11 von 18 Spalten sind konstant
- Lücke: Okt-Dez 2026 waren zum Zeitpunkt des Downloads noch nicht verfügbar (Platzhalter `...`, 9 Zellen); in `value` keine leeren Zellen, `-` (13 Zeilen, Vormonatsveränderung) bedeutet 0
- Einheiten: `value` = Index in Indexpunkten (2020 = 100) bzw. Veränderungsraten in %
- Personenbezogene Daten: keine. Nationaler, aggregierter Monatsindex ohne Personen, Haushalte oder kleine Gruppen

### Verbraucherpreisindex: Deutschland, Monate, COICOP-Hierarchie (Tabelle 61111-0004, Serie CC13-09421) (Tanja)
- Quelle: https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004
- Lizenz: Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0), https://www.govdata.de/dl-de/by-2-0. Nutzung mit Nennung von Destatis, Lizenzhinweis mit Link, Verweis auf den Datensatz (mit Link) und Vermerk „eigene Berechnung“ bei Veränderung der Daten
- Zugriff: kostenloser Download ohne Registrierung aus GENESIS-Online; die Datei (CSV im Flat-Layout) enthält keinen Exportzeitstempel, daher das Abrufdatum selbst dokumentieren
- Nur Deutschland gesamt (`DG`), keine regionale Gliederung. Genutzt wird die Serie `CC13-09421 (Besuch von Kino, Theater, Konzert, Zirkus u. Ä.)`; Konzerte sind nicht separat ausgewiesen
- Fallen: CSV mit UTF-8 BOM und Semikolon als Trennzeichen; Dezimalkomma, Werte als Text (100,8); Platzhalter `...` für Okt-Dez 2026 (3 Zeilen für CC13-09421) erzeugen beim Umwandeln Fehler und müssen durch leere Zellen ersetzt werden; Zeilen sind weder nach Jahr noch nach Monat sortiert; Jahr (`time`) und Monat (z. B. `MONAT02`) stehen in getrennten Spalten, das Datum `YYYY-MM` muss gebaut werden; 13 von 22 Spalten sind konstant (Metadaten in jeder Zeile wiederholt)
- Lücke: Okt-Dez 2026 waren zum Zeitpunkt des Downloads noch nicht verfügbar (Platzhalter `...`, 3 Zeilen für CC13-09421); Flag `()` bei CC13-09421 für Apr-Jun 2020 und Nov 2020-Jun 2021 (Aussagewert eingeschränkt, Corona-Zeit)
- Einheiten: `value` = Verbraucherpreisindex in Indexpunkten, Basis 2020 = 100
- Personenbezogene Daten: keine. Nationaler, aggregierter Monatsindex ohne Personen, Haushalte oder kleine Gruppen

### Optional: HICP – Cinemas, theatres and concerts (Muhammed)

<!-- TODO Muhammed -->

### Optional: List of highest-grossing concert tours (Esma)
- Quelle: https://en.wikipedia.org/wiki/List_of_highest-grossing_concert_tours
- Lizenz: CC BY-SA 4.0 (ShareAlike: Weitergabe nur unter gleicher Lizenz)
- Nur bei Bedarf, noch nicht als Datengrundlage beschlossen

## Rules

<!-- TODO Idman -->
