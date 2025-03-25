create table AREA_CODE_STATE
(
    area_code integer    not null
        primary key,
    state     varchar(2) not null
);

create table CONTESTANTS
(
    contestant_number integer
        primary key,
    contestant_name   varchar(50) not null
);

create table VOTES
(
    vote_id           integer                             not null
        primary key,
    phone_number      integer                             not null,
    state             varchar(2)                          not null
        references AREA_CODE_STATE (state),
    contestant_number integer                             not null
        references CONTESTANTS (contestant_number),
    created           timestamp default CURRENT_TIMESTAMP not null
);

create index idx_VOTES_idx_votes_phone_number
    on VOTES (phone_number);

