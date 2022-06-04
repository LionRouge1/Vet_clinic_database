/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, 'TRUE', 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, 'TRUE', 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, 'FALSE', 15.04);
INSERT INTO animals VALUES (4, 'Pikachu', '2017-05-12', 5, 'TRUE', 11);


INSERT INTO animals 
(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '2020-02-08', 0, 'FALSE', -11),
(6, 'Plantmon', '2021-11-15', 2, 'TRUE', -5.7),
(7, 'Squirtle', '1993-04-02', 3, 'FALSE', -12.13),
(8, 'Angemon', '2005-06-12', 1, 'TRUE', -45),
(9, 'Boarmon', '2005-06-07', 7, 'TRUE', 20.4),
(10, 'Blossom', '1998-10-13', 3, 'TRUE', 17),
(11, 'Ditto', '2022-05-13', 4, 'TRUE', 22);

/* Query multiple tables */

INSERT INTO owners 
(full_name, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species 
(name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals 
SET species_id = 1
WHERE name LIKE '%mon';

UPDATE animals 
SET species_id = 2
WHERE species_id IS NULL ;

UPDATE animals 
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = 2
WHERE name = 'Gabumon' 
OR name = 'Pikachu';

UPDATE animals 
SET owner_id = 3
WHERE name = 'Devimon' 
OR name = 'Plantmon';

UPDATE animals 
SET owner_id = 4
WHERE name = 'Charmander' 
OR name = 'Squirtle' 
OR name = 'Blossom';

UPDATE animals 
SET owner_id = 5
WHERE name = 'Angemon' 
OR name = 'Boarmon';

INSERT INTO visits 
VALUES
(11, 1, '2020-05-24'), 
(11, 3, '2020-07-22'), 
(12, 4, '2021-02-02'), 
(15, 2, '2020-01-05'), 
(15, 2, '2020-03-08'), 
(15, 2, '2020-05-14'), 
(13, 3, '2021-05-04'), 
(19, 4, '2021-02-24'), 
(17, 2, '2019-12-21'), 
(17, 1,'2020-08-10'), 
(17, 2, '2021-04-07'), 
(20, 3, '2019-09-29'), 
(18, 4, '2020-10-03'), 
(18, 4, '2020-11-04'), 
(14, 2, '2019-01-24'), 
(14, 2, '2019-05-15'), 
(14, 2, '2020-02-27'), 
(14, 2, '2020-08-03'), 
(16, 3, '2020-05-24'), 
(16, 1, '2020-01-11');