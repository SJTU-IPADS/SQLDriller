CREATE TABLE `manufacturer`
(
    `Manufacturer_ID`  int,
    `Open_Year`        real,
    `Name`             text,
    `Num_of_Factories` int,
    `Num_of_Shops`     int,
    PRIMARY KEY (`Manufacturer_ID`)
);



CREATE TABLE `furniture`
(
    `Furniture_ID`     int,
    `Name`             text,
    `Num_of_Component` int,
    `Market_Rate`      real,
    PRIMARY KEY (`Furniture_ID`)
);



CREATE TABLE `furniture_manufacte`
(
    `Manufacturer_ID` int,
    `Furniture_ID`    int,
    `Price_in_Dollar` real,
    PRIMARY KEY (`Manufacturer_ID`, `Furniture_ID`),
    FOREIGN KEY (`Manufacturer_ID`) REFERENCES `manufacturer` (`Manufacturer_ID`),
    FOREIGN KEY (`Furniture_ID`) REFERENCES `furniture` (`Furniture_ID`)
);


