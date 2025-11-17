CREATE SCHEMA quran;
CREATE SCHEMA bible;
CREATE SCHEMA gita;

CREATE TABLE quran.verses (
    surah INT,
    ayah INT,
    text TEXT,
    PRIMARY KEY (surah, ayah)
);

INSERT INTO quran.verses (surah, ayah, text)
VALUES (1, 1, 'In the name of Allah, the Most Merciful, the Most Compassionate.');


CREATE TABLE bible.verses (
    book VARCHAR(50),
    chapter INT,
    verse INT,
    text TEXT,
    PRIMARY KEY (book, chapter, verse)
);

INSERT INTO bible.verses (book, chapter, verse, text)
VALUES ('Genesis', 1, 1, 'In the beginning God created the heavens and the earth.');


CREATE TABLE gita.verses (
    chapter INT,
    verse INT,
    text TEXT,
    PRIMARY KEY (chapter, verse)
);

INSERT INTO gita.verses (chapter, verse, text)
VALUES (1, 1, 'Dhritarashtra said: Sanjaya, tell me what my sons and the sons of Pandu did...');


CREATE TABLE quran.translation (
    surah INT,
    ayah INT,
    language VARCHAR(10),
    text TEXT,
    PRIMARY KEY (surah, ayah, language)
);

CREATE TABLE quran.commentary (
    surah INT,
    ayah INT,
    scholar VARCHAR(100),
    text TEXT
);

select * from gita.verses;

CREATE TABLE all_verses (
    source VARCHAR(20),       -- Quran, Bible, Gita
    book VARCHAR(50),         -- Surah name or Bible book or chapter
    chapter INT,
    verse INT,
    text TEXT
);

INSERT INTO all_verses (source, book, chapter, verse, text)
SELECT
    'Quran' AS source,
    surah::text AS book,
    surah AS chapter,
    ayah AS verse,
    text
FROM quran.verses;


INSERT INTO all_verses (source, book, chapter, verse, text)
SELECT
    'Bible' AS source,
    book,
    chapter,
    verse,
    text
FROM bible.verses;

INSERT INTO all_verses (source, book, chapter, verse, text)
SELECT
    'Gita' AS source,
    chapter::text AS book,
    chapter,
    verse,
    text
FROM gita.verses;

SELECT * FROM all_verses
WHERE text ILIKE '%mercy%';

SELECT * FROM all_verses; --WHERE source = 'Quran'

SELECT 'Quran' AS source, surah::text, surah, ayah, text FROM quran.verses
UNION ALL
SELECT 'Bible', book, chapter, verse, text FROM bible.verses
UNION ALL
SELECT 'Gita', chapter::text, chapter, verse, text FROM gita.verses;

SELECT * FROM all_verses
WHERE text ILIKE '%mercy%';

