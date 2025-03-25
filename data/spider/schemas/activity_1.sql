create table Activity
(
    actid         INTEGER PRIMARY KEY,
    activity_name varchar(25)
);

create table Participates_in
(
    stuid INTEGER,
    actid INTEGER,
    FOREIGN KEY (stuid) REFERENCES Student (StuID),
    FOREIGN KEY (actid) REFERENCES Activity (actid)
);

create table Faculty_Participates_in
(
    FacID INTEGER,
    actid INTEGER,
    FOREIGN KEY (FacID) REFERENCES Faculty (FacID),
    FOREIGN KEY (actid) REFERENCES Activity (actid)
);

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

create table Faculty
(
    FacID    INTEGER PRIMARY KEY,
    Lname    VARCHAR(15),
    Fname    VARCHAR(15),
    Rank     VARCHAR(15),
    Sex      VARCHAR(1),
    Phone    INTEGER,
    Room     VARCHAR(5),
    Building VARCHAR(13)
);






































































