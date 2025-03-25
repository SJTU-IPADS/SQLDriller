CREATE TABLE actor
(
    ActorID           INT PRIMARY KEY,
    Name              TEXT,
    `Date of Birth`   DATE,
    `Birth City`      TEXT,
    `Birth Country`   TEXT,
    `Height (Inches)` INT,
    Biography         TEXT,
    Gender            TEXT,
    Ethnicity         TEXT,
    NetWorth          TEXT
);
CREATE TABLE movie
(
    MovieID        INT PRIMARY KEY,
    Title          TEXT,
    `MPAA Rating`  TEXT,
    Budget         INT,
    Gross          INT,
    `Release Date` TEXT,
    Genre          TEXT,
    Runtime        INT,
    Rating         FLOAT,
    `Rating Count` INT,
    Summary        TEXT
);
CREATE TABLE characters
(
    MovieID          INT,
    ActorID          INT,
    `Character Name` TEXT,
    creditOrder      INT,
    pay              TEXT,
    screentime       TEXT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (ActorID) REFERENCES actor (ActorID),
    FOREIGN KEY (MovieID) REFERENCES movie (MovieID)
);
