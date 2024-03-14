
CREATE TABLE human(
    id SERIAL PRIMARY KEY,
    name_human VARCHAR(20),
    age_human DECIMAL(2,0),
    sex_human CHAR(1),
    nationality_human VARCHAR(20)
);
CREATE TABLE tombstone(
    id SERIAL PRIMARY KEY,
    material_tombstone VARCHAR(50),
    temperature_tombstone DECIMAL(3,2),
    color_tombstone VARCHAR(30)
);
CREATE TABLE stone(
    id SERIAL PRIMARY KEY,
    color_stone VARCHAR(10),
    size_stone INTEGER,
    id_human INTEGER REFERENCES human(id),
    id_tombstone INTEGER REFERENCES tombstone(id)
);
CREATE TABLE creature(
    id SERIAL PRIMARY KEY,
    description_creature VARCHAR(50),
    name_creature VARCHAR(20),
    color_creature VARCHAR(10)
);
CREATE TABLE grave(
    id SERIAL PRIMARY KEY,
    size_grave INTEGER,
    year_grave DATE,
    id_tombstone INTEGER UNIQUE,
    FOREIGN KEY (id_tombstone) REFERENCES tombstone (id)
);
CREATE TABLE body(
    id SERIAL PRIMARY KEY,
    condition_body VARCHAR(20),
    name_body VARCHAR(20),
    id_grave INTEGER UNIQUE,
    FOREIGN KEY (id_grave) REFERENCES grave (id)
);
CREATE TABLE similarity(
    id SERIAL PRIMARY KEY,
    id_stone INTEGER,
    id_creature INTEGER,
    id_stone INTEGER REFERENCES stone(id),
    id_creature INTEGER REFERENCES creature(id)
);

INSERT INTO stone
VALUES('green', 12, 1, 2),
      ('green', 6, 2, 1);

INSERT INTO creature
VALUES ('звездчатые головы древних тварей', 'тварь', 'brown');

INSERT INTO body
VALUES ('растерзанное', 'тело');

INSERT INTO human
VALUES ('Leik', 24, 'm', 'american'),
       ('Jak', 31, 'm', 'canadian'),
       ('Jein', 27, 'f', 'canadian');

INSERT INTO grave
VALUES (12, '1998-09-10', 2),
       (12, '1948-11-29', 1),
       (12, '2000-03-08', 3);

INSERT INTO similarity
VALUES (2, 1);

INSERT INTO tombstone
VALUES ('гранитные плиты', -10.3, 'dirty dark grey'),
       ('мраморные плиты', -13.7, 'moldy brown');