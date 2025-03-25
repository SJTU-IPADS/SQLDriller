CREATE TABLE `headphone`
(
    `Headphone_ID`      int,
    `Model`             text,
    `Class`             text,
    `Driver-matched_dB` real,
    `Construction`      text,
    `Earpads`           text,
    `Price`             int,
    PRIMARY KEY (`Headphone_ID`)
);
CREATE TABLE `store`
(
    `Store_ID`     int,
    `Name`         text,
    `Neighborhood` text,
    `Parking`      text,
    `Date_Opened`  date,
    PRIMARY KEY (`Store_ID`)
);
CREATE TABLE `stock`
(
    `Store_ID`     int,
    `Headphone_ID` int,
    `Quantity`     int,
    PRIMARY KEY (`Store_ID`, `Headphone_ID`),
    FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`),
    FOREIGN KEY (`Headphone_ID`) REFERENCES `headphone` (`Headphone_ID`)
);
