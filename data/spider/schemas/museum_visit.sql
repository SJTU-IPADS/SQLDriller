CREATE TABLE `museum`
(
    `Museum_ID`    int,
    `Name`         text,
    `Num_of_Staff` int,
    `Open_Year`    text,
    PRIMARY KEY (`Museum_ID`)
);



CREATE TABLE `visitor`
(
    `ID`                  int,
    `Name`                text,
    `Level_of_membership` int,
    `Age`                 int,
    PRIMARY KEY (`ID`)
);


CREATE TABLE `visit`
(
    `Museum_ID`     int,
    `visitor_ID`    text,
    `Num_of_Ticket` int,
    `Total_spent`   real,
    PRIMARY KEY (`Museum_ID`, `visitor_ID`),
    FOREIGN KEY (`Museum_ID`) REFERENCES `museum` (`Museum_ID`),
    FOREIGN KEY (`visitor_ID`) REFERENCES `visitor` (`ID`)
);




