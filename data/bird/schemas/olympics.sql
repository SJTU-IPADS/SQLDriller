CREATE TABLE city
(
    id        INT NOT NULL PRIMARY KEY,
    city_name TEXT DEFAULT NULL
);
CREATE TABLE games
(
    id         INT NOT NULL PRIMARY KEY,
    games_year INT  DEFAULT NULL,
    games_name TEXT DEFAULT NULL,
    season     TEXT DEFAULT NULL
);
CREATE TABLE games_city
(
    games_id INT DEFAULT NULL,
    city_id  INT DEFAULT NULL,
    FOREIGN KEY (city_id) REFERENCES city (id),
    FOREIGN KEY (games_id) REFERENCES games (id)
);
CREATE TABLE medal
(
    id         INT NOT NULL PRIMARY KEY,
    medal_name TEXT DEFAULT NULL
);
CREATE TABLE noc_region
(
    id          INT NOT NULL PRIMARY KEY,
    noc         TEXT DEFAULT NULL,
    region_name TEXT DEFAULT NULL
);
CREATE TABLE person
(
    id        INT NOT NULL PRIMARY KEY,
    full_name TEXT DEFAULT NULL,
    gender    TEXT DEFAULT NULL,
    height    INT  DEFAULT NULL,
    weight    INT  DEFAULT NULL
);
CREATE TABLE games_competitor
(
    id        INT NOT NULL PRIMARY KEY,
    games_id  INT DEFAULT NULL,
    person_id INT DEFAULT NULL,
    age       INT DEFAULT NULL,
    FOREIGN KEY (games_id) REFERENCES games (id),
    FOREIGN KEY (person_id) REFERENCES person (id)
);
CREATE TABLE person_region
(
    person_id INT DEFAULT NULL,
    region_id INT DEFAULT NULL,
    FOREIGN KEY (person_id) REFERENCES person (id),
    FOREIGN KEY (region_id) REFERENCES noc_region (id)
);
CREATE TABLE sport
(
    id         INT NOT NULL PRIMARY KEY,
    sport_name TEXT DEFAULT NULL
);
CREATE TABLE event
(
    id         INT NOT NULL PRIMARY KEY,
    sport_id   INT  DEFAULT NULL,
    event_name TEXT DEFAULT NULL,
    FOREIGN KEY (sport_id) REFERENCES sport (id)
);
CREATE TABLE competitor_event
(
    event_id      INT DEFAULT NULL,
    competitor_id INT DEFAULT NULL,
    medal_id      INT DEFAULT NULL,
    FOREIGN KEY (competitor_id) REFERENCES games_competitor (id),
    FOREIGN KEY (event_id) REFERENCES event (id),
    FOREIGN KEY (medal_id) REFERENCES medal (id)
);
