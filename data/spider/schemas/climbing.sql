CREATE TABLE `mountain`
(
    `Mountain_ID` int,
    `Name`        text,
    `Height`      real,
    `Prominence`  real,
    `Range`       text,
    `Country`     text,
    PRIMARY KEY (`Mountain_ID`)
);

CREATE TABLE `climber`
(
    `Climber_ID`  int,
    `Name`        text,
    `Country`     text,
    `Time`        text,
    `Points`      real,
    `Mountain_ID` int,
    PRIMARY KEY (`Climber_ID`),
    FOREIGN KEY (`Mountain_ID`) REFERENCES `mountain` (`Mountain_ID`)
);




