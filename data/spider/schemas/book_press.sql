CREATE TABLE `author`
(
    `Author_ID` int,
    `Name`      text,
    `Age`       int,
    `Gender`    text,
    -- CHECK ( `Gender` IN ('Male', 'Female') )
    PRIMARY KEY (`Author_ID`)
);
CREATE TABLE `press`
(
    `Press_ID`              int,
    `Name`                  text,
    `Month_Profits_billion` real,
    `Year_Profits_billion`  real,
    PRIMARY KEY (`Press_ID`)
);
CREATE TABLE `book`
(
    `Book_ID`      int,
    `Title`        text,
    `Book_Series`  text,
    `Author_ID`    int,
    `Press_ID`     int,
    `Sale_Amount`  int,
    `Release_date` date,
    PRIMARY KEY (`Book_ID`),
    FOREIGN KEY (`Author_ID`) REFERENCES `author` (`Author_ID`),
    FOREIGN KEY (`Press_ID`) REFERENCES `press` (`Press_ID`)
);
