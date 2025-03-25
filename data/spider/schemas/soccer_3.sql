CREATE TABLE `club`
(
    `Club_ID`      int,
    `Name`         text,
    `Manager`      text,
    `Captain`      text,
    `Manufacturer` text,
    `Sponsor`      text,
    PRIMARY KEY (`Club_ID`)
);
CREATE TABLE `player`
(
    `Player_ID`     real,
    `Name`          text,
    `Country`       text,
    `Earnings`      real,
    `Events_number` int,
    `Wins_count`    int,
    `Club_ID`       int,
    -- CHECK ( Events_number >= player.Wins_count ),
    PRIMARY KEY (`Player_ID`),
    FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`)
);
