CREATE TABLE `gymnast`
(
    `Gymnast_ID`            int,
    `Floor_Exercise_Points` real,
    `Pommel_Horse_Points`   real,
    `Rings_Points`          real,
    `Vault_Points`          real,
    `Parallel_Bars_Points`  real,
    `Horizontal_Bar_Points` real,
    `Total_Points`          real,
    PRIMARY KEY (`Gymnast_ID`),
    FOREIGN KEY (`Gymnast_ID`) REFERENCES `people` (`People_ID`)
);

CREATE TABLE `people`
(
    `People_ID` int,
    `Name`      text,
    `Age`       real,
    `Height`    real,
    `Hometown`  text,
    PRIMARY KEY (`People_ID`)
);





