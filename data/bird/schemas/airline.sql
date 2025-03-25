CREATE TABLE `Air Carriers`
(
    Code        INT PRIMARY KEY,
    Description TEXT
);
CREATE TABLE Airports
(
    Code        TEXT PRIMARY KEY,
    Description TEXT
);
CREATE TABLE Airlines
(
    FL_DATE               TEXT,
    OP_CARRIER_AIRLINE_ID INT,
    TAIL_NUM              TEXT,
    OP_CARRIER_FL_NUM     INT,
    ORIGIN_AIRPORT_ID     INT,
    ORIGIN_AIRPORT_SEQ_ID INT,
    ORIGIN_CITY_MARKET_ID INT,
    ORIGIN                TEXT,
    DEST_AIRPORT_ID       INT,
    DEST_AIRPORT_SEQ_ID   INT,
    DEST_CITY_MARKET_ID   INT,
    DEST                  TEXT,
    CRS_DEP_TIME          INT,
    DEP_TIME              INT,
    DEP_DELAY             INT,
    DEP_DELAY_NEW         INT,
    ARR_TIME              INT,
    ARR_DELAY             INT,
    ARR_DELAY_NEW         INT,
    CANCELLED             INT,
    CANCELLATION_CODE     TEXT,
    CRS_ELAPSED_TIME      INT,
    ACTUAL_ELAPSED_TIME   INT,
    CARRIER_DELAY         INT,
    WEATHER_DELAY         INT,
    NAS_DELAY             INT,
    SECURITY_DELAY        INT,
    LATE_AIRCRAFT_DELAY   INT,
    FOREIGN KEY (ORIGIN) REFERENCES Airports (Code),
    FOREIGN KEY (DEST) REFERENCES Airports (Code),
    FOREIGN KEY (OP_CARRIER_AIRLINE_ID) REFERENCES `Air Carriers` (Code)
);
