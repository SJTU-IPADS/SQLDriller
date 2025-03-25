CREATE TABLE location
(
    LocationID INT PRIMARY KEY,
    Country    TEXT,
    State      TEXT,
    StateCode  TEXT,
    City       TEXT
);
CREATE TABLE user
(
    UserID TEXT PRIMARY KEY,
    Gender TEXT
);
CREATE TABLE twitter
(
    TweetID      TEXT PRIMARY KEY,
    Weekday      TEXT,
    Hour         INT,
    Day          INT,
    Lang         TEXT,
    IsReshare    TEXT,
    Reach        INT,
    RetweetCount INT,
    Likes        INT,
    Klout        INT,
    Sentiment    FLOAT,
    `text`       TEXT,
    LocationID   INT,
    UserID       TEXT,
    FOREIGN KEY (LocationID) REFERENCES location (LocationID),
    FOREIGN KEY (UserID) REFERENCES user (UserID)
);
