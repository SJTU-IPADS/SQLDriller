CREATE TABLE `program`
(
    `Program_ID` int,
    `Name`       text,
    `Origin`     text,
    `Launch`     real,
    `Owner`      text,
    PRIMARY KEY (`Program_ID`)
);


CREATE TABLE `channel`
(
    `Channel_ID`        int,
    `Name`              text,
    `Owner`             text,
    `Share_in_percent`  real,
    `Rating_in_percent` real,
    PRIMARY KEY (`Channel_ID`)
);



CREATE TABLE `broadcast`
(
    `Channel_ID`  int,
    `Program_ID`  int,
    `Time_of_day` text,
    PRIMARY KEY (`Channel_ID`, `Program_ID`),
    FOREIGN KEY (`Channel_ID`) REFERENCES `channel` (`Channel_ID`),
    FOREIGN KEY (`Program_ID`) REFERENCES `program` (`Program_ID`)
);



CREATE TABLE `broadcast_share`
(
    `Channel_ID`       int,
    `Program_ID`       int,
    `Date`             text,
    `Share_in_percent` real,
    PRIMARY KEY (`Channel_ID`, `Program_ID`),
    FOREIGN KEY (`Channel_ID`) REFERENCES `channel` (`Channel_ID`),
    FOREIGN KEY (`Program_ID`) REFERENCES `program` (`Program_ID`)
);

