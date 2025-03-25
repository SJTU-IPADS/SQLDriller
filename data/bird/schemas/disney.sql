CREATE TABLE characters
(
    movie_title  TEXT PRIMARY KEY,
    release_date TEXT,
    hero         TEXT,
    villian      TEXT,
    song         TEXT,
    FOREIGN KEY (hero) REFERENCES `voice-actors` (character)
);
CREATE TABLE director
(
    name     TEXT PRIMARY KEY,
    director TEXT,
    FOREIGN KEY (name) REFERENCES characters (movie_title)
);
CREATE TABLE movies_total_gross
(
    movie_title              TEXT,
    release_date             TEXT,
    genre                    TEXT,
    MPAA_rating              TEXT,
    total_gross              TEXT,
    inflation_adjusted_gross TEXT,
    PRIMARY KEY (movie_title, release_date),
    FOREIGN KEY (movie_title) REFERENCES characters (movie_title)
);
CREATE TABLE revenue
(
    Year                              INT PRIMARY KEY,
    `Studio Entertainment[NI 1]`      FLOAT,
    `Disney Consumer Products[NI 2]`  FLOAT,
    `Disney Interactive[NI 3][Rev 1]` INT,
    `Walt Disney Parks and Resorts`   FLOAT,
    `Disney Media Networks`           TEXT,
    Total                             INT
);
CREATE TABLE `voice-actors`
(
    character     TEXT PRIMARY KEY,
    `voice-actor` TEXT,
    movie         TEXT,
    FOREIGN KEY (movie) REFERENCES characters (movie_title)
);
