CREATE TABLE authors
(
    au_id    TEXT PRIMARY KEY,
    au_lname TEXT NOT NULL,
    au_fname TEXT NOT NULL,
    phone    TEXT NOT NULL,
    address  TEXT,
    city     TEXT,
    state    TEXT,
    zip      TEXT,
    contract TEXT NOT NULL
);
CREATE TABLE jobs
(
    job_id   INT PRIMARY KEY,
    job_desc TEXT NOT NULL,
    min_lvl  INT  NOT NULL,
    max_lvl  INT  NOT NULL
);
CREATE TABLE publishers
(
    pub_id   TEXT PRIMARY KEY,
    pub_name TEXT,
    city     TEXT,
    state    TEXT,
    country  TEXT
);
CREATE TABLE employee
(
    emp_id    TEXT PRIMARY KEY,
    fname     TEXT     NOT NULL,
    minit     TEXT,
    lname     TEXT     NOT NULL,
    job_id    INT      NOT NULL,
    job_lvl   INT,
    pub_id    TEXT     NOT NULL,
    hire_date DATETIME NOT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs (job_id),
    FOREIGN KEY (pub_id) REFERENCES publishers (pub_id)
);
CREATE TABLE pub_info
(
    pub_id  TEXT PRIMARY KEY,
    logo    BLOB,
    pr_info TEXT,
    FOREIGN KEY (pub_id) REFERENCES publishers (pub_id)
);
CREATE TABLE stores
(
    stor_id      TEXT PRIMARY KEY,
    stor_name    TEXT,
    stor_address TEXT,
    city         TEXT,
    state        TEXT,
    zip          TEXT
);
CREATE TABLE discounts
(
    discounttype TEXT  NOT NULL,
    stor_id      TEXT,
    lowqty       INT,
    highqty      INT,
    discount     FLOAT NOT NULL,
    FOREIGN KEY (stor_id) REFERENCES stores (stor_id)
);
CREATE TABLE titles
(
    title_id  TEXT PRIMARY KEY,
    title     TEXT     NOT NULL,
    type      TEXT     NOT NULL,
    pub_id    TEXT,
    price     FLOAT,
    advance   FLOAT,
    royalty   INT,
    ytd_sales INT,
    notes     TEXT,
    pubdate   DATETIME NOT NULL,
    FOREIGN KEY (pub_id) REFERENCES publishers (pub_id)
);
CREATE TABLE roysched
(
    title_id TEXT NOT NULL,
    lorange  INT,
    hirange  INT,
    royalty  INT,
    FOREIGN KEY (title_id) REFERENCES titles (title_id)
);
CREATE TABLE sales
(
    stor_id  TEXT     NOT NULL,
    ord_num  TEXT     NOT NULL,
    ord_date DATETIME NOT NULL,
    qty      INT      NOT NULL,
    payterms TEXT     NOT NULL,
    title_id TEXT     NOT NULL,
    PRIMARY KEY (stor_id, ord_num, title_id),
    FOREIGN KEY (stor_id) REFERENCES stores (stor_id),
    FOREIGN KEY (title_id) REFERENCES titles (title_id)
);
CREATE TABLE titleauthor
(
    au_id      TEXT NOT NULL,
    title_id   TEXT NOT NULL,
    au_ord     INT,
    royaltyper INT,
    PRIMARY KEY (au_id, title_id),
    FOREIGN KEY (au_id) REFERENCES authors (au_id),
    FOREIGN KEY (title_id) REFERENCES titles (title_id)
);
