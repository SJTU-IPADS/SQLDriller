CREATE TABLE `Method`
(
    Id            INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name          TEXT,
    FullComment   TEXT,
    Summary       TEXT,
    ApiCalls      TEXT,
    CommentIsXml  INT,
    SampledAt     INT,
    SolutionId    INT,
    Lang          TEXT,
    NameTokenized TEXT
);
CREATE TABLE `MethodParameter`
(
    Id       INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    MethodId TEXT,
    Type     TEXT,
    Name     TEXT
);
CREATE TABLE Repo
(
    Id            INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Url           TEXT,
    Stars         INT,
    Forks         INT,
    Watchers      INT,
    ProcessedTime INT
);
CREATE TABLE Solution
(
    Id            INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    RepoId        INT,
    Path          TEXT,
    ProcessedTime INT,
    WasCompiled   INT
);
