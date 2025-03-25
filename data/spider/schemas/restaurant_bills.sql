CREATE TABLE `customer`
(
    `Customer_ID`         int,
    `Name`                text,
    `Nationality`         text,
    `Card_Credit`         real,
    `Level_of_Membership` int,
    PRIMARY KEY (`Customer_ID`)
);
CREATE TABLE `branch`
(
    `Branch_ID`          int,
    `Manager`            text,
    `Years_opened`       int,
    `Location_of_office` text,
    PRIMARY KEY (`Branch_ID`)
);
CREATE TABLE `customer_order`
(
    `Customer_ID` int,
    `Branch_ID`   int,
    `Dish_Name`   text,
    `Quantity`    int,
    PRIMARY KEY (`Customer_ID`, `Branch_ID`, `Dish_Name`),
    FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
    FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`)
);
