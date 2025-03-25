CREATE TABLE PilotSkills
(
    pilot_name CHAR(15) NOT NULL,
    plane_name CHAR(15) NOT NULL,
    age        INTEGER,
    PRIMARY KEY (pilot_name, plane_name),
    FOREIGN KEY (plane_name) REFERENCES Hangar (plane_name)
);
CREATE TABLE Hangar
(
    plane_name CHAR(15) NOT NULL PRIMARY KEY,
    location   CHAR(15)
);
