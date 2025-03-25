CREATE TABLE `cars`
(
    `id`         INT NOT NULL,
    `train_id`   INT  DEFAULT NULL,
    `position`   INT  DEFAULT NULL,
    `shape`      TEXT DEFAULT NULL,
    `len`        TEXT DEFAULT NULL,
    `sides`      TEXT DEFAULT NULL,
    `roof`       TEXT DEFAULT NULL,
    `wheels`     INT  DEFAULT NULL,
    `load_shape` TEXT DEFAULT NULL,
    `load_num`   INT  DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`)
);
CREATE TABLE `trains`
(
    `id`        INT NOT NULL,
    `direction` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`)
);
