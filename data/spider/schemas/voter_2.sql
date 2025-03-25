create table Student
(
    StuID     INTEGER PRIMARY KEY,
    LName     VARCHAR(12),
    Fname     VARCHAR(12),
    Age       INTEGER,
    Sex       VARCHAR(1),
    Major     INTEGER,
    Advisor   INTEGER,
    city_code VARCHAR(3)
);

create table Voting_record
(
    StuID                INTEGER,
    Registration_Date    VARCHAR(12),
    Election_Cycle       VARCHAR(12),
    President_Vote       INTEGER,
    Vice_President_Vote  INTEGER,
    Secretary_Vote       INTEGER,
    Treasurer_Vote       INTEGER,
    Class_President_Vote INTEGER,
    Class_Senator_Vote   INTEGER,
    FOREIGN KEY (StuID) REFERENCES Student (StuID),
    FOREIGN KEY (President_Vote) REFERENCES Student (StuID),
    FOREIGN KEY (Vice_President_Vote) REFERENCES Student (StuID),
    FOREIGN KEY (Secretary_Vote) REFERENCES Student (StuID),
    FOREIGN KEY (Treasurer_Vote) REFERENCES Student (StuID),
    FOREIGN KEY (Class_President_Vote) REFERENCES Student (StuID),
    FOREIGN KEY (Class_Senator_Vote) REFERENCES Student (StuID)
);


