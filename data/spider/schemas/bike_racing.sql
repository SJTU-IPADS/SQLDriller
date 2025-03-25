CREATE TABLE `bike`
(
    `id`           int,
    `product_name` text,
    `weight`       int,
    `price`        real,
    `material`     text,
    primary key (`id`)
);
CREATE TABLE `cyclist`
(
    `id`     int,
    `heat`   int,
    `name`   text,
    `nation` text,
    `result` real,
    primary key (`id`)
);
CREATE TABLE `cyclists_own_bikes`
(
    `cyclist_id`    int,
    `bike_id`       int,
    `purchase_year` int,
    primary key (`cyclist_id`, `bike_id`),
    foreign key (`cyclist_id`) references `cyclist` (`id`),
    foreign key (`bike_id`) references `bike` (`id`)
);
