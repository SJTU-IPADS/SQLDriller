CREATE TABLE `driver`
(
    `Driver_ID`   int,
    `Driver_Name` text,
    `Entrant`     text,
    `Constructor` text,
    `Chassis`     text,
    `Engine`      text,
    `Age`         int,
    PRIMARY KEY (`Driver_ID`)
);
CREATE TABLE `race`
(
    `Road`           int,
    `Driver_ID`      int,
    `Race_Name`      text,
    `Pole_Position`  text,
    `Fastest_Lap`    text,
    `Winning_driver` text,
    `Winning_team`   text,
    `Report`         text,
    PRIMARY KEY (`Road`),
    FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`)
);
