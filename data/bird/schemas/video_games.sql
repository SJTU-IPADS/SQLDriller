CREATE TABLE genre
(
    id         INT NOT NULL PRIMARY KEY,
    genre_name TEXT DEFAULT NULL
);
CREATE TABLE game
(
    id        INT NOT NULL PRIMARY KEY,
    genre_id  INT  DEFAULT NULL,
    game_name TEXT DEFAULT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre (id)
);
CREATE TABLE platform
(
    id            INT NOT NULL PRIMARY KEY,
    platform_name TEXT DEFAULT NULL
);
CREATE TABLE publisher
(
    id             INT NOT NULL PRIMARY KEY,
    publisher_name TEXT DEFAULT NULL
);
CREATE TABLE game_publisher
(
    id           INT NOT NULL PRIMARY KEY,
    game_id      INT DEFAULT NULL,
    publisher_id INT DEFAULT NULL,
    FOREIGN KEY (game_id) REFERENCES game (id),
    FOREIGN KEY (publisher_id) REFERENCES publisher (id)
);
CREATE TABLE game_platform
(
    id                INT NOT NULL PRIMARY KEY,
    game_publisher_id INT DEFAULT NULL,
    platform_id       INT DEFAULT NULL,
    release_year      INT DEFAULT NULL,
    FOREIGN KEY (game_publisher_id) REFERENCES game_publisher (id),
    FOREIGN KEY (platform_id) REFERENCES platform (id)
);
CREATE TABLE region
(
    id          INT NOT NULL PRIMARY KEY,
    region_name TEXT DEFAULT NULL
);
CREATE TABLE region_sales
(
    region_id        INT   DEFAULT NULL,
    game_platform_id INT   DEFAULT NULL,
    num_sales        FLOAT DEFAULT NULL,
    FOREIGN KEY (game_platform_id) REFERENCES game_platform (id),
    FOREIGN KEY (region_id) REFERENCES region (id)
);
