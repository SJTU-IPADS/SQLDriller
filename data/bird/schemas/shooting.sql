CREATE TABLE incidents
(
    case_number      TEXT NOT NULL PRIMARY KEY,
    date             DATE NOT NULL,
    location         TEXT NOT NULL,
    subject_statuses TEXT NOT NULL,
    subject_weapon   TEXT NOT NULL,
    subjects         TEXT NOT NULL,
    subject_count    INT  NOT NULL,
    officers         TEXT NOT NULL
);
CREATE TABLE officers
(
    case_number TEXT NOT NULL,
    race        TEXT NULL,
    gender      TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    first_name  TEXT NULL,
    full_name   TEXT NOT NULL,
    FOREIGN KEY (case_number) REFERENCES incidents (case_number)
);
CREATE TABLE subjects
(
    case_number TEXT NOT NULL,
    race        TEXT NOT NULL,
    gender      TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    first_name  TEXT NULL,
    full_name   TEXT NOT NULL,
    FOREIGN KEY (case_number) REFERENCES incidents (case_number)
);
