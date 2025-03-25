CREATE TABLE `country`
(
    `Country_id`               int,
    `Country_name`             text,
    `Capital`                  text,
    `Official_native_language` text,
    PRIMARY KEY (`Country_id`)
);


CREATE TABLE `team`
(
    `Team_id` int,
    `Name`    text,
    PRIMARY KEY (`Team_id`)
);


CREATE TABLE `match_season`
(
    `Season`            real,
    `Player`            text,
    `Position`          text,
    `Country`           int,
    `Team`              int,
    `Draft_Pick_Number` int,
    `Draft_Class`       text,
    `College`           text,
    PRIMARY KEY (`Season`),
    FOREIGN KEY (`Country`) REFERENCES `country` (`Country_id`),
    FOREIGN KEY (`Team`) REFERENCES `team` (`Team_id`)
);


CREATE TABLE `player`
(
    `Player_ID`    int,
    `Player`       text,
    `Years_Played` text,
    `Total_WL`     text,
    `Singles_WL`   text,
    `Doubles_WL`   text,
    `Team`         int,
    PRIMARY KEY (`Player_ID`),
    FOREIGN KEY (`Team`) REFERENCES `team` (`Team_id`)
);







