CREATE TABLE Episode
(
    episode_id       TEXT PRIMARY KEY,
    series           TEXT,
    season           INT,
    episode          INT,
    number_in_series INT,
    title            TEXT,
    summary          TEXT,
    air_date         DATE,
    episode_image    TEXT,
    rating           FLOAT,
    votes            INT
);
CREATE TABLE Keyword
(
    episode_id TEXT,
    keyword    TEXT,
    PRIMARY KEY (episode_id, keyword),
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id)
);
CREATE TABLE Person
(
    person_id     TEXT PRIMARY KEY,
    name          TEXT,
    birthdate     DATE,
    birth_name    TEXT,
    birth_place   TEXT,
    birth_region  TEXT,
    birth_country TEXT,
    height_meters FLOAT,
    nickname      TEXT
);
CREATE TABLE Award
(
    award_id       INT PRIMARY KEY,
    organization   TEXT,
    year           INT,
    award_category TEXT,
    award          TEXT,
    series         TEXT,
    episode_id     TEXT,
    person_id      TEXT,
    role           TEXT,
    result         TEXT,
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id),
    FOREIGN KEY (person_id) REFERENCES Person (person_id)
);
CREATE TABLE Credit
(
    episode_id TEXT,
    person_id  TEXT,
    category   TEXT,
    role       TEXT,
    credited   TEXT,
    PRIMARY KEY (episode_id, person_id),
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id),
    FOREIGN KEY (person_id) REFERENCES Person (person_id)
);
CREATE TABLE Vote
(
    episode_id TEXT,
    stars      INT,
    votes      INT,
    percent    FLOAT,
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id)
);
