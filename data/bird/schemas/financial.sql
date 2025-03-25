CREATE TABLE account
(
    account_id  INT DEFAULT 0 NOT NULL PRIMARY KEY,
    district_id INT DEFAULT 0 NOT NULL,
    frequency   TEXT          NOT NULL,
    date        DATE          NOT NULL,
    FOREIGN KEY (district_id) REFERENCES district (district_id)
);
CREATE TABLE card
(
    card_id INT DEFAULT 0 NOT NULL PRIMARY KEY,
    disp_id INT           NOT NULL,
    type    TEXT          NOT NULL,
    issued  DATE          NOT NULL,
    FOREIGN KEY (disp_id) REFERENCES disp (disp_id)
);
CREATE TABLE client
(
    client_id   INT  NOT NULL PRIMARY KEY,
    gender      TEXT NOT NULL,
    birth_date  DATE NOT NULL,
    district_id INT  NOT NULL,
    FOREIGN KEY (district_id) REFERENCES district (district_id)
);
CREATE TABLE disp
(
    disp_id    INT  NOT NULL PRIMARY KEY,
    client_id  INT  NOT NULL,
    account_id INT  NOT NULL,
    type       TEXT NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account (account_id),
    FOREIGN KEY (client_id) REFERENCES client (client_id)
);
CREATE TABLE district
(
    district_id INT DEFAULT 0 NOT NULL PRIMARY KEY,
    A2          TEXT          NOT NULL,
    A3          TEXT          NOT NULL,
    A4          TEXT          NOT NULL,
    A5          TEXT          NOT NULL,
    A6          TEXT          NOT NULL,
    A7          TEXT          NOT NULL,
    A8          INT           NOT NULL,
    A9          INT           NOT NULL,
    A10         FLOAT         NOT NULL,
    A11         INT           NOT NULL,
    A12         FLOAT         NULL,
    A13         FLOAT         NOT NULL,
    A14         INT           NOT NULL,
    A15         INT           NULL,
    A16         INT           NOT NULL
);
CREATE TABLE loan
(
    loan_id    INT DEFAULT 0 NOT NULL PRIMARY KEY,
    account_id INT           NOT NULL,
    date       DATE          NOT NULL,
    amount     INT           NOT NULL,
    duration   INT           NOT NULL,
    payments   FLOAT         NOT NULL,
    status     TEXT          NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account (account_id)
);
CREATE TABLE `order`
(
    order_id   INT DEFAULT 0 NOT NULL PRIMARY KEY,
    account_id INT           NOT NULL,
    bank_to    TEXT          NOT NULL,
    account_to INT           NOT NULL,
    amount     FLOAT         NOT NULL,
    k_symbol   TEXT          NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account (account_id)
);
CREATE TABLE trans
(
    trans_id   INT DEFAULT 0 NOT NULL PRIMARY KEY,
    account_id INT DEFAULT 0 NOT NULL,
    date       DATE          NOT NULL,
    type       TEXT          NOT NULL,
    operation  TEXT          NULL,
    amount     INT           NOT NULL,
    balance    INT           NOT NULL,
    k_symbol   TEXT          NULL,
    bank       TEXT          NULL,
    account    INT           NULL,
    FOREIGN KEY (account_id) REFERENCES account (account_id)
);
