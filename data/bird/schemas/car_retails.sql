CREATE TABLE offices
(
    officeCode   TEXT NOT NULL PRIMARY KEY,
    city         TEXT NOT NULL,
    phone        TEXT NOT NULL,
    addressLine1 TEXT NOT NULL,
    addressLine2 TEXT,
    state        TEXT,
    country      TEXT NOT NULL,
    postalCode   TEXT NOT NULL,
    territory    TEXT NOT NULL
);
CREATE TABLE employees
(
    employeeNumber INT  NOT NULL PRIMARY KEY,
    lastName       TEXT NOT NULL,
    firstName      TEXT NOT NULL,
    extension      TEXT NOT NULL,
    email          TEXT NOT NULL,
    officeCode     TEXT NOT NULL,
    reportsTo      INT,
    jobTitle       TEXT NOT NULL,
    FOREIGN KEY (officeCode) REFERENCES offices (officeCode),
    FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber)
);
CREATE TABLE customers
(
    customerNumber         INT  NOT NULL PRIMARY KEY,
    customerName           TEXT NOT NULL,
    contactLastName        TEXT NOT NULL,
    contactFirstName       TEXT NOT NULL,
    phone                  TEXT NOT NULL,
    addressLine1           TEXT NOT NULL,
    addressLine2           TEXT,
    city                   TEXT NOT NULL,
    state                  TEXT,
    postalCode             TEXT,
    country                TEXT NOT NULL,
    salesRepEmployeeNumber INT,
    creditLimit            FLOAT,
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)
);
CREATE TABLE orders
(
    orderNumber    INT  NOT NULL PRIMARY KEY,
    orderDate      DATE NOT NULL,
    requiredDate   DATE NOT NULL,
    shippedDate    DATE,
    status         TEXT NOT NULL,
    comments       TEXT,
    customerNumber INT  NOT NULL,
    FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);
CREATE TABLE payments
(
    customerNumber INT   NOT NULL,
    checkNumber    TEXT  NOT NULL,
    paymentDate    DATE  NOT NULL,
    amount         FLOAT NOT NULL,
    PRIMARY KEY (customerNumber, checkNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);
CREATE TABLE productlines
(
    productLine     TEXT NOT NULL PRIMARY KEY,
    textDescription TEXT,
    htmlDescription TEXT,
    image           BLOB
);
CREATE TABLE products
(
    productCode        TEXT  NOT NULL PRIMARY KEY,
    productName        TEXT  NOT NULL,
    productLine        TEXT  NOT NULL,
    productScale       TEXT  NOT NULL,
    productVendor      TEXT  NOT NULL,
    productDescription TEXT  NOT NULL,
    quantityInStock    INT   NOT NULL,
    buyPrice           FLOAT NOT NULL,
    MSRP               FLOAT NOT NULL,
    FOREIGN KEY (productLine) REFERENCES productlines (productLine)
);
CREATE TABLE `orderdetails`
(
    orderNumber     INT   NOT NULL REFERENCES orders,
    productCode     TEXT  NOT NULL REFERENCES products,
    quantityOrdered INT   NOT NULL,
    priceEach       FLOAT NOT NULL,
    orderLineNumber INT   NOT NULL,
    PRIMARY KEY (orderNumber, productCode)
);
