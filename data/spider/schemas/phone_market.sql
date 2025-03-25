CREATE TABLE `phone`
(
    `Name`        text,
    `Phone_ID`    int,
    `Memory_in_G` int,
    `Carrier`     text,
    `Price`       real,
    PRIMARY KEY (`Phone_ID`)
);

CREATE TABLE `market`
(
    `Market_ID`        int,
    `District`         text,
    `Num_of_employees` int,
    `Num_of_shops`     real,
    `Ranking`          int,
    PRIMARY KEY (`Market_ID`)
);



CREATE TABLE `phone_market`
(
    `Market_ID`    int,
    `Phone_ID`     text,
    `Num_of_stock` int,
    PRIMARY KEY (`Market_ID`, `Phone_ID`),
    FOREIGN KEY (`Market_ID`) REFERENCES `market` (`Market_ID`),
    FOREIGN KEY (`Phone_ID`) REFERENCES `phone` (`Phone_ID`)
);



