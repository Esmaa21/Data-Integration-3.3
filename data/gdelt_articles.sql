-- gdelt_articles.sql
-- Zweck: Monatliche Anzahl deutscher Medienartikel je Künstler (Tabelle C)
-- DIS 3.3, Gruppenprojekt. Methode von Melissa (Kandidaten-Stichprobe),
-- hier auf ALLE Tage und Monatswerte erweitert.
-- Ausgeführt: 09.11.2026 in der BigQuery-Sandbox, verarbeitet 282,47 GB, 527 Zeilen.
--
-- Zeitraum: 01.01.2017 bis 31.01.2026
-- DEUTSCHLAND-FILTER: Originalsprache Deutsch (TranslationInfo srclc:deu)
--   UND Quelle endet auf .de ODER ist eines von 6 zugeordneten deutschen Medien
--   ohne .de (faz.net, handelsblatt.com, dw.com, finanzen.net, topagrar.com,
--   agrarheute.com).
-- SUCHMETHODE: Name in der URL (mit Bindestrich, z. B. taylor-swift).
--   Melissas Methode prüft zusätzlich den Seitentitel (Extras, PAGE_TITLE).
--   Das Feld Extras kostet für alle Tage ca. 450 GB zusätzlich (gesamt 734 GB,
--   mehr als das freie Kontingent). Deshalb hier nur die URL (282 GB).
--   Laut Melissas Methodentest bringt der Titel für diese 5 Künstler nur 0–1 % mehr Treffer.
--   Nicht über das Feld Persons (Namen werden bei der maschinellen
--   Übersetzung verfälscht, z. B. Taylor Swift 103 statt 954 Treffer).
-- avg_tone: Mittelwert des GDELT-Tons (V2Tone, erster Wert), -100 bis +100.
--
-- EINSCHRÄNKUNGEN:
-- - Artikel, die den Namen nur im Fließtext nennen, fehlen.
-- - Themen-/Übersichtsseiten mit dem Namen in der URL können mitzählen.
-- - GDELT-Ausfall ca. 14.06.–01.07.2025 (Juni 2025 zu niedrig).
-- - Monate ohne Treffer fehlen im Ergebnis (527 Zeilen). In gdelt_articles.csv
--   wurden sie danach per Python-Skript als 0 ergänzt (545 Zeilen = 5 Künstler x 109 Monate).
--
-- Quelle: GDELT 2.0 Global Knowledge Graph (https://www.gdeltproject.org/data.html)
-- von The GDELT Project (https://www.gdeltproject.org/), genutzt gemäß den
-- GDELT Terms of Use (https://www.gdeltproject.org/about.html#termsofuse).

WITH basis AS (
  SELECT
    DocumentIdentifier AS url,
    LOWER(DocumentIdentifier) AS url_klein,
    FORMAT_TIMESTAMP('%Y-%m', _PARTITIONTIME) AS month,
    SAFE_CAST(SPLIT(V2Tone, ',')[SAFE_OFFSET(0)] AS FLOAT64) AS tone,
    '' AS titel  -- Seitentitel aus Kostengründen weggelassen (s. o.)
  FROM `gdelt-bq.gdeltv2.gkg_partitioned`
  WHERE _PARTITIONTIME >= TIMESTAMP('2017-01-01')
    AND _PARTITIONTIME < TIMESTAMP('2026-02-01')
    AND REGEXP_EXTRACT(TranslationInfo, r'srclc:([a-z]+)') = 'deu'
    AND (
      ENDS_WITH(LOWER(SourceCommonName), '.de')
      OR LOWER(SourceCommonName) IN ('faz.net', 'handelsblatt.com', 'dw.com',
                                     'finanzen.net', 'topagrar.com', 'agrarheute.com')
    )
),
kuenstler AS (
  SELECT * FROM UNNEST([
    STRUCT('Taylor Swift' AS artist, 'taylor swift' AS name, 'taylor-swift' AS slug),
    ('Ed Sheeran', 'ed sheeran', 'ed-sheeran'),
    ('Elton John', 'elton john', 'elton-john'),
    ('Bruce Springsteen', 'bruce springsteen', 'bruce-springsteen'),
    ('Lady Gaga', 'lady gaga', 'lady-gaga')
  ])
)
SELECT
  b.month,
  k.artist,
  COUNT(DISTINCT b.url) AS article_count,
  ROUND(AVG(b.tone), 2) AS avg_tone
FROM basis b
JOIN kuenstler k
  ON STRPOS(b.url_klein, k.slug) > 0 OR STRPOS(b.titel, k.name) > 0
GROUP BY b.month, k.artist
ORDER BY k.artist, b.month
