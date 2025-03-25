CREATE TABLE `station`
(
    `Station_ID`          int,
    `Name`                text,
    `Annual_entry_exit`   real,
    `Annual_interchanges` real,
    `Total_Passengers`    real,
    `Location`            text,
    `Main_Services`       text,
    `Number_of_Platforms` int,
    PRIMARY KEY (`Station_ID`)
);

CREATE TABLE `train`
(
    `Train_ID` int,
    `Name`     text,
    `Time`     text,
    `Service`  text,
    PRIMARY KEY (`Train_ID`)
);



CREATE TABLE `train_station`
(
    `Train_ID`   int,
    `Station_ID` int,
    PRIMARY KEY (`Train_ID`, `Station_ID`),
    FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
    FOREIGN KEY (`Station_ID`) REFERENCES `station` (`Station_ID`)
);



