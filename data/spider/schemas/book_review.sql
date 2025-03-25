CREATE TABLE `book`
(
    `Book_ID`  int,
    `Title`    text,
    `Type`     text,
    `Pages`    int,
    `Chapters` int,
    `Audio`    text,
    `Release`  text,
    PRIMARY KEY (`Book_ID`)
);
CREATE TABLE `review`
(
    `Review_ID`          int,
    `Book_ID`            int,
    `Rating`             real,
    `Readers_in_Million` real,
    `Rank`               int,
    PRIMARY KEY (`Review_ID`),
    FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`)
);
