CREATE TABLE `perpetrator`
(
    `Perpetrator_ID` int,
    `People_ID`      int,
    `Date`           text,
    `Year`           real,
    `Location`       text,
    `Country`        text,
    `Killed`         int,
    `Injured`        int,
    PRIMARY KEY (`Perpetrator_ID`),
    FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`)
);

CREATE TABLE `people`
(
    `People_ID` int,
    `Name`      text,
    `Height`    real,
    `Weight`    real,
    `Home Town` text,
    PRIMARY KEY (`People_ID`)
);






