create table Authors
(
    authID INTEGER
        primary key,
    lname  TEXT,
    fname  TEXT
);

create table Inst
(
    instID  INTEGER
        primary key,
    name    TEXT,
    country TEXT
);

create table Papers
(
    paperID INTEGER
        primary key,
    title   TEXT
);

create table Authorship
(
    authID    INTEGER
        references Authors (authID),
    instID    INTEGER
        references Inst (instID),
    paperID   INTEGER
        references Papers (paperID),
    authOrder INTEGER,
    primary key (authID, instID, paperID)
);

