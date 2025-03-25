CREATE TABLE alignment
(
    id        INT NOT NULL PRIMARY KEY,
    alignment TEXT DEFAULT NULL
);
CREATE TABLE attribute
(
    id             INT NOT NULL PRIMARY KEY,
    attribute_name TEXT DEFAULT NULL
);
CREATE TABLE colour
(
    id     INT NOT NULL PRIMARY KEY,
    colour TEXT DEFAULT NULL
);
CREATE TABLE gender
(
    id     INT NOT NULL PRIMARY KEY,
    gender TEXT DEFAULT NULL
);
CREATE TABLE publisher
(
    id             INT NOT NULL PRIMARY KEY,
    publisher_name TEXT DEFAULT NULL
);
CREATE TABLE race
(
    id   INT NOT NULL PRIMARY KEY,
    race TEXT DEFAULT NULL
);
CREATE TABLE superhero
(
    id             INT NOT NULL PRIMARY KEY,
    superhero_name TEXT DEFAULT NULL,
    full_name      TEXT DEFAULT NULL,
    gender_id      INT  DEFAULT NULL,
    eye_colour_id  INT  DEFAULT NULL,
    hair_colour_id INT  DEFAULT NULL,
    skin_colour_id INT  DEFAULT NULL,
    race_id        INT  DEFAULT NULL,
    publisher_id   INT  DEFAULT NULL,
    alignment_id   INT  DEFAULT NULL,
    height_cm      INT  DEFAULT NULL,
    weight_kg      INT  DEFAULT NULL,
    FOREIGN KEY (alignment_id) REFERENCES alignment (id),
    FOREIGN KEY (eye_colour_id) REFERENCES colour (id),
    FOREIGN KEY (gender_id) REFERENCES gender (id),
    FOREIGN KEY (hair_colour_id) REFERENCES colour (id),
    FOREIGN KEY (publisher_id) REFERENCES publisher (id),
    FOREIGN KEY (race_id) REFERENCES race (id),
    FOREIGN KEY (skin_colour_id) REFERENCES colour (id)
);
CREATE TABLE hero_attribute
(
    hero_id         INT DEFAULT NULL,
    attribute_id    INT DEFAULT NULL,
    attribute_value INT DEFAULT NULL,
    FOREIGN KEY (attribute_id) REFERENCES attribute (id),
    FOREIGN KEY (hero_id) REFERENCES superhero (id)
);
CREATE TABLE superpower
(
    id         INT NOT NULL PRIMARY KEY,
    power_name TEXT DEFAULT NULL
);
CREATE TABLE hero_power
(
    hero_id  INT DEFAULT NULL,
    power_id INT DEFAULT NULL,
    FOREIGN KEY (hero_id) REFERENCES superhero (id),
    FOREIGN KEY (power_id) REFERENCES superpower (id)
);
