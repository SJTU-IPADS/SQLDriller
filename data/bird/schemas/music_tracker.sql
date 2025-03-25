CREATE TABLE `torrents`
(
    groupName     TEXT,
    totalSnatched INT,
    artist        TEXT,
    groupYear     INT,
    releaseType   TEXT,
    groupId       INT,
    id            INT PRIMARY KEY
);
CREATE TABLE `tags`
(
    `index` INT PRIMARY KEY,
    id      INT REFERENCES torrents,
    tag     TEXT
);
