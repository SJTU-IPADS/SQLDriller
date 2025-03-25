CREATE TABLE film_text
(
    film_id     INT  NOT NULL PRIMARY KEY,
    title       TEXT NOT NULL,
    description TEXT NULL
);
CREATE TABLE `actor`
(
    actor_id    INT PRIMARY KEY AUTO_INCREMENT,
    first_name  TEXT                                 NOT NULL,
    last_name   TEXT                                 NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `address`
(
    address_id  INT PRIMARY KEY AUTO_INCREMENT,
    address     TEXT                                 NOT NULL,
    address2    TEXT,
    district    TEXT                                 NOT NULL,
    city_id     INT                                  NOT NULL REFERENCES city (city_id),
    postal_code TEXT,
    phone       TEXT                                 NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `category`
(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name        TEXT                                 NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `city`
(
    city_id     INT PRIMARY KEY AUTO_INCREMENT,
    city        TEXT                                 NOT NULL,
    country_id  INT                                  NOT NULL REFERENCES country (country_id),
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `country`
(
    country_id  INT PRIMARY KEY AUTO_INCREMENT,
    country     TEXT                                 NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `customer`
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id    INT                                  NOT NULL REFERENCES store (store_id),
    first_name  TEXT                                 NOT NULL,
    last_name   TEXT                                 NOT NULL,
    email       TEXT,
    address_id  INT                                  NOT NULL REFERENCES address (address_id),
    active      INT      DEFAULT 1                   NOT NULL,
    create_date DATETIME                             NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `film`
(
    film_id              INT PRIMARY KEY AUTO_INCREMENT,
    title                TEXT                                 NOT NULL,
    description          TEXT,
    release_year         TEXT,
    language_id          INT                                  NOT NULL REFERENCES language (language_id),
    original_language_id INT REFERENCES language (language_id),
    rental_duration      INT      DEFAULT 3                   NOT NULL,
    rental_rate          FLOAT    DEFAULT 4.99                NOT NULL,
    length               INT,
    replacement_cost     FLOAT    DEFAULT 19.99               NOT NULL,
    rating               TEXT     DEFAULT 'G',
    special_features     TEXT,
    last_update          DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `film_actor`
(
    actor_id    INT                                  NOT NULL REFERENCES actor (actor_id),
    film_id     INT                                  NOT NULL REFERENCES film (film_id),
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (actor_id, film_id)
);
CREATE TABLE `film_category`
(
    film_id     INT                                  NOT NULL REFERENCES film (film_id),
    category_id INT                                  NOT NULL REFERENCES category (category_id),
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (film_id, category_id)
);
CREATE TABLE `inventory`
(
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id      INT                                  NOT NULL REFERENCES film (film_id),
    store_id     INT                                  NOT NULL REFERENCES store (store_id),
    last_update  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `language`
(
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    name        TEXT                                 NOT NULL,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `payment`
(
    payment_id   INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT                                  NOT NULL REFERENCES customer (customer_id),
    staff_id     INT                                  NOT NULL REFERENCES staff (staff_id),
    rental_id    INT REFERENCES rental (rental_id),
    amount       FLOAT                                NOT NULL,
    payment_date DATETIME                             NOT NULL,
    last_update  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `rental`
(
    rental_id    INT PRIMARY KEY AUTO_INCREMENT,
    rental_date  DATETIME                             NOT NULL,
    inventory_id INT                                  NOT NULL REFERENCES inventory (inventory_id),
    customer_id  INT                                  NOT NULL REFERENCES customer (customer_id),
    return_date  DATETIME,
    staff_id     INT                                  NOT NULL REFERENCES staff (staff_id),
    last_update  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (rental_date, inventory_id, customer_id)
);
CREATE TABLE `staff`
(
    staff_id    INT PRIMARY KEY AUTO_INCREMENT,
    first_name  TEXT                                 NOT NULL,
    last_name   TEXT                                 NOT NULL,
    address_id  INT                                  NOT NULL REFERENCES address (address_id),
    picture     BLOB,
    email       TEXT,
    store_id    INT                                  NOT NULL REFERENCES store (store_id),
    active      INT      DEFAULT 1                   NOT NULL,
    username    TEXT                                 NOT NULL,
    password    TEXT,
    last_update DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `store`
(
    store_id         INT PRIMARY KEY AUTO_INCREMENT,
    manager_staff_id INT                                  NOT NULL UNIQUE REFERENCES staff (staff_id),
    address_id       INT                                  NOT NULL REFERENCES address (address_id),
    last_update      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);