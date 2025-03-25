create table ACCOUNTS
(
    custid BIGINT      not null
        primary key,
    name   VARCHAR(64) not null
);

create table CHECKING
(
    custid  BIGINT not null
        primary key
        references ACCOUNTS (custid),
    balance FLOAT  not null
);

create table SAVINGS
(
    custid  BIGINT not null
        primary key
        references ACCOUNTS (custid),
    balance FLOAT  not null
);

