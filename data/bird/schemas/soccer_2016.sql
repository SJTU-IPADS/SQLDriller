CREATE TABLE Batting_Style
(
    Batting_Id   INT PRIMARY KEY,
    Batting_hand TEXT
);
CREATE TABLE Bowling_Style
(
    Bowling_Id    INT PRIMARY KEY,
    Bowling_skill TEXT
);
CREATE TABLE City
(
    City_Id    INT PRIMARY KEY,
    City_Name  TEXT,
    Country_id INT
);
CREATE TABLE Country
(
    Country_Id   INT PRIMARY KEY,
    Country_Name TEXT
);
CREATE TABLE Extra_Type
(
    Extra_Id   INT PRIMARY KEY,
    Extra_Name TEXT
);
CREATE TABLE Extra_Runs
(
    Match_Id      INT,
    Over_Id       INT,
    Ball_Id       INT,
    Extra_Type_Id INT,
    Extra_Runs    INT,
    Innings_No    INT,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Extra_Type_Id) REFERENCES Extra_Type (Extra_Id)
);
CREATE TABLE Out_Type
(
    Out_Id   INT PRIMARY KEY,
    Out_Name TEXT
);
CREATE TABLE Outcome
(
    Outcome_Id   INT PRIMARY KEY,
    Outcome_Type TEXT
);
CREATE TABLE Player
(
    Player_Id     INT PRIMARY KEY,
    Player_Name   TEXT,
    DOB           DATE,
    Batting_hand  INT,
    Bowling_skill INT,
    Country_Name  INT,
    FOREIGN KEY (Batting_hand) REFERENCES Batting_Style (Batting_Id),
    FOREIGN KEY (Bowling_skill) REFERENCES Bowling_Style (Bowling_Id),
    FOREIGN KEY (Country_Name) REFERENCES Country (Country_Id)
);
CREATE TABLE Rolee
(
    Role_Id   INT PRIMARY KEY,
    Role_Desc TEXT
);
CREATE TABLE Season
(
    Season_Id         INT PRIMARY KEY,
    Man_of_the_Series INT,
    Orange_Cap        INT,
    Purple_Cap        INT,
    Season_Year       INT
);
CREATE TABLE Team
(
    Team_Id   INT PRIMARY KEY,
    Team_Name TEXT
);
CREATE TABLE Toss_Decision
(
    Toss_Id   INT PRIMARY KEY,
    Toss_Name TEXT
);
CREATE TABLE Umpire
(
    Umpire_Id      INT PRIMARY KEY,
    Umpire_Name    TEXT,
    Umpire_Country INT,
    FOREIGN KEY (Umpire_Country) REFERENCES Country (Country_Id)
);
CREATE TABLE Venue
(
    Venue_Id   INT PRIMARY KEY,
    Venue_Name TEXT,
    City_Id    INT,
    FOREIGN KEY (City_Id) REFERENCES City (City_Id)
);
CREATE TABLE Win_By
(
    Win_Id   INT PRIMARY KEY,
    Win_Type TEXT
);
CREATE TABLE Match
(
    Match_Id         INT PRIMARY KEY,
    Team_1           INT,
    Team_2           INT,
    Match_Date       DATE,
    Season_Id        INT,
    Venue_Id         INT,
    Toss_Winner      INT,
    Toss_Decide      INT,
    Win_Type         INT,
    Win_Margin       INT,
    Outcome_type     INT,
    Match_Winner     INT,
    Man_of_the_Match INT,
    FOREIGN KEY (Team_1) REFERENCES Team (Team_Id),
    FOREIGN KEY (Team_2) REFERENCES Team (Team_Id),
    FOREIGN KEY (Season_Id) REFERENCES Season (Season_Id),
    FOREIGN KEY (Venue_Id) REFERENCES Venue (Venue_Id),
    FOREIGN KEY (Toss_Winner) REFERENCES Team (Team_Id),
    FOREIGN KEY (Toss_Decide) REFERENCES Toss_Decision (Toss_Id),
    FOREIGN KEY (Win_Type) REFERENCES Win_By (Win_Id),
    FOREIGN KEY (Outcome_type) REFERENCES Out_Type (Out_Id),
    FOREIGN KEY (Match_Winner) REFERENCES Team (Team_Id),
    FOREIGN KEY (Man_of_the_Match) REFERENCES Player (Player_Id)
);
CREATE TABLE Ball_by_Ball
(
    Match_Id                 INT,
    Over_Id                  INT,
    Ball_Id                  INT,
    Innings_No               INT,
    Team_Batting             INT,
    Team_Bowling             INT,
    Striker_Batting_Position INT,
    Striker                  INT,
    Non_Striker              INT,
    Bowler                   INT,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Match_Id) REFERENCES Match (Match_Id)
);
CREATE TABLE Batsman_Scored
(
    Match_Id    INT,
    Over_Id     INT,
    Ball_Id     INT,
    Runs_Scored INT,
    Innings_No  INT,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Match_Id) REFERENCES Match (Match_Id)
);
CREATE TABLE Player_Match
(
    Match_Id  INT,
    Player_Id INT,
    Role_Id   INT,
    Team_Id   INT,
    PRIMARY KEY (Match_Id, Player_Id, Role_Id),
    FOREIGN KEY (Match_Id) REFERENCES Match (Match_Id),
    FOREIGN KEY (Player_Id) REFERENCES Player (Player_Id),
    FOREIGN KEY (Team_Id) REFERENCES Team (Team_Id),
    FOREIGN KEY (Role_Id) REFERENCES Rolee (Role_Id)
);
CREATE TABLE Wicket_Taken
(
    Match_Id   INT,
    Over_Id    INT,
    Ball_Id    INT,
    Player_Out INT,
    Kind_Out   INT,
    Fielders   INT,
    Innings_No INT,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Match_Id) REFERENCES Match (Match_Id),
    FOREIGN KEY (Player_Out) REFERENCES Player (Player_Id),
    FOREIGN KEY (Kind_Out) REFERENCES Out_Type (Out_Id),
    FOREIGN KEY (Fielders) REFERENCES Player (Player_Id)
);
