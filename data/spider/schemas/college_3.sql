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

create table Department
(
    DNO      INTEGER PRIMARY KEY,
    Division VARCHAR(2),
    DName    VARCHAR(25),
    Room     VARCHAR(5),
    Building VARCHAR(13),
    DPhone   INTEGER
);

create table Member_of
(
    FacID     INTEGER,
    DNO       INTEGER,
    Appt_Type VARCHAR(15),
    FOREIGN KEY (FacID) REFERENCES Faculty (FacID),
    FOREIGN KEY (DNO) REFERENCES Department (DNO)
);

create table Course
(
    CID        VARCHAR(7) PRIMARY KEY,
    CName      VARCHAR(40),
    Credits    INTEGER,
    Instructor INTEGER,
    Days       VARCHAR(5),
    Hours      VARCHAR(11),
    DNO        INTEGER,
    FOREIGN KEY (Instructor) REFERENCES Faculty (FacID),
    FOREIGN KEY (DNO) REFERENCES Department (DNO)
);

create table Minor_in
(
    StuID INTEGER,
    DNO   INTEGER,
    FOREIGN KEY (StuID) REFERENCES Student (StuID),
    FOREIGN KEY (DNO) REFERENCES Department (DNO)
);

create table Enrolled_in
(
    StuID INTEGER,
    CID   VARCHAR(7),
    Grade VARCHAR(2),
    FOREIGN KEY (StuID) REFERENCES Student (StuID),
    FOREIGN KEY (CID) REFERENCES Course (CID),
    FOREIGN KEY (Grade) REFERENCES Gradeconversion (lettergrade)
);

create table Gradeconversion
(
    lettergrade VARCHAR(2) PRIMARY KEY,
    gradepoint  FLOAT
);














