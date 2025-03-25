CREATE TABLE event
(
    event_id   TEXT PRIMARY KEY,
    event_name TEXT,
    event_date TEXT,
    type       TEXT,
    notes      TEXT,
    location   TEXT,
    status     TEXT
);
CREATE TABLE major
(
    major_id   TEXT PRIMARY KEY,
    major_name TEXT,
    department TEXT,
    college    TEXT
);
CREATE TABLE zip_code
(
    zip_code    INT PRIMARY KEY,
    type        TEXT,
    city        TEXT,
    county      TEXT,
    state       TEXT,
    short_state TEXT
);
CREATE TABLE `attendance`
(
    link_to_event  TEXT,
    link_to_member TEXT,
    PRIMARY KEY (link_to_event, link_to_member),
    FOREIGN KEY (link_to_event) REFERENCES event (event_id),
    FOREIGN KEY (link_to_member) REFERENCES member (member_id)
);
CREATE TABLE `budget`
(
    budget_id     TEXT PRIMARY KEY,
    category      TEXT,
    spent         FLOAT,
    remaining     FLOAT,
    amount        INT,
    event_status  TEXT,
    link_to_event TEXT,
    FOREIGN KEY (link_to_event) REFERENCES event (event_id)
);
CREATE TABLE `expense`
(
    expense_id          TEXT PRIMARY KEY,
    expense_description TEXT,
    expense_date        TEXT,
    cost                FLOAT,
    approved            TEXT,
    link_to_member      TEXT,
    link_to_budget      TEXT,
    FOREIGN KEY (link_to_budget) REFERENCES budget (budget_id),
    FOREIGN KEY (link_to_member) REFERENCES member (member_id)
);
CREATE TABLE `income`
(
    income_id      TEXT PRIMARY KEY,
    date_received  TEXT,
    amount         INT,
    source         TEXT,
    notes          TEXT,
    link_to_member TEXT,
    FOREIGN KEY (link_to_member) REFERENCES member (member_id)
);
CREATE TABLE `member`
(
    member_id     TEXT PRIMARY KEY,
    first_name    TEXT,
    last_name     TEXT,
    email         TEXT,
    position      TEXT,
    t_shirt_size  TEXT,
    phone         TEXT,
    zip           INT,
    link_to_major TEXT,
    FOREIGN KEY (link_to_major) REFERENCES major (major_id),
    FOREIGN KEY (zip) REFERENCES zip_code (zip_code)
);
