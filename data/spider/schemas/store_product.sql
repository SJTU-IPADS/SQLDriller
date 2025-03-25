CREATE TABLE `product`
(
    `product_id`             int,
    `product`                text,
    `dimensions`             text,
    `dpi`                    real,
    `pages_per_minute_color` real,
    `max_page_size`          text,
    `interface`              text,
    PRIMARY KEY (`product_id`)
);

CREATE TABLE `store`
(
    `Store_ID`                   int,
    `Store_Name`                 text,
    `Type`                       text,
    `Area_size`                  real,
    `Number_of_product_category` real,
    `Ranking`                    int,
    PRIMARY KEY (`Store_ID`)
);

CREATE TABLE `district`
(
    `District_ID`        int,
    `District_name`      text,
    `Headquartered_City` text,
    `City_Population`    real,
    `City_Area`          real,
    PRIMARY KEY (`District_ID`)
);



CREATE TABLE `store_product`
(
    `Store_ID`   int,
    `Product_ID` int,
    PRIMARY KEY (`Store_ID`, `Product_ID`),
    FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`),
    FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
);



CREATE TABLE `store_district`
(
    `Store_ID`    int,
    `District_ID` int,
    PRIMARY KEY (`Store_ID`),
    FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`),
    FOREIGN KEY (`District_ID`) REFERENCES `district` (`District_ID`)
);

