CREATE TABLE `customer`
(
    `c_custkey`    INT NOT NULL,
    `c_mktsegment` TEXT  DEFAULT NULL,
    `c_nationkey`  INT   DEFAULT NULL,
    `c_name`       TEXT  DEFAULT NULL,
    `c_address`    TEXT  DEFAULT NULL,
    `c_phone`      TEXT  DEFAULT NULL,
    `c_acctbal`    FLOAT DEFAULT NULL,
    `c_comment`    TEXT  DEFAULT NULL,
    PRIMARY KEY (`c_custkey`),
    FOREIGN KEY (`c_nationkey`) REFERENCES `nation` (`n_nationkey`)
);
CREATE TABLE lineitem
(
    l_shipdate      DATE  NULL,
    l_orderkey      INT   NOT NULL,
    l_discount      FLOAT NOT NULL,
    l_extendedprice FLOAT NOT NULL,
    l_suppkey       INT   NOT NULL,
    l_quantity      INT   NOT NULL,
    l_returnflag    TEXT  NULL,
    l_partkey       INT   NOT NULL,
    l_linestatus    TEXT  NULL,
    l_tax           FLOAT NOT NULL,
    l_commitdate    DATE  NULL,
    l_receiptdate   DATE  NULL,
    l_shipmode      TEXT  NULL,
    l_linenumber    INT   NOT NULL,
    l_shipinstruct  TEXT  NULL,
    l_comment       TEXT  NULL,
    PRIMARY KEY (l_orderkey, l_linenumber),
    FOREIGN KEY (l_orderkey) REFERENCES orders (o_orderkey),
    FOREIGN KEY (l_partkey, l_suppkey) REFERENCES partsupp (ps_partkey, ps_suppkey)
);
CREATE TABLE nation
(
    n_nationkey INT  NOT NULL PRIMARY KEY,
    n_name      TEXT NULL,
    n_regionkey INT  NULL,
    n_comment   TEXT NULL,
    FOREIGN KEY (n_regionkey) REFERENCES region (r_regionkey)
);
CREATE TABLE orders
(
    o_orderdate     DATE  NULL,
    o_orderkey      INT   NOT NULL PRIMARY KEY,
    o_custkey       INT   NOT NULL,
    o_orderpriority TEXT  NULL,
    o_shippriority  INT   NULL,
    o_clerk         TEXT  NULL,
    o_orderstatus   TEXT  NULL,
    o_totalprice    FLOAT NULL,
    o_comment       TEXT  NULL,
    FOREIGN KEY (o_custkey) REFERENCES customer (c_custkey)
);
CREATE TABLE part
(
    p_partkey     INT   NOT NULL PRIMARY KEY,
    p_type        TEXT  NULL,
    p_size        INT   NULL,
    p_brand       TEXT  NULL,
    p_name        TEXT  NULL,
    p_container   TEXT  NULL,
    p_mfgr        TEXT  NULL,
    p_retailprice FLOAT NULL,
    p_comment     TEXT  NULL
);
CREATE TABLE partsupp
(
    ps_partkey    INT   NOT NULL,
    ps_suppkey    INT   NOT NULL,
    ps_supplycost FLOAT NOT NULL,
    ps_availqty   INT   NULL,
    ps_comment    TEXT  NULL,
    PRIMARY KEY (ps_partkey, ps_suppkey),
    FOREIGN KEY (ps_partkey) REFERENCES part (p_partkey),
    FOREIGN KEY (ps_suppkey) REFERENCES supplier (s_suppkey)
);
CREATE TABLE region
(
    r_regionkey INT  NOT NULL PRIMARY KEY,
    r_name      TEXT NULL,
    r_comment   TEXT NULL
);
CREATE TABLE supplier
(
    s_suppkey   INT   NOT NULL PRIMARY KEY,
    s_nationkey INT   NULL,
    s_comment   TEXT  NULL,
    s_name      TEXT  NULL,
    s_address   TEXT  NULL,
    s_phone     TEXT  NULL,
    s_acctbal   FLOAT NULL,
    FOREIGN KEY (s_nationkey) REFERENCES nation (n_nationkey)
);
