CREATE TABLE location
(
    locationID   INT PRIMARY KEY,
    locationcity TEXT,
    address      TEXT,
    state        TEXT,
    zipcode      INT,
    officephone  TEXT
);
CREATE TABLE position
(
    positionID        INT PRIMARY KEY,
    positiontitle     TEXT,
    educationrequired TEXT,
    minsalary         TEXT,
    maxsalary         TEXT
);
CREATE TABLE employee
(
    ssn         TEXT PRIMARY KEY,
    lastname    TEXT,
    firstname   TEXT,
    hiredate    TEXT,
    salary      TEXT,
    gender      TEXT,
    performance TEXT,
    positionID  INT,
    locationID  INT,
    FOREIGN KEY (locationID) REFERENCES location (locationID),
    FOREIGN KEY (positionID) REFERENCES position (positionID)
);
