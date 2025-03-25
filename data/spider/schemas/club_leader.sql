CREATE TABLE `member`
(
    `Member_ID`   int,
    `Name`        text,
    `Nationality` text,
    `Age`         int,
    PRIMARY KEY (`Member_ID`)
);
CREATE TABLE `club`
(
    `Club_ID`         int,
    `Overall_Ranking` int,
    `Team_Leader`     text,
    `Club_Name`       text,
    PRIMARY KEY (`Club_ID`)
);
CREATE TABLE `club_leader`
(
    `Club_ID`   int,
    `Member_ID` int,
    `Year_Join` int,
    PRIMARY KEY (`Club_ID`, `Member_ID`),
    FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`),
    FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
);
