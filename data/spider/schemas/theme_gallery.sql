CREATE TABLE `artist`
(
    `Artist_ID` int,
    `Name`      text,
    `Country`   text,
    `Year_Join` int,
    `Age`       int,
    PRIMARY KEY (`Artist_ID`)
);



CREATE TABLE `exhibition`
(
    `Exhibition_ID` int,
    `Year`          int,
    `Theme`         text,
    `Artist_ID`     int,
    `Ticket_Price`  real,
    PRIMARY KEY (`Exhibition_ID`),
    FOREIGN KEY (`Artist_ID`) REFERENCES `artist` (`Artist_ID`)
);



CREATE TABLE `exhibition_record`
(
    `Exhibition_ID` int,
    `Date`          text,
    `Attendance`    int,
    PRIMARY KEY (`Exhibition_ID`, `Date`),
    FOREIGN KEY (`Exhibition_ID`) REFERENCES `exhibition` (`Exhibition_ID`)
);




