CREATE TABLE `driver`
(
    `Driver_ID` int,
    `Name`      text,
    `Party`     text,
    `Home_city` text,
    `Age`       int,
    PRIMARY KEY (`Driver_ID`)
);

CREATE TABLE `school`
(
    `School_ID` int,
    `Grade`     text,
    `School`    text,
    `Location`  text,
    `Type`      text,
    PRIMARY KEY (`School_ID`)
);



CREATE TABLE `school_bus`
(
    `School_ID`     int,
    `Driver_ID`     int,
    `Years_Working` int,
    `If_full_time`  bool,
    PRIMARY KEY (`School_ID`, `Driver_ID`),
    FOREIGN KEY (`School_ID`) REFERENCES `school` (`School_ID`),
    FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`)
);



