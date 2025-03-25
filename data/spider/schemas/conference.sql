CREATE TABLE `conference`
(
    `Conference_ID`   int,
    `Conference_Name` text,
    `Year`            int,
    `Location`        text,
    PRIMARY KEY (`Conference_ID`)
);
CREATE TABLE institution
(
    `Institution_ID`   int,
    `Institution_Name` text,
    `Location`         text,
    `Founded`          int,
    PRIMARY KEY (`Institution_ID`)
);
CREATE TABLE `staff`
(
    `staff_ID`       int,
    `name`           text,
    `Age`            int,
    `Nationality`    text,
    `Institution_ID` int,
    PRIMARY KEY (`staff_ID`),
    FOREIGN KEY (`Institution_ID`) REFERENCES `institution` (`Institution_ID`)
);
CREATE TABLE `conference_participation`
(
    `Conference_ID` int,
    `staff_ID`      int,
    `role`          text,
    PRIMARY KEY (`staff_ID`, `Conference_ID`),
    FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`),
    FOREIGN KEY (`Conference_ID`) REFERENCES `conference` (`Conference_ID`)
);
