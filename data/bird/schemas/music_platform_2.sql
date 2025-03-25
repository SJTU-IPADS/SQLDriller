CREATE TABLE runs
(
    run_at        TEXT NOT NULL,
    max_rowid     INT  NOT NULL,
    reviews_added INT  NOT NULL
);
CREATE TABLE podcasts
(
    podcast_id TEXT PRIMARY KEY,
    itunes_id  INT  NOT NULL,
    slug       TEXT NOT NULL,
    itunes_url TEXT NOT NULL,
    title      TEXT NOT NULL
);
CREATE TABLE `reviews`
(
    podcast_id TEXT NOT NULL REFERENCES podcasts,
    title      TEXT NOT NULL,
    content    TEXT NOT NULL,
    rating     INT  NOT NULL,
    author_id  TEXT NOT NULL,
    created_at TEXT NOT NULL
);
CREATE TABLE `categories`
(
    podcast_id TEXT NOT NULL REFERENCES podcasts,
    category   TEXT NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (podcast_id, category)
);
