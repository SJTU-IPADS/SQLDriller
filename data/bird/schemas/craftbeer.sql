CREATE TABLE breweries
(
    id    INT  NOT NULL PRIMARY KEY,
    name  TEXT NULL,
    city  TEXT NULL,
    state TEXT NULL
);
CREATE TABLE `beers`
(
    id         INT   NOT NULL PRIMARY KEY,
    brewery_id INT   NOT NULL REFERENCES breweries (id),
    abv        FLOAT,
    ibu        FLOAT,
    name       TEXT  NOT NULL,
    style      TEXT,
    ounces     FLOAT NOT NULL
);
