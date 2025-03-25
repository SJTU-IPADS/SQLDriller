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


create table Dorm
(
    dormid           INTEGER,
    dorm_name        VARCHAR(20),
    student_capacity INTEGER,
    gender           VARCHAR(1)
);

create table Dorm_amenity
(
    amenid       INTEGER,
    amenity_name VARCHAR(25)
);

create table Has_amenity
(
    dormid INTEGER,
    amenid INTEGER,
    FOREIGN KEY (dormid) REFERENCES `Dorm` (dormid),
    FOREIGN KEY (amenid) REFERENCES `Dorm_amenity` (amenid)
);

create table Lives_in
(
    stuid       INTEGER,
    dormid      INTEGER,
    room_number INTEGER,
    FOREIGN KEY (stuid) REFERENCES `Student` (StuID),
    FOREIGN KEY (dormid) REFERENCES `Dorm` (dormid)
);









