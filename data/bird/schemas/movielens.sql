CREATE TABLE users
(
    userid     INT DEFAULT 0 NOT NULL PRIMARY KEY,
    age        TEXT          NOT NULL,
    u_gender   TEXT          NOT NULL,
    occupation TEXT          NOT NULL
);
CREATE TABLE `directors`
(
    directorid  INT NOT NULL PRIMARY KEY,
    d_quality   INT NOT NULL,
    avg_revenue INT NOT NULL
);
CREATE TABLE `actors`
(
    actorid   INT  NOT NULL PRIMARY KEY,
    a_gender  TEXT NOT NULL,
    a_quality INT  NOT NULL
);
CREATE TABLE `movies`
(
    movieid     INT DEFAULT 0 NOT NULL PRIMARY KEY,
    year        INT           NOT NULL,
    isEnglish   TEXT          NOT NULL,
    country     TEXT          NOT NULL,
    runningtime INT           NOT NULL
);
CREATE TABLE `movies2actors`
(
    movieid  INT NOT NULL REFERENCES movies,
    actorid  INT NOT NULL REFERENCES actors,
    cast_num INT NOT NULL,
    PRIMARY KEY (movieid, actorid)
);
CREATE TABLE `movies2directors`
(
    movieid    INT  NOT NULL REFERENCES movies,
    directorid INT  NOT NULL REFERENCES directors,
    genre      TEXT NOT NULL,
    PRIMARY KEY (movieid, directorid)
);
CREATE TABLE `u2base`
(
    userid  INT DEFAULT 0 NOT NULL REFERENCES users,
    movieid INT           NOT NULL REFERENCES movies,
    rating  TEXT          NOT NULL,
    PRIMARY KEY (userid, movieid)
);
