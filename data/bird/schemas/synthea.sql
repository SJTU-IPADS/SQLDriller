CREATE TABLE all_prevalences
(
    ITEM                    TEXT PRIMARY KEY,
    `POPULATION TYPE`       TEXT,
    OCCURRENCES             INT,
    `POPULATION COUNT`      INT,
    `PREVALENCE RATE`       FLOAT,
    `PREVALENCE PERCENTAGE` FLOAT
);
CREATE TABLE patients
(
    patient    TEXT PRIMARY KEY,
    birthdate  DATE,
    deathdate  DATE,
    ssn        TEXT,
    drivers    TEXT,
    passport   TEXT,
    prefix     TEXT,
    first      TEXT,
    last       TEXT,
    suffix     TEXT,
    maiden     TEXT,
    marital    TEXT,
    race       TEXT,
    ethnicity  TEXT,
    gender     TEXT,
    birthplace TEXT,
    address    TEXT
);
CREATE TABLE encounters
(
    ID                TEXT PRIMARY KEY,
    DATE              DATE,
    PATIENT           TEXT,
    CODE              INT,
    DESCRIPTION       TEXT,
    REASONCODE        INT,
    REASONDESCRIPTION TEXT,
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE allergies
(
    START       TEXT,
    STOP        TEXT,
    PATIENT     TEXT,
    ENCOUNTER   TEXT,
    CODE        INT,
    DESCRIPTION TEXT,
    PRIMARY KEY (PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE careplans
(
    ID                TEXT,
    START             DATE,
    STOP              DATE,
    PATIENT           TEXT,
    ENCOUNTER         TEXT,
    CODE              FLOAT,
    DESCRIPTION       TEXT,
    REASONCODE        INT,
    REASONDESCRIPTION TEXT,
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE conditions
(
    START       DATE,
    STOP        DATE,
    PATIENT     TEXT,
    ENCOUNTER   TEXT,
    CODE        INT,
    DESCRIPTION TEXT,
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient),
    FOREIGN KEY (DESCRIPTION) REFERENCES all_prevalences (ITEM)
);
CREATE TABLE immunizations
(
    DATE        DATE,
    PATIENT     TEXT,
    ENCOUNTER   TEXT,
    CODE        INT,
    DESCRIPTION TEXT,
    PRIMARY KEY (DATE, PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE medications
(
    START             DATE,
    STOP              DATE,
    PATIENT           TEXT,
    ENCOUNTER         TEXT,
    CODE              INT,
    DESCRIPTION       TEXT,
    REASONCODE        INT,
    REASONDESCRIPTION TEXT,
    PRIMARY KEY (START, PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE observations
(
    DATE        DATE,
    PATIENT     TEXT,
    ENCOUNTER   TEXT,
    CODE        TEXT,
    DESCRIPTION TEXT,
    VALUE       FLOAT,
    UNITS       TEXT,
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE procedures
(
    DATE              DATE,
    PATIENT           TEXT,
    ENCOUNTER         TEXT,
    CODE              INT,
    DESCRIPTION       TEXT,
    REASONCODE        INT,
    REASONDESCRIPTION TEXT,
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters (ID),
    FOREIGN KEY (PATIENT) REFERENCES patients (patient)
);
CREATE TABLE `claims`
(
    ID             TEXT PRIMARY KEY,
    PATIENT        TEXT REFERENCES patients (patient),
    BILLABLEPERIOD DATE,
    ORGANIZATION   TEXT,
    ENCOUNTER      TEXT REFERENCES encounters (ID),
    DIAGNOSIS      TEXT,
    TOTAL          INT
);
