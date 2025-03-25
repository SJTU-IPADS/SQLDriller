CREATE TABLE city
(
    city_id    INT PRIMARY KEY,
    city_name  TEXT,
    state      TEXT,
    population INT,
    area       FLOAT
);
CREATE TABLE customer
(
    cust_id        INT PRIMARY KEY,
    cust_name      TEXT,
    annual_revenue INT,
    cust_type      TEXT,
    address        TEXT,
    city           TEXT,
    state          TEXT,
    zip            FLOAT,
    phone          TEXT
);
CREATE TABLE driver
(
    driver_id  INT PRIMARY KEY,
    first_name TEXT,
    last_name  TEXT,
    address    TEXT,
    city       TEXT,
    state      TEXT,
    zip_code   INT,
    phone      TEXT
);
CREATE TABLE truck
(
    truck_id   INT PRIMARY KEY,
    make       TEXT,
    model_year INT
);
CREATE TABLE shipment
(
    ship_id   INT PRIMARY KEY,
    cust_id   INT,
    weight    FLOAT,
    truck_id  INT,
    driver_id INT,
    city_id   INT,
    ship_date TEXT,
    FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id),
    FOREIGN KEY (driver_id) REFERENCES driver (driver_id),
    FOREIGN KEY (truck_id) REFERENCES truck (truck_id)
);
