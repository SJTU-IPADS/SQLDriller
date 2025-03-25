CREATE TABLE coins
(
    id            INT NOT NULL PRIMARY KEY,
    name          TEXT,
    slug          TEXT,
    symbol        TEXT,
    status        TEXT,
    category      TEXT,
    description   TEXT,
    subreddit     TEXT,
    notice        TEXT,
    tags          TEXT,
    tag_names     TEXT,
    website       TEXT,
    platform_id   INT,
    date_added    TEXT,
    date_launched TEXT
);
CREATE TABLE `historical`
(
    date               DATE,
    coin_id            INT,
    cmc_rank           INT,
    market_cap         FLOAT,
    price              FLOAT,
    open               FLOAT,
    high               FLOAT,
    low                FLOAT,
    close              FLOAT,
    time_high          TEXT,
    time_low           TEXT,
    volume_24h         FLOAT,
    percent_change_1h  FLOAT,
    percent_change_24h FLOAT,
    percent_change_7d  FLOAT,
    circulating_supply FLOAT,
    total_supply       FLOAT,
    max_supply         FLOAT,
    num_market_pairs   INT
);
