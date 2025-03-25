CREATE TABLE `building`
(
    `building_id`      text,
    `Name`             text,
    `Street_address`   text,
    `Years_as_tallest` text,
    `Height_feet`      int,
    `Floors`           int,
    PRIMARY KEY (`building_id`)
);

CREATE TABLE `Institution`
(
    `Institution_id`     text,
    `Institution`        text,
    `Location`           text,
    `Founded`            real,
    `Type`               text,
    `Enrollment`         int,
    `Team`               text,
    `Primary_Conference` text,
    `building_id`        text,
    PRIMARY KEY (`Institution_id`),
    FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`)
);

CREATE TABLE `protein`
(
    `common_name`                        text,
    `protein_name`                       text,
    `divergence_from_human_lineage`      real,
    `accession_number`                   text,
    `sequence_length`                    real,
    `sequence_identity_to_human_protein` text,
    `Institution_id`                     text,
    PRIMARY KEY (`common_name`),
    FOREIGN KEY (`Institution_id`) REFERENCES `Institution` (`Institution_id`)
);





