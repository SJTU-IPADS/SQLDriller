CREATE TABLE employee
(
    employee_id INT PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT,
    address     TEXT,
    city        TEXT,
    state       TEXT,
    zip         INT,
    phone       TEXT,
    title       TEXT,
    salary      INT,
    supervisor  INT,
    FOREIGN KEY (supervisor) REFERENCES employee (employee_id)
);
CREATE TABLE establishment
(
    license_no    INT PRIMARY KEY,
    dba_name      TEXT,
    aka_name      TEXT,
    facility_type TEXT,
    risk_level    INT,
    address       TEXT,
    city          TEXT,
    state         TEXT,
    zip           INT,
    latitude      FLOAT,
    longitude     FLOAT,
    ward          INT
);
CREATE TABLE inspection
(
    inspection_id   INT PRIMARY KEY,
    inspection_date DATE,
    inspection_type TEXT,
    results         TEXT,
    employee_id     INT,
    license_no      INT,
    followup_to     INT,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    FOREIGN KEY (license_no) REFERENCES establishment (license_no),
    FOREIGN KEY (followup_to) REFERENCES inspection (inspection_id)
);
CREATE TABLE inspection_point
(
    point_id    INT PRIMARY KEY,
    Description TEXT,
    category    TEXT,
    code        TEXT,
    fine        INT,
    point_level TEXT
);
CREATE TABLE violation
(
    inspection_id     INT,
    point_id          INT,
    fine              INT,
    inspector_comment TEXT,
    PRIMARY KEY (inspection_id, point_id),
    FOREIGN KEY (inspection_id) REFERENCES inspection (inspection_id),
    FOREIGN KEY (point_id) REFERENCES inspection_point (point_id)
);
