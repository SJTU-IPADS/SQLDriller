CREATE TABLE `course`
(
    `Course_ID`    int,
    `Staring_Date` text,
    `Course`       text,
    PRIMARY KEY (`Course_ID`)
);

CREATE TABLE `teacher`
(
    `Teacher_ID` int,
    `Name`       text,
    `Age`        text,
    `Hometown`   text,
    PRIMARY KEY (`Teacher_ID`)
);



CREATE TABLE `course_arrange`
(
    `Course_ID`  int,
    `Teacher_ID` int,
    `Grade`      int,
    PRIMARY KEY (`Course_ID`, `Teacher_ID`, `Grade`),
    FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
    FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`)
);

