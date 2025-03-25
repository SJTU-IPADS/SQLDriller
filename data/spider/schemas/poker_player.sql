CREATE TABLE `poker_player`
(
    `Poker_Player_ID`  int,
    `People_ID`        int,
    `Final_Table_Made` real,
    `Best_Finish`      real,
    `Money_Rank`       real,
    `Earnings`         real,
    PRIMARY KEY (`Poker_Player_ID`),
    FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`)
);

CREATE TABLE `people`
(
    `People_ID`   int,
    `Nationality` text,
    `Name`        text,
    `Birth_Date`  text,
    `Height`      real,
    PRIMARY KEY (`People_ID`)
);


