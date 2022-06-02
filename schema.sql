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



