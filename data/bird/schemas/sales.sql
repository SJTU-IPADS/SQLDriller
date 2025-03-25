CREATE TABLE Customers
(
    CustomerID    INT  NOT NULL PRIMARY KEY,
    FirstName     TEXT NOT NULL,
    MiddleInitial TEXT NULL,
    LastName      TEXT NOT NULL
);
CREATE TABLE Employees
(
    EmployeeID    INT  NOT NULL PRIMARY KEY,
    FirstName     TEXT NOT NULL,
    MiddleInitial TEXT NULL,
    LastName      TEXT NOT NULL
);
CREATE TABLE Products
(
    ProductID INT   NOT NULL PRIMARY KEY,
    Name      TEXT  NOT NULL,
    Price     FLOAT NULL
);
CREATE TABLE Sales
(
    SalesID       INT NOT NULL PRIMARY KEY,
    SalesPersonID INT NOT NULL,
    CustomerID    INT NOT NULL,
    ProductID     INT NOT NULL,
    Quantity      INT NOT NULL,
    FOREIGN KEY (SalesPersonID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
