CREATE TABLE `TV_Channel`
(
    `id`                     text,
    `series_name`            text,
    `Country`                text,
    `Language`               text,
    `Content`                text,
    `Pixel_aspect_ratio_PAR` text,
    `Hight_definition_TV`    text,
    `Pay_per_view_PPV`       text,
    `Package_Option`         text,
    PRIMARY KEY (`id`)
);

CREATE TABLE `TV_series`
(
    `id`                 real,
    `Episode`            text,
    `Air_Date`           text,
    `Rating`             text,
    `Share`              real,
    `18_49_Rating_Share` text,
    `Viewers_m`          text,
    `Weekly_Rank`        real,
    `Channel`            text,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`Channel`) REFERENCES `TV_Channel` (`id`)
);

CREATE TABLE `Cartoon`
(
    `id`                real,
    `Title`             text,
    `Directed_by`       text,
    `Written_by`        text,
    `Original_air_date` text,
    `Production_code`   real,
    `Channel`           text,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`Channel`) REFERENCES `TV_Channel` (`id`)
);










 
