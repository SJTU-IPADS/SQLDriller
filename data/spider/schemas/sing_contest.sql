CREATE TABLE `participants`
(
    `id`         int,
    `name`       text,
    `popularity` real,
    primary key (`id`)
);
CREATE TABLE `songs`
(
    `id`                  int,
    `language`            text,
    `original_artist`     text,
    `name`                text,
    `english_translation` text,
    primary key (`id`)
);
CREATE TABLE `performance_score`
(
    `participant_id`      int,
    `songs_id`            int,
    `voice_sound_quality` real,
    `rhythm_tempo`        real,
    `stage_presence`      real,
    primary key (`participant_id`, `songs_id`),
    foreign key (`participant_id`) references `participants` (`id`),
    foreign key (`songs_id`) references `songs` (`id`)
);
