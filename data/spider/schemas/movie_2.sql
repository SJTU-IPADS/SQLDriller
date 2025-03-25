CREATE TABLE Movies
(
    Code   INTEGER PRIMARY KEY,
    Title  VARCHAR(255) NOT NULL,
    Rating VARCHAR(255)
);
CREATE TABLE MovieTheaters
(
    Code  INTEGER PRIMARY KEY,
    Name  VARCHAR(255) NOT NULL,
    Movie INTEGER,
    FOREIGN KEY (Movie) REFERENCES Movies (Code)
);
