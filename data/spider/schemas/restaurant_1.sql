create table Student
(
    StuID     INTEGER PRIMARY KEY,
    LName     VARCHAR(12),
    Fname     VARCHAR(12),
    Age       INTEGER,
    Sex       VARCHAR(1),
    Major     INTEGER,
    Advisor   INTEGER,
    city_code VARCHAR(3)
);

create table Restaurant
(
    ResID   INTEGER PRIMARY KEY,
    ResName VARCHAR(100),
    Address VARCHAR(100),
    Rating  INTEGER
);

create table Type_Of_Restaurant
(
    ResID     INTEGER,
    ResTypeID INTEGER,
    FOREIGN KEY (ResID) REFERENCES Restaurant (ResID),
    FOREIGN KEY (ResTypeID) REFERENCES Restaurant_Type (ResTypeID)
);

create table Restaurant_Type
(
    ResTypeID          INTEGER PRIMARY KEY,
    ResTypeName        VARCHAR(40),
    ResTypeDescription VARCHAR(100)
);

create table Visits_Restaurant
(
    StuID INTEGER,
    ResID INTEGER,
    Time  TIMESTAMP,
    Spent FLOAT,
    FOREIGN KEY (StuID) REFERENCES Student (StuID),
    FOREIGN KEY (ResID) REFERENCES Restaurant (ResID)
);






