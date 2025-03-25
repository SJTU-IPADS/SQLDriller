CREATE TABLE `body_builder`
(
    `Body_Builder_ID` int,
    `People_ID`       int,
    `Snatch`          real,
    `Clean_Jerk`      real,
    `Total`           real,
    PRIMARY KEY (`Body_Builder_ID`),
    FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`)
);

CREATE TABLE `people`
(
    `People_ID`   int,
    `Name`        text,
    `Height`      real,
    `Weight`      real,
    `Birth_Date`  text,
    `Birth_Place` text,
    PRIMARY KEY (`People_ID`)
);





