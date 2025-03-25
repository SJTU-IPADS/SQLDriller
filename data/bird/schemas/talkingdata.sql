CREATE TABLE `app_all`
(
    `app_id` INT NOT NULL,
    PRIMARY KEY (`app_id`)
);
CREATE TABLE `app_events`
(
    `event_id`     INT NOT NULL,
    `app_id`       INT NOT NULL,
    `is_installed` INT NOT NULL,
    `is_active`    INT NOT NULL,
    PRIMARY KEY (`event_id`, `app_id`),
    FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
);
CREATE TABLE `app_events_relevant`
(
    `event_id`     INT NOT NULL,
    `app_id`       INT NOT NULL,
    `is_installed` INT DEFAULT NULL,
    `is_active`    INT DEFAULT NULL,
    PRIMARY KEY (`event_id`, `app_id`),
    FOREIGN KEY (`event_id`) REFERENCES `events_relevant` (`event_id`),
    FOREIGN KEY (`app_id`) REFERENCES `app_all` (`app_id`)
);
CREATE TABLE `app_labels`
(
    `app_id`   INT NOT NULL,
    `label_id` INT NOT NULL,
    FOREIGN KEY (`label_id`) REFERENCES `label_categories` (`label_id`),
    FOREIGN KEY (`app_id`) REFERENCES `app_all` (`app_id`)
);
CREATE TABLE `events`
(
    `event_id`  INT NOT NULL,
    `device_id` INT      DEFAULT NULL,
    `timestamp` DATETIME DEFAULT NULL,
    `longitude` FLOAT    DEFAULT NULL,
    `latitude`  FLOAT    DEFAULT NULL,
    PRIMARY KEY (`event_id`)
);
CREATE TABLE `events_relevant`
(
    `event_id`  INT      NOT NULL,
    `device_id` INT DEFAULT NULL,
    `timestamp` DATETIME NOT NULL,
    `longitude` FLOAT    NOT NULL,
    `latitude`  FLOAT    NOT NULL,
    PRIMARY KEY (`event_id`),
    FOREIGN KEY (`device_id`) REFERENCES `gender_age` (`device_id`)
);
CREATE TABLE `gender_age`
(
    `device_id` INT NOT NULL,
    `gender`    TEXT DEFAULT NULL,
    `age`       INT  DEFAULT NULL,
    `group`     TEXT DEFAULT NULL,
    PRIMARY KEY (`device_id`),
    FOREIGN KEY (`device_id`) REFERENCES `phone_brand_device_model2` (`device_id`)
);
CREATE TABLE `gender_age_test`
(
    `device_id` INT NOT NULL,
    PRIMARY KEY (`device_id`)
);
CREATE TABLE `gender_age_train`
(
    `device_id` INT NOT NULL,
    `gender`    TEXT DEFAULT NULL,
    `age`       INT  DEFAULT NULL,
    `group`     TEXT DEFAULT NULL,
    PRIMARY KEY (`device_id`)
);
CREATE TABLE `label_categories`
(
    `label_id` INT NOT NULL,
    `category` TEXT DEFAULT NULL,
    PRIMARY KEY (`label_id`)
);
CREATE TABLE `phone_brand_device_model2`
(
    `device_id`    INT  NOT NULL,
    `phone_brand`  TEXT NOT NULL,
    `device_model` TEXT NOT NULL,
    PRIMARY KEY (`device_id`, `phone_brand`, `device_model`)
);
CREATE TABLE `sample_submission`
(
    `device_id` INT NOT NULL,
    `F23-`      FLOAT DEFAULT NULL,
    `F24-26`    FLOAT DEFAULT NULL,
    `F27-28`    FLOAT DEFAULT NULL,
    `F29-32`    FLOAT DEFAULT NULL,
    `F33-42`    FLOAT DEFAULT NULL,
    `F43+`      FLOAT DEFAULT NULL,
    `M22-`      FLOAT DEFAULT NULL,
    `M23-26`    FLOAT DEFAULT NULL,
    `M27-28`    FLOAT DEFAULT NULL,
    `M29-31`    FLOAT DEFAULT NULL,
    `M32-38`    FLOAT DEFAULT NULL,
    `M39+`      FLOAT DEFAULT NULL,
    PRIMARY KEY (`device_id`)
);
