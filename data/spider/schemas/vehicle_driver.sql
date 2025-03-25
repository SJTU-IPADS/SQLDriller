CREATE TABLE `vehicle`
(
    `Vehicle_ID`       int,
    `Model`            text,
    `Build_Year`       int,
    `Top_Speed`        int,
    `Power`            int,
    `Builder`          text,
    `Total_Production` int,
    PRIMARY KEY (`Vehicle_ID`)
);
CREATE TABLE `driver`
(
    `Driver_ID`     int,
    `Name`          text,
    `Citizenship`   text,
    `Racing_Series` text,
    PRIMARY KEY (`Driver_ID`)
);
CREATE TABLE `vehicle_driver`
(
    `Driver_ID`  int,
    `Vehicle_ID` int,
    PRIMARY KEY (`Driver_ID`, `Vehicle_ID`),
    FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`),
    FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`)
);
