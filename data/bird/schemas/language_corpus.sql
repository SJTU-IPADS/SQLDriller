CREATE TABLE langs
(
    lid    INT PRIMARY KEY AUTO_INCREMENT,
    lang   TEXT UNIQUE,
    locale TEXT UNIQUE,
    pages  INT DEFAULT 0,
    words  INT DEFAULT 0
);
CREATE TABLE pages
(
    pid      INT PRIMARY KEY AUTO_INCREMENT,
    lid      INT REFERENCES langs (lid),
    page     INT DEFAULT NULL,
    revision INT DEFAULT NULL,
    title    TEXT,
    words    INT DEFAULT 0,
    UNIQUE (lid, page, title)
);
CREATE TABLE words
(
    wid         INT PRIMARY KEY AUTO_INCREMENT,
    word        TEXT UNIQUE,
    occurrences INT DEFAULT 0
);
CREATE TABLE langs_words
(
    lid         INT REFERENCES langs (lid),
    wid         INT REFERENCES words (wid),
    occurrences INT,
    PRIMARY KEY (lid, wid)
);
CREATE TABLE pages_words
(
    pid         INT REFERENCES pages (pid),
    wid         INT REFERENCES words (wid),
    occurrences INT DEFAULT 0,
    PRIMARY KEY (pid, wid)
);
CREATE TABLE biwords
(
    lid         INT REFERENCES langs (lid),
    w1st        INT REFERENCES words (wid),
    w2nd        INT REFERENCES words (wid),
    occurrences INT DEFAULT 0,
    PRIMARY KEY (lid, w1st, w2nd)
)
