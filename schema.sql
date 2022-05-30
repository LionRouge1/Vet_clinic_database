/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED DEFAULT AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts CHAR(15),
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
