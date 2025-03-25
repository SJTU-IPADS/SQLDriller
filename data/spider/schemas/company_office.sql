CREATE TABLE `buildings`
(
    `id`      int,
    `name`    text,
    `City`    text,
    `Height`  int,
    `Stories` int,
    `Status`  text,
    PRIMARY KEY (`id`)
);



CREATE TABLE `Companies`
(
    `id`                   int,
    `name`                 text,
    `Headquarters`         text,
    `Industry`             text,
    `Sales_billion`        real,
    `Profits_billion`      real,
    `Assets_billion`       real,
    `Market_Value_billion` text,
    PRIMARY KEY (`id`)
);



CREATE TABLE `Office_locations`
(
    `building_id`  int,
    `company_id`   int,
    `move_in_year` int,
    PRIMARY KEY (`building_id`, `company_id`),
    FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
    FOREIGN KEY (`company_id`) REFERENCES `Companies` (`id`)
);


