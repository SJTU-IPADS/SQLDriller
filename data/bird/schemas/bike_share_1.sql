CREATE TABLE `station`
(
    id                INT NOT NULL PRIMARY KEY,
    name              TEXT,
    lat               FLOAT,
    long              FLOAT,
    dock_count        INT,
    city              TEXT,
    installation_date TEXT
);
CREATE TABLE `status`
(
    station_id      INT,
    bikes_available INT,
    docks_available INT,
    time            TEXT
);
CREATE TABLE `trip`
(
    id                 INT NOT NULL PRIMARY KEY,
    duration           INT,
    start_date         TEXT,
    start_station_name TEXT,
    start_station_id   INT,
    end_date           TEXT,
    end_station_name   TEXT,
    end_station_id     INT,
    bike_id            INT,
    subscription_type  TEXT,
    zip_code           INT
);
CREATE TABLE `weather`
(
    date                           TEXT,
    max_temperature_f              INT,
    mean_temperature_f             INT,
    min_temperature_f              INT,
    max_dew_point_f                INT,
    mean_dew_point_f               INT,
    min_dew_point_f                INT,
    max_humidity                   INT,
    mean_humidity                  INT,
    min_humidity                   INT,
    max_sea_level_pressure_inches  FLOAT,
    mean_sea_level_pressure_inches FLOAT,
    min_sea_level_pressure_inches  FLOAT,
    max_visibility_miles           INT,
    mean_visibility_miles          INT,
    min_visibility_miles           INT,
    max_wind_Speed_mph             INT,
    mean_wind_speed_mph            INT,
    max_gust_speed_mph             INT,
    precipitation_inches           TEXT,
    cloud_cover                    INT,
    events                         TEXT,
    wind_dir_degrees               INT,
    zip_code                       TEXT
);
