CREATE TABLE `building`
(
    `Building_ID`       int,
    `Region_ID`         int,
    `Name`              text,
    `Address`           text,
    `Number_of_Stories` int,
    `Completed_Year`    int,
    PRIMARY KEY (`Building_ID`),
    FOREIGN KEY (`Region_ID`) REFERENCES `region` (`Region_ID`)
);
CREATE TABLE `region`
(
    `Region_ID`  int,
    `Name`       text,
    `Capital`    text,
    `Area`       int,
    `Population` int,
    PRIMARY KEY (`Region_ID`)
);
