CREATE TABLE bool
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY
);
CREATE TABLE person
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY
);
CREATE TABLE disabled
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE enlist
(
    `name` TEXT NOT NULL,
    organ  TEXT NOT NULL,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE filed_for_bankrupcy
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE longest_absense_from_school
(
    `name`  TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    `month` INT  DEFAULT 0  NULL,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE male
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE no_payment_due
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    bool   TEXT            NULL,
    FOREIGN KEY (`name`) REFERENCES person (`name`),
    FOREIGN KEY (bool) REFERENCES bool (`name`)
);
CREATE TABLE unemployed
(
    `name` TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    FOREIGN KEY (`name`) REFERENCES person (`name`)
);
CREATE TABLE `enrolled`
(
    `name`   TEXT NOT NULL,
    `school` TEXT NOT NULL,
    `month`  INT  NOT NULL DEFAULT 0,
    PRIMARY KEY (`name`, `school`),
    FOREIGN KEY (`name`) REFERENCES `person` (`name`)
);
