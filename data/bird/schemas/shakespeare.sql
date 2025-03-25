CREATE TABLE `chapters`
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    Act         INT  NOT NULL,
    Scene       INT  NOT NULL,
    Description TEXT NOT NULL,
    work_id     INT  NOT NULL REFERENCES works (id)
);
CREATE TABLE `characters`
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    CharName    TEXT NOT NULL,
    Abbrev      TEXT NOT NULL,
    Description TEXT NOT NULL
);
CREATE TABLE `paragraphs`
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    ParagraphNum INT           NOT NULL,
    PlainText    TEXT          NOT NULL,
    character_id INT           NOT NULL REFERENCES characters (id),
    chapter_id   INT DEFAULT 0 NOT NULL REFERENCES chapters (id)
);
CREATE TABLE `works`
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    Title     TEXT NOT NULL,
    LongTitle TEXT NOT NULL,
    Date      INT  NOT NULL,
    GenreType TEXT NOT NULL
);
