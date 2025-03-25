CREATE TABLE Employee
(
    EmployeeID INTEGER PRIMARY KEY,
    Name       VARCHAR(255) NOT NULL,
    Position   VARCHAR(255) NOT NULL,
    Salary     REAL         NOT NULL,
    Remarks    VARCHAR(255)
);
CREATE TABLE Planet
(
    PlanetID    INTEGER PRIMARY KEY,
    Name        VARCHAR(255) NOT NULL,
    Coordinates REAL         NOT NULL
);
CREATE TABLE Shipment
(
    ShipmentID INTEGER PRIMARY KEY,
    Date       DATE,
    Manager    INTEGER NOT NULL,
    Planet     INTEGER NOT NULL,
    FOREIGN KEY (Manager) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (Planet) REFERENCES Planet (PlanetID)
);
CREATE TABLE Has_Clearance
(
    Employee INTEGER NOT NULL,
    Planet   INTEGER NOT NULL,
    Level    INTEGER NOT NULL,
    PRIMARY KEY (Employee, Planet),
    FOREIGN KEY (Employee) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (Planet) REFERENCES Planet (PlanetID)
);
CREATE TABLE Client
(
    AccountNumber INTEGER PRIMARY KEY,
    Name          VARCHAR(255) NOT NULL
);
CREATE TABLE Package
(
    Shipment      INTEGER      NOT NULL,
    PackageNumber INTEGER      NOT NULL,
    Contents      VARCHAR(255) NOT NULL,
    Weight        REAL         NOT NULL,
    Sender        INTEGER      NOT NULL,
    Recipient     INTEGER      NOT NULL,
    PRIMARY KEY (Shipment, PackageNumber),
    FOREIGN KEY (Shipment) REFERENCES Shipment (ShipmentID),
    FOREIGN KEY (Sender) REFERENCES Client (AccountNumber),
    FOREIGN KEY (Recipient) REFERENCES Client (AccountNumber)
);
