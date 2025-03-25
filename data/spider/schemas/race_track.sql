CREATE TABLE `race`
(
    `Race_ID`  int,
    `Name`     text,
    `Class`    text,
    `Date`     text,
    `Track_ID` text,
    PRIMARY KEY (`Race_ID`),
    FOREIGN KEY (`Track_ID`) REFERENCES `track` (`Track_ID`)
);

CREATE TABLE `track`
(
    `Track_ID`    int,
    `Name`        text,
    `Location`    text,
    `Seating`     real,
    `Year_Opened` real,
    PRIMARY KEY (`Track_ID`)
);



