create table user_profiles
(
    uid         int(11) not null
        primary key,
    name        varchar(255) default NULL,
    email       varchar(255) default NULL,
    partitionid int(11)      default NULL,
    followers   int(11)      default NULL
);

create table follows
(
    f1 int(11) not null
        references user_profiles (uid),
    f2 int(11) not null
        references user_profiles (uid),
    primary key (f1, f2)
);

create table tweets
(
    id         bigint(20) not null
        primary key,
    uid        int(11)    not null
        references user_profiles (uid),
    text       char(140)  not null,
    createdate datetime default CURRENT_TIMESTAMP
);

