CREATE TABLE Services
(
    Service_ID      INTEGER NOT NULL,
    Service_Details VARCHAR(255),
    PRIMARY KEY (Service_ID)
);
CREATE TABLE Customers
(
    Customer_ID      INTEGER      NOT NULL,
    Customer_Details VARCHAR(255) NOT NULL,
    PRIMARY KEY (Customer_ID)
);
CREATE TABLE Channels
(
    Channel_ID      INTEGER      NOT NULL,
    Channel_Details VARCHAR(255) NOT NULL,
    PRIMARY KEY (Channel_ID)
);
CREATE TABLE Customers_and_Services
(
    Customers_and_Services_ID      INTEGER  NOT NULL,
    Customer_ID                    INTEGER,
    Service_ID                     INTEGER,
    Customers_and_Services_Details CHAR(15) NOT NULL,
    PRIMARY KEY (Customers_and_Services_ID),
    FOREIGN KEY (Service_ID) REFERENCES Services (Service_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID)
);
CREATE TABLE Customer_Interactions
(
    Customer_Interaction_ID       INTEGER NOT NULL,
    Channel_ID                    INTEGER,
    Customer_ID                   INTEGER,
    Service_ID                    INTEGER,
    Status_Code                   CHAR(15),
    Services_and_Channels_Details VARCHAR(255),
    PRIMARY KEY (Customer_Interaction_ID),
    FOREIGN KEY (Service_ID) REFERENCES Services (Service_ID),
    FOREIGN KEY (Channel_ID) REFERENCES Channels (Channel_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID)
);
CREATE TABLE Integration_Platform
(
    Integration_Platform_ID      INTEGER      NOT NULL,
    Customer_Interaction_ID      INTEGER      NOT NULL,
    Integration_Platform_Details VARCHAR(255) NOT NULL,
    PRIMARY KEY (Integration_Platform_ID),
    FOREIGN KEY (Customer_Interaction_ID) REFERENCES Customer_Interactions (Customer_Interaction_ID)
);
CREATE TABLE Analytical_Layer
(
    Analytical_ID              INTEGER      NOT NULL,
    Customers_and_Services_ID  VARCHAR(40)  NOT NULL,
    Pattern_Recognition        VARCHAR(255) NOT NULL,
    Analytical_Layer_Type_Code CHAR(15),
    PRIMARY KEY (Analytical_ID),
    FOREIGN KEY (Customers_and_Services_ID) REFERENCES Customers_and_Services (Customers_and_Services_ID)
);
