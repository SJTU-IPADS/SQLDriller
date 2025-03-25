CREATE TABLE `college`
(
    `College_ID`       int,
    `Name`             text,
    `Leader_Name`      text,
    `College_Location` text,
    PRIMARY KEY (`College_ID`)
);



CREATE TABLE `member`
(
    `Member_ID`  int,
    `Name`       text,
    `Country`    text,
    `College_ID` int,
    PRIMARY KEY (`Member_ID`),
    FOREIGN KEY (`College_ID`) REFERENCES `college` (`College_ID`)
);



CREATE TABLE `round`
(
    `Round_ID`         int,
    `Member_ID`        int,
    `Decoration_Theme` text,
    `Rank_in_Round`    int,
    PRIMARY KEY (`Member_ID`, `Round_ID`),
    FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
);



