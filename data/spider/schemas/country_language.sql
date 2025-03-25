CREATE TABLE `languages`
(
    `id`   integer,
    `name` text,
    PRIMARY KEY (`id`)
);
CREATE TABLE `countries`
(
    `id`              integer,
    `name`            text,
    `overall_score`   real,
    `justice_score`   real,
    `health_score`    real,
    `education_score` real,
    `economics_score` real,
    `politics_score`  real,
    PRIMARY KEY (`id`)
);
CREATE TABLE `official_languages`
(
    `language_id` integer,
    `country_id`  integer,
    PRIMARY KEY (`language_id`, `country_id`),
    FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
    FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
);
