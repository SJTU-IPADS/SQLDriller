CREATE TABLE `Products`
(
    `product_id`          INTEGER PRIMARY KEY,
    `parent_product_id`   INTEGER,
    `product_name`        VARCHAR(80),
    `product_price`       DECIMAL(19, 4) DEFAULT 0,
    `product_color`       VARCHAR(50),
    `product_size`        VARCHAR(50),
    `product_description` VARCHAR(255)
);
CREATE TABLE `Customers`
(
    `customer_id`             INTEGER PRIMARY KEY,
    `gender_code`             VARCHAR(10) NOT NULL,
    `customer_first_name`     VARCHAR(50),
    `customer_middle_initial` VARCHAR(1),
    `customer_last_name`      VARCHAR(50),
    `email_address`           VARCHAR(255),
    `login_name`              VARCHAR(80),
    `login_password`          VARCHAR(20),
    `phone_number`            VARCHAR(255),
    `address_line_1`          VARCHAR(255),
    `town_city`               VARCHAR(50),
    `county`                  VARCHAR(50),
    `country`                 VARCHAR(50)
    -- check ( gender_code in ('Female', 'Male', 'Unknown'))
);
CREATE TABLE `Customer_Payment_Methods`
(
    `customer_id`         INTEGER     NOT NULL,
    `payment_method_code` VARCHAR(10) NOT NULL,
    primary key (customer_id, payment_method_code),
    FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
);
CREATE TABLE `Invoices`
(
    `invoice_number`      INTEGER PRIMARY KEY,
    `invoice_status_code` VARCHAR(10) NOT NULL,
    `invoice_date`        DATETIME
);
CREATE TABLE `Orders`
(
    `order_id`          INTEGER PRIMARY KEY,
    `customer_id`       INTEGER     NOT NULL,
    `order_status_code` VARCHAR(10) NOT NULL,
    `date_order_placed` DATETIME    NOT NULL,
    FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
);
CREATE TABLE `Order_Items`
(
    `order_item_id`          INTEGER PRIMARY KEY,
    `product_id`             INTEGER     NOT NULL,
    `order_id`               INTEGER     NOT NULL,
    `order_item_status_code` VARCHAR(10) NOT NULL,
    FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
    FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
);
CREATE TABLE `Shipments`
(
    `shipment_id`              INTEGER PRIMARY KEY,
    `order_id`                 INTEGER NOT NULL,
    `invoice_number`           INTEGER NOT NULL,
    `shipment_tracking_number` VARCHAR(80),
    `shipment_date`            DATETIME,
    FOREIGN KEY (`invoice_number`) REFERENCES `Invoices` (`invoice_number`),
    FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
);
CREATE TABLE `Shipment_Items`
(
    `shipment_id`   INTEGER NOT NULL,
    `order_item_id` INTEGER NOT NULL,
    PRIMARY KEY (`shipment_id`, `order_item_id`),
    FOREIGN KEY (`shipment_id`) REFERENCES `Shipments` (`shipment_id`),
    FOREIGN KEY (`order_item_id`) REFERENCES `Order_Items` (`order_item_id`)
);
