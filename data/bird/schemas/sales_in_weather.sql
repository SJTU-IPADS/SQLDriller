CREATE TABLE sales_in_weather
(
    date      DATE,
    store_nbr INT,
    item_nbr  INT,
    units     INT,
    PRIMARY KEY (store_nbr, date, item_nbr)
);
CREATE TABLE weather
(
    station_nbr INT,
    date        DATE,
    tmax        INT,
    tmin        INT,
    tavg        INT,
    depart      INT,
    dewpoint    INT,
    wetbulb     INT,
    heat        INT,
    cool        INT,
    sunrise     TEXT,
    sunset      TEXT,
    codesum     TEXT,
    snowfall    FLOAT,
    preciptotal FLOAT,
    stnpressure FLOAT,
    sealevel    FLOAT,
    resultspeed FLOAT,
    resultdir   INT,
    avgspeed    FLOAT,
    PRIMARY KEY (station_nbr, date)
);
CREATE TABLE relation
(
    store_nbr   INT PRIMARY KEY,
    station_nbr INT,
    FOREIGN KEY (store_nbr) REFERENCES sales_in_weather (store_nbr),
    FOREIGN KEY (station_nbr) REFERENCES weather (station_nbr)
);
