CREATE TABLE circuits
(
    circuitId  INT PRIMARY KEY AUTO_INCREMENT,
    circuitRef TEXT DEFAULT '' NOT NULL,
    name       TEXT DEFAULT '' NOT NULL,
    location   TEXT,
    country    TEXT,
    lat        FLOAT,
    lng        FLOAT,
    alt        INT,
    url        TEXT DEFAULT '' NOT NULL UNIQUE
);
CREATE TABLE constructors
(
    constructorId  INT PRIMARY KEY AUTO_INCREMENT,
    constructorRef TEXT DEFAULT '' NOT NULL,
    name           TEXT DEFAULT '' NOT NULL UNIQUE,
    nationality    TEXT,
    url            TEXT DEFAULT '' NOT NULL
);
CREATE TABLE drivers
(
    driverId    INT PRIMARY KEY AUTO_INCREMENT,
    driverRef   TEXT DEFAULT '' NOT NULL,
    number      INT,
    code        TEXT,
    forename    TEXT DEFAULT '' NOT NULL,
    surname     TEXT DEFAULT '' NOT NULL,
    dob         DATE,
    nationality TEXT,
    url         TEXT DEFAULT '' NOT NULL UNIQUE
);
CREATE TABLE seasons
(
    year INT  DEFAULT 0  NOT NULL PRIMARY KEY,
    url  TEXT DEFAULT '' NOT NULL UNIQUE
);
CREATE TABLE races
(
    raceId    INT PRIMARY KEY AUTO_INCREMENT,
    year      INT  DEFAULT 0            NOT NULL,
    round     INT  DEFAULT 0            NOT NULL,
    circuitId INT  DEFAULT 0            NOT NULL,
    name      TEXT DEFAULT ''           NOT NULL,
    date      DATE DEFAULT '0000-00-00' NOT NULL,
    time      TEXT,
    url       TEXT UNIQUE,
    FOREIGN KEY (year) REFERENCES seasons (year),
    FOREIGN KEY (circuitId) REFERENCES circuits (circuitId)
);
CREATE TABLE constructorResults
(
    constructorResultsId INT PRIMARY KEY AUTO_INCREMENT,
    raceId               INT DEFAULT 0 NOT NULL,
    constructorId        INT DEFAULT 0 NOT NULL,
    points               FLOAT,
    status               TEXT,
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (constructorId) REFERENCES constructors (constructorId)
);
CREATE TABLE constructorStandings
(
    constructorStandingsId INT PRIMARY KEY AUTO_INCREMENT,
    raceId                 INT   DEFAULT 0 NOT NULL,
    constructorId          INT   DEFAULT 0 NOT NULL,
    points                 FLOAT DEFAULT 0 NOT NULL,
    position               INT,
    positionText           TEXT,
    wins                   INT   DEFAULT 0 NOT NULL,
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (constructorId) REFERENCES constructors (constructorId)
);
CREATE TABLE driverStandings
(
    driverStandingsId INT PRIMARY KEY AUTO_INCREMENT,
    raceId            INT   DEFAULT 0 NOT NULL,
    driverId          INT   DEFAULT 0 NOT NULL,
    points            FLOAT DEFAULT 0 NOT NULL,
    position          INT,
    positionText      TEXT,
    wins              INT   DEFAULT 0 NOT NULL,
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (driverId) REFERENCES drivers (driverId)
);
CREATE TABLE lapTimes
(
    raceId       INT NOT NULL,
    driverId     INT NOT NULL,
    lap          INT NOT NULL,
    position     INT,
    time         TEXT,
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, lap),
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (driverId) REFERENCES drivers (driverId)
);
CREATE TABLE pitStops
(
    raceId       INT  NOT NULL,
    driverId     INT  NOT NULL,
    stop         INT  NOT NULL,
    lap          INT  NOT NULL,
    time         TEXT NOT NULL,
    duration     TEXT,
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, stop),
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (driverId) REFERENCES drivers (driverId)
);
CREATE TABLE qualifying
(
    qualifyId     INT PRIMARY KEY AUTO_INCREMENT,
    raceId        INT DEFAULT 0 NOT NULL,
    driverId      INT DEFAULT 0 NOT NULL,
    constructorId INT DEFAULT 0 NOT NULL,
    number        INT DEFAULT 0 NOT NULL,
    position      INT,
    q1            TEXT,
    q2            TEXT,
    q3            TEXT,
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (driverId) REFERENCES drivers (driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors (constructorId)
);
CREATE TABLE status
(
    statusId INT PRIMARY KEY AUTO_INCREMENT,
    status   TEXT DEFAULT '' NOT NULL
);
CREATE TABLE results
(
    resultId        INT PRIMARY KEY AUTO_INCREMENT,
    raceId          INT   DEFAULT 0  NOT NULL,
    driverId        INT   DEFAULT 0  NOT NULL,
    constructorId   INT   DEFAULT 0  NOT NULL,
    number          INT,
    grid            INT   DEFAULT 0  NOT NULL,
    position        INT,
    positionText    TEXT  DEFAULT '' NOT NULL,
    positionOrder   INT   DEFAULT 0  NOT NULL,
    points          FLOAT DEFAULT 0  NOT NULL,
    laps            INT   DEFAULT 0  NOT NULL,
    time            TEXT,
    milliseconds    INT,
    fastestLap      INT,
    rank            INT   DEFAULT 0,
    fastestLapTime  TEXT,
    fastestLapSpeed TEXT,
    statusId        INT   DEFAULT 0  NOT NULL,
    FOREIGN KEY (raceId) REFERENCES races (raceId),
    FOREIGN KEY (driverId) REFERENCES drivers (driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors (constructorId),
    FOREIGN KEY (statusId) REFERENCES status (statusId)
);
