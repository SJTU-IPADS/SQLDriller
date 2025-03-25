CREATE TABLE Student
(
    StuID     INTEGER PRIMARY KEY,
    LName     VARCHAR(12),
    Fname     VARCHAR(12),
    Age       INTEGER,
    Sex       VARCHAR(1),
    Major     INTEGER,
    Advisor   INTEGER,
    city_code VARCHAR(3),
    FOREIGN KEY (city_code) REFERENCES City (city_code)
);
CREATE TABLE Direct_distance
(
    city1_code varchar(3),
    city2_code varchar(3),
    distance   INTEGER,
    FOREIGN KEY (city1_code) REFERENCES City (city_code),
    FOREIGN KEY (city2_code) REFERENCES City (city_code),
    PRIMARY KEY (city1_code, city2_code)
);
CREATE TABLE City
(
    city_code VARCHAR(3) PRIMARY KEY,
    city_name VARCHAR(25),
    state     VARCHAR(2),
    country   VARCHAR(25),
    latitude  FLOAT,
    longitude FLOAT
);
