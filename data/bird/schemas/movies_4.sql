CREATE TABLE country
(
    country_id       INT NOT NULL PRIMARY KEY,
    country_iso_code TEXT DEFAULT NULL,
    country_name     TEXT DEFAULT NULL
);
CREATE TABLE department
(
    department_id   INT NOT NULL PRIMARY KEY,
    department_name TEXT DEFAULT NULL
);
CREATE TABLE gender
(
    gender_id INT NOT NULL PRIMARY KEY,
    gender    TEXT DEFAULT NULL
);
CREATE TABLE genre
(
    genre_id   INT NOT NULL PRIMARY KEY,
    genre_name TEXT DEFAULT NULL
);
CREATE TABLE keyword
(
    keyword_id   INT NOT NULL PRIMARY KEY,
    keyword_name TEXT DEFAULT NULL
);
CREATE TABLE language
(
    language_id   INT NOT NULL PRIMARY KEY,
    language_code TEXT DEFAULT NULL,
    language_name TEXT DEFAULT NULL
);
CREATE TABLE language_role
(
    role_id       INT NOT NULL PRIMARY KEY,
    language_role TEXT DEFAULT NULL
);
CREATE TABLE movie
(
    movie_id     INT NOT NULL PRIMARY KEY,
    title        TEXT  DEFAULT NULL,
    budget       INT   DEFAULT NULL,
    homepage     TEXT  DEFAULT NULL,
    overview     TEXT  DEFAULT NULL,
    popularity   FLOAT DEFAULT NULL,
    release_date DATE  DEFAULT NULL,
    revenue      INT   DEFAULT NULL,
    runtime      INT   DEFAULT NULL,
    movie_status TEXT  DEFAULT NULL,
    tagline      TEXT  DEFAULT NULL,
    vote_average FLOAT DEFAULT NULL,
    vote_count   INT   DEFAULT NULL
);
CREATE TABLE movie_genres
(
    movie_id INT DEFAULT NULL,
    genre_id INT DEFAULT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
);
CREATE TABLE movie_languages
(
    movie_id         INT DEFAULT NULL,
    language_id      INT DEFAULT NULL,
    language_role_id INT DEFAULT NULL,
    FOREIGN KEY (language_id) REFERENCES language (language_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (language_role_id) REFERENCES language_role (role_id)
);
CREATE TABLE person
(
    person_id   INT NOT NULL PRIMARY KEY,
    person_name TEXT DEFAULT NULL
);
CREATE TABLE movie_crew
(
    movie_id      INT  DEFAULT NULL,
    person_id     INT  DEFAULT NULL,
    department_id INT  DEFAULT NULL,
    job           TEXT DEFAULT NULL,
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);
CREATE TABLE production_company
(
    company_id   INT NOT NULL PRIMARY KEY,
    company_name TEXT DEFAULT NULL
);
CREATE TABLE production_country
(
    movie_id   INT DEFAULT NULL,
    country_id INT DEFAULT NULL,
    FOREIGN KEY (country_id) REFERENCES country (country_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
);
CREATE TABLE movie_cast
(
    movie_id       INT  DEFAULT NULL,
    person_id      INT  DEFAULT NULL,
    character_name TEXT DEFAULT NULL,
    gender_id      INT  DEFAULT NULL,
    cast_order     INT  DEFAULT NULL,
    FOREIGN KEY (gender_id) REFERENCES gender (gender_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);
CREATE TABLE `movie_keywords`
(
    movie_id   INT DEFAULT NULL REFERENCES movie,
    keyword_id INT DEFAULT NULL REFERENCES keyword
);
CREATE TABLE `movie_company`
(
    movie_id   INT DEFAULT NULL REFERENCES movie,
    company_id INT DEFAULT NULL REFERENCES production_company
);
