CREATE TABLE Dish
(
    id             INT PRIMARY KEY,
    name           TEXT,
    description    TEXT,
    menus_appeared INT,
    times_appeared INT,
    first_appeared INT,
    last_appeared  INT,
    lowest_price   FLOAT,
    highest_price  FLOAT
);
CREATE TABLE Menu
(
    id                   INT PRIMARY KEY,
    name                 TEXT,
    sponsor              TEXT,
    event                TEXT,
    venue                TEXT,
    place                TEXT,
    physical_description TEXT,
    occasion             TEXT,
    notes                TEXT,
    call_number          TEXT,
    keywords             TEXT,
    language             TEXT,
    date                 DATE,
    location             TEXT,
    location_type        TEXT,
    currency             TEXT,
    currency_symbol      TEXT,
    status               TEXT,
    page_count           INT,
    dish_count           INT
);
CREATE TABLE MenuPage
(
    id          INT PRIMARY KEY,
    menu_id     INT,
    page_number INT,
    image_id    FLOAT,
    full_height INT,
    full_width  INT,
    uuid        TEXT,
    FOREIGN KEY (menu_id) REFERENCES Menu (id)
);
CREATE TABLE MenuItem
(
    id           INT PRIMARY KEY,
    menu_page_id INT,
    price        FLOAT,
    high_price   FLOAT,
    dish_id      INT,
    created_at   TEXT,
    updated_at   TEXT,
    xpos         FLOAT,
    ypos         FLOAT,
    FOREIGN KEY (dish_id) REFERENCES Dish (id),
    FOREIGN KEY (menu_page_id) REFERENCES MenuPage (id)
);
