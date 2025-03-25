CREATE TABLE AwardsMisc
(
    name  TEXT NOT NULL PRIMARY KEY,
    ID    TEXT,
    award TEXT,
    year  INT,
    lgID  TEXT,
    note  TEXT
);
CREATE TABLE HOF
(
    year     INT,
    hofID    TEXT NOT NULL PRIMARY KEY,
    name     TEXT,
    category TEXT
);
CREATE TABLE Teams
(
    year       INT  NOT NULL,
    lgID       TEXT,
    tmID       TEXT NOT NULL,
    franchID   TEXT,
    confID     TEXT,
    divID      TEXT,
    rank       INT,
    playoff    TEXT,
    G          INT,
    W          INT,
    L          INT,
    T          INT,
    OTL        TEXT,
    Pts        INT,
    SoW        TEXT,
    SoL        TEXT,
    GF         INT,
    GA         INT,
    name       TEXT,
    PIM        TEXT,
    BenchMinor TEXT,
    PPG        TEXT,
    PPC        TEXT,
    SHA        TEXT,
    PKG        TEXT,
    PKC        TEXT,
    SHF        TEXT,
    PRIMARY KEY (year, tmID)
);
CREATE TABLE Coaches
(
    coachID TEXT NOT NULL,
    year    INT  NOT NULL,
    tmID    TEXT NOT NULL,
    lgID    TEXT,
    stint   INT  NOT NULL,
    notes   TEXT,
    g       INT,
    w       INT,
    l       INT,
    t       INT,
    postg   TEXT,
    postw   TEXT,
    postl   TEXT,
    postt   TEXT,
    PRIMARY KEY (coachID, year, tmID, stint),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID)
);
CREATE TABLE AwardsCoaches
(
    coachID TEXT,
    award   TEXT,
    year    INT,
    lgID    TEXT,
    note    TEXT,
    FOREIGN KEY (coachID) REFERENCES Coaches (coachID)
);
CREATE TABLE Master
(
    playerID     TEXT,
    coachID      TEXT,
    hofID        TEXT,
    firstName    TEXT,
    lastName     TEXT NOT NULL,
    nameNote     TEXT,
    nameGiven    TEXT,
    nameNick     TEXT,
    height       TEXT,
    weight       TEXT,
    shootCatch   TEXT,
    legendsID    TEXT,
    ihdbID       TEXT,
    hrefID       TEXT,
    firstNHL     TEXT,
    lastNHL      TEXT,
    firstWHA     TEXT,
    lastWHA      TEXT,
    pos          TEXT,
    birthYear    TEXT,
    birthMon     TEXT,
    birthDay     TEXT,
    birthCountry TEXT,
    birthState   TEXT,
    birthCity    TEXT,
    deathYear    TEXT,
    deathMon     TEXT,
    deathDay     TEXT,
    deathCountry TEXT,
    deathState   TEXT,
    deathCity    TEXT,
    FOREIGN KEY (coachID) REFERENCES Coaches (coachID)
);
CREATE TABLE AwardsPlayers
(
    playerID TEXT NOT NULL,
    award    TEXT NOT NULL,
    year     INT  NOT NULL,
    lgID     TEXT,
    note     TEXT,
    pos      TEXT,
    PRIMARY KEY (playerID, award, year),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE CombinedShutouts
(
    year      INT,
    month     INT,
    date      INT,
    tmID      TEXT,
    oppID     TEXT,
    `R/P`     TEXT,
    IDgoalie1 TEXT,
    IDgoalie2 TEXT,
    FOREIGN KEY (IDgoalie1) REFERENCES Master (playerID),
    FOREIGN KEY (IDgoalie2) REFERENCES Master (playerID)
);
CREATE TABLE Goalies
(
    playerID TEXT NOT NULL,
    year     INT  NOT NULL,
    stint    INT  NOT NULL,
    tmID     TEXT,
    lgID     TEXT,
    GP       TEXT,
    Min      TEXT,
    W        TEXT,
    L        TEXT,
    `T/OL`   TEXT,
    ENG      TEXT,
    SHO      TEXT,
    GA       TEXT,
    SA       TEXT,
    PostGP   TEXT,
    PostMin  TEXT,
    PostW    TEXT,
    PostL    TEXT,
    PostT    TEXT,
    PostENG  TEXT,
    PostSHO  TEXT,
    PostGA   TEXT,
    PostSA   TEXT,
    PRIMARY KEY (playerID, year, stint),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE GoaliesSC
(
    playerID TEXT NOT NULL,
    year     INT  NOT NULL,
    tmID     TEXT,
    lgID     TEXT,
    GP       INT,
    Min      INT,
    W        INT,
    L        INT,
    T        INT,
    SHO      INT,
    GA       INT,
    PRIMARY KEY (playerID, year),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE GoaliesShootout
(
    playerID TEXT,
    year     INT,
    stint    INT,
    tmID     TEXT,
    W        INT,
    L        INT,
    SA       INT,
    GA       INT,
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE Scoring
(
    playerID  TEXT,
    year      INT,
    stint     INT,
    tmID      TEXT,
    lgID      TEXT,
    pos       TEXT,
    GP        INT,
    G         INT,
    A         INT,
    Pts       INT,
    PIM       INT,
    `+/-`     TEXT,
    PPG       TEXT,
    PPA       TEXT,
    SHG       TEXT,
    SHA       TEXT,
    GWG       TEXT,
    GTG       TEXT,
    SOG       TEXT,
    PostGP    TEXT,
    PostG     TEXT,
    PostA     TEXT,
    PostPts   TEXT,
    PostPIM   TEXT,
    `Post+/-` TEXT,
    PostPPG   TEXT,
    PostPPA   TEXT,
    PostSHG   TEXT,
    PostSHA   TEXT,
    PostGWG   TEXT,
    PostSOG   TEXT,
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE ScoringSC
(
    playerID TEXT,
    year     INT,
    tmID     TEXT,
    lgID     TEXT,
    pos      TEXT,
    GP       INT,
    G        INT,
    A        INT,
    Pts      INT,
    PIM      INT,
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE ScoringShootout
(
    playerID TEXT,
    year     INT,
    stint    INT,
    tmID     TEXT,
    S        INT,
    G        INT,
    GDG      INT,
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE ScoringSup
(
    playerID TEXT,
    year     INT,
    PPA      TEXT,
    SHA      TEXT,
    FOREIGN KEY (playerID) REFERENCES Master (playerID)
);
CREATE TABLE SeriesPost
(
    year        INT,
    round       TEXT,
    series      TEXT,
    tmIDWinner  TEXT,
    lgIDWinner  TEXT,
    tmIDLoser   TEXT,
    lgIDLoser   TEXT,
    W           INT,
    L           INT,
    T           INT,
    GoalsWinner INT,
    GoalsLoser  INT,
    note        TEXT,
    FOREIGN KEY (year, tmIDWinner) REFERENCES Teams (year, tmID),
    FOREIGN KEY (year, tmIDLoser) REFERENCES Teams (year, tmID)
);
CREATE TABLE TeamSplits
(
    year  INT  NOT NULL,
    lgID  TEXT,
    tmID  TEXT NOT NULL,
    hW    INT,
    hL    INT,
    hT    INT,
    hOTL  TEXT,
    rW    INT,
    rL    INT,
    rT    INT,
    rOTL  TEXT,
    SepW  TEXT,
    SepL  TEXT,
    SepT  TEXT,
    SepOL TEXT,
    OctW  TEXT,
    OctL  TEXT,
    OctT  TEXT,
    OctOL TEXT,
    NovW  TEXT,
    NovL  TEXT,
    NovT  TEXT,
    NovOL TEXT,
    DecW  TEXT,
    DecL  TEXT,
    DecT  TEXT,
    DecOL TEXT,
    JanW  INT,
    JanL  INT,
    JanT  INT,
    JanOL TEXT,
    FebW  INT,
    FebL  INT,
    FebT  INT,
    FebOL TEXT,
    MarW  TEXT,
    MarL  TEXT,
    MarT  TEXT,
    MarOL TEXT,
    AprW  TEXT,
    AprL  TEXT,
    AprT  TEXT,
    AprOL TEXT,
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID)
);
CREATE TABLE TeamVsTeam
(
    year  INT  NOT NULL,
    lgID  TEXT,
    tmID  TEXT NOT NULL,
    oppID TEXT NOT NULL,
    W     INT,
    L     INT,
    T     INT,
    OTL   TEXT,
    PRIMARY KEY (year, tmID, oppID),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID),
    FOREIGN KEY (oppID, year) REFERENCES Teams (tmID, year)
);
CREATE TABLE TeamsHalf
(
    year INT  NOT NULL,
    lgID TEXT,
    tmID TEXT NOT NULL,
    half INT  NOT NULL,
    rank INT,
    G    INT,
    W    INT,
    L    INT,
    T    INT,
    GF   INT,
    GA   INT,
    PRIMARY KEY (year, tmID, half),
    FOREIGN KEY (tmID, year) REFERENCES Teams (tmID, year)
);
CREATE TABLE TeamsPost
(
    year       INT  NOT NULL,
    lgID       TEXT,
    tmID       TEXT NOT NULL,
    G          INT,
    W          INT,
    L          INT,
    T          INT,
    GF         INT,
    GA         INT,
    PIM        TEXT,
    BenchMinor TEXT,
    PPG        TEXT,
    PPC        TEXT,
    SHA        TEXT,
    PKG        TEXT,
    PKC        TEXT,
    SHF        TEXT,
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID)
);
CREATE TABLE TeamsSC
(
    year INT  NOT NULL,
    lgID TEXT,
    tmID TEXT NOT NULL,
    G    INT,
    W    INT,
    L    INT,
    T    INT,
    GF   INT,
    GA   INT,
    PIM  TEXT,
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year, tmID) REFERENCES Teams (year, tmID)
);
CREATE TABLE abbrev
(
    Type     TEXT NOT NULL,
    Code     TEXT NOT NULL,
    Fullname TEXT,
    PRIMARY KEY (Type, Code)
);
