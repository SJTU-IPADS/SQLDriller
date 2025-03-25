CREATE TABLE Students
(
    Student_ID        INTEGER NOT NULL,
    First_Name        VARCHAR(255),
    Middle_Name       VARCHAR(255),
    Last_Name         VARCHAR(255),
    Gender_MFU        CHAR(1),
    Student_Address   VARCHAR(255),
    Email_Adress      VARCHAR(255),
    Cell_Mobile_Phone VARCHAR(255),
    Home_Phone        VARCHAR(255),
    PRIMARY KEY (Student_ID)
    -- check ( Gender_MFU in ('F', 'M', 'U') )
);
CREATE TABLE Questions
(
    Question_ID           INTEGER     NOT NULL,
    Type_of_Question_Code VARCHAR(15) NOT NULL,
    Question_Text         VARCHAR(255),
    PRIMARY KEY (Question_ID)
);
CREATE TABLE Exams
(
    Exam_ID      INTEGER  NOT NULL,
    Subject_Code CHAR(15) NOT NULL,
    Exam_Date    DATETIME,
    Exam_Name    VARCHAR(255),
    PRIMARY KEY (Exam_ID)
);
CREATE TABLE Questions_in_Exams
(
    Exam_ID     INTEGER NOT NULL,
    Question_ID INTEGER NOT NULL,
    PRIMARY KEY (Exam_ID, Question_ID),
    FOREIGN KEY (Question_ID) REFERENCES Questions (Question_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exams (Exam_ID)
);
CREATE TABLE Valid_Answers
(
    Valid_Answer_ID   INTEGER NOT NULL,
    Question_ID       INTEGER NOT NULL,
    Valid_Answer_Text VARCHAR(255),
    PRIMARY KEY (Valid_Answer_ID),
    FOREIGN KEY (Question_ID) REFERENCES Questions (Question_ID)
);
CREATE TABLE Student_Answers
(
    Student_Answer_ID   INTEGER NOT NULL,
    Exam_ID             INTEGER NOT NULL,
    Question_ID         INTEGER NOT NULL,
    Student_ID          INTEGER NOT NULL,
    Date_of_Answer      DATETIME,
    Comments            VARCHAR(255),
    Satisfactory_YN     VARCHAR(1),
    Student_Answer_Text VARCHAR(255),
    PRIMARY KEY (Student_Answer_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students (Student_ID),
    FOREIGN KEY (Exam_ID, Question_ID) REFERENCES Questions_in_Exams (Exam_ID, Question_ID)
    -- check ( Satisfactory_YN in ('0', '1') )
);
CREATE TABLE Student_Assessments
(
    Student_Answer_ID   VARCHAR(100) NOT NULL,
    Valid_Answer_ID     INTEGER      NOT NULL,
    Student_Answer_Text VARCHAR(255),
    Satisfactory_YN     CHAR(1),
    Assessment          VARCHAR(40),
    PRIMARY KEY (Student_Answer_ID),
    FOREIGN KEY (Student_Answer_ID) REFERENCES Student_Answers (Student_Answer_ID),
    FOREIGN KEY (Valid_Answer_ID) REFERENCES Valid_Answers (Valid_Answer_ID)
    -- check ( Satisfactory_YN in ('0', '1') )
);
