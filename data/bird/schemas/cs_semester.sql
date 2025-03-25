CREATE TABLE `course`
(
    course_id INT PRIMARY KEY,
    name      TEXT,
    credit    INT,
    diff      INT
);
CREATE TABLE prof
(
    prof_id         INT PRIMARY KEY,
    gender          TEXT,
    first_name      TEXT,
    last_name       TEXT,
    email           TEXT,
    popularity      INT,
    teachingability INT,
    graduate_from   TEXT
);
CREATE TABLE RA
(
    student_id INT,
    capability INT,
    prof_id    INT,
    salary     TEXT,
    PRIMARY KEY (student_id, prof_id),
    FOREIGN KEY (prof_id) REFERENCES prof (prof_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
CREATE TABLE registration
(
    course_id  INT,
    student_id INT,
    grade      TEXT,
    sat        INT,
    PRIMARY KEY (course_id, student_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
CREATE TABLE student
(
    student_id   INT PRIMARY KEY,
    f_name       TEXT,
    l_name       TEXT,
    phone_number TEXT,
    email        TEXT,
    intelligence INT,
    gpa          FLOAT,
    type         TEXT
);
