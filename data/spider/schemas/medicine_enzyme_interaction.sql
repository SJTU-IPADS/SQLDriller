CREATE TABLE `medicine`
(
    `id`           int,
    `name`         text,
    `Trade_Name`   text,
    `FDA_approved` text,
    primary key (`id`)
);

CREATE TABLE `enzyme`
(
    `id`         int,
    `name`       text,
    `Location`   text,
    `Product`    text,
    `Chromosome` text,
    `OMIM`       int,
    `Porphyria`  text,
    primary key (`id`)
);


CREATE TABLE `medicine_enzyme_interaction`
(
    `enzyme_id`        int,
    `medicine_id`      int,
    `interaction_type` text,
    primary key (`enzyme_id`, `medicine_id`),
    foreign key (`enzyme_id`) references `enzyme` (`id`),
    foreign key (`medicine_id`) references `medicine` (`id`)
);












