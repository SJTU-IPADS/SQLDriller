CREATE TABLE Artists
(
    artistID  INTEGER,
    lname     TEXT,
    fname     TEXT,
    birthYear INTEGER,
    deathYear INTEGER,
    PRIMARY KEY (artistID)
);
CREATE TABLE Paintings
(
    paintingID INTEGER,
    title      TEXT,
    year       INTEGER,
    height_mm  INTEGER,
    width_mm   INTEGER,
    medium     TEXT,
    mediumOn   TEXT,
    location   TEXT,
    painterID  INTEGER,
    PRIMARY KEY (paintingID),
    FOREIGN KEY (painterID) REFERENCES Artists (artistID)
);
CREATE TABLE Sculptures
(
    sculptureID INTEGER,
    title       TEXT,
    year        INTEGER,
    medium      TEXT,
    location    TEXT,
    sculptorID  INTEGER,
    PRIMARY KEY (sculptureID),
    FOREIGN KEY (sculptorID) REFERENCES Artists (artistID)
);
