CREATE TABLE Demog
(
    GEOID         INT PRIMARY KEY,
    INHABITANTS_K FLOAT,
    INCOME_K      FLOAT,
    A_VAR1        FLOAT,
    A_VAR2        FLOAT,
    A_VAR3        FLOAT,
    A_VAR4        FLOAT,
    A_VAR5        FLOAT,
    A_VAR6        FLOAT,
    A_VAR7        FLOAT,
    A_VAR8        FLOAT,
    A_VAR9        FLOAT,
    A_VAR10       FLOAT,
    A_VAR11       FLOAT,
    A_VAR12       FLOAT,
    A_VAR13       FLOAT,
    A_VAR14       FLOAT,
    A_VAR15       FLOAT,
    A_VAR16       FLOAT,
    A_VAR17       FLOAT,
    A_VAR18       FLOAT
);
CREATE TABLE mailings3
(
    REFID    INT PRIMARY KEY,
    REF_DATE DATETIME,
    RESPONSE TEXT
);
CREATE TABLE `Customers`
(
    ID             INT PRIMARY KEY,
    SEX            TEXT,
    MARITAL_STATUS TEXT,
    GEOID          INT REFERENCES Demog (GEOID),
    EDUCATIONNUM   INT,
    OCCUPATION     TEXT,
    age            INT
);
CREATE TABLE `Mailings1_2`
(
    REFID    INT PRIMARY KEY REFERENCES Customers (ID),
    REF_DATE DATETIME,
    RESPONSE TEXT
);
CREATE TABLE `Sales`
(
    EVENTID    INT PRIMARY KEY,
    REFID      INT REFERENCES Customers (ID),
    EVENT_DATE DATETIME,
    AMOUNT     FLOAT
);
