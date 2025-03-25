CREATE TABLE `stadium`
(
    `id`                  int,
    `name`                text,
    `Home_Games`          int,
    `Average_Attendance`  real,
    `Total_Attendance`    real,
    `Capacity_Percentage` real,
    primary key (`id`)
);

CREATE TABLE `game`
(
    `stadium_id`  int,
    `id`          int,
    `Season`      int,
    `Date`        text,
    `Home_team`   text,
    `Away_team`   text,
    `Score`       text,
    `Competition` text,
    primary key (`id`),
    foreign key (`stadium_id`) references `stadium` (`id`)
);

CREATE TABLE `injury_accident`
(
    `game_id`           int,
    `id`                int,
    `Player`            text,
    `Injury`            text,
    `Number_of_matches` text,
    `Source`            text,
    primary key (`id`),
    foreign key (`game_id`) references `game` (`id`)
);







