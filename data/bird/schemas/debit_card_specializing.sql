CREATE TABLE customers
(
    CustomerID INT UNIQUE NOT NULL PRIMARY KEY,
    Segment    TEXT       NULL,
    Currency   TEXT       NULL
);
CREATE TABLE gasstations
(
    GasStationID INT UNIQUE NOT NULL PRIMARY KEY,
    ChainID      INT        NULL,
    Country      TEXT       NULL,
    Segment      TEXT       NULL
);
CREATE TABLE products
(
    ProductID   INT UNIQUE NOT NULL PRIMARY KEY,
    Description TEXT       NULL
);
CREATE TABLE `transactions_1k`
(
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    Date          DATE,
    Time          TEXT,
    CustomerID    INT,
    CardID        INT,
    GasStationID  INT,
    ProductID     INT,
    Amount        INT,
    Price         FLOAT
);
CREATE TABLE `yearmonth`
(
    CustomerID  INT  NOT NULL REFERENCES customers (CustomerID),
    Date        TEXT NOT NULL,
    Consumption FLOAT,
    PRIMARY KEY (Date, CustomerID)
);
