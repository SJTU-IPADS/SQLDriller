CREATE TABLE bank
(
    branch_ID       int PRIMARY KEY,
    bname           varchar(20),
    no_of_customers int,
    city            varchar(10),
    state           varchar(20)
);


CREATE TABLE customer
(
    cust_ID      varchar(3) PRIMARY KEY,
    cust_name    varchar(20),
    acc_type     char(1),
    acc_bal      int,
    no_of_loans  int,
    credit_score int,
    branch_ID    int,
    state        varchar(20),
    FOREIGN KEY (branch_ID) REFERENCES bank (branch_ID)
);


CREATE TABLE loan
(
    loan_ID   varchar(3) PRIMARY KEY,
    loan_type varchar(15),
    cust_ID   varchar(3),
    branch_ID varchar(3),
    amount    int,
    FOREIGN KEY (branch_ID) REFERENCES bank (branch_ID),
    FOREIGN KEY (Cust_ID) REFERENCES customer (Cust_ID)
);



