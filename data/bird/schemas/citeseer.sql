CREATE TABLE cites
(
    cited_paper_id  TEXT NOT NULL,
    citing_paper_id TEXT NOT NULL,
    PRIMARY KEY (cited_paper_id, citing_paper_id)
);
CREATE TABLE paper
(
    paper_id    TEXT NOT NULL PRIMARY KEY,
    class_label TEXT NOT NULL
);
CREATE TABLE content
(
    paper_id      TEXT NOT NULL,
    word_cited_id TEXT NOT NULL,
    PRIMARY KEY (paper_id, word_cited_id),
    FOREIGN KEY (paper_id) REFERENCES paper (paper_id)
);
