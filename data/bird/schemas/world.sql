CREATE TABLE `City`
(
    `ID`          INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `Name`        TEXT NOT NULL DEFAULT '',
    `CountryCode` TEXT NOT NULL DEFAULT '',
    `District`    TEXT NOT NULL DEFAULT '',
    `Population`  INT  NOT NULL DEFAULT 0,
    FOREIGN KEY (`CountryCode`) REFERENCES `Country` (`Code`)
);
CREATE TABLE `Country`
(
    `Code`           TEXT  NOT NULL DEFAULT '',
    `Name`           TEXT  NOT NULL DEFAULT '',
    `Continent`      TEXT  NOT NULL DEFAULT 'Asia',
    `Region`         TEXT  NOT NULL DEFAULT '',
    `SurfaceArea`    FLOAT NOT NULL DEFAULT 0.00,
    `IndepYear`      INT            DEFAULT NULL,
    `Population`     INT   NOT NULL DEFAULT 0,
    `LifeExpectancy` FLOAT          DEFAULT NULL,
    `GNP`            FLOAT          DEFAULT NULL,
    `GNPOld`         FLOAT          DEFAULT NULL,
    `LocalName`      TEXT  NOT NULL DEFAULT '',
    `GovernmentForm` TEXT  NOT NULL DEFAULT '',
    `HeadOfState`    TEXT           DEFAULT NULL,
    `Capital`        INT            DEFAULT NULL,
    `Code2`          TEXT  NOT NULL DEFAULT '',
    PRIMARY KEY (`Code`)
);
CREATE TABLE `CountryLanguage`
(
    `CountryCode` TEXT  NOT NULL DEFAULT '',
    `Language`    TEXT  NOT NULL DEFAULT '',
    `IsOfficial`  TEXT  NOT NULL DEFAULT 'F',
    `Percentage`  FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY (`CountryCode`, `Language`),
    FOREIGN KEY (`CountryCode`) REFERENCES `Country` (`Code`)
);
