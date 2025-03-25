CREATE TABLE Staff
(
    staff_id      INTEGER      NOT NULL,
    staff_details VARCHAR(255) NOT NULL,
    PRIMARY KEY (staff_id)
);
CREATE TABLE Ref_Staff_Roles
(
    staff_role_code        CHAR(15)     NOT NULL,
    staff_role_description VARCHAR(255) NOT NULL,
    PRIMARY KEY (staff_role_code)
);
CREATE TABLE Process_Outcomes
(
    process_outcome_code        CHAR(15)     NOT NULL,
    process_outcome_description VARCHAR(255) NOT NULL,
    PRIMARY KEY (process_outcome_code)
);
CREATE TABLE Process_Status
(
    process_status_code        CHAR(15)     NOT NULL,
    process_status_description VARCHAR(255) NOT NULL,
    PRIMARY KEY (process_status_code)
);
CREATE TABLE Authors
(
    author_name   VARCHAR(255) NOT NULL,
    other_details VARCHAR(255) NOT NULL,
    PRIMARY KEY (author_name)
);
CREATE TABLE Documents
(
    document_id          INTEGER      NOT NULL,
    author_name          VARCHAR(255) NOT NULL,
    document_name        VARCHAR(255) NOT NULL,
    document_description VARCHAR(255) NOT NULL,
    other_details        VARCHAR(255),
    PRIMARY KEY (document_id),
    FOREIGN KEY (author_name) REFERENCES Authors (author_name)
);
CREATE TABLE Business_Processes
(
    process_id          INTEGER      NOT NULL,
    next_process_id     INTEGER,
    process_name        VARCHAR(255) NOT NULL,
    process_description VARCHAR(255) NOT NULL,
    other_details       VARCHAR(255),
    PRIMARY KEY (process_id),
    foreign key (next_process_id) references Business_Processes (process_id)
);
CREATE TABLE Documents_Processes
(
    document_id          INTEGER  NOT NULL,
    process_id           INTEGER  NOT NULL,
    process_outcome_code CHAR(15) NOT NULL,
    process_status_code  CHAR(15) NOT NULL,
    PRIMARY KEY (document_id, process_id),
    FOREIGN KEY (document_id) REFERENCES Documents (document_id),
    FOREIGN KEY (process_id) REFERENCES Business_Processes (process_id),
    FOREIGN KEY (process_outcome_code) REFERENCES Process_Outcomes (process_outcome_code),
    FOREIGN KEY (process_status_code) REFERENCES Process_Status (process_status_code)
);
CREATE TABLE Staff_in_Processes
(
    document_id     INTEGER  NOT NULL,
    process_id      INTEGER  NOT NULL,
    staff_id        INTEGER  NOT NULL,
    staff_role_code CHAR(15) NOT NULL,
    date_from       DATETIME,
    date_to         DATETIME,
    other_details   VARCHAR(255),
    PRIMARY KEY (document_id, process_id, staff_id),
    FOREIGN KEY (staff_id) REFERENCES Staff (staff_id),
    FOREIGN KEY (document_id, process_id) REFERENCES Documents_Processes (document_id, process_id),
    FOREIGN KEY (staff_role_code) REFERENCES Ref_Staff_Roles (staff_role_code)
);
