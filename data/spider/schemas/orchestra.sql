CREATE TABLE `conductor`
(
    `Conductor_ID` int,
    `Name`         text,
    `Age`          int,
    `Nationality`  text,
    `Year_of_Work` int,
    PRIMARY KEY (`Conductor_ID`)
);



CREATE TABLE `orchestra`
(
    `Orchestra_ID`        int,
    `Orchestra`           text,
    `Conductor_ID`        int,
    `Record_Company`      text,
    `Year_of_Founded`     real,
    `Major_Record_Format` text,
    PRIMARY KEY (`Orchestra_ID`),
    FOREIGN KEY (`Conductor_ID`) REFERENCES `conductor` (`Conductor_ID`)
);

CREATE TABLE `performance`
(
    `Performance_ID`              int,
    `Orchestra_ID`                int,
    `Type`                        text,
    `Date`                        text,
    `Official_ratings_(millions)` real,
    `Weekly_rank`                 text,
    `Share`                       text,
    PRIMARY KEY (`Performance_ID`),
    FOREIGN KEY (`Orchestra_ID`) REFERENCES `orchestra` (`Orchestra_ID`)
);

CREATE TABLE `show`
(
    `Show_ID`        int,
    `Performance_ID` int,
    `If_first_show`  bool,
    `Result`         text,
    `Attendance`     real,
    FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`)
);





