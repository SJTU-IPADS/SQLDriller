CREATE TABLE `Episode`
(
    episode_id       TEXT PRIMARY KEY,
    season           INT,
    episode          INT,
    number_in_series INT,
    title            TEXT,
    summary          TEXT,
    air_date         TEXT,
    episode_image    TEXT,
    rating           FLOAT,
    votes            INT
);
CREATE TABLE Person
(
    name          TEXT PRIMARY KEY,
    birthdate     TEXT,
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
    person         TEXT,
    role           TEXT,
    episode_id     TEXT,
    season         TEXT,
    song           TEXT,
    result         TEXT,
    FOREIGN KEY (person) REFERENCES Person (name),
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id)
);
CREATE TABLE Character_Award
(
    award_id  INT,
    character TEXT,
    FOREIGN KEY (award_id) REFERENCES Award (award_id)
);
CREATE TABLE Credit
(
    episode_id TEXT,
    category   TEXT,
    person     TEXT,
    role       TEXT,
    credited   TEXT,
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id),
    FOREIGN KEY (person) REFERENCES Person (name)
);
CREATE TABLE Keyword
(
    episode_id TEXT,
    keyword    TEXT,
    PRIMARY KEY (episode_id, keyword),
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id)
);
CREATE TABLE Vote
(
    episode_id TEXT,
    stars      INT,
    votes      INT,
    percent    FLOAT,
    FOREIGN KEY (episode_id) REFERENCES Episode (episode_id)
);
