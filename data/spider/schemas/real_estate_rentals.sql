CREATE TABLE `Ref_Age_Categories`
(
    `age_category_code`        VARCHAR(15) PRIMARY KEY,
    `age_category_description` VARCHAR(80)
);
CREATE TABLE `Ref_Property_Types`
(
    `property_type_code`        VARCHAR(15) PRIMARY KEY,
    `property_type_description` VARCHAR(80)
);
CREATE TABLE `Ref_Room_Types`
(
    `room_type_code`        VARCHAR(15) PRIMARY KEY,
    `room_type_description` VARCHAR(80)
);
CREATE TABLE `Ref_User_Categories`
(
    `user_category_code`        VARCHAR(15) PRIMARY KEY,
    `user_category_description` VARCHAR(80)
);
CREATE TABLE `Addresses`
(
    `address_id`             INTEGER PRIMARY KEY,
    `line_1_number_building` VARCHAR(80),
    `line_2_number_street`   VARCHAR(80),
    `line_3_area_locality`   VARCHAR(80),
    `town_city`              VARCHAR(80),
    `zip_postcode`           VARCHAR(20),
    `county_state_province`  VARCHAR(80),
    `country`                VARCHAR(50),
    `other_address_details`  VARCHAR(255)
);
CREATE TABLE `Features`
(
    `feature_id`          INTEGER PRIMARY KEY,
    `feature_name`        VARCHAR(80),
    `feature_description` VARCHAR(80)
);
CREATE TABLE `Users`
(
    `user_id`            INTEGER PRIMARY KEY,
    `age_category_code`  VARCHAR(15),
    `user_category_code` VARCHAR(15),
    `user_address_id`    INTEGER NOT NULL,
    `is_buyer`           VARCHAR(1),
    `is_seller`          VARCHAR(1),
    `login_name`         VARCHAR(25),
    `password`           VARCHAR(8),
    `date_registered`    DATETIME,
    `first_name`         VARCHAR(80),
    `middle_name`        VARCHAR(80),
    `last_name`          VARCHAR(80),
    `other_user_details` VARCHAR(255),
    -- check ( is_buyer in ('0', '1', '')),
    -- check ( Users.is_seller in ('0', '1', '')),
    -- CHECK (is_buyer <> is_seller),
    FOREIGN KEY (age_category_code) REFERENCES Ref_Age_Categories (age_category_code),
    FOREIGN KEY (user_category_code) REFERENCES Ref_User_Categories (user_category_code),
    FOREIGN KEY (user_address_id) REFERENCES Addresses (address_id)
);
CREATE TABLE `Properties`
(
    `property_id`            INTEGER PRIMARY KEY,
    `property_address_id`    INTEGER     NOT NULL,
    `owner_user_id`          INTEGER     NOT NULL,
    `property_type_code`     VARCHAR(15) NOT NULL,
    `date_on_market`         DATETIME,
    `date_off_market`        DATETIME,
    `property_name`          VARCHAR(80),
    `property_description`   VARCHAR(255),
    `garage_yn`              VARCHAR(1),
    `parking_lots`           VARCHAR(1),
    `room_count`             int,
    `vendor_requested_price` DOUBLE NULL,
    `price_min` DOUBLE NULL,
    `price_max` DOUBLE NULL,
    `other_property_details` VARCHAR(255),
    FOREIGN KEY (`owner_user_id`) REFERENCES `Users` (`user_id`),
    FOREIGN KEY (`property_address_id`) REFERENCES `Addresses` (`address_id`),
    FOREIGN KEY (`property_type_code`) REFERENCES `Ref_Property_Types` (`property_type_code`)
    -- check ( garage_yn in ('0', '1', '') )
    -- check ( parking_lots in ('0', '1', '') )
);
CREATE TABLE `Property_Features`
(
    `property_id`                  INTEGER NOT NULL,
    `feature_id`                   INTEGER NOT NULL,
    `feature_value`                VARCHAR(80),
    `property_feature_description` VARCHAR(80),
    PRIMARY KEY (property_id, feature_id),
    FOREIGN KEY (`feature_id`) REFERENCES `Features` (`feature_id`),
    FOREIGN KEY (`property_id`) REFERENCES `Properties` (`property_id`)
);
CREATE TABLE `Property_Photos`
(
    `property_id`       INTEGER NOT NULL,
    `photo_seq`         INTEGER NOT NULL,
    `photo_title`       VARCHAR(30),
    `photo_description` VARCHAR(255),
    `photo_filename`    VARCHAR(255),
    PRIMARY KEY (property_id, photo_seq),
    FOREIGN KEY (`property_id`) REFERENCES `Properties` (`property_id`)
);
CREATE TABLE `Rooms`
(
    `property_id`        INTEGER     NOT NULL,
    `room_number`        VARCHAR(10) NOT NULL,
    `room_type_code`     VARCHAR(15) NOT NULL,
    `room_size`          VARCHAR(20),
    `other_room_details` VARCHAR(255),
    FOREIGN KEY (`property_id`) REFERENCES `Properties` (`property_id`),
    FOREIGN KEY (`room_type_code`) REFERENCES `Ref_Room_Types` (`room_type_code`)
);
CREATE TABLE `User_Property_History`
(
    `user_id`     INTEGER  NOT NULL,
    `property_id` INTEGER  NOT NULL,
    `datestamp`   DATETIME NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
    FOREIGN KEY (`property_id`) REFERENCES `Properties` (`property_id`)
);
CREATE TABLE `User_Searches`
(
    `user_id`         INTEGER NOT NULL,
    `search_seq`      INTEGER NOT NULL,
    `search_datetime` DATETIME,
    `search_string`   VARCHAR(80),
    primary key (user_id, search_seq),
    FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
);
