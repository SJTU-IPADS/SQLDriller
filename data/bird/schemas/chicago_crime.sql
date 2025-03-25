CREATE TABLE Community_Area
(
    community_area_no   INT PRIMARY KEY,
    community_area_name TEXT,
    side                TEXT,
    population          TEXT
);
CREATE TABLE District
(
    district_no   INT PRIMARY KEY,
    district_name TEXT,
    address       TEXT,
    zip_code      INT,
    commander     TEXT,
    email         TEXT,
    phone         TEXT,
    fax           TEXT,
    tty           TEXT,
    twitter       TEXT
);
CREATE TABLE FBI_Code
(
    fbi_code_no   TEXT PRIMARY KEY,
    title         TEXT,
    description   TEXT,
    crime_against TEXT
);
CREATE TABLE IUCR
(
    iucr_no               TEXT PRIMARY KEY,
    primary_description   TEXT,
    secondary_description TEXT,
    index_code            TEXT
);
CREATE TABLE Neighborhood
(
    neighborhood_name TEXT PRIMARY KEY,
    community_area_no INT,
    FOREIGN KEY (community_area_no) REFERENCES Community_Area (community_area_no)
);
CREATE TABLE Ward
(
    ward_no                INT PRIMARY KEY,
    alderman_first_name    TEXT,
    alderman_last_name     TEXT,
    alderman_name_suffix   TEXT,
    ward_office_address    TEXT,
    ward_office_zip        TEXT,
    ward_email             TEXT,
    ward_office_phone      TEXT,
    ward_office_fax        TEXT,
    city_hall_office_room  INT,
    city_hall_office_phone TEXT,
    city_hall_office_fax   TEXT,
    Population             INT
);
CREATE TABLE Crime
(
    report_no            INT PRIMARY KEY,
    case_number          TEXT,
    date                 TEXT,
    block                TEXT,
    iucr_no              TEXT,
    location_description TEXT,
    arrest               TEXT,
    domestic             TEXT,
    beat                 INT,
    district_no          INT,
    ward_no              INT,
    community_area_no    INT,
    fbi_code_no          TEXT,
    latitude             TEXT,
    longitude            TEXT,
    FOREIGN KEY (ward_no) REFERENCES Ward (ward_no),
    FOREIGN KEY (iucr_no) REFERENCES IUCR (iucr_no),
    FOREIGN KEY (district_no) REFERENCES District (district_no),
    FOREIGN KEY (community_area_no) REFERENCES Community_Area (community_area_no),
    FOREIGN KEY (fbi_code_no) REFERENCES FBI_Code (fbi_code_no)
);
