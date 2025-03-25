create table Highschooler
(
    ID    int primary key,
    name  text,
    grade int
);
create table Friend
(
    student_id int,
    friend_id  int,
    primary key (student_id, friend_id),
    foreign key (student_id) references Highschooler (ID),
    foreign key (friend_id) references Highschooler (ID)
);
create table Likes
(
    student_id int,
    liked_id   int,
    primary key (student_id, liked_id),
    foreign key (liked_id) references Highschooler (ID),
    foreign key (student_id) references Highschooler (ID)
);


