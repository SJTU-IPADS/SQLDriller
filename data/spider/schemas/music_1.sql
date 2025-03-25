create table genre
(
    g_name          varchar(20) not null,
    rating          varchar(10),
    most_popular_in varchar(50),
    primary key (g_name)
);

create table artist
(
    artist_name     varchar(50) not null,
    country         varchar(20),
    gender          varchar(20),
    preferred_genre varchar(50),
    constraint a_name primary key (artist_name),
    foreign key (preferred_genre) references genre (g_name) ON DELETE CASCADE
);

create table files
(
    f_id        numeric(10) not null,
    artist_name varchar(50),
    file_size   varchar(20),
    duration    varchar(20),
    formats     varchar(20),
    primary key (f_id),
    foreign key (artist_name) references artist (artist_name) ON DELETE CASCADE
);


create table song
(
    song_name   varchar(50),
    artist_name varchar(50),
    country     varchar(20),
    f_id        numeric(10),
    genre_is    varchar(20),
    rating      numeric(10) check (rating > 0 and rating < 11),
    languages   varchar(20),
    releasedate Date,
    resolution  numeric(10) not null,
    constraint s_name primary key (song_name),
    foreign key (artist_name) references artist (artist_name) ON DELETE CASCADE,
    foreign key (f_id) references files (f_id) ON DELETE CASCADE,
    foreign key (genre_is) references genre (g_name) ON DELETE CASCADE
);






