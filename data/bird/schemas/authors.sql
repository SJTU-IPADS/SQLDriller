CREATE TABLE `Author`
(
    Id          INT PRIMARY KEY,
    Name        TEXT,
    Affiliation TEXT
);
CREATE TABLE `Conference`
(
    Id        INT PRIMARY KEY,
    ShortName TEXT,
    FullName  TEXT,
    HomePage  TEXT
);
CREATE TABLE `Journal`
(
    Id        INT PRIMARY KEY,
    ShortName TEXT,
    FullName  TEXT,
    HomePage  TEXT
);
CREATE TABLE Paper
(
    Id           INT PRIMARY KEY,
    Title        TEXT,
    Year         INT,
    ConferenceId INT,
    JournalId    INT,
    Keyword      TEXT,
    FOREIGN KEY (ConferenceId) REFERENCES Conference (Id),
    FOREIGN KEY (JournalId) REFERENCES Journal (Id)
);
CREATE TABLE PaperAuthor
(
    PaperId     INT,
    AuthorId    INT,
    Name        TEXT,
    Affiliation TEXT,
    FOREIGN KEY (PaperId) REFERENCES Paper (Id),
    FOREIGN KEY (AuthorId) REFERENCES Author (Id)
);
