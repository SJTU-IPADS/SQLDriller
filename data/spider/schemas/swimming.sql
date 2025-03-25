CREATE TABLE `swimmer`
(
    `ID`          int,
    `name`        text,
    `Nationality` text,
    `meter_100`   real,
    `meter_200`   text,
    `meter_300`   text,
    `meter_400`   text,
    `meter_500`   text,
    `meter_600`   text,
    `meter_700`   text,
    `Time`        text,
    PRIMARY KEY (`ID`)
);



CREATE TABLE `stadium`
(
    `ID`           int,
    `name`         text,
    `Capacity`     int,
    `City`         text,
    `Country`      text,
    `Opening_year` int,
    PRIMARY KEY (`ID`)
);



CREATE TABLE `event`
(
    `ID`         int,
    `Name`       text,
    `Stadium_ID` int,
    `Year`       text,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`Stadium_ID`) REFERENCES `stadium` (`ID`)
);

CREATE TABLE `record`
(
    `ID`         int,
    `Result`     text,
    `Swimmer_ID` int,
    `Event_ID`   int,
    PRIMARY KEY (`Swimmer_ID`, `Event_ID`),
    FOREIGN KEY (`Event_ID`) REFERENCES `event` (`ID`),
    FOREIGN KEY (`Swimmer_ID`) REFERENCES `swimmer` (`ID`)
);



