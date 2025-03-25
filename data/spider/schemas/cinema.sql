CREATE TABLE `film`
(
    `Film_ID`           int,
    `Rank_in_series`    int,
    `Number_in_season`  int,
    `Title`             text,
    `Directed_by`       text,
    `Original_air_date` text,
    `Production_code`   text,
    PRIMARY KEY (`Film_ID`)
);

CREATE TABLE `cinema`
(
    `Cinema_ID`     int,
    `Name`          text,
    `Openning_year` int,
    `Capacity`      int,
    `Location`      text,
    PRIMARY KEY (`Cinema_ID`)
);



CREATE TABLE `schedule`
(
    `Cinema_ID`          int,
    `Film_ID`            int,
    `Date`               text,
    `Show_times_per_day` int,
    `Price`              float,
    PRIMARY KEY (`Cinema_ID`, `Film_ID`),
    FOREIGN KEY (`Film_ID`) REFERENCES `film` (`Film_ID`),
    FOREIGN KEY (`Cinema_ID`) REFERENCES `cinema` (`Cinema_ID`)
);



