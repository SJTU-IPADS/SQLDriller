CREATE TABLE Classification
(
    GeneID       TEXT NOT NULL PRIMARY KEY,
    Localization TEXT NOT NULL
);
CREATE TABLE Genes
(
    GeneID       TEXT NOT NULL,
    Essential    TEXT NOT NULL,
    Class        TEXT NOT NULL,
    Complex      TEXT NULL,
    Phenotype    TEXT NOT NULL,
    Motif        TEXT NOT NULL,
    Chromosome   INT  NOT NULL,
    Function     TEXT NOT NULL,
    Localization TEXT NOT NULL,
    FOREIGN KEY (GeneID) REFERENCES Classification (GeneID)
);
CREATE TABLE Interactions
(
    GeneID1         TEXT  NOT NULL,
    GeneID2         TEXT  NOT NULL,
    Type            TEXT  NOT NULL,
    Expression_Corr FLOAT NOT NULL,
    PRIMARY KEY (GeneID1, GeneID2),
    FOREIGN KEY (GeneID1) REFERENCES Classification (GeneID),
    FOREIGN KEY (GeneID2) REFERENCES Classification (GeneID)
);
