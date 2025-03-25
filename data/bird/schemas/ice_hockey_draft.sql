CREATE TABLE height_info
(
    height_id      INT PRIMARY KEY,
    height_in_cm   INT,
    height_in_inch TEXT
);
CREATE TABLE weight_info
(
    weight_id     INT PRIMARY KEY,
    weight_in_kg  INT,
    weight_in_lbs INT
);
CREATE TABLE PlayerInfo
(
    ELITEID           INT PRIMARY KEY,
    PlayerName        TEXT,
    birthdate         TEXT,
    birthyear         DATE,
    birthmonth        INT,
    birthday          INT,
    birthplace        TEXT,
    nation            TEXT,
    height            INT,
    weight            INT,
    position_info     TEXT,
    shoots            TEXT,
    draftyear         INT,
    draftround        INT,
    overall           INT,
    overallby         TEXT,
    CSS_rank          INT,
    sum_7yr_GP        INT,
    sum_7yr_TOI       INT,
    GP_greater_than_0 TEXT,
    FOREIGN KEY (height) REFERENCES height_info (height_id),
    FOREIGN KEY (weight) REFERENCES weight_info (weight_id)
);
CREATE TABLE SeasonStatus
(
    ELITEID   INT,
    SEASON    TEXT,
    TEAM      TEXT,
    LEAGUE    TEXT,
    GAMETYPE  TEXT,
    GP        INT,
    G         INT,
    A         INT,
    P         INT,
    PIM       INT,
    PLUSMINUS INT,
    FOREIGN KEY (ELITEID) REFERENCES PlayerInfo (ELITEID)
);
