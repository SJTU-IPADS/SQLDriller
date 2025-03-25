CREATE TABLE `event`
(
    `Event_ID`         int,
    `Date`             text,
    `Venue`            text,
    `Name`             text,
    `Event_Attendance` int,
    PRIMARY KEY (`Event_ID`)
);

CREATE TABLE `journalist`
(
    `journalist_ID` int,
    `Name`          text,
    `Nationality`   text,
    `Age`           text,
    `Years_working` int,
    PRIMARY KEY (`journalist_ID`)
);



CREATE TABLE `news_report`
(
    `journalist_ID` int,
    `Event_ID`      int,
    `Work_Type`     text,
    PRIMARY KEY (`journalist_ID`, `Event_ID`),
    FOREIGN KEY (`journalist_ID`) REFERENCES `journalist` (`journalist_ID`),
    FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`)
);


