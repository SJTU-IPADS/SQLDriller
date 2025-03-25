CREATE TABLE Ingredient
(
    ingredient_id INT PRIMARY KEY,
    category      TEXT,
    name          TEXT,
    plural        TEXT
);
CREATE TABLE Recipe
(
    recipe_id  INT PRIMARY KEY,
    title      TEXT,
    subtitle   TEXT,
    servings   INT,
    yield_unit TEXT,
    prep_min   INT,
    cook_min   INT,
    stnd_min   INT,
    source     TEXT,
    intro      TEXT,
    directions TEXT
);
CREATE TABLE Nutrition
(
    recipe_id     INT PRIMARY KEY,
    protein       FLOAT,
    carbo         FLOAT,
    alcohol       FLOAT,
    total_fat     FLOAT,
    sat_fat       FLOAT,
    cholestrl     FLOAT,
    sodium        FLOAT,
    iron          FLOAT,
    vitamin_c     FLOAT,
    vitamin_a     FLOAT,
    fiber         FLOAT,
    pcnt_cal_carb FLOAT,
    pcnt_cal_fat  FLOAT,
    pcnt_cal_prot FLOAT,
    calories      FLOAT,
    FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);
CREATE TABLE Quantity
(
    quantity_id   INT PRIMARY KEY,
    recipe_id     INT,
    ingredient_id INT,
    max_qty       FLOAT,
    min_qty       FLOAT,
    unit          TEXT,
    preparation   TEXT,
    optional      TEXT,
    FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient (ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Nutrition (recipe_id)
);
