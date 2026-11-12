# Data-Integration-3.3

**Projektfrage in einem Satz:** Hängen Online-Aufmerksamkeit (Wikipedia-Aufrufe) und Medienberichterstattung (GDELT) zu fünf großen Künstlern mit der relativen Preisentwicklung von Kino, Theater, Konzert und Zirkus in Deutschland von 2017 bis 2025 zusammen?

Gruppenrepository für das Semesterprojekt im Modul **DIS 3.3 Data Integration** an der TH Köln. Diese README ist die zentrale Projektübersicht. Die ausführlichen Beschreibungen der Datensätze liegen in den GitHub-Bereichen der jeweils verantwortlichen Gruppenmitglieder.

## Inhalt

- [Team](#team)
- [Thema](#thema)
- [Daten](#daten)
- [Forschungsfragen](#forschungsfragen)
- [Plan](#plan)
- [Lizenzen](#lizenzen)

## Team

| Person | Aufgabe |
|---|---|
| Melissa | Datensatz GDELT (Medienberichterstattung) |
| Idman | Datensatz Wikimedia Pageviews (Online-Aufmerksamkeit) |
| Tanja | Destatis VPI Datensätze: Gesamtindex und Teilindex Kulturveranstaltungen |
| Esma | Einrichtung des Gruppenrepositorys. Datensatz Wikipedia-Tourtabellen, nur bei Bedarf |
| Muhammed | Datensatz Eurostat HICP, nur bei Bedarf |

## Thema

**Thema:** Zusammenhangsanalyse zwischen Online-Aufmerksamkeit, Medienberichterstattung und der relativen Preisentwicklung von Kulturangeboten in Deutschland (2017–2025).

Wir verbinden drei offene Datenquellen:

- **Medienberichterstattung:** Wie oft wird über ausgewählte Künstler berichtet?
- **Online-Aufmerksamkeit:** Wie oft werden ihre deutschsprachigen Wikipedia-Artikel aufgerufen?
- **Preisentwicklung:** Wie entwickeln sich die Preise für Kino, Theater, Konzert und Zirkus im Vergleich zu den allgemeinen Verbraucherpreisen?

Ziel ist es, gemeinsame Entwicklungen und zeitliche Abfolgen dieser Größen sichtbar zu machen. Wir untersuchen Zusammenhänge, keine Ursachen.

### Untersuchungsrahmen

| Aspekt | Festlegung |
|---|---|
| Region | Nur Deutschland. Nachbarländer höchstens kurz als Kontext, nicht als Teil der Untersuchung |
| Zeitraum | Januar 2017 bis Dezember 2025, monatlich |
| Künstler | Taylor Swift, Ed Sheeran, Elton John, Bruce Springsteen, Lady Gaga (siehe unten) |
| Datensätze | Zunächst nur die drei Kerndatensätze unten. Weitere Datensätze aus der Gruppe nur bei tatsächlichem Bedarf |

**Auswahl der Künstler:** lebende, aktiv tourende Künstler mit Konzerten in Deutschland im Zeitraum, einem deutschsprachigen Wikipedia-Artikel und Treffern in deutschen Medien bei GDELT. Grundlage war eine GDELT-Stichprobe mit 22 Kandidaten (Melissa).

| Künstler | Konzerte in Deutschland im Zeitraum |
|---|---|
| Taylor Swift | 2024 (Gelsenkirchen, Hamburg, München) |
| Ed Sheeran | 2022 (Gelsenkirchen, München, Frankfurt), 2025 (Stuttgart, Hamburg, Düsseldorf) |
| Elton John | 2019 (München), 2022 (Frankfurt, Leipzig), 2023 (Hamburg, München) |
| Bruce Springsteen | 2023 (Düsseldorf, Hamburg, Hockenheim, München) |
| Lady Gaga | 2022 (Düsseldorf), 2025 (Berlin) |

Oasis fällt weg: Die Band hatte im Zeitraum keine Konzerte in Deutschland.

## Daten

Jeder Datensatz deckt eine Seite der Forschungsfrage ab. Die ausführlichen Profile mit Quelle, Lizenz, Data Dictionary und FAIR-Prüfung liegen in den verlinkten GitHub-Bereichen.

| Datensatz | Herausgeber | Lizenz | Formate | Profiliert von | Rolle im Projekt |
|---|---|---|---|---|---|
| **GDELT 2.0 Global Knowledge Graph** | The GDELT Project | [GDELT Terms of Use](https://www.gdeltproject.org/about.html#termsofuse) (freie Nutzung mit Quellenangabe) | CSV (Rohdateien), BigQuery-Tabellen, JSON (API) | Melissa – [Profil](https://github.com/Melissakasterin/data-integration-labs/blob/main/labs/01/dataset.md) | Medienberichterstattung: Artikel pro Monat und Künstler |
| **Wikimedia Pageviews** | Wikimedia Foundation | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) | JSON (API), CSV, komprimierte Textdateien (Dumps) | Idman – [Profil](https://github.com/idmanhadafo1-cell/data-integration-labs/blob/main/labs/01/dataset.md) | Online-Aufmerksamkeit: Aufrufe der deutschsprachigen Wikipedia-Artikel |
| **Destatis Verbraucherpreisindex** (61111-0004: CC13-09421 Kino, Theater, Konzert, Zirkus; 61111-0002: VPI gesamt) | Statistisches Bundesamt (Destatis) | [Datenlizenz Deutschland – Namensnennung 2.0](https://www.govdata.de/dl-de/by-2-0) | CSV, XLSX, JSON (GENESIS-API) | Tanja – [Profil - VPI Kulturveranstaltungen](https://github.com/dreilingt/data-integration-labs/blob/main/labs/01/dataset.md) und [Profil - VPI Gesamt](https://github.com/dreilingt/data-integration-labs/blob/main/labs/01/dataset_2.md) | Preisentwicklung: Kulturpreisindex und VPI |
| **HICP – Cinemas, theatres and concerts** | European Central Bank (ECB) | ECB Policy/EZB | CSV (Comma-Separated Values) | Muhammed Salih -  [European Central Bank (ECB)](https://data.ecb.europa.eu/data/datasets/ICP/ICP.M.U2.N.094210.4.ANR) | nur bei Bedarf |


**Warum der VPI?** Der Kulturpreisindex steigt auch dann, wenn alles teurer wird. Erst geteilt durch den VPI-Gesamtindex zeigt er, ob Kulturangebote **relativ** zu den übrigen Preisen teurer oder günstiger werden.

**Wie wir GDELT abfragen:** Wir zählen nur Artikel in deutscher Originalsprache aus deutschen Medien (Domain `.de` sowie faz.net, handelsblatt.com, dw.com, finanzen.net, topagrar.com, agrarheute.com). Ein Artikel zählt, wenn der Name des Künstlers in der URL steht (z. B. `taylor-swift`). Das GDELT-Feld `Persons` nutzen wir nicht, weil Namen bei der maschinellen Übersetzung verfälscht werden.

### Tabellenstrukturen

Die Tabellenstrukturen für die drei Datensätze haben wir gemeinsam festgelegt. Gemeinsamer Schlüssel ist der Monat (`month`, Format `JJJJ-MM`), bei B und C zusätzlich der Künstler (`artist`).

| Tabelle | Spalten | Inhalt |
|---|---|---|
| A – Destatis | `month`, `kultur_index`, `vpi_gesamt` | Preisindizes, 2020 = 100 |
| B – Wikimedia | `month`, `artist`, `pageviews` | Aufrufe pro Monat und Künstler |
| C – GDELT | `month`, `artist`, `article_count`, `avg_tone` | Artikel pro Monat und Künstler, mittlerer Ton |
| D – Zusammengeführt | `month`, `artist`, `pageviews`, `article_count`, `kultur_index`, `vpi_gesamt` | A, B und C über `month` und `artist` verbunden |
| E – Künstlerliste | `artist`, `wikipedia_title`, `Auswahlkriterium`, `Quelle` | Die fünf Künstler mit Begründung |


### Daten im Repository

| Datei | Inhalt |
|---|---|
| [`data/Konzertpreise_Aufmerksamkeit.xlsx`](data/Konzertpreise_Aufmerksamkeit.xlsx) | Arbeitstabelle mit A–E, erster Analyse und GDELT-Kandidatenliste |
| [`data/wikimedia_pageviews.csv`](data/wikimedia_pageviews.csv) | Tabelle B, 01/2017–01/2026 |
| [`data/gdelt_articles.csv`](data/gdelt_articles.csv) | Tabelle C, 01/2017–01/2026 |
| [`data/gdelt_articles.sql`](data/gdelt_articles.sql) | BigQuery-Abfrage für Tabelle C |

**Bekannte Einschränkungen:**

- GDELT: Artikel, die den Namen nur im Text oder in der Überschrift nennen, fehlen. Die Überschrift zu prüfen hätte das freie BigQuery-Kontingent überschritten.
- GDELT: Vom 14.06. bis 01.07.2025 fehlen Daten (Ausfall bei GDELT). Juni 2025 ist deshalb zu niedrig.
- Destatis: 11 Monate in der Corona-Zeit (2020/21) haben nur eingeschränkte Aussagekraft.

## Forschungsfragen

**F1:** Gehen Veränderungen der Online-Aufmerksamkeit (Aufrufe deutschsprachiger Wikipedia-Artikel ausgewählter Künstler) und der Medienberichterstattung (Anzahl GDELT-Nachrichtenartikel zu diesen Künstlern) mit Veränderungen des relativen Preisindex für den Besuch von Kino, Theater, Konzert und Zirkus (Destatis CC13-09421 geteilt durch den VPI-Gesamtindex) in Deutschland von 2017 bis 2025 einher?

**F2:** Folgen die Wikipedia-Aufrufe ausgewählter Künstler zeitlich der Medienberichterstattung über sie, und wie stark reagieren beide auf große Tour-Ankündigungen und Tourneen in Deutschland (z. B. Taylor Swifts Eras Tour in Gelsenkirchen, Hamburg und München, Juli 2024)?

## Plan

### Geplantes Vorgehen

1. **Künstler festlegen:** Die fünf Künstler bestimmen.
2. **Daten aufbereiten:** Jede verantwortliche Person bereitet ihren Datensatz für 2017–2025 nach den gemeinsam festgelegten [Tabellenstrukturen](#tabellenstrukturen) auf.
3. **Relativen Preisindex bilden:** Destatis CC13-09421 geteilt durch den VPI-Gesamtindex.
4. **Zusammenführen:** Die drei Datensätze über die gemeinsamen Tabellenstrukturen verbinden.
5. **Auswerten:** F1 und F2 beantworten, also gemeinsame Entwicklungen und zeitliche Abfolgen untersuchen.

**Offen:** Die genauen Analysemethoden sind noch nicht festgelegt.

### Roadmap

**Erledigt**

- [x] Kerndatensätze, Untersuchungsrahmen und Forschungsfragen F1 und F2 festgelegt (Gruppentelefonat am 08.11.2026)
- [x] Tabellenstrukturen gemeinsam festgelegt
- [x] Gruppenrepository eingerichtet
- [x] Datensatzprofil GDELT erstellt
- [x] Datensatzprofil Wikimedia Pageviews verlinkt
- [x] Liste der fünf Künstler finalisiert
- [x] Erste Daten für Tabellen A, B und C aufbereitet (siehe [Daten im Repository](#daten-im-repository))
- [x] Datensatzprofil Destatis verlinken
- [x] Lizenzen aller drei Datensätze (GDELT, Wikimedia Pageviews, Destatis) prüfen und klären, ob und unter welcher Lizenz wir die kombinierten Daten veröffentlichen dürfen

**Offen**
- [ ] Abgabe Meilenstein 1 am 13.11.2026
- [ ] Danach: Daten zusammenführen und auswerten (siehe [Geplantes Vorgehen](#geplantes-vorgehen))

## Lizenzen
Der Code in diesem Repository steht unter der MIT-Lizenz (siehe [LICENSE](https://github.com/Esmaa21/Data-Integration-3.3/blob/main/LICENSE)). Die MIT-Lizenz gilt nicht für die verwendeten Datensätze. Diese stammen von Dritten und unterliegen weiterhin den Lizenzen bzw. Nutzungsbedingungen ihrer jeweiligen Quellen. Sie sind in den verlinkten Datensatzprofilen dokumentiert.

Quellenangaben für die Dateien in `data/`:

* Destatis:
  * "Verbraucherpreisindex: Deutschland, Monate (Table 61111-0004, series CC13-09421)" by Statistisches Bundesamt (Destatis), Genesis-Online, https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004, [Data licence by-2-0](https://www.govdata.de/dl-de/by-2-0). **Daten geändert:** ausgewählt, aufbereitet, mit weiteren Datensätzen zusammengeführt.
  * "Verbraucherpreisindex: Deutschland, Monate (Table 61111-0002)" by Statistisches Bundesamt (Destatis), Genesis-Online, https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002, [Data licence by-2-0](https://www.govdata.de/dl-de/by-2-0). **Daten geändert:** ausgewählt, aufbereitet und mit weiteren Datensätzen zusammengeführt.
* Wikimedia Pageviews: Wikimedia Foundation, [Analytics API](https://doc.wikimedia.org/analytics-api), [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
* GDELT: GDELT 2.0 Global Knowledge Graph von [The GDELT Project](https://www.gdeltproject.org/), genutzt gemäß den [GDELT Terms of Use](https://www.gdeltproject.org/about.html#termsofuse)

Alle drei Datensätze dürfen genutzt, verändert, zusammengeführt und weitergegeben werden, sofern die Quelle genannt wird (Destatis: Namensnennung nach dl-de/by-2-0 mit Änderungshinweis; Wikimedia: CC0 1.0, keine Bedingungen; GDELT: Zitat des GDELT Project mit Link). Share-Alike-, Non-Commercial- oder No-Derivatives-Bedingungen gibt es nicht. Die Veröffentlichung der zusammengeführten Daten ist daher zulässig. Wir veröffentlichen sie unter [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Diese Lizenz deckt ausschließlich unsere eigenen Rechte am zusammengeführten Datensatz (Auswahl, Aufbereitung, Zusammenführung) ab und überträgt keine Rechte Dritter oder Rechte an den zugrunde liegenden Nachrichtenartikeln. Die Originaldaten behalten die Bedingungen ihrer Quellen, und die Quellenangaben oben müssen bei jeder Weitergabe erhalten bleiben.
