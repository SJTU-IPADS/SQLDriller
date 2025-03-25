CREATE TABLE divisions
(
    division TEXT NOT NULL PRIMARY KEY,
    name     TEXT,
    country  TEXT
);
CREATE TABLE matchs
(
    Div      TEXT,
    Date     DATE,
    HomeTeam TEXT,
    AwayTeam TEXT,
    FTHG     INT,
    FTAG     INT,
    FTR      TEXT,
    season   INT,
    FOREIGN KEY (Div) REFERENCES divisions (division)
);
