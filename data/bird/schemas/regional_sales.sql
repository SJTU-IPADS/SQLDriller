CREATE TABLE Customers
(
    CustomerID       INT PRIMARY KEY,
    `Customer Names` TEXT
);
CREATE TABLE Products
(
    ProductID      INT PRIMARY KEY,
    `Product Name` TEXT
);
CREATE TABLE Regions
(
    StateCode TEXT PRIMARY KEY,
    State     TEXT,
    Region    TEXT
);
CREATE TABLE `Sales Team`
(
    SalesTeamID  INT PRIMARY KEY,
    `Sales Team` TEXT,
    Region       TEXT
);
CREATE TABLE `Store Locations`
(
    StoreID            INT PRIMARY KEY,
    `City Name`        TEXT,
    County             TEXT,
    StateCode          TEXT REFERENCES Regions (StateCode),
    State              TEXT,
    Type               TEXT,
    Latitude           FLOAT,
    Longitude          FLOAT,
    AreaCode           INT,
    Population         INT,
    `Household Income` INT,
    `Median Income`    INT,
    `Land Area`        INT,
    `Water Area`       INT,
    `Time Zone`        TEXT
);
CREATE TABLE `Sales Orders`
(
    OrderNumber        TEXT PRIMARY KEY,
    `Sales Channel`    TEXT,
    WarehouseCode      TEXT,
    ProcuredDate       TEXT,
    OrderDate          TEXT,
    ShipDate           TEXT,
    DeliveryDate       TEXT,
    CurrencyCode       TEXT,
    _SalesTeamID       INT REFERENCES `Sales Team` (SalesTeamID),
    _CustomerID        INT REFERENCES Customers (CustomerID),
    _StoreID           INT REFERENCES `Store Locations` (StoreID),
    _ProductID         INT REFERENCES Products (ProductID),
    `Order Quantity`   INT,
    `Discount Applied` FLOAT,
    `Unit Price`       TEXT,
    `Unit Cost`        TEXT
);
