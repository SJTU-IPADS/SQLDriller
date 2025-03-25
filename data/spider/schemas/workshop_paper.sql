CREATE TABLE `workshop`
(
    `Workshop_ID` int,
    `Date`        text,
    `Venue`       text,
    `Name`        text,
    PRIMARY KEY (`Workshop_ID`)
);

CREATE TABLE `submission`
(
    `Submission_ID` int,
    `Scores`        real,
    `Author`        text,
    `College`       text,
    PRIMARY KEY (`Submission_ID`)
);



CREATE TABLE `Acceptance`
(
    `Submission_ID` int,
    `Workshop_ID`   int,
    `Result`        text,
    PRIMARY KEY (`Submission_ID`, `Workshop_ID`),
    FOREIGN KEY (`Submission_ID`) REFERENCES `submission` (`Submission_ID`),
    FOREIGN KEY (`Workshop_ID`) REFERENCES `workshop` (`Workshop_ID`)
);


