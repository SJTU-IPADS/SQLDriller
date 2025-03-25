CREATE TABLE `customers`
(
    `Id`        INTEGER PRIMARY KEY,
    `LastName`  TEXT,
    `FirstName` TEXT
);
CREATE TABLE `goods`
(
    `Id`     TEXT PRIMARY KEY,
    `Flavor` TEXT,
    `Food`   TEXT,
    `Price`  REAL
);
CREATE TABLE `items`
(
    `Receipt` INTEGER,
    `Ordinal` INTEGER,
    `Item`    TEXT,
    PRIMARY KEY (Receipt, Ordinal),
    FOREIGN KEY (Item) REFERENCES goods (Id),
    FOREIGN KEY (Receipt) REFERENCES receipts (ReceiptNumber)
);
CREATE TABLE `receipts`
(
    `ReceiptNumber` INTEGER PRIMARY KEY,
    `Date`          TEXT,
    `CustomerId`    INTEGER,
    FOREIGN KEY (CustomerId) REFERENCES customers (Id)
);
