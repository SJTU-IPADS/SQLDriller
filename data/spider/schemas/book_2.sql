CREATE TABLE `publication`
(
    `Publication_ID`   int,
    `Book_ID`          int,
    `Publisher`        text,
    `Publication_Date` text,
    `Price`            real,
    PRIMARY KEY (`Publication_ID`),
    FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`)
);

CREATE TABLE `book`
(
    `Book_ID` int,
    `Title`   text,
    `Issues`  real,
    `Writer`  text,
    PRIMARY KEY (`Book_ID`)
);




