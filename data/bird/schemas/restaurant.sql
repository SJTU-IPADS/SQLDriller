CREATE TABLE geographic
(
    city   TEXT NOT NULL PRIMARY KEY,
    county TEXT NULL,
    region TEXT NULL
);
CREATE TABLE generalinfo
(
    id_restaurant INT   NOT NULL PRIMARY KEY,
    label         TEXT  NULL,
    food_type     TEXT  NULL,
    city          TEXT  NULL,
    review        FLOAT NULL,
    FOREIGN KEY (city) REFERENCES geographic (city)
);
CREATE TABLE location
(
    id_restaurant INT  NOT NULL PRIMARY KEY,
    street_num    INT  NULL,
    street_name   TEXT NULL,
    city          TEXT NULL,
    FOREIGN KEY (city) REFERENCES geographic (city),
    FOREIGN KEY (id_restaurant) REFERENCES generalinfo (id_restaurant)
);
