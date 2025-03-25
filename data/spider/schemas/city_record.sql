CREATE TABLE `city`
(
    `City_ID`             int,
    `City`                text,
    `Hanzi`               text,
    `Hanyu_Pinyin`        text,
    `Regional_Population` int,
    `GDP`                 real,
    PRIMARY KEY (`City_ID`)
);

CREATE TABLE `match`
(
    `Match_ID`    int,
    `Date`        text,
    `Venue`       text,
    `Score`       text,
    `Result`      text,
    `Competition` text,
    PRIMARY KEY (`Match_ID`)
);



CREATE TABLE `temperature`
(
    `City_ID` int,
    `Jan`     real,
    `Feb`     real,
    `Mar`     real,
    `Apr`     real,
    `Jun`     real,
    `Jul`     real,
    `Aug`     real,
    `Sep`     real,
    `Oct`     real,
    `Nov`     real,
    `Dec`     real,
    PRIMARY KEY (`City_ID`),
    FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
);



CREATE TABLE `hosting_city`
(
    `Year`      int,
    `Match_ID`  int,
    `Host_City` text,
    PRIMARY KEY (`Year`),
    FOREIGN KEY (`Host_City`) REFERENCES `city` (`City_ID`),
    FOREIGN KEY (`Match_ID`) REFERENCES `match` (`Match_ID`)
);

