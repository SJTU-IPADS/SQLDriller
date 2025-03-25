CREATE TABLE `city_channel`
(
    `ID`           int,
    `City`         text,
    `Station_name` text,
    `Owned_Since`  int,
    `Affiliation`  text,
    PRIMARY KEY (`ID`)
);
CREATE TABLE `radio`
(
    `Radio_ID`     int,
    `Transmitter`  text,
    `Radio_MHz`    real,
    `2FM_MHz`      real,
    `RnaG_MHz`     real,
    `Lyric_FM_MHz` real,
    `ERP_kW`       real,
    PRIMARY KEY (`Radio_ID`)
);
CREATE TABLE `tv_show`
(
    `tv_show_ID`       int,
    `tv_show_name`     text,
    `Sub_tittle`       text,
    `Next_show_name`   text,
    `Original_Airdate` date,
    PRIMARY KEY (`tv_show_ID`)
);
CREATE TABLE `city_channel_radio`
(
    `City_channel_ID` int,
    `Radio_ID`        int,
    `Is_online`       bool,
    PRIMARY KEY (`City_channel_ID`, `Radio_ID`),
    FOREIGN KEY (`City_channel_ID`) REFERENCES `city_channel` (`ID`),
    FOREIGN KEY (`Radio_ID`) REFERENCES `radio` (`Radio_ID`)
);
CREATE TABLE `city_channel_tv_show`
(
    `City_channel_ID` int,
    `tv_show_ID`      int,
    `Is_online`       bool,
    `Is_free`         bool,
    PRIMARY KEY (`City_channel_ID`, `tv_show_ID`),
    FOREIGN KEY (`City_channel_ID`) REFERENCES `city_channel` (`ID`),
    FOREIGN KEY (`tv_show_ID`) REFERENCES `tv_show` (`tv_show_ID`)
);
