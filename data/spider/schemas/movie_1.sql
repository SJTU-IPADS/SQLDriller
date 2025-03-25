create table Movie
(
    mID      int primary key,
    title    text,
    year     int,
    director text
);
create table Reviewer
(
    rID  int primary key,
    name text
);

create table Rating
(
    rID        int,
    mID        int,
    stars      int,
    ratingDate date,
    FOREIGN KEY (mID) references Movie (mID),
    FOREIGN KEY (rID) references Reviewer (rID)
);


