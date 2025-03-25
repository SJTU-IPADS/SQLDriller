CREATE TABLE Apartment_Buildings
(
    building_id          INTEGER NOT NULL,
    building_short_name  CHAR(15),
    building_full_name   VARCHAR(80),
    building_description VARCHAR(255),
    building_address     VARCHAR(255),
    building_manager     VARCHAR(50),
    building_phone       VARCHAR(80),
    PRIMARY KEY (building_id),
    UNIQUE (building_id)
);

CREATE TABLE Apartments (
apt_id INTEGER NOT NULL ,
building_id INTEGER NOT NULL,
apt_type_code CHAR(15),
apt_number CHAR(10),
bathroom_count INTEGER,
bedroom_count INTEGER,
room_count CHAR(5),
PRIMARY KEY (apt_id),
UNIQUE (apt_id),
FOREIGN KEY (building_id) REFERENCES Apartment_Buildings (building_id)
);

CREATE TABLE Apartment_Facilities (
apt_id INTEGER NOT NULL,
facility_code CHAR(15) NOT NULL,
PRIMARY KEY (apt_id, facility_code),
FOREIGN KEY (apt_id) REFERENCES Apartments (apt_id)
);
CREATE TABLE Guests (
guest_id INTEGER NOT NULL ,
gender_code CHAR(1),
guest_first_name VARCHAR(80),
guest_last_name VARCHAR(80),
date_of_birth DATETIME,
PRIMARY KEY (guest_id),
UNIQUE (guest_id)
);



CREATE TABLE Apartment_Bookings (
apt_booking_id INTEGER NOT NULL,
apt_id INTEGER,
guest_id INTEGER NOT NULL,
booking_status_code CHAR(15) NOT NULL,
booking_start_date DATETIME,
booking_end_date DATETIME,
PRIMARY KEY (apt_booking_id),
UNIQUE (apt_booking_id),
FOREIGN KEY (apt_id) REFERENCES Apartments (apt_id),
FOREIGN KEY (guest_id) REFERENCES Guests (guest_id)
);
CREATE TABLE View_Unit_Status (
apt_id INTEGER,
apt_booking_id INTEGER,
status_date DATETIME NOT NULL,
available_yn BIT,
PRIMARY KEY (status_date),
FOREIGN KEY (apt_id) REFERENCES Apartments (apt_id),
FOREIGN KEY (apt_booking_id) REFERENCES Apartment_Bookings (apt_booking_id)
);

