CREATE TABLE `channel`
(
    `Channel_ID`                   int,
    `Name`                         text,
    `Analogue_terrestrial_channel` text,
    `Digital_terrestrial_channel`  text,
    `Internet`                     text,
    PRIMARY KEY (`Channel_ID`)
);
CREATE TABLE `director`
(
    `Director_ID` int,
    `Name`        text,
    `Age`         int,
    PRIMARY KEY (`Director_ID`)
);
CREATE TABLE `program`
(
    `Program_ID`  int,
    `Start_Year`  int,
    `Title`       text,
    `Director_ID` int,
    `Channel_ID`  int,
    PRIMARY KEY (`Program_ID`),
    FOREIGN KEY (`Director_ID`) REFERENCES `director` (`Director_ID`),
    FOREIGN KEY (`Channel_ID`) REFERENCES `channel` (`Channel_ID`)
);
CREATE TABLE `director_admin`
(
    `Director_ID`       int,
    `Channel_ID`        int,
    `Is_first_director` bool,
    PRIMARY KEY (`Director_ID`, `Channel_ID`),
    FOREIGN KEY (`Director_ID`) REFERENCES `director` (`Director_ID`),
    FOREIGN KEY (`Channel_ID`) REFERENCES `channel` (`Channel_ID`)
);
