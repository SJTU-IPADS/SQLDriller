CREATE TABLE `institution`
(
    `Institution_ID` int,
    `Name`           text,
    `Team`           text,
    `City`           text,
    `Province`       text,
    `Founded`        int,
    `Affiliation`    text,
    `Enrollment`     int,
    `Endowment`      text,
    `Stadium`        text,
    `Capacity`       int,
    PRIMARY KEY (`Institution_ID`)
);
CREATE TABLE `Championship`
(
    `Institution_ID`          int,
    `Nickname`                text,
    `Joined`                  int,
    `Number_of_Championships` int,
    PRIMARY KEY (`Institution_ID`),
    FOREIGN KEY (`Institution_ID`) REFERENCES `institution` (`Institution_ID`)
);
