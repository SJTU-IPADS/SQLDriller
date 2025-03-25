CREATE TABLE Students
(
    `student_id`      INTEGER      NOT NULL,
    `bio_data`        VARCHAR(255) NOT NULL,
    `student_details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`student_id`)
);
CREATE TABLE Transcripts
(
    `transcript_id`      INTEGER      NOT NULL,
    `student_id`         INTEGER      NOT NULL,
    `date_of_transcript` DATETIME(3),
    `transcript_details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`transcript_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);
CREATE TABLE Behaviour_Monitoring
(
    `behaviour_monitoring_id`      INTEGER      NOT NULL,
    `student_id`                   INTEGER      NOT NULL,
    `behaviour_monitoring_details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`behaviour_monitoring_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);
CREATE TABLE Addresses
(
    `address_id`      INTEGER      NOT NULL,
    `address_details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`address_id`)
);
CREATE TABLE Ref_Event_Types
(
    `event_type_code`        CHAR(10)     NOT NULL,
    `event_type_description` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`event_type_code`)
);
CREATE TABLE Ref_Achievement_Type
(
    `achievement_type_code`        CHAR(15) NOT NULL,
    `achievement_type_description` VARCHAR(80),
    PRIMARY KEY (`achievement_type_code`)
);
CREATE TABLE Ref_Address_Types
(
    `address_type_code`        CHAR(10)     NOT NULL,
    `address_type_description` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`address_type_code`)
);
CREATE TABLE Ref_Detention_Type
(
    `detention_type_code`        CHAR(10) NOT NULL,
    `detention_type_description` VARCHAR(80),
    PRIMARY KEY (`detention_type_code`)
);
CREATE TABLE Student_Events
(
    `event_id`        INTEGER      NOT NULL,
    `event_type_code` CHAR(10)     NOT NULL,
    `student_id`      INTEGER      NOT NULL,
    `event_date`      DATETIME(3),
    `other_details`   VARCHAR(255) NOT NULL,
    PRIMARY KEY (`event_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (event_type_code) REFERENCES Ref_Event_Types (event_type_code)
);
CREATE TABLE Teachers
(
    `teacher_id`      INTEGER NOT NULL,
    `teacher_details` VARCHAR(255),
    PRIMARY KEY (`teacher_id`)
);
CREATE TABLE Student_Loans
(
    `student_loan_id` INTEGER NOT NULL,
    `student_id`      INTEGER NOT NULL,
    `date_of_loan`    DATETIME(3),
    `amount_of_loan`  DECIMAL(15, 4),
    `other_details`   VARCHAR(255),
    PRIMARY KEY (`student_loan_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);
CREATE TABLE Classes
(
    `class_id`      INTEGER      NOT NULL,
    `student_id`    INTEGER      NOT NULL,
    `teacher_id`    INTEGER      NOT NULL,
    `class_details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`class_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers (teacher_id)
);
CREATE TABLE Students_Addresses
(
    `student_address_id` INTEGER  NOT NULL,
    `address_id`         INTEGER  NOT NULL,
    `address_type_code`  CHAR(10) NOT NULL,
    `student_id`         INTEGER  NOT NULL,
    `date_from`          DATETIME(3),
    `date_to`            DATETIME(3),
    PRIMARY KEY (`student_address_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (address_id) REFERENCES Addresses (address_id),
    FOREIGN KEY (address_type_code) REFERENCES Ref_Address_Types (address_type_code)
);
CREATE TABLE Detention
(
    `detention_id`             INTEGER  NOT NULL,
    `detention_type_code`      CHAR(10) NOT NULL,
    `student_id`               INTEGER  NOT NULL,
    `datetime_detention_start` DATETIME(3),
    `datetime_detention_end`   DATETIME(3),
    `detention_summary`        VARCHAR(255),
    `other_details`            VARCHAR(255),
    PRIMARY KEY (`detention_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (detention_type_code) REFERENCES Ref_Detention_Type (detention_type_code)
);
CREATE TABLE Achievements
(
    `achievement_id`        INTEGER  NOT NULL,
    `achievement_type_code` CHAR(15) NOT NULL,
    `student_id`            INTEGER  NOT NULL,
    `date_achievement`      DATETIME(3),
    `achievement_details`   VARCHAR(255),
    `other_details`         VARCHAR(255),
    PRIMARY KEY (`achievement_id`),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (achievement_type_code) REFERENCES Ref_Achievement_Type (achievement_type_code)
);
