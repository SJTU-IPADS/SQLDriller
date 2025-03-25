CREATE TABLE customers
(
    CustomerID            INT PRIMARY KEY,
    First                 TEXT,
    Last                  TEXT,
    StreetAddress         TEXT,
    City                  TEXT,
    State                 TEXT,
    ZipCode               INT,
    Email                 TEXT,
    PhoneNumber           TEXT,
    FirstPurchaseDate     DATE,
    SubscribedToEmailList TEXT,
    Gender                TEXT
);
CREATE TABLE geolocation
(
    LocationID INT PRIMARY KEY,
    Latitude   FLOAT,
    Longitude  FLOAT,
    FOREIGN KEY (LocationID) REFERENCES location (LocationID)
);
CREATE TABLE location
(
    LocationID    INT PRIMARY KEY,
    LocationName  TEXT,
    StreetAddress TEXT,
    City          TEXT,
    State         TEXT,
    ZipCode       INT
);
CREATE TABLE rootbeerbrand
(
    BrandID             INT PRIMARY KEY,
    BrandName           TEXT,
    FirstBrewedYear     INT,
    BreweryName         TEXT,
    City                TEXT,
    State               TEXT,
    Country             TEXT,
    Description         TEXT,
    CaneSugar           TEXT,
    CornSyrup           TEXT,
    Honey               TEXT,
    ArtificialSweetener TEXT,
    Caffeinated         TEXT,
    Alcoholic           TEXT,
    AvailableInCans     TEXT,
    AvailableInBottles  TEXT,
    AvailableInKegs     TEXT,
    Website             TEXT,
    FacebookPage        TEXT,
    Twitter             TEXT,
    WholesaleCost       FLOAT,
    CurrentRetailPrice  FLOAT
);
CREATE TABLE rootbeer
(
    RootBeerID    INT PRIMARY KEY,
    BrandID       INT,
    ContainerType TEXT,
    LocationID    INT,
    PurchaseDate  DATE,
    FOREIGN KEY (LocationID) REFERENCES geolocation (LocationID),
    FOREIGN KEY (LocationID) REFERENCES location (LocationID),
    FOREIGN KEY (BrandID) REFERENCES rootbeerbrand (BrandID)
);
CREATE TABLE rootbeerreview
(
    CustomerID INT,
    BrandID    INT,
    StarRating INT,
    ReviewDate DATE,
    Review     TEXT,
    PRIMARY KEY (CustomerID, BrandID),
    FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID),
    FOREIGN KEY (BrandID) REFERENCES rootbeerbrand (BrandID)
);
CREATE TABLE `transaction`
(
    TransactionID    INT PRIMARY KEY,
    CreditCardNumber INT,
    CustomerID       INT,
    TransactionDate  DATE,
    CreditCardType   TEXT,
    LocationID       INT,
    RootBeerID       INT,
    PurchasePrice    FLOAT,
    FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID),
    FOREIGN KEY (LocationID) REFERENCES location (LocationID),
    FOREIGN KEY (RootBeerID) REFERENCES rootbeer (RootBeerID)
);
