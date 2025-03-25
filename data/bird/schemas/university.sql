CREATE TABLE country
(
    id           INT NOT NULL PRIMARY KEY,
    country_name TEXT DEFAULT NULL
);
CREATE TABLE ranking_system
(
    id          INT NOT NULL PRIMARY KEY,
    system_name TEXT DEFAULT NULL
);
CREATE TABLE ranking_criteria
(
    id                INT NOT NULL PRIMARY KEY,
    ranking_system_id INT  DEFAULT NULL,
    criteria_name     TEXT DEFAULT NULL,
    FOREIGN KEY (ranking_system_id) REFERENCES ranking_system (id)
);
CREATE TABLE university
(
    id              INT NOT NULL PRIMARY KEY,
    country_id      INT  DEFAULT NULL,
    university_name TEXT DEFAULT NULL,
    FOREIGN KEY (country_id) REFERENCES country (id)
);
CREATE TABLE university_ranking_year
(
    university_id       INT DEFAULT NULL,
    ranking_criteria_id INT DEFAULT NULL,
    year                INT DEFAULT NULL,
    score               INT DEFAULT NULL,
    FOREIGN KEY (ranking_criteria_id) REFERENCES ranking_criteria (id),
    FOREIGN KEY (university_id) REFERENCES university (id)
);
CREATE TABLE university_year
(
    university_id              INT   DEFAULT NULL,
    year                       INT   DEFAULT NULL,
    num_students               INT   DEFAULT NULL,
    student_staff_ratio        FLOAT DEFAULT NULL,
    pct_international_students INT   DEFAULT NULL,
    pct_female_students        INT   DEFAULT NULL,
    FOREIGN KEY (university_id) REFERENCES university (id)
);
