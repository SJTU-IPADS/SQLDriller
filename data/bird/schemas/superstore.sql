CREATE TABLE people
(
    `Customer ID`   TEXT,
    `Customer Name` TEXT,
    Segment         TEXT,
    Country         TEXT,
    City            TEXT,
    State           TEXT,
    `Postal Code`   INT,
    Region          TEXT,
    PRIMARY KEY (`Customer ID`, Region)
);
CREATE TABLE product
(
    `Product ID`   TEXT,
    `Product Name` TEXT,
    Category       TEXT,
    `Sub-Category` TEXT,
    Region         TEXT,
    PRIMARY KEY (`Product ID`, Region)
);
CREATE TABLE central_superstore
(
    `Row ID`      INT PRIMARY KEY,
    `Order ID`    TEXT,
    `Order Date`  DATE,
    `Ship Date`   DATE,
    `Ship Mode`   TEXT,
    `Customer ID` TEXT,
    Region        TEXT,
    `Product ID`  TEXT,
    Sales         FLOAT,
    Quantity      INT,
    Discount      FLOAT,
    Profit        FLOAT,
    FOREIGN KEY (`Customer ID`, Region) REFERENCES people (`Customer ID`, Region),
    FOREIGN KEY (`Product ID`, Region) REFERENCES product (`Product ID`, Region)
);
CREATE TABLE east_superstore
(
    `Row ID`      INT PRIMARY KEY,
    `Order ID`    TEXT,
    `Order Date`  DATE,
    `Ship Date`   DATE,
    `Ship Mode`   TEXT,
    `Customer ID` TEXT,
    Region        TEXT,
    `Product ID`  TEXT,
    Sales         FLOAT,
    Quantity      INT,
    Discount      FLOAT,
    Profit        FLOAT,
    FOREIGN KEY (`Customer ID`, Region) REFERENCES people (`Customer ID`, Region),
    FOREIGN KEY (`Product ID`, Region) REFERENCES product (`Product ID`, Region)
);
CREATE TABLE south_superstore
(
    `Row ID`      INT PRIMARY KEY,
    `Order ID`    TEXT,
    `Order Date`  DATE,
    `Ship Date`   DATE,
    `Ship Mode`   TEXT,
    `Customer ID` TEXT,
    Region        TEXT,
    `Product ID`  TEXT,
    Sales         FLOAT,
    Quantity      INT,
    Discount      FLOAT,
    Profit        FLOAT,
    FOREIGN KEY (`Customer ID`, Region) REFERENCES people (`Customer ID`, Region),
    FOREIGN KEY (`Product ID`, Region) REFERENCES product (`Product ID`, Region)
);
CREATE TABLE west_superstore
(
    `Row ID`      INT PRIMARY KEY,
    `Order ID`    TEXT,
    `Order Date`  DATE,
    `Ship Date`   DATE,
    `Ship Mode`   TEXT,
    `Customer ID` TEXT,
    Region        TEXT,
    `Product ID`  TEXT,
    Sales         FLOAT,
    Quantity      INT,
    Discount      FLOAT,
    Profit        FLOAT,
    FOREIGN KEY (`Customer ID`, Region) REFERENCES people (`Customer ID`, Region),
    FOREIGN KEY (`Product ID`, Region) REFERENCES product (`Product ID`, Region)
);
