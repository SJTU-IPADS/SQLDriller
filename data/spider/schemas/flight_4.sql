CREATE TABLE airlines
(
    alid     integer PRIMARY KEY,
    name     text,
    iata     varchar(2),
    icao     varchar(3),
    callsign text,
    country  text,
    active   varchar(2)

);


CREATE TABLE airports
(
    apid      integer PRIMARY KEY,
    name      text NOT NULL,
    city      text,
    country   text,
    x         double precision,
    y         double precision,
    elevation bigint,
    iata      varchar(3),
    icao      varchar(4)

);

CREATE TABLE routes
(
    rid       integer PRIMARY KEY,
    dst_apid  integer,
    dst_ap    varchar(4),
    src_apid  bigint,
    src_ap    varchar(4),
    alid      bigint,
    airline   varchar(4),
    codeshare text,
    FOREIGN KEY (dst_apid) REFERENCES airports (apid),
    FOREIGN KEY (src_apid) REFERENCES airports (apid),
    FOREIGN KEY (alid) REFERENCES airlines (alid)
);