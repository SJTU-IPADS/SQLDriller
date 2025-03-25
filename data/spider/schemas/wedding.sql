CREATE TABLE `people`
(
    `People_ID` int,
    `Name`      text,
    `Country`   text,
    `Is_Male`   text,
    `Age`       int,
    PRIMARY KEY (`People_ID`)
);



CREATE TABLE `church`
(
    `Church_ID`       int,
    `Name`            text,
    `Organized_by`    text,
    `Open_Date`       int,
    `Continuation_of` text,
    PRIMARY KEY (`Church_ID`)
);



CREATE TABLE `wedding`
(
    `Church_ID` int,
    `Male_ID`   int,
    `Female_ID` int,
    `Year`      int,
    PRIMARY KEY (`Church_ID`, `Male_ID`, `Female_ID`),
    FOREIGN KEY (`Church_ID`) REFERENCES `church` (`Church_ID`),
    FOREIGN KEY (`Male_ID`) REFERENCES `people` (`People_ID`),
    FOREIGN KEY (`Female_ID`) REFERENCES `people` (`People_ID`)
);


