CREATE TABLE `stadium`
(
    `Stadium_ID` int,
    `Location`   text,
    `Name`       text,
    `Capacity`   int,
    `Highest`    int,
    `Lowest`     int,
    `Average`    int,
    PRIMARY KEY (`Stadium_ID`)
);



CREATE TABLE `singer`
(
    `Singer_ID`         int,
    `Name`              text,
    `Country`           text,
    `Song_Name`         text,
    `Song_release_year` text,
    `Age`               int,
    `Is_male`           bool,
    PRIMARY KEY (`Singer_ID`)
);



CREATE TABLE `concert`
(
    `concert_ID`   int,
    `concert_Name` text,
    `Theme`        text,
    `Stadium_ID`   text,
    `Year`         text,
    PRIMARY KEY (`concert_ID`),
    FOREIGN KEY (`Stadium_ID`) REFERENCES `stadium` (`Stadium_ID`)
);



CREATE TABLE `singer_in_concert`
(
    `concert_ID` int,
    `Singer_ID`  text,
    PRIMARY KEY (`concert_ID`, `Singer_ID`),
    FOREIGN KEY (`concert_ID`) REFERENCES `concert` (`concert_ID`),
    FOREIGN KEY (`Singer_ID`) REFERENCES `singer` (`Singer_ID`)
);


