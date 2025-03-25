CREATE TABLE `borders`
(
    Country1 TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Country2 TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Length   FLOAT,
    PRIMARY KEY (Country1, Country2)
);
CREATE TABLE `city`
(
    Name       TEXT DEFAULT '' NOT NULL,
    Country    TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province   TEXT DEFAULT '' NOT NULL,
    Population INT,
    Longitude  FLOAT,
    Latitude   FLOAT,
    PRIMARY KEY (Name, Province),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `continent`
(
    Name TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Area FLOAT
);
CREATE TABLE `country`
(
    Name       TEXT            NOT NULL UNIQUE,
    Code       TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Capital    TEXT,
    Province   TEXT,
    Area       FLOAT,
    Population INT
);
CREATE TABLE `desert`
(
    Name      TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Area      FLOAT,
    Longitude FLOAT,
    Latitude  FLOAT
);
CREATE TABLE `economy`
(
    Country     TEXT DEFAULT '' NOT NULL PRIMARY KEY REFERENCES country (Code),
    GDP         FLOAT,
    Agriculture FLOAT,
    Service     FLOAT,
    Industry    FLOAT,
    Inflation   FLOAT
);
CREATE TABLE `encompasses`
(
    Country    TEXT NOT NULL REFERENCES country (Code),
    Continent  TEXT NOT NULL REFERENCES continent (Name),
    Percentage FLOAT,
    PRIMARY KEY (Country, Continent)
);
CREATE TABLE `ethnicGroup`
(
    Country    TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Name       TEXT DEFAULT '' NOT NULL,
    Percentage FLOAT,
    PRIMARY KEY (Name, Country)
);
CREATE TABLE `geo_desert`
(
    Desert   TEXT DEFAULT '' NOT NULL REFERENCES desert (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, Desert),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_estuary`
(
    River    TEXT DEFAULT '' NOT NULL REFERENCES river (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, River),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_island`
(
    Island   TEXT DEFAULT '' NOT NULL REFERENCES island (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, Island),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_lake`
(
    Lake     TEXT DEFAULT '' NOT NULL REFERENCES lake (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, Lake),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_mountain`
(
    Mountain TEXT DEFAULT '' NOT NULL REFERENCES mountain (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, Mountain),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_river`
(
    River    TEXT DEFAULT '' NOT NULL REFERENCES river (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, River),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_sea`
(
    Sea      TEXT DEFAULT '' NOT NULL REFERENCES sea (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, Sea),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `geo_source`
(
    River    TEXT DEFAULT '' NOT NULL REFERENCES river (Name),
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Province TEXT DEFAULT '' NOT NULL,
    PRIMARY KEY (Province, Country, River),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `island`
(
    Name      TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Islands   TEXT,
    Area      FLOAT,
    Height    FLOAT,
    Type      TEXT,
    Longitude FLOAT,
    Latitude  FLOAT
);
CREATE TABLE `islandIn`
(
    Island TEXT REFERENCES island (Name),
    Sea    TEXT REFERENCES sea (Name),
    Lake   TEXT REFERENCES lake (Name),
    River  TEXT REFERENCES river (Name)
);
CREATE TABLE `isMember`
(
    Country      TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Organization TEXT DEFAULT '' NOT NULL REFERENCES organization (Abbreviation),
    Type         TEXT DEFAULT 'member',
    PRIMARY KEY (Country, Organization)
);
CREATE TABLE `lake`
(
    Name      TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Area      FLOAT,
    Depth     FLOAT,
    Altitude  FLOAT,
    Type      TEXT,
    River     TEXT,
    Longitude FLOAT,
    Latitude  FLOAT
);
CREATE TABLE `language`
(
    Country    TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Name       TEXT DEFAULT '' NOT NULL,
    Percentage FLOAT,
    PRIMARY KEY (Name, Country)
);
CREATE TABLE `located`
(
    City     TEXT,
    Province TEXT,
    Country  TEXT REFERENCES country (Code),
    River    TEXT REFERENCES river (Name),
    Lake     TEXT REFERENCES lake (name),
    Sea      TEXT REFERENCES sea (name),
    FOREIGN KEY (City, Province) REFERENCES city (Name, Province),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `locatedOn`
(
    City     TEXT DEFAULT '' NOT NULL,
    Province TEXT DEFAULT '' NOT NULL,
    Country  TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Island   TEXT DEFAULT '' NOT NULL REFERENCES island (Name),
    PRIMARY KEY (City, Province, Country, Island),
    FOREIGN KEY (City, Province) REFERENCES city (Name, Province),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `mergesWith`
(
    Sea1 TEXT DEFAULT '' NOT NULL REFERENCES sea (Name),
    Sea2 TEXT DEFAULT '' NOT NULL REFERENCES sea (Name),
    PRIMARY KEY (Sea1, Sea2)
);
CREATE TABLE `mountain`
(
    Name      TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Mountains TEXT,
    Height    FLOAT,
    Type      TEXT,
    Longitude FLOAT,
    Latitude  FLOAT
);
CREATE TABLE `mountainOnIsland`
(
    Mountain TEXT DEFAULT '' NOT NULL REFERENCES mountain (Name),
    Island   TEXT DEFAULT '' NOT NULL REFERENCES island (Name),
    PRIMARY KEY (Mountain, Island)
);
CREATE TABLE `organization`
(
    Abbreviation TEXT NOT NULL PRIMARY KEY,
    Name         TEXT NOT NULL UNIQUE,
    City         TEXT,
    Country      TEXT REFERENCES country (Code),
    Province     TEXT,
    Established  DATE,
    FOREIGN KEY (City, Province) REFERENCES city (Name, Province),
    FOREIGN KEY (Province, Country) REFERENCES province (Name, Country)
);
CREATE TABLE `politics`
(
    Country      TEXT DEFAULT '' NOT NULL PRIMARY KEY REFERENCES country (Code),
    Independence DATE,
    Dependent    TEXT REFERENCES country (Code),
    Government   TEXT
);
CREATE TABLE `population`
(
    Country           TEXT DEFAULT '' NOT NULL PRIMARY KEY REFERENCES country (Code),
    Population_Growth FLOAT,
    Infant_Mortality  FLOAT
);
CREATE TABLE `province`
(
    Name       TEXT NOT NULL,
    Country    TEXT NOT NULL REFERENCES country (Code),
    Population INT,
    Area       FLOAT,
    Capital    TEXT,
    CapProv    TEXT,
    PRIMARY KEY (Name, Country)
);
CREATE TABLE `religion`
(
    Country    TEXT DEFAULT '' NOT NULL REFERENCES country (Code),
    Name       TEXT DEFAULT '' NOT NULL,
    Percentage FLOAT,
    PRIMARY KEY (Name, Country)
);
CREATE TABLE `river`
(
    Name             TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    River            TEXT,
    Lake             TEXT REFERENCES lake (Name),
    Sea              TEXT,
    Length           FLOAT,
    SourceLongitude  FLOAT,
    SourceLatitude   FLOAT,
    Mountains        TEXT,
    SourceAltitude   FLOAT,
    EstuaryLongitude FLOAT,
    EstuaryLatitude  FLOAT
);
CREATE TABLE `sea`
(
    Name  TEXT DEFAULT '' NOT NULL PRIMARY KEY,
    Depth FLOAT
);
CREATE TABLE `target`
(
    Country TEXT NOT NULL PRIMARY KEY REFERENCES country (Code),
    Target  TEXT
);
