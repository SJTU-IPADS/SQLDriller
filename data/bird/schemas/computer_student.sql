CREATE TABLE course
(
    course_id   INT PRIMARY KEY,
    courseLevel TEXT
);
CREATE TABLE person
(
    p_id           INT PRIMARY KEY,
    professor      INT,
    student        INT,
    hasPosition    TEXT,
    inPhase        TEXT,
    yearsInProgram TEXT
);
CREATE TABLE `advisedBy`
(
    p_id       INT,
    p_id_dummy INT,
    CONSTRAINT advisedBy_pk PRIMARY KEY (p_id, p_id_dummy),
    CONSTRAINT advisedBy_person_p_id_p_id_fk FOREIGN KEY (p_id, p_id_dummy) REFERENCES person (p_id, p_id)
);
CREATE TABLE taughtBy
(
    course_id INT,
    p_id      INT,
    PRIMARY KEY (course_id, p_id),
    FOREIGN KEY (p_id) REFERENCES person (p_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id)
);
