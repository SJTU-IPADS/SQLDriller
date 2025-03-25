CREATE TABLE badges
(
    Id     INT      NOT NULL PRIMARY KEY,
    UserId INT      NULL,
    Name   TEXT     NULL,
    Date   DATETIME NULL,
    FOREIGN KEY (UserId) REFERENCES users (Id)
);
CREATE TABLE comments
(
    Id              INT      NOT NULL PRIMARY KEY,
    PostId          INT      NULL,
    Score           INT      NULL,
    Text            TEXT     NULL,
    CreationDate    DATETIME NULL,
    UserId          INT      NULL,
    UserDisplayName TEXT     NULL,
    FOREIGN KEY (PostId) REFERENCES posts (Id),
    FOREIGN KEY (UserId) REFERENCES users (Id)
);
CREATE TABLE postHistory
(
    Id                INT      NOT NULL UNIQUE PRIMARY KEY,
    PostHistoryTypeId INT      NULL,
    PostId            INT      NULL,
    RevisionGUID      TEXT     NULL,
    CreationDate      DATETIME NULL,
    UserId            INT      NULL,
    Text              TEXT     NULL,
    Comment           TEXT     NULL,
    UserDisplayName   TEXT     NULL,
    FOREIGN KEY (PostId) REFERENCES posts (Id),
    FOREIGN KEY (UserId) REFERENCES users (Id)
);
CREATE TABLE postLinks
(
    Id            INT      NOT NULL PRIMARY KEY,
    CreationDate  DATETIME NULL,
    PostId        INT      NULL,
    RelatedPostId INT      NULL,
    LinkTypeId    INT      NULL,
    FOREIGN KEY (PostId) REFERENCES posts (Id),
    FOREIGN KEY (RelatedPostId) REFERENCES posts (Id)
);
CREATE TABLE posts
(
    Id                    INT      NOT NULL UNIQUE PRIMARY KEY,
    PostTypeId            INT      NULL,
    AcceptedAnswerId      INT      NULL,
    CreaionDate           DATETIME NULL,
    Score                 INT      NULL,
    ViewCount             INT      NULL,
    Body                  TEXT     NULL,
    OwnerUserId           INT      NULL,
    LasActivityDate       DATETIME NULL,
    Title                 TEXT     NULL,
    Tags                  TEXT     NULL,
    AnswerCount           INT      NULL,
    CommentCount          INT      NULL,
    FavoriteCount         INT      NULL,
    LastEditorUserId      INT      NULL,
    LastEditDate          DATETIME NULL,
    CommunityOwnedDate    DATETIME NULL,
    ParentId              INT      NULL,
    ClosedDate            DATETIME NULL,
    OwnerDisplayName      TEXT     NULL,
    LastEditorDisplayName TEXT     NULL,
    FOREIGN KEY (LastEditorUserId) REFERENCES users (Id),
    FOREIGN KEY (OwnerUserId) REFERENCES users (Id),
    FOREIGN KEY (ParentId) REFERENCES posts (Id)
);
CREATE TABLE tags
(
    Id            INT  NOT NULL PRIMARY KEY,
    TagName       TEXT NULL,
    Count         INT  NULL,
    ExcerptPostId INT  NULL,
    WikiPostId    INT  NULL,
    FOREIGN KEY (ExcerptPostId) REFERENCES posts (Id)
);
CREATE TABLE users
(
    Id              INT      NOT NULL UNIQUE PRIMARY KEY,
    Reputation      INT      NULL,
    CreationDate    DATETIME NULL,
    DisplayName     TEXT     NULL,
    LastAccessDate  DATETIME NULL,
    WebsiteUrl      TEXT     NULL,
    Location        TEXT     NULL,
    AboutMe         TEXT     NULL,
    Views           INT      NULL,
    UpVotes         INT      NULL,
    DownVotes       INT      NULL,
    AccountId       INT      NULL,
    Age             INT      NULL,
    ProfileImageUrl TEXT     NULL
);
CREATE TABLE votes
(
    Id           INT  NOT NULL PRIMARY KEY,
    PostId       INT  NULL,
    VoteTypeId   INT  NULL,
    CreationDate DATE NULL,
    UserId       INT  NULL,
    BountyAmount INT  NULL,
    FOREIGN KEY (PostId) REFERENCES posts (Id),
    FOREIGN KEY (UserId) REFERENCES users (Id)
);
