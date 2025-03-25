CREATE TABLE `businesses`
(
    `business_id`          INT  NOT NULL,
    `name`                 TEXT NOT NULL,
    `address`              TEXT  DEFAULT NULL,
    `city`                 TEXT  DEFAULT NULL,
    `postal_code`          TEXT  DEFAULT NULL,
    `latitude`             FLOAT DEFAULT NULL,
    `longitude`            FLOAT DEFAULT NULL,
    `phone_number`         INT   DEFAULT NULL,
    `tax_code`             TEXT  DEFAULT NULL,
    `business_certificate` INT  NOT NULL,
    `application_date`     DATE  DEFAULT NULL,
    `owner_name`           TEXT NOT NULL,
    `owner_address`        TEXT  DEFAULT NULL,
    `owner_city`           TEXT  DEFAULT NULL,
    `owner_state`          TEXT  DEFAULT NULL,
    `owner_zip`            TEXT  DEFAULT NULL,
    PRIMARY KEY (`business_id`)
);
CREATE TABLE `inspections`
(
    `business_id` INT  NOT NULL,
    `score`       INT DEFAULT NULL,
    `date`        DATE NOT NULL,
    `type`        TEXT NOT NULL,
    FOREIGN KEY (`business_id`) REFERENCES `businesses` (`business_id`)
);
CREATE TABLE `violations`
(
    `business_id`       INT  NOT NULL,
    `date`              DATE NOT NULL,
    `violation_type_id` TEXT NOT NULL,
    `risk_category`     TEXT NOT NULL,
    `description`       TEXT NOT NULL,
    FOREIGN KEY (`business_id`) REFERENCES `businesses` (`business_id`)
);
