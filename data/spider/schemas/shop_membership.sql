CREATE TABLE `member`
(
    `Member_ID`   int,
    `Card_Number` text,
    `Name`        text,
    `Hometown`    text,
    `Level`       int,
    PRIMARY KEY (`Member_ID`)
);



CREATE TABLE `branch`
(
    `Branch_ID`         int,
    `Name`              text,
    `Open_year`         text,
    `Address_road`      text,
    `City`              text,
    `membership_amount` text,
    PRIMARY KEY (`Branch_ID`)
);



CREATE TABLE `membership_register_branch`
(
    `Member_ID`     int,
    `Branch_ID`     text,
    `Register_Year` text,
    PRIMARY KEY (`Member_ID`),
    FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
    FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`)
);



CREATE TABLE `purchase`
(
    `Member_ID`    int,
    `Branch_ID`    text,
    `Year`         text,
    `Total_pounds` real,
    PRIMARY KEY (`Member_ID`, `Branch_ID`, `Year`),
    FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
    FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`)
);


