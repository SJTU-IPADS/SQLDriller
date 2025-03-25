CREATE TABLE country
(
    origin  INT PRIMARY KEY,
    country TEXT
);
CREATE TABLE price
(
    ID    INT PRIMARY KEY,
    price FLOAT
);
CREATE TABLE data
(
    ID           INT PRIMARY KEY,
    mpg          FLOAT,
    cylinders    INT,
    displacement FLOAT,
    horsepower   INT,
    weight       INT,
    acceleration FLOAT,
    model        INT,
    car_name     TEXT,
    FOREIGN KEY (ID) REFERENCES price (ID)
);
CREATE TABLE production
(
    ID         INT,
    model_year INT,
    country    INT,
    PRIMARY KEY (ID, model_year),
    FOREIGN KEY (country) REFERENCES country (origin),
    FOREIGN KEY (ID) REFERENCES data (ID),
    FOREIGN KEY (ID) REFERENCES price (ID)
);
