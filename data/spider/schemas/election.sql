CREATE TABLE `county`
(
    `County_Id`   int,
    `County_name` text,
    `Population`  real,
    `Zip_code`    text,
    PRIMARY KEY (`County_Id`)
);



CREATE TABLE `party`
(
    `Party_ID`            int,
    `Year`                real,
    `Party`               text,
    `Governor`            text,
    `Lieutenant_Governor` text,
    `Comptroller`         text,
    `Attorney_General`    text,
    `US_Senate`           text,
    PRIMARY KEY (`Party_ID`)
);



CREATE TABLE `election`
(
    `Election_ID`          int,
    `Counties_Represented` text,
    `District`             int,
    `Delegate`             text,
    `Party`                int,
    `First_Elected`        real,
    `Committee`            text,
    PRIMARY KEY (`Election_ID`),
    FOREIGN KEY (`Party`) REFERENCES `party` (`Party_ID`),
    FOREIGN KEY (`District`) REFERENCES `county` (`County_Id`)
);


