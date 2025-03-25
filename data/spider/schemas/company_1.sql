-- we don't know how to generate root <with-no-name> (class Root) :(
create table department
(
    Dname          TEXT,
    Dnumber        INTEGER
        primary key,
    Mgr_ssn        INTEGER,
    Mgr_start_date TEXT
);

create table dependent
(
    Essn           INTEGER,
    Dependent_name TEXT,
    Sex            TEXT,
    Bdate          TEXT,
    Relationship   TEXT,
    primary key (Essn, Dependent_name)
);

create table dept_locations
(
    Dnumber   INTEGER,
    Dlocation TEXT,
    primary key (Dnumber, Dlocation)
);

create table employee
(
    Fname     TEXT,
    Minit     TEXT,
    Lname     TEXT,
    Ssn       INTEGER
        primary key,
    Bdate     TEXT,
    Address   TEXT,
    Sex       TEXT,
    Salary    INTEGER,
    Super_ssn INTEGER,
    Dno       INTEGER
);

create table project
(
    Pname     Text,
    Pnumber   INTEGER
        primary key,
    Plocation TEXT,
    Dnum      INTEGER
);

create table works_on
(
    Essn  INTEGER,
    Pno   INTEGER,
    Hours REAL,
    primary key (Essn, Pno)
);

