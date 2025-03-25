CREATE TABLE `Affiliation`
(
    `affiliation_id` integer NOT NULL,
    `name`           varchar(255) DEFAULT NULL,
    `address`        varchar(255) DEFAULT NULL,
    PRIMARY KEY (`affiliation_id`)
);
CREATE TABLE `Author`
(
    `author_id` integer NOT NULL,
    `name`      varchar(255) DEFAULT NULL,
    `email`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`author_id`)
);
CREATE TABLE `Author_list`
(
    `paper_id`       varchar(25) NOT NULL,
    `author_id`      integer     NOT NULL,
    `affiliation_id` integer DEFAULT NULL,
    PRIMARY KEY (`paper_id`, `author_id`),
    FOREIGN KEY (`paper_id`) REFERENCES `Paper` (`paper_id`),
    FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`),
    FOREIGN KEY (`affiliation_id`) REFERENCES `Affiliation` (`affiliation_id`)
);
CREATE TABLE `Citation`
(
    `paper_id`       varchar(25) NOT NULL,
    `cited_paper_id` varchar(25) NOT NULL,
    PRIMARY KEY (`paper_id`, `cited_paper_id`),
    FOREIGN KEY (`paper_id`) REFERENCES `Paper` (`paper_id`),
    FOREIGN KEY (`cited_paper_id`) REFERENCES `Paper` (`paper_id`)
);
CREATE TABLE `Paper`
(
    `paper_id` varchar(25) NOT NULL,
    `title`    varchar(255) DEFAULT NULL,
    `venue`    varchar(255) DEFAULT NULL,
    `year`     integer      DEFAULT NULL,
    PRIMARY KEY (`paper_id`)
);
