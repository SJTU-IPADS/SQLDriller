CREATE TABLE `circuits`
(
    `circuitId`  INTEGER PRIMARY KEY,
    `circuitRef` TEXT,
    `name`       TEXT,
    `location`   TEXT,
    `country`    TEXT,
    `lat`        REAL,
    `lng`        REAL,
    `alt`        INTEGER,
    `url`        TEXT
);
CREATE TABLE `races`
(
    `raceId`    INTEGER PRIMARY KEY,
    `year`      INTEGER,
    `round`     INTEGER,
    `circuitId` INTEGER,
    `name`      TEXT,
    `date`      TEXT,
    `time`      TEXT,
    `url`       TEXT,
    FOREIGN KEY (`circuitId`) REFERENCES `circuits` (`circuitId`)
);

CREATE TABLE `drivers`
(
    `driverId`    INTEGER PRIMARY KEY,
    `driverRef`   TEXT,
    `number`      INTEGER,
    `code`        TEXT,
    `forename`    TEXT,
    `surname`     TEXT,
    `dob`         TEXT,
    `nationality` TEXT,
    `url`         TEXT
);
CREATE TABLE `status`
(
    `statusId` INTEGER PRIMARY KEY,
    `status`   TEXT
);
CREATE TABLE `seasons`
(
    `year` INTEGER PRIMARY KEY,
    `url`  TEXT
);
CREATE TABLE `constructors`
(
    `constructorId`  INTEGER PRIMARY KEY,
    `constructorRef` TEXT,
    `name`           TEXT,
    `nationality`    TEXT,
    `url`            TEXT
);
CREATE TABLE `constructorStandings`
(
    `constructorStandingsId` INTEGER PRIMARY KEY,
    `raceId`                 INTEGER,
    `constructorId`          INTEGER,
    `points`                 REAL,
    `position`               INTEGER,
    `positionText`           TEXT,
    `wins`                   INTEGER,
    FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`)
);
CREATE TABLE `results`
(
    `resultId`        INTEGER PRIMARY KEY,
    `raceId`          INTEGER,
    `driverId`        INTEGER,
    `constructorId`   INTEGER,
    `number`          INTEGER,
    `grid`            INTEGER,
    `position`        INTEGER,
    `positionText`    TEXT,
    `positionOrder`   INTEGER,
    `points`          REAL,
    `laps`            INTEGER,
    `time`            TEXT,
    `milliseconds`    INTEGER,
    `fastestLap`      INTEGER,
    `rank`            INTEGER,
    `fastestLapTime`  TEXT,
    `fastestLapSpeed` TEXT,
    `statusId`        INTEGER,
    FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`)
);
CREATE TABLE `driverStandings`
(
    `driverStandingsId` INTEGER PRIMARY KEY,
    `raceId`            INTEGER,
    `driverId`          INTEGER,
    `points`            REAL,
    `position`          INTEGER,
    `positionText`      TEXT,
    `wins`              INTEGER,
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`)
);
CREATE TABLE `constructorResults`
(
    `constructorResultsId` INTEGER PRIMARY KEY,
    `raceId`               INTEGER,
    `constructorId`        INTEGER,
    `points`               REAL,
    `status`               REAL,
    FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`)
);
CREATE TABLE `qualifying`
(
    `qualifyId`     INTEGER PRIMARY KEY,
    `raceId`        INTEGER,
    `driverId`      INTEGER,
    `constructorId` INTEGER,
    `number`        INTEGER,
    `position`      INTEGER,
    `q1`            TEXT,
    `q2`            TEXT,
    `q3`            TEXT,
    FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`)
);
CREATE TABLE `pitStops`
(
    `raceId`       INTEGER,
    `driverId`     INTEGER,
    `stop`         INTEGER,
    `lap`          INTEGER,
    `time`         TEXT,
    `duration`     TEXT,
    `milliseconds` INTEGER,
    PRIMARY KEY (`raceId`, `driverId`, `stop`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`)
);
CREATE TABLE `lapTimes`
(
    `raceId`       INTEGER,
    `driverId`     INTEGER,
    `lap`          INTEGER,
    `position`     INTEGER,
    `time`         TEXT,
    `milliseconds` INTEGER,
    PRIMARY KEY (`raceId`, `driverId`, `lap`),
    FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`)
); 
