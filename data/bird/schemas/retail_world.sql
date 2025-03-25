CREATE TABLE Categories
(
    CategoryID   INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName TEXT,
    Description  TEXT
);
CREATE TABLE Customers
(
    CustomerID   INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName TEXT,
    ContactName  TEXT,
    Address      TEXT,
    City         TEXT,
    PostalCode   TEXT,
    Country      TEXT
);
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    LastName   TEXT,
    FirstName  TEXT,
    BirthDate  DATE,
    Photo      TEXT,
    Notes      TEXT
);
CREATE TABLE Shippers
(
    ShipperID   INT PRIMARY KEY AUTO_INCREMENT,
    ShipperName TEXT,
    Phone       TEXT
);
CREATE TABLE Suppliers
(
    SupplierID   INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName TEXT,
    ContactName  TEXT,
    Address      TEXT,
    City         TEXT,
    PostalCode   TEXT,
    Country      TEXT,
    Phone        TEXT
);
CREATE TABLE Products
(
    ProductID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductName TEXT,
    SupplierID  INT,
    CategoryID  INT,
    Unit        TEXT,
    Price       FLOAT DEFAULT 0,
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);
CREATE TABLE Orders
(
    OrderID    INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate  DATETIME,
    ShipperID  INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);
CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID       INT,
    ProductID     INT,
    Quantity      INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
