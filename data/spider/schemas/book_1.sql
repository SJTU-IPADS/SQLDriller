CREATE TABLE Client
(
    IdClient CHAR(10) PRIMARY KEY,
    Name     VARCHAR(25) NOT NULL,
    Address  VARCHAR(60) NOT NULL,
    NumCC    CHAR(16)    NOT NULL
);
CREATE TABLE Orders
(
    IdOrder   CHAR(10) PRIMARY KEY,
    IdClient  CHAR(10) NOT NULL REFERENCES Client(IdClient),
    DateOrder DATE,
    DateExped DATE
);
CREATE TABLE Author
(
    idAuthor int PRIMARY KEY,
    Name     VARCHAR(25)
);
CREATE TABLE Book
(
    ISBN          CHAR(15) PRIMARY KEY,
    Title         VARCHAR(60) NOT NULL,
    Author        CHAR(4)     NOT NULL,
    PurchasePrice DECIMAL(6, 2) DEFAULT 0,
    SalePrice     DECIMAL(6, 2) DEFAULT 0
);
CREATE TABLE Author_Book
(
    ISBN   CHAR(15),
    Author int,
    PRIMARY KEY (ISBN, Author),
    FOREIGN KEY (ISBN) REFERENCES `Book` (ISBN),
    FOREIGN KEY (Author) REFERENCES `Author` (idAuthor)
);
CREATE TABLE Books_Order
(
    ISBN    CHAR(15),
    IdOrder CHAR(10),
    amount  DECIMAL(3),
    PRIMARY KEY (ISBN, idOrder),
    FOREIGN KEY (ISBN) REFERENCES `Book` (ISBN),
    FOREIGN KEY (IdOrder) REFERENCES `Orders` (IdOrder)
    -- CHECK (amount > 0)
);
