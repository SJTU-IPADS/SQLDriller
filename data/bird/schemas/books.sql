CREATE TABLE address_status
(
    status_id      INT PRIMARY KEY,
    address_status TEXT
);
CREATE TABLE author
(
    author_id   INT PRIMARY KEY,
    author_name TEXT
);
CREATE TABLE book_language
(
    language_id   INT PRIMARY KEY,
    language_code TEXT,
    language_name TEXT
);
CREATE TABLE country
(
    country_id   INT PRIMARY KEY,
    country_name TEXT
);
CREATE TABLE address
(
    address_id    INT PRIMARY KEY,
    street_number TEXT,
    street_name   TEXT,
    city          TEXT,
    country_id    INT,
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);
CREATE TABLE customer
(
    customer_id INT PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT,
    email       TEXT
);
CREATE TABLE customer_address
(
    customer_id INT,
    address_id  INT,
    status_id   INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);
CREATE TABLE order_status
(
    status_id    INT PRIMARY KEY,
    status_value TEXT
);
CREATE TABLE publisher
(
    publisher_id   INT PRIMARY KEY,
    publisher_name TEXT
);
CREATE TABLE book
(
    book_id          INT PRIMARY KEY,
    title            TEXT,
    isbn13           TEXT,
    language_id      INT,
    num_pages        INT,
    publication_date DATE,
    publisher_id     INT,
    FOREIGN KEY (language_id) REFERENCES book_language (language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);
CREATE TABLE book_author
(
    book_id   INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id)
);
CREATE TABLE shipping_method
(
    method_id   INT PRIMARY KEY,
    method_name TEXT,
    cost        FLOAT
);
CREATE TABLE `cust_order`
(
    order_id           INT PRIMARY KEY AUTO_INCREMENT,
    order_date         DATETIME,
    customer_id        INT REFERENCES customer (customer_id),
    shipping_method_id INT REFERENCES shipping_method (method_id),
    dest_address_id    INT REFERENCES address (address_id)
);
CREATE TABLE `order_history`
(
    history_id  INT PRIMARY KEY AUTO_INCREMENT,
    order_id    INT REFERENCES cust_order (order_id),
    status_id   INT REFERENCES order_status (status_id),
    status_date DATETIME
);
CREATE TABLE `order_line`
(
    line_id  INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT REFERENCES cust_order (order_id),
    book_id  INT REFERENCES book (book_id),
    price    FLOAT
);
