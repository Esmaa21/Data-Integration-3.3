# Data-Integration-3.3

Gruppenrepository für das Semesterprojekt im Modul **DIS 3.3 Data Integration** an der TH Köln. Wir untersuchen, ob Online-Aufmerksamkeit und Medienberichterstattung zu ausgewählten Künstlern mit der relativen Preisentwicklung von Kulturangeboten in Deutschland zusammenhängen.

Diese README ist die zentrale Projektübersicht. Die ausführlichen Beschreibungen der Datensätze liegen in den GitHub-Bereichen der jeweils verantwortlichen Gruppenmitglieder.

## Inhalt

- [Projektthema und Zielsetzung](#projektthema-und-zielsetzung)
- [Forschungsfragen](#forschungsfragen)
- [Untersuchungsrahmen](#untersuchungsrahmen)
- [Datengrundlage und Datenquellen](#datengrundlage-und-datenquellen)
- [Tabellenstrukturen](#tabellenstrukturen)
- [Geplantes Vorgehen](#geplantes-vorgehen)
- [Team und Aufgabenverteilung](#team-und-aufgabenverteilung)
- [Roadmap](#roadmap)
- [Lizenzen](#lizenzen)

## Projektthema und Zielsetzung

**Thema:** Zusammenhangsanalyse zwischen Online-Aufmerksamkeit, Medienberichterstattung und der relativen Preisentwicklung von Kulturangeboten in Deutschland (2017–2026).

Wir verbinden drei offene Datenquellen:

- **Medienberichterstattung:** Wie oft wird über ausgewählte Künstler berichtet?
- **Online-Aufmerksamkeit:** Wie oft werden ihre deutschsprachigen Wikipedia-Artikel aufgerufen?
- **Preisentwicklung:** Wie entwickeln sich die Preise für Kino, Theater, Konzert und Zirkus im Vergleich zu den allgemeinen Verbraucherpreisen?

Ziel ist es, gemeinsame Entwicklungen und zeitliche Abfolgen dieser Größen sichtbar zu machen. Wir untersuchen Zusammenhänge, keine Ursachen.

## Forschungsfragen

**F1:** Gehen Veränderungen der Online-Aufmerksamkeit (Aufrufe deutschsprachiger Wikipedia-Artikel ausgewählter Künstler) und der Medienberichterstattung (Anzahl GDELT-Nachrichtenartikel zu diesen Künstlern) mit Veränderungen des relativen Preisindex für den Besuch von Kino, Theater, Konzert und Zirkus (Destatis CC13-09421 geteilt durch den VPI-Gesamtindex) in Deutschland von 2017 bis 2025 einher?

**F2:** Folgen die Wikipedia-Aufrufe ausgewählter Künstler zeitlich der Medienberichterstattung über sie, und wie stark reagieren beide auf große Tour-Ankündigungen (z. B. Oasis-Reunion, August 2024)?

**F3 (optionale Erweiterung, noch nicht beschlossen):** [F3-WORTLAUT EINFÜGEN]

> F3 ist nicht Teil des aktuellen Projektumfangs. Ob wir sie bearbeiten, entscheiden wir später gemeinsam.

## Untersuchungsrahmen

| Aspekt | Festlegung |
|---|---|
| Region | Nur Deutschland. Nachbarländer höchstens kurz als Kontext, nicht als Teil der Untersuchung |
| Zeitraum | 2017–2025 |
| Künstler | Fünf Künstler, darunter Taylor Swift. **Offen:** Die vollständige Liste wird noch finalisiert |
| Datensätze | Zunächst nur die drei Kerndatensätze unten. Weitere Datensätze aus der Gruppe nur bei tatsächlichem Bedarf |

## Datengrundlage und Datenquellen

Jeder Datensatz deckt eine Seite der Forschungsfrage ab. Die ausführlichen Profile mit Quelle, Lizenz, Data Dictionary und FAIR-Prüfung liegen in den verlinkten GitHub-Bereichen.

| Datensatz | Rolle im Projekt | Beschreibung | Verantwortlich | Weitere Informationen |
|---|---|---|---|---|
| **GDELT** | Medienberichterstattung | Anzahl der Nachrichtenartikel, in denen die ausgewählten Künstler genannt werden (GDELT 2.0 Global Knowledge Graph) | Melissa | [Datensatzprofil GDELT](https://github.com/Melissakasterin/data-integration-labs/blob/main/labs/01/dataset.md) |
| **Wikimedia Pageviews** | Online-Aufmerksamkeit | Aufrufe der deutschsprachigen Wikipedia-Artikel der ausgewählten Künstler | Idman | [LINK_IDMAN EINFÜGEN] |
| **Destatis** | Preisentwicklung | Preisindex für den Besuch von Kino, Theater, Konzert und Zirkus (CC13-09421) sowie allgemeiner Verbraucherpreisindex (VPI) | Tanja | [LINK_TANJA EINFÜGEN] |

**Warum der VPI?** Der Kulturpreisindex steigt auch dann, wenn alles teurer wird. Erst geteilt durch den VPI-Gesamtindex zeigt er, ob Kulturangebote **relativ** zu den übrigen Preisen teurer oder günstiger werden.

## Tabellenstrukturen

Die Tabellenstrukturen für die drei Datensätze haben wir gemeinsam festgelegt.

[TABELLENSTRUKTUREN EINFÜGEN]

## Geplantes Vorgehen

1. **Künstler festlegen:** Die fünf Künstler bestimmen.
2. **Daten aufbereiten:** Jede verantwortliche Person bereitet ihren Datensatz für 2017–2025 nach den gemeinsam festgelegten [Tabellenstrukturen](#tabellenstrukturen) auf.
3. **Relativen Preisindex bilden:** Destatis CC13-09421 geteilt durch den VPI-Gesamtindex.
4. **Zusammenführen:** Die drei Datensätze über die gemeinsamen Tabellenstrukturen verbinden.
5. **Auswerten:** F1 und F2 beantworten, also gemeinsame Entwicklungen und zeitliche Abfolgen untersuchen.

**Offen:** Die genauen Analysemethoden sind noch nicht festgelegt.

## Team und Aufgabenverteilung

| Person | Aufgabe |
|---|---|
| Melissa | Datensatz GDELT (Medienberichterstattung) |
| Idman | Datensatz Wikimedia Pageviews (Online-Aufmerksamkeit) |
| Tanja | Datensatz Destatis (Kulturpreisindex und VPI) |
| Esma | Einrichtung des Gruppenrepositorys. Datensatz Wikipedia-Tourtabellen, nur bei Bedarf |
| Muhammed | Datensatz Eurostat HICP, nur bei Bedarf |

## Roadmap

**Erledigt**

- [x] Kerndatensätze, Untersuchungsrahmen und Forschungsfragen F1 und F2 festgelegt (Gruppentelefonat am 08.11.2026)
- [x] Tabellenstrukturen gemeinsam festgelegt
- [x] Gruppenrepository eingerichtet
- [x] Datensatzprofil GDELT erstellt

**Offen**

- [ ] Datensatzprofile Wikimedia Pageviews und Destatis verlinken
- [ ] Liste der fünf Künstler finalisieren
- [ ] Lizenzen aller drei Datensätze (GDELT, Wikimedia Pageviews, Destatis) prüfen und klären, ob und unter welcher Lizenz wir die kombinierten Daten veröffentlichen dürfen
- [ ] Abgabe Meilenstein 1 am 13.11.2026
- [ ] Danach: Daten aufbereiten, zusammenführen und auswerten (siehe [Geplantes Vorgehen](#geplantes-vorgehen))

## Lizenzen

Dieses Repository steht unter der MIT-Lizenz (siehe [LICENSE](LICENSE)). **Die MIT-Lizenz gilt nicht für die verwendeten Datensätze.** Diese stammen von Dritten und unterliegen weiterhin den Lizenzen bzw. Nutzungsbedingungen ihrer jeweiligen Quellen. Sie sind in den verlinkten Datensatzprofilen dokumentiert.

**Offen:** Die Prüfung der Lizenzen aller drei Datensätze und ihrer Kombination steht noch aus (siehe [Roadmap](#roadmap)).
