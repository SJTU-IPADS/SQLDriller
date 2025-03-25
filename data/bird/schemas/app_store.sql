CREATE TABLE `playstore`
(
    App              TEXT,
    Category         TEXT,
    Rating           FLOAT,
    Reviews          INT,
    Size             TEXT,
    Installs         TEXT,
    Type             TEXT,
    Price            TEXT,
    `Content Rating` TEXT,
    Genres           TEXT
);
CREATE TABLE `user_reviews`
(
    App                    TEXT REFERENCES `playstore` (App),
    Translated_Review      TEXT,
    Sentiment              TEXT,
    Sentiment_Polarity     TEXT,
    Sentiment_Subjectivity TEXT
);
