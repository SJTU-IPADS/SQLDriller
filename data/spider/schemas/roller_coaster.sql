CREATE TABLE `roller_coaster`
(
    `Roller_Coaster_ID` int,
    `Name`              text,
    `Park`              text,
    `Country_ID`        int,
    `Length`            real,
    `Height`            real,
    `Speed`             text,
    `Opened`            text,
    `Status`            text,
    PRIMARY KEY (`Roller_Coaster_ID`),
    FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`)
);

CREATE TABLE `country`
(
    `Country_ID` int,
    `Name`       text,
    `Population` int,
    `Area`       int,
    `Languages`  text,
    PRIMARY KEY (`Country_ID`)
);


