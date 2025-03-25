CREATE TABLE `mission`
(
    `Mission_ID`    int,
    `Ship_ID`       int,
    `Code`          text,
    `Launched_Year` int,
    `Location`      text,
    `Speed_knots`   int,
    `Fate`          text,
    PRIMARY KEY (`Mission_ID`),
    FOREIGN KEY (`Ship_ID`) REFERENCES `ship` (`Ship_ID`)
);

CREATE TABLE `ship`
(
    `Ship_ID`     int,
    `Name`        text,
    `Type`        text,
    `Nationality` text,
    `Tonnage`     int,
    PRIMARY KEY (`Ship_ID`)
);




