CREATE TABLE `singer`
(
    `Singer_ID`          int,
    `Name`               text,
    `Birth_Year`         real,
    `Net_Worth_Millions` real,
    `Citizenship`        text,
    PRIMARY KEY (`Singer_ID`)
);

CREATE TABLE `song`
(
    `Song_ID`          int,
    `Title`            text,
    `Singer_ID`        int,
    `Sales`            real,
    `Highest_Position` real,
    PRIMARY KEY (`Song_ID`),
    FOREIGN KEY (`Singer_ID`) REFERENCES `singer` (`Singer_ID`)
);



