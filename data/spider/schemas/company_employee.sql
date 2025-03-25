CREATE TABLE `people`
(
    `People_ID`          int,
    `Age`                int,
    `Name`               text,
    `Nationality`        text,
    `Graduation_College` text,
    PRIMARY KEY (`People_ID`)
);



CREATE TABLE `company`
(
    `Company_ID`              real,
    `Name`                    text,
    `Headquarters`            text,
    `Industry`                text,
    `Sales_in_Billion`        real,
    `Profits_in_Billion`      real,
    `Assets_in_Billion`       real,
    `Market_Value_in_Billion` real,
    PRIMARY KEY (`Company_ID`)
);



CREATE TABLE `employment`
(
    `Company_ID`   int,
    `People_ID`    int,
    `Year_working` int,
    PRIMARY KEY (`Company_ID`, `People_ID`),
    FOREIGN KEY (`Company_ID`) REFERENCES `company` (`Company_ID`),
    FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`)
);


