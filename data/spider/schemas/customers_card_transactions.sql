CREATE TABLE `Accounts`
(
    `account_id`            INTEGER PRIMARY KEY,
    `customer_id`           INTEGER NOT NULL,
    `account_name`          VARCHAR(50),
    `other_account_details` VARCHAR(255)
);
CREATE TABLE `Customers`
(
    `customer_id`            INTEGER PRIMARY KEY,
    `customer_first_name`    VARCHAR(20),
    `customer_last_name`     VARCHAR(20),
    `customer_address`       VARCHAR(255),
    `customer_phone`         VARCHAR(255),
    `customer_email`         VARCHAR(255),
    `other_customer_details` VARCHAR(255)
);
CREATE TABLE `Customers_Cards`
(
    `card_id`            INTEGER PRIMARY KEY,
    `customer_id`        INTEGER     NOT NULL,
    `card_type_code`     VARCHAR(15) NOT NULL,
    `card_number`        VARCHAR(80),
    `date_valid_from`    DATETIME,
    `date_valid_to`      DATETIME,
    `other_card_details` VARCHAR(255)
);
CREATE TABLE `Financial_Transactions`
(
    `transaction_id`            INTEGER     NOT NULL,
    `previous_transaction_id`   INTEGER,
    `account_id`                INTEGER     NOT NULL,
    `card_id`                   INTEGER     NOT NULL,
    `transaction_type`          VARCHAR(15) NOT NULL,
    `transaction_date`          DATETIME,
    `transaction_amount`        DOUBLE      NULL,
    `transaction_comment`       VARCHAR(255),
    `other_transaction_details` VARCHAR(255),
    FOREIGN KEY (`card_id`) REFERENCES `Customers_Cards` (`card_id`),
    FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`account_id`)
);
