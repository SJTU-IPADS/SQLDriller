CREATE TABLE `Agencies`
(
    `agency_id`      INTEGER PRIMARY KEY,
    `agency_details` VARCHAR(255) NOT NULL
);
CREATE TABLE `Staff`
(
    `staff_id`      INTEGER PRIMARY KEY,
    `agency_id`     INTEGER      NOT NULL,
    `staff_details` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`agency_id`) REFERENCES `Agencies` (`agency_id`)
);
CREATE TABLE `Clients`
(
    `client_id`      INTEGER PRIMARY KEY,
    `agency_id`      INTEGER      NOT NULL,
    `sic_code`       VARCHAR(10)  NOT NULL,
    `client_details` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`agency_id`) REFERENCES `Agencies` (`agency_id`)
);
CREATE TABLE `Invoices`
(
    `invoice_id`      INTEGER PRIMARY KEY,
    `client_id`       INTEGER      NOT NULL,
    `invoice_status`  VARCHAR(10)  NOT NULL,
    `invoice_details` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`)
);
CREATE TABLE `Meetings`
(
    `meeting_id`         INTEGER PRIMARY KEY,
    `client_id`          INTEGER      NOT NULL,
    `meeting_outcome`    VARCHAR(10)  NOT NULL,
    `meeting_type`       VARCHAR(10)  NOT NULL,
    `billable_yn`        VARCHAR(1),
    `start_date_time`    DATETIME,
    `end_date_time`      DATETIME,
    `purpose_of_meeting` VARCHAR(255),
    `other_details`      VARCHAR(255) NOT NULL,
    FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`)
);
CREATE TABLE `Payments`
(
    `payment_id`      INTEGER      NOT NULL PRIMARY KEY,
    `invoice_id`      INTEGER      NOT NULL,
    `payment_details` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`)
);
CREATE TABLE `Staff_in_Meetings`
(
    `meeting_id` INTEGER NOT NULL,
    `staff_id`   INTEGER NOT NULL,
    FOREIGN KEY (`meeting_id`) REFERENCES `Meetings` (`meeting_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`staff_id`),
    PRIMARY KEY (`meeting_id`, `staff_id`)
);
