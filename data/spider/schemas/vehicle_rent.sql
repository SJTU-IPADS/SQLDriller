CREATE TABLE `Customers`
(
    `id`                int,
    `name`              text,
    `age`               int,
    `membership_credit` int,
    PRIMARY KEY (`id`)
);
CREATE TABLE `Discount`
(
    `id`                int,
    `name`              text,
    `membership_credit` int,
    PRIMARY KEY (`id`)
);
CREATE TABLE `Vehicles`
(
    `id`                         int,
    `name`                       text,
    `Model_year`                 int,
    `Type_of_powertrain`         text,
    `Combined_fuel_economy_rate` int,
    `City_fuel_economy_rate`     int,
    `Highway_fuel_economy_rate`  int,
    `Cost_per_25_miles`          real,
    `Annual_fuel_cost`           real,
    `Notes`                      text,
    PRIMARY KEY (`id`)
);
CREATE TABLE `Renting_history`
(
    `id`          int,
    `customer_id` int,
    `discount_id` int,
    `vehicles_id` int,
    `total_hours` int,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`),
    FOREIGN KEY (`vehicles_id`) REFERENCES `Vehicles` (`id`),
    FOREIGN KEY (`discount_id`) REFERENCES `Discount` (`id`)
);
