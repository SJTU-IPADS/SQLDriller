CREATE TABLE `architect`
(
    `id`          text,
    `name`        text,
    `nationality` text,
    `gender`      text,
    primary key (`id`)
);

CREATE TABLE `bridge`
(
    `architect_id`  int,
    `id`            int,
    `name`          text,
    `location`      text,
    `length_meters` real,
    `length_feet`   real,
    primary key (`id`),
    foreign key (`architect_id`) references `architect` (`id`)
);

CREATE TABLE `mill`
(
    `architect_id` int,
    `id`           int,
    `location`     text,
    `name`         text,
    `type`         text,
    `built_year`   int,
    `notes`        text,
    primary key (`id`),
    foreign key (`architect_id`) references `architect` (`id`)
);







