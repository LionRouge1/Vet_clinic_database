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

/* ADD JOIN TABLE FOR VISITS */

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age NUMERIC,
    date_of_graduation DATE
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date_of_visit DATE,
    CONSTRAINT animals_vets PRIMARY KEY (animal_id, vets_id, date_of_visit)
);

CREATE TABLE specializations (
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    CONSTRAINT species_vets PRIMARY KEY (species_id, vets_id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create index on visits table --
CREATE INDEX ON visits (animal_id);

create index on visits (vet_id)
where vet_id = 2;

CREATE INDEX email_index ON owners (email);