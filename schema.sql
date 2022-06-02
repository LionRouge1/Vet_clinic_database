/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED DEFAULT AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD species VARCHAR(100);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD species_id INT;

ALTER TABLE animals 
ADD species_id INT;

/* Query multiple tables */

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY (id)
);