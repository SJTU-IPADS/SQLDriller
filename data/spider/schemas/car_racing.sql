CREATE TABLE `country`
(
    `Country_Id`               int,
    `Country`                  text,
    `Capital`                  text,
    `Official_native_language` text,
    `Regoin`                   text,
    PRIMARY KEY (`Country_Id`)
);
CREATE TABLE `team`
(
    `Team_ID`   int,
    `Team`      text,
    `Make`      text,
    `Manager`   text,
    `Sponsor`   text,
    `Car_Owner` text,
    PRIMARY KEY (`Team_ID`)
);
CREATE TABLE `driver`
(
    `Driver_ID` int,
    `Driver`    text,
    `Country`   int,
    `Age`       int,
    `Car_#`     real,
    `Make`      text,
    `Points`    real,
    `Laps`      real,
    `Winnings`  text,
    PRIMARY KEY (`Driver_ID`),
    FOREIGN KEY (`Country`) REFERENCES `country` (`Country_ID`)
);
CREATE TABLE `team_driver`
(
    `Team_ID`   int,
    `Driver_ID` int,
    PRIMARY KEY (`Team_ID`, `Driver_ID`),
    FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`),
    FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`)
);
