CREATE TABLE `wrestler`
(
    `Wrestler_ID` int,
    `Name`        text,
    `Reign`       text,
    `Days_held`   text,
    `Location`    text,
    `Event`       text,
    PRIMARY KEY (`Wrestler_ID`)
);

CREATE TABLE `Elimination`
(
    `Elimination_ID`   text,
    `Wrestler_ID`      text,
    `Team`             text,
    `Eliminated_By`    text,
    `Elimination_Move` text,
    `Time`             text,
    PRIMARY KEY (`Elimination_ID`),
    FOREIGN KEY (`Wrestler_ID`) REFERENCES `wrestler` (`Wrestler_ID`)
);





