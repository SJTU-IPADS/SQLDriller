create table flight
(
    flno           numeric(4, 0) primary key,
    origin         varchar(20),
    destination    varchar(20),
    distance       numeric(6, 0),
    departure_date date,
    arrival_date   date,
    price          numeric(7, 2),
    aid            numeric(9, 0),
    foreign key (`aid`) references `aircraft` (`aid`)
);

create table aircraft
(
    aid      numeric(9, 0) primary key,
    name     varchar(30),
    distance numeric(6, 0)
);

create table employee
(
    eid    numeric(9, 0) primary key,
    name   varchar(30),
    salary numeric(10, 2)
);

create table certificate
(
    eid numeric(9, 0),
    aid numeric(9, 0),
    primary key (eid, aid),
    foreign key (`eid`) references `employee` (`eid`),
    foreign key (`aid`) references `aircraft` (`aid`)
);
















