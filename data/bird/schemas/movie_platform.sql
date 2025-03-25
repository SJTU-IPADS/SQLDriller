CREATE TABLE `lists`
(
    user_id                     INT REFERENCES lists_users (user_id),
    list_id                     INT NOT NULL PRIMARY KEY REFERENCES lists_users(list_id),
    list_title                  TEXT,
    list_movie_number           INT,
    list_update_timestamp_utc   TEXT,
    list_creation_timestamp_utc TEXT,
    list_followers              INT,
    list_url                    TEXT,
    list_comments               INT,
    list_description            TEXT,
    list_cover_image_url        TEXT,
    list_first_image_url        TEXT,
    list_second_image_url       TEXT,
    list_third_image_url        TEXT
);
CREATE TABLE `movies`
(
    movie_id             INT NOT NULL PRIMARY KEY,
    movie_title          TEXT,
    movie_release_year   INT,
    movie_url            TEXT,
    movie_title_language TEXT,
    movie_popularity     INT,
    movie_image_url      TEXT,
    director_id          TEXT,
    director_name        TEXT,
    director_url         TEXT
);
CREATE TABLE `ratings_users`
(
    user_id                 INT REFERENCES lists_users (user_id),
    rating_date_utc         TEXT,
    user_trialist           INT,
    user_subscriber         INT,
    user_avatar_image_url   TEXT,
    user_cover_image_url    TEXT,
    user_eligible_for_trial INT,
    user_has_payment_method INT
);
CREATE TABLE lists_users
(
    user_id                 INT NOT NULL,
    list_id                 INT NOT NULL,
    list_update_date_utc    TEXT,
    list_creation_date_utc  TEXT,
    user_trialist           INT,
    user_subscriber         INT,
    user_avatar_image_url   TEXT,
    user_cover_image_url    TEXT,
    user_eligible_for_trial TEXT,
    user_has_payment_method TEXT,
    PRIMARY KEY (user_id, list_id)
);

CREATE TABLE ratings
(
    movie_id                INT,
    rating_id               INT,
    rating_url              TEXT,
    rating_score            INT,
    rating_timestamp_utc    TEXT,
    critic                  TEXT,
    critic_likes            INT,
    critic_comments         INT,
    user_id                 INT,
    user_trialist           INT,
    user_subscriber         INT,
    user_eligible_for_trial INT,
    user_has_payment_method INT,
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    FOREIGN KEY (user_id) REFERENCES lists_users (user_id),
    FOREIGN KEY (user_id) REFERENCES ratings_users (user_id)
);
