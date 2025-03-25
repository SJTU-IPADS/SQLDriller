CREATE TABLE Question
(
    questiontext TEXT,
    questionid   INT PRIMARY KEY
);
CREATE TABLE Survey
(
    SurveyID    INT PRIMARY KEY,
    Description TEXT
);
CREATE TABLE `Answer`
(
    AnswerText TEXT,
    SurveyID   INT REFERENCES Survey,
    UserID     INT,
    QuestionID INT REFERENCES Question,
    CONSTRAINT Answer_pk PRIMARY KEY (UserID, QuestionID)
);
