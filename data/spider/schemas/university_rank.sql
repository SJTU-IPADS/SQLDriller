CREATE TABLE `university`
(
    `University_ID`   int,
    `University_Name` text,
    `City`            text,
    `State`           text,
    `Team_Name`       text,
    `Affiliation`     text,
    `Enrollment`      int,
    `Home_Conference` text,
    PRIMARY KEY (`University_ID`)
);
CREATE TABLE `overall_ranking`
(
    `Rank`             int,
    `University_ID`    int,
    `Reputation_point` int,
    `Research_point`   int,
    `Citation_point`   int,
    `Total`            int,
-- CHECK ( Total = Research_point + Citation_point + Research_point),
    PRIMARY KEY (`University_ID`),
    FOREIGN KEY (`University_ID`) REFERENCES `university` (`University_ID`)
);
CREATE TABLE `major`
(
    `Major_ID`   int,
    `Major_Name` text,
    `Major_Code` int,
    PRIMARY KEY (`Major_ID`)
);
CREATE TABLE `major_ranking`
(
    `Rank`          int,
    `University_ID` int,
    `Major_ID`      int,
    PRIMARY KEY (`Rank`, `Major_ID`, `University_ID`),
    FOREIGN KEY (`University_ID`) REFERENCES `university` (`University_ID`),
    FOREIGN KEY (`Major_ID`) REFERENCES `major` (`Major_ID`)
);
