CREATE TABLE `Course_Authors_and_Tutors`
(
    `author_id`        INTEGER PRIMARY KEY,
    `author_tutor_ATB` VARCHAR(3),
    `login_name`       VARCHAR(40),
    `password`         VARCHAR(40),
    `personal_name`    VARCHAR(80),
    `middle_name`      VARCHAR(80),
    `family_name`      VARCHAR(80),
    `gender_mf`        VARCHAR(1),
    `address_line_1`   VARCHAR(80)
);

CREATE TABLE `Students`
(
    `student_id`           INTEGER PRIMARY KEY,
    `date_of_registration` DATETIME,
    `date_of_latest_logon` DATETIME,
    `login_name`           VARCHAR(40),
    `password`             VARCHAR(10),
    `personal_name`        VARCHAR(40),
    `middle_name`          VARCHAR(40),
    `family_name`          VARCHAR(40)
);

CREATE TABLE `Subjects`
(
    `subject_id`   INTEGER PRIMARY KEY,
    `subject_name` VARCHAR(120)
);


CREATE TABLE `Courses`
(
    `course_id`          INTEGER PRIMARY KEY,
    `author_id`          INTEGER NOT NULL,
    `subject_id`         INTEGER NOT NULL,
    `course_name`        VARCHAR(120),
    `course_description` VARCHAR(255),
    FOREIGN KEY (`author_id`) REFERENCES `Course_Authors_and_Tutors` (`author_id`),
    FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`subject_id`)
);


CREATE TABLE `Student_Course_Enrolment`
(
    `registration_id`    INTEGER PRIMARY KEY,
    `student_id`         INTEGER  NOT NULL,
    `course_id`          INTEGER  NOT NULL,
    `date_of_enrolment`  DATETIME NOT NULL,
    `date_of_completion` DATETIME NOT NULL,
    FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`),
    FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`)
);


CREATE TABLE `Student_Tests_Taken`
(
    `registration_id` INTEGER  NOT NULL,
    `date_test_taken` DATETIME NOT NULL,
    `test_result`     VARCHAR(255),
    FOREIGN KEY (`registration_id`) REFERENCES `Student_Course_Enrolment` (`registration_id`)
);

