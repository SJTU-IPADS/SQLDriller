CREATE TABLE `district`
(
    `District_ID`        int,
    `Name`               text,
    `Area_km`            real,
    `Population`         real,
    `Density_km`         real,
    `Government_website` text,
    PRIMARY KEY (`District_ID`)
);
CREATE TABLE `spokesman`
(
    `Spokesman_ID`  int,
    `Name`          text,
    `Age`           int,
    `Speach_title`  text,
    `Rank_position` int,
    `Points`        int,
    PRIMARY KEY (`Spokesman_ID`)
);
CREATE TABLE `spokesman_district`
(
    `Spokesman_ID` int,
    `District_ID`  int,
    `Start_year`   int,
    PRIMARY KEY (`Spokesman_ID`),
    FOREIGN KEY (`Spokesman_ID`) REFERENCES `spokesman` (`Spokesman_ID`),
    FOREIGN KEY (`District_ID`) REFERENCES `district` (`District_ID`)
);
