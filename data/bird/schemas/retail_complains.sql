CREATE TABLE state
(
    StateCode TEXT PRIMARY KEY,
    State     TEXT,
    Region    TEXT
);
CREATE TABLE callcenterlogs
(
    `Date received` DATE,
    `Complaint ID`  TEXT,
    `rand client`   TEXT,
    phonefinal      TEXT,
    `vru+line`      TEXT,
    call_id         INT,
    priority        INT,
    type            TEXT,
    outcome         TEXT,
    server          TEXT,
    ser_start       TEXT,
    ser_exit        TEXT,
    ser_time        TEXT,
    PRIMARY KEY (`Complaint ID`),
    FOREIGN KEY (`rand client`) REFERENCES client (client_id)
);
CREATE TABLE client
(
    client_id   TEXT PRIMARY KEY,
    sex         TEXT,
    day         INT,
    month       INT,
    year        INT,
    age         INT,
    social      TEXT,
    first       TEXT,
    middle      TEXT,
    last        TEXT,
    phone       TEXT,
    email       TEXT,
    address_1   TEXT,
    address_2   TEXT,
    city        TEXT,
    state       TEXT,
    zipcode     INT,
    district_id INT,
    FOREIGN KEY (district_id) REFERENCES district (district_id)
);
CREATE TABLE district
(
    district_id  INT PRIMARY KEY,
    city         TEXT,
    state_abbrev TEXT,
    division     TEXT,
    FOREIGN KEY (state_abbrev) REFERENCES state (StateCode)
);
CREATE TABLE events
(
    `Date received`                DATE,
    Product                        TEXT,
    `Sub-product`                  TEXT,
    Issue                          TEXT,
    `Sub-issue`                    TEXT,
    `Consumer complaint narrative` TEXT,
    Tags                           TEXT,
    `Consumer consent provided?`   TEXT,
    `Submitted via`                TEXT,
    `Date sent to company`         TEXT,
    `Company response to consumer` TEXT,
    `Timely response?`             TEXT,
    `Consumer disputed?`           TEXT,
    `Complaint ID`                 TEXT,
    Client_ID                      TEXT,
    PRIMARY KEY (`Complaint ID`, Client_ID),
    FOREIGN KEY (`Complaint ID`) REFERENCES callcenterlogs (`Complaint ID`),
    FOREIGN KEY (Client_ID) REFERENCES client (client_id)
);
CREATE TABLE reviews
(
    `Date`      DATE PRIMARY KEY,
    Stars       INT,
    Reviews     TEXT,
    Product     TEXT,
    district_id INT,
    FOREIGN KEY (district_id) REFERENCES district (district_id)
);
