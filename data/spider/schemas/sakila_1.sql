CREATE TABLE actor
(
    actor_id    SMALLINT UNSIGNED NOT NULL,
    first_name  VARCHAR(45)       NOT NULL,
    last_name   VARCHAR(45)       NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id)
);


CREATE TABLE address
(
    address_id  SMALLINT UNSIGNED NOT NULL,
    address     VARCHAR(50)       NOT NULL,
    address2    VARCHAR(50)                DEFAULT NULL,
    district    VARCHAR(20)       NOT NULL,
    city_id     SMALLINT UNSIGNED NOT NULL,
    postal_code VARCHAR(10)                DEFAULT NULL,
    phone       VARCHAR(20)       NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (address_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);


CREATE TABLE category
(
    category_id TINYINT UNSIGNED NOT NULL,
    name        VARCHAR(25)      NOT NULL,
    last_update TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
);

CREATE TABLE city
(
    city_id     SMALLINT UNSIGNED NOT NULL,
    city        VARCHAR(50)       NOT NULL,
    country_id  SMALLINT UNSIGNED NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (city_id),
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);


CREATE TABLE country
(
    country_id  SMALLINT UNSIGNED NOT NULL,
    country     VARCHAR(50)       NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (country_id)
);



CREATE TABLE customer
(
    customer_id SMALLINT UNSIGNED NOT NULL,
    store_id    TINYINT UNSIGNED  NOT NULL,
    first_name  VARCHAR(45)       NOT NULL,
    last_name   VARCHAR(45)       NOT NULL,
    email       VARCHAR(50)                DEFAULT NULL,
    address_id  SMALLINT UNSIGNED NOT NULL,
    active      BOOLEAN           NOT NULL DEFAULT TRUE,
    create_date DATETIME          NOT NULL,
    last_update TIMESTAMP                  DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id)
);



CREATE TABLE film
(
    film_id              SMALLINT UNSIGNED NOT NULL,
    title                VARCHAR(255)      NOT NULL,
    description          TEXT                       DEFAULT NULL,
    release_year         YEAR                       DEFAULT NULL,
    language_id          TINYINT UNSIGNED  NOT NULL,
    original_language_id TINYINT UNSIGNED           DEFAULT NULL,
    rental_duration      TINYINT UNSIGNED  NOT NULL DEFAULT 3,
    rental_rate          DECIMAL(4, 2)     NOT NULL DEFAULT 4.99,
    length               SMALLINT UNSIGNED          DEFAULT NULL,
    replacement_cost     DECIMAL(5, 2)     NOT NULL DEFAULT 19.99,
    rating               char                       DEFAULT 'G',
    special_features     text                       DEFAULT NULL,
    last_update          TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (film_id),
    FOREIGN KEY (language_id) REFERENCES language (language_id),
    FOREIGN KEY (original_language_id) REFERENCES language (language_id)
);



CREATE TABLE film_actor
(
    actor_id    SMALLINT UNSIGNED NOT NULL,
    film_id     SMALLINT UNSIGNED NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id)
);



CREATE TABLE film_category
(
    film_id     SMALLINT UNSIGNED NOT NULL,
    category_id TINYINT UNSIGNED  NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);



CREATE TABLE film_text
(
    film_id     SMALLINT     NOT NULL,
    title       VARCHAR(255) NOT NULL,
    description TEXT,
    PRIMARY KEY (film_id)
);



CREATE TABLE inventory
(
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    film_id      SMALLINT UNSIGNED  NOT NULL,
    store_id     TINYINT UNSIGNED   NOT NULL,
    last_update  TIMESTAMP          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id)
);



CREATE TABLE language
(
    language_id TINYINT UNSIGNED NOT NULL,
    name        CHAR(20)         NOT NULL,
    last_update TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (language_id)
);



CREATE TABLE payment
(
    payment_id   SMALLINT UNSIGNED NOT NULL,
    customer_id  SMALLINT UNSIGNED NOT NULL,
    staff_id     TINYINT UNSIGNED  NOT NULL,
    rental_id    INT       DEFAULT NULL,
    amount       DECIMAL(5, 2)     NOT NULL,
    payment_date DATETIME          NOT NULL,
    last_update  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (rental_id) REFERENCES rental (rental_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);



CREATE TABLE rental
(
    rental_id    INT                NOT NULL,
    rental_date  DATETIME           NOT NULL,
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    customer_id  SMALLINT UNSIGNED  NOT NULL,
    return_date  DATETIME                    DEFAULT NULL,
    staff_id     TINYINT UNSIGNED   NOT NULL,
    last_update  TIMESTAMP          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rental_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);



CREATE TABLE staff
(
    staff_id    TINYINT UNSIGNED  NOT NULL,
    first_name  VARCHAR(45)       NOT NULL,
    last_name   VARCHAR(45)       NOT NULL,
    address_id  SMALLINT UNSIGNED NOT NULL,
    picture     BLOB                       DEFAULT NULL,
    email       VARCHAR(50)                DEFAULT NULL,
    store_id    TINYINT UNSIGNED  NOT NULL,
    active      BOOLEAN           NOT NULL DEFAULT TRUE,
    username    VARCHAR(16)       NOT NULL,
    password    VARCHAR(40)                DEFAULT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);



CREATE TABLE store
(
    store_id         TINYINT UNSIGNED  NOT NULL,
    manager_staff_id TINYINT UNSIGNED  NOT NULL,
    address_id       SMALLINT UNSIGNED NOT NULL,
    last_update      TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (store_id),
    FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);






























