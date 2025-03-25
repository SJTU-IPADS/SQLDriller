CREATE TABLE `employee`
(
    `Employee_ID` int,
    `Name`        text,
    `Age`         int,
    `City`        text,
    PRIMARY KEY (`Employee_ID`)
);



CREATE TABLE `shop`
(
    `Shop_ID`         int,
    `Name`            text,
    `Location`        text,
    `District`        text,
    `Number_products` int,
    `Manager_name`    text,
    PRIMARY KEY (`Shop_ID`)
);



CREATE TABLE `hiring`
(
    `Shop_ID`      int,
    `Employee_ID`  int,
    `Start_from`   text,
    `Is_full_time` bool,
    PRIMARY KEY (`Employee_ID`),
    FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`Shop_ID`),
    FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
);



CREATE TABLE `evaluation`
(
    `Employee_ID`  text,
    `Year_awarded` text,
    `Bonus`        real,
    PRIMARY KEY (`Employee_ID`, `Year_awarded`),
    FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
);



