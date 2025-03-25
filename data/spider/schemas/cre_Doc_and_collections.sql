CREATE TABLE Document_Subsets
(
    Document_Subset_ID      INTEGER      NOT NULL,
    Document_Subset_Name    VARCHAR(255) NOT NULL,
    Document_Subset_Details VARCHAR(255) NOT NULL,
    PRIMARY KEY (Document_Subset_ID)
);
CREATE TABLE Collection_Subsets
(
    Collection_Subset_ID       INTEGER      NOT NULL,
    Collection_Subset_Name     VARCHAR(255) NOT NULL,
    Collecrtion_Subset_Details VARCHAR(255) NOT NULL,
    PRIMARY KEY (Collection_Subset_ID)
);
CREATE TABLE Document_Objects
(
    Document_Object_ID        INTEGER NOT NULL,
    Parent_Document_Object_ID INTEGER,
    Owner                     VARCHAR(255),
    Description               VARCHAR(255),
    Other_Details             VARCHAR(255),
    PRIMARY KEY (Document_Object_ID),
    FOREIGN KEY (Parent_Document_Object_ID) references Document_Objects (Document_Object_ID)
);
CREATE TABLE Collections
(
    Collection_ID          INTEGER NOT NULL,
    Parent_Collection_ID   INTEGER,
    Collection_Name        VARCHAR(255),
    Collection_Description VARCHAR(255),
    PRIMARY KEY (Collection_ID),
    FOREIGN KEY (Parent_Collection_ID) references Collections (Collection_ID)
);
CREATE TABLE Documents_in_Collections
(
    Document_Object_ID INTEGER NOT NULL,
    Collection_ID      INTEGER NOT NULL,
    PRIMARY KEY (Document_Object_ID, Collection_ID),
    FOREIGN KEY (Document_Object_ID) REFERENCES Document_Objects (Document_Object_ID),
    FOREIGN KEY (Collection_ID) REFERENCES Collections (Collection_ID)
);
CREATE TABLE Document_Subset_Members
(
    Document_Object_ID         INTEGER NOT NULL,
    Related_Document_Object_ID INTEGER NOT NULL,
    Document_Subset_ID         INTEGER NOT NULL,
    PRIMARY KEY (Document_Object_ID, Related_Document_Object_ID),
    FOREIGN KEY (Document_Object_ID) REFERENCES Document_Objects (Document_Object_ID),
    FOREIGN KEY (Related_Document_Object_ID) REFERENCES Document_Objects
        (Document_Object_ID),
    FOREIGN KEY (Document_Subset_ID) REFERENCES Document_Subsets (Document_Subset_ID)
);
CREATE TABLE Collection_Subset_Members
(
    Collection_ID         INTEGER NOT NULL,
    Related_Collection_ID INTEGER NOT NULL,
    Collection_Subset_ID  INTEGER NOT NULL,
    PRIMARY KEY (Collection_ID, Related_Collection_ID),
    FOREIGN KEY (Collection_ID) REFERENCES Collections (Collection_ID),
    FOREIGN KEY (Related_Collection_ID) REFERENCES Collections (Collection_ID),
    FOREIGN KEY (Collection_Subset_ID) REFERENCES Collection_Subsets (Collection_Subset_ID)
);
