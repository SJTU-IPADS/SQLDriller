CREATE TABLE `member`
(
    `Member_ID`   text,
    `Name`        text,
    `Nationality` text,
    `Role`        text,
    PRIMARY KEY (`Member_ID`)
);



CREATE TABLE `performance`
(
    `Performance_ID` real,
    `Date`           text,
    `Host`           text,
    `Location`       text,
    `Attendance`     int,
    PRIMARY KEY (`Performance_ID`)
);



CREATE TABLE `member_attendance`
(
    `Member_ID`      int,
    `Performance_ID` int,
    `Num_of_Pieces`  int,
    PRIMARY KEY (`Member_ID`, `Performance_ID`),
    FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
    FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`)
);


