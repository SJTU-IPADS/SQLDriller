CREATE TABLE `Products`
(
    `product_id`          INTEGER PRIMARY KEY,
    `product_name`        VARCHAR(20),
    `product_price`       DECIMAL(19, 4),
    `product_description` VARCHAR(255)
);


CREATE TABLE `Addresses`
(
    `address_id`            INTEGER PRIMARY KEY,
    `address_details`       VARCHAR(80),
    `city`                  VARCHAR(50),
    `zip_postcode`          VARCHAR(20),
    `state_province_county` VARCHAR(50),
    `country`               VARCHAR(50)
);


CREATE TABLE `Customers`
(
    `customer_id`          INTEGER PRIMARY KEY,
    `payment_method`       VARCHAR(10) NOT NULL,
    `customer_name`        VARCHAR(80),
    `customer_phone`       VARCHAR(80),
    `customer_email`       VARCHAR(80),
    `date_became_customer` DATETIME
);


CREATE TABLE `Regular_Orders`
(
    `regular_order_id` INTEGER PRIMARY KEY,
    `distributer_id`   INTEGER NOT NULL,
    FOREIGN KEY (`distributer_id`) REFERENCES `Customers` (`customer_id`)
);



CREATE TABLE `Regular_Order_Products`
(
    `regular_order_id` INTEGER NOT NULL,
    `product_id`       INTEGER NOT NULL,
    FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
    FOREIGN KEY (`regular_order_id`) REFERENCES `Regular_Orders` (`regular_order_id`)
);



CREATE TABLE `Actual_Orders`
(
    `actual_order_id`   INTEGER PRIMARY KEY,
    `order_status_code` VARCHAR(10) NOT NULL,
    `regular_order_id`  INTEGER     NOT NULL,
    `actual_order_date` DATETIME,
    FOREIGN KEY (`regular_order_id`) REFERENCES `Regular_Orders` (`regular_order_id`)
);



CREATE TABLE `Actual_Order_Products`
(
    `actual_order_id` INTEGER NOT NULL,
    `product_id`      INTEGER NOT NULL,
    FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
    FOREIGN KEY (`actual_order_id`) REFERENCES `Actual_Orders` (`actual_order_id`)
);



CREATE TABLE `Customer_Addresses`
(
    `customer_id`  INTEGER     NOT NULL,
    `address_id`   INTEGER     NOT NULL,
    `date_from`    DATETIME    NOT NULL,
    `address_type` VARCHAR(10) NOT NULL,
    `date_to`      DATETIME,
    FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
    FOREIGN KEY (`address_id`) REFERENCES `Addresses` (`address_id`)
);



CREATE TABLE `Delivery_Routes`
(
    `route_id`            INTEGER PRIMARY KEY,
    `route_name`          VARCHAR(50),
    `other_route_details` VARCHAR(255)
);


CREATE TABLE `Delivery_Route_Locations` (
`location_code` VARCHAR(10) PRIMARY KEY,
`route_id` INTEGER NOT NULL,
`location_address_id` INTEGER NOT NULL,
`location_name` VARCHAR(50),
FOREIGN KEY (`location_address_id` ) REFERENCES `Addresses`(`address_id` ),
FOREIGN KEY (`route_id` ) REFERENCES `Delivery_Routes`(`route_id` )
);


CREATE TABLE `Trucks` (
`truck_id` INTEGER PRIMARY KEY,
`truck_licence_number` VARCHAR(20),
`truck_details` VARCHAR(255)
);



CREATE TABLE `Employees` (
`employee_id` INTEGER PRIMARY KEY,
`employee_address_id` INTEGER NOT NULL,
`employee_name` VARCHAR(80),
`employee_phone` VARCHAR(80),
FOREIGN KEY (`employee_address_id` ) REFERENCES `Addresses`(`address_id` )
);



CREATE TABLE `Order_Deliveries` (
`location_code` VARCHAR(10) NOT NULL,
`actual_order_id` INTEGER NOT NULL,
`delivery_status_code` VARCHAR(10) NOT NULL,
`driver_employee_id` INTEGER NOT NULL,
`truck_id` INTEGER NOT NULL,
`delivery_date` DATETIME,
FOREIGN KEY (`truck_id` ) REFERENCES `Trucks`(`truck_id` ),
FOREIGN KEY (`actual_order_id` ) REFERENCES `Actual_Orders`(`actual_order_id` ),
FOREIGN KEY (`location_code` ) REFERENCES `Delivery_Route_Locations`(`location_code` ),
FOREIGN KEY (`driver_employee_id` ) REFERENCES `Employees`(`employee_id` )
);

