CREATE TABLE Attributes
(
    attribute_id   INT PRIMARY KEY,
    attribute_name TEXT
);
CREATE TABLE Categories
(
    category_id   INT PRIMARY KEY,
    category_name TEXT
);
CREATE TABLE Compliments
(
    compliment_id   INT PRIMARY KEY,
    compliment_type TEXT
);
CREATE TABLE Days
(
    day_id      INT PRIMARY KEY,
    day_of_week TEXT
);
CREATE TABLE Years
(
    year_id     INT PRIMARY KEY,
    actual_year INT
);
CREATE TABLE `Business_Attributes`
(
    attribute_id    INT REFERENCES Attributes,
    business_id     INT REFERENCES Business,
    attribute_value TEXT,
    CONSTRAINT Business_Attributes_pk PRIMARY KEY (attribute_id, business_id)
);
CREATE TABLE `Business_Categories`
(
    business_id INT REFERENCES Business,
    category_id INT REFERENCES Categories,
    CONSTRAINT Business_Categories_pk PRIMARY KEY (business_id, category_id)
);
CREATE TABLE `Business_Hours`
(
    business_id  INT REFERENCES Business,
    day_id       INT REFERENCES Days,
    opening_time TEXT,
    closing_time TEXT,
    CONSTRAINT Business_Hours_pk PRIMARY KEY (business_id, day_id)
);
CREATE TABLE `Checkins`
(
    business_id   INT REFERENCES Business,
    day_id        INT REFERENCES Days,
    label_time_0  TEXT,
    label_time_1  TEXT,
    label_time_2  TEXT,
    label_time_3  TEXT,
    label_time_4  TEXT,
    label_time_5  TEXT,
    label_time_6  TEXT,
    label_time_7  TEXT,
    label_time_8  TEXT,
    label_time_9  TEXT,
    label_time_10 TEXT,
    label_time_11 TEXT,
    label_time_12 TEXT,
    label_time_13 TEXT,
    label_time_14 TEXT,
    label_time_15 TEXT,
    label_time_16 TEXT,
    label_time_17 TEXT,
    label_time_18 TEXT,
    label_time_19 TEXT,
    label_time_20 TEXT,
    label_time_21 TEXT,
    label_time_22 TEXT,
    label_time_23 TEXT,
    CONSTRAINT Checkins_pk PRIMARY KEY (business_id, day_id)
);
CREATE TABLE `Elite`
(
    user_id INT REFERENCES Users,
    year_id INT REFERENCES Years,
    CONSTRAINT Elite_pk PRIMARY KEY (user_id, year_id)
);
CREATE TABLE `Reviews`
(
    business_id         INT REFERENCES Business,
    user_id             INT REFERENCES Users,
    review_stars        INT,
    review_votes_funny  TEXT,
    review_votes_useful TEXT,
    review_votes_cool   TEXT,
    review_length       TEXT,
    CONSTRAINT Reviews_pk PRIMARY KEY (business_id, user_id)
);
CREATE TABLE `Tips`
(
    business_id INT REFERENCES Business,
    user_id     INT REFERENCES Users,
    likes       INT,
    tip_length  TEXT,
    CONSTRAINT Tips_pk PRIMARY KEY (business_id, user_id)
);
CREATE TABLE `Users_Compliments`
(
    compliment_id         INT REFERENCES Compliments,
    user_id               INT REFERENCES Users,
    number_of_compliments TEXT,
    CONSTRAINT Users_Compliments_pk PRIMARY KEY (compliment_id, user_id)
);
CREATE TABLE `Business`
(
    business_id  INT PRIMARY KEY,
    active       TEXT,
    city         TEXT,
    state        TEXT,
    stars        FLOAT,
    review_count TEXT
);
CREATE TABLE `Users`
(
    user_id                 INT PRIMARY KEY,
    user_yelping_since_year INT,
    user_average_stars      TEXT,
    user_votes_funny        TEXT,
    user_votes_useful       TEXT,
    user_votes_cool         TEXT,
    user_review_count       TEXT,
    user_fans               TEXT
);
