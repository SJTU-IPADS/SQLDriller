CREATE TABLE CBSA
(
    CBSA      INT PRIMARY KEY,
    CBSA_name TEXT,
    CBSA_type TEXT
);
CREATE TABLE state
(
    abbreviation TEXT PRIMARY KEY,
    name         TEXT
);
CREATE TABLE congress
(
    cognress_rep_id TEXT PRIMARY KEY,
    first_name      TEXT,
    last_name       TEXT,
    CID             TEXT,
    party           TEXT,
    state           TEXT,
    abbreviation    TEXT,
    House           TEXT,
    District        INT,
    land_area       FLOAT,
    FOREIGN KEY (abbreviation) REFERENCES state (abbreviation)
);
CREATE TABLE zip_data
(
    zip_code                         INT PRIMARY KEY,
    city                             TEXT,
    state                            TEXT,
    multi_county                     TEXT,
    type                             TEXT,
    organization                     TEXT,
    time_zone                        TEXT,
    daylight_savings                 TEXT,
    latitude                         FLOAT,
    longitude                        FLOAT,
    elevation                        INT,
    state_fips                       INT,
    county_fips                      INT,
    region                           TEXT,
    division                         TEXT,
    population_2020                  INT,
    population_2010                  INT,
    households                       INT,
    avg_house_value                  INT,
    avg_income_per_household         INT,
    persons_per_household            FLOAT,
    white_population                 INT,
    black_population                 INT,
    hispanic_population              INT,
    asian_population                 INT,
    american_indian_population       INT,
    hawaiian_population              INT,
    other_population                 INT,
    male_population                  INT,
    female_population                INT,
    median_age                       FLOAT,
    male_median_age                  FLOAT,
    female_median_age                FLOAT,
    residential_mailboxes            INT,
    business_mailboxes               INT,
    total_delivery_receptacles       INT,
    businesses                       INT,
    `1st_quarter_payroll`            INT,
    annual_payroll                   INT,
    employees                        INT,
    water_area                       FLOAT,
    land_area                        FLOAT,
    single_family_delivery_units     INT,
    multi_family_delivery_units      INT,
    total_beneficiaries              INT,
    retired_workers                  INT,
    disabled_workers                 INT,
    parents_and_widowed              INT,
    spouses                          INT,
    children                         INT,
    over_65                          INT,
    monthly_benefits_all             INT,
    monthly_benefits_retired_workers INT,
    monthly_benefits_widowed         INT,
    CBSA                             INT,
    FOREIGN KEY (state) REFERENCES state (abbreviation),
    FOREIGN KEY (CBSA) REFERENCES CBSA (CBSA)
);
CREATE TABLE alias
(
    zip_code INT PRIMARY KEY,
    alias    TEXT,
    FOREIGN KEY (zip_code) REFERENCES zip_data (zip_code)
);
CREATE TABLE area_code
(
    zip_code  INT,
    area_code INT,
    PRIMARY KEY (zip_code, area_code),
    FOREIGN KEY (zip_code) REFERENCES zip_data (zip_code)
);
CREATE TABLE avoid
(
    zip_code  INT,
    bad_alias TEXT,
    PRIMARY KEY (zip_code, bad_alias),
    FOREIGN KEY (zip_code) REFERENCES zip_data (zip_code)
);
CREATE TABLE country
(
    zip_code INT,
    county   TEXT,
    state    TEXT,
    PRIMARY KEY (zip_code, county),
    FOREIGN KEY (zip_code) REFERENCES zip_data (zip_code),
    FOREIGN KEY (state) REFERENCES state (abbreviation)
);
CREATE TABLE zip_congress
(
    zip_code INT,
    district TEXT,
    PRIMARY KEY (zip_code, district),
    FOREIGN KEY (district) REFERENCES congress (cognress_rep_id),
    FOREIGN KEY (zip_code) REFERENCES zip_data (zip_code)
);
