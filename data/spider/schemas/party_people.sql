CREATE TABLE `region`
(
    `Region_ID`   int,
    `Region_name` text,
    `Date`        text,
    `Label`       text,
    `Format`      text,
    `Catalogue`   text,
    PRIMARY KEY (`Region_ID`)
);



CREATE TABLE `party`
(
    `Party_ID`    int,
    `Minister`    text,
    `Took_office` text,
    `Left_office` text,
    `Region_ID`   int,
    `Party_name`  text,
    PRIMARY KEY (`Party_ID`),
    FOREIGN KEY (`Region_ID`) REFERENCES `region` (`Region_ID`)
);

CREATE TABLE `member`
(
    `Member_ID`   int,
    `Member_Name` text,
    `Party_ID`    text,
    `In_office`   text,
    PRIMARY KEY (`Member_ID`),
    FOREIGN KEY (`Party_ID`) REFERENCES `party` (`Party_ID`)
);



CREATE TABLE `party_events`
(
    `Event_ID`            int,
    `Event_Name`          text,
    `Party_ID`            int,
    `Member_in_charge_ID` int,
    PRIMARY KEY (`Event_ID`),
    FOREIGN KEY (`Party_ID`) REFERENCES `party` (`Party_ID`),
    FOREIGN KEY (`Member_in_charge_ID`) REFERENCES `member` (`Member_ID`)
);


