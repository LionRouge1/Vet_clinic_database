/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
postgres-# WHERE name LIKE '%mon';

SELECT name                   
FROM animals
WHERE date_of_birth BETWEEN '2016/12/31' AND '2019/12/31';

SELECT name
FROM animals
WHERE neutered = 'TRUE'
AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name = 'Agumon'
OR name = 'Pikachu';

SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = 'TRUE';

SELECT *
FROM animals
WHERE name != 'Gabumon';

SELECT * 
FROM animals
WHERE weight_kg <= 10.4 AND weight_kg >= 17.3;

/* Query and update animals table */

SELECT COUNT(*) AS Total
FROM animals;

SELECT COUNT(*) as Not_escape
FROM animals
WHERE escape_attempts > 0;

SELECT AVG(weight_kg) as Average
FROM animals;

SELECT neutered, SUM(escape_attempts)
AS N_Escape  
FROM animals
GROUP BY neutered;

SELECT species, 
MAX(weight_kg) AS maximum, 
MIN(weight_kg) AS minimum
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as Average
FROM animals
WHERE date_of_birth BETWEEN '1990/12/31' AND '2000/12/31'
GROUP BY species;

/* Query multiple tables */
SELECT a.name, o.full_name, o.id
FROM animals a
INNER JOIN owners o
ON a.owner_id = o.id
where o.full_name = 'Melody Pond';

SELECT a.name, s.name
FROM animals a
JOIN species s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM animals a
RIGHT JOIN owners o
ON a.owner_id = o.id;

SELECT s.name, COUNT(a.name)
FROM animals a
JOIN species s
ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN owners o
ON a.owner_id = o.id
JOIN species s
ON a.species_id = s.id
WHERE s.name = 'Digimon' 
AND o.full_name = 'Jennifer Orwell';

SELECT a.name 
FROM  animals a
JOIN owners o
ON a.owner_id = o.id
WHERE a.escape_attempts = 0;

SELECT o.full_name, COUNT(o.full_name) 
AS nombre
FROM animals a
JOIN owners o
ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY nombre desc
LIMIT 1;
