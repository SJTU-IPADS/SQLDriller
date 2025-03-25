CREATE TABLE `captain`
(
    `Captain_ID` int,
    `Name`       text,
    `Ship_ID`    int,
    `age`        text,
    `Class`      text,
    `Rank`       text,
    PRIMARY KEY (`Captain_ID`),
    FOREIGN KEY (`Ship_ID`) REFERENCES `Ship` (`Ship_ID`)
);

CREATE TABLE `Ship`
(
    `Ship_ID`    int,
    `Name`       text,
    `Type`       text,
    `Built_Year` real,
    `Class`      text,
    `Flag`       text,
    PRIMARY KEY (`Ship_ID`)
);



