PRAGMA foreign_keys = ON;

CREATE TABLE "musical" (
"Musical_ID" int,
"Name" text,
"Year" int,
"Award" text,
"Category" text,
"Nominee" text,
"Result" text,
PRIMARY KEY ("Musical_ID")
);

CREATE TABLE "actor" (
"Actor_ID" int,
"Name" text,
"Musical_ID" int,
"Character" text,
"Duration" text,
"age" int,
PRIMARY KEY ("Actor_ID"),
FOREIGN KEY ("Musical_ID") REFERENCES `musical` (`Musical_ID`)
);
