create table item
(
    i_id  integer not null
        primary key,
    title varchar(20) default NULL
);

create table useracct
(
    u_id integer not null
        primary key,
    name varchar(128) default NULL
);

create table review
(
    a_id   integer not null
        primary key,
    u_id   integer not null
        references useracct (u_id),
    i_id   integer not null
        references item (i_id),
    rating integer default NULL,
    rank   integer default NULL
);

create index idx_review_IDX_RATING_AID
    on review (a_id);

create index idx_review_IDX_RATING_IID
    on review (i_id);

create index idx_review_IDX_RATING_UID
    on review (u_id);

create table trust
(
    source_u_id integer not null
        references useracct (u_id),
    target_u_id integer not null
        references useracct (u_id),
    trust       integer not null
);

create index idx_trust_IDX_TRUST_SID
    on trust (source_u_id);

create index idx_trust_IDX_TRUST_TID
    on trust (target_u_id);

