CREATE TABLE `platform`
(
    `Platform_ID`     int,
    `Platform_name`   text,
    `Market_district` text,
    `Download_rank`   int,
    PRIMARY KEY (`Platform_ID`)
);
CREATE TABLE `game`
(
    `Game_ID`             int,
    `Title`               text,
    `Release_Date`        text,
    `Franchise`           text,
    `Developers`          text,
    `Platform_ID`         int,
    `Units_sold_Millions` real,
    PRIMARY KEY (`Game_ID`),
    FOREIGN KEY (`Platform_ID`) REFERENCES platform (`Platform_ID`)
);
CREATE TABLE `player`
(
    `Player_ID`        int,
    `Rank_of_the_year` int,
    `Player_name`      text,
    `Position`         text,
    `College`          text,
    PRIMARY KEY (`Player_ID`)
);
CREATE TABLE `game_player`
(
    `Player_ID` int,
    `Game_ID`   int,
    `If_active` bool,
    PRIMARY KEY (`Player_ID`, `Game_ID`),
    FOREIGN KEY (`Player_ID`) REFERENCES player (`Player_ID`),
    FOREIGN KEY (`Game_ID`) REFERENCES game (`Game_ID`)
);
