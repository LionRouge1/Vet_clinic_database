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

-- Who was the last animal seen by William Tatcher --
SELECT A.name, V.name, VS.date_of_visit
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
JOIN vets V
ON VS.vets_id = V.id
WHERE V.name = 'William Tatcher'
ORDER BY VS.date_of_visit desc
LIMIT 1;

-- How many different animals did Stephanie Mendez see --
SELECT COUNT(A.name)                   
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
JOIN vets V
ON VS.vets_id = V.id
WHERE V.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties --
SELECT V.name AS Vet, S.name AS Specialization
FROM vets V
JOIN specializations spts
ON V.id = spts.vets_id
JOIN species S
ON spts.species_id = S.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020 --
SELECT A.name AS animals, VS.date_of_visit
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
JOIN vets V
ON VS.vets_id = V.id
WHERE VS.date_of_visit BETWEEN '2020/04/01' AND '2020/08/30';

-- What animal has the most visits to vets --
SELECT A.name AS animals, COUNT(A.name) AS Nb_of_visits
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
GROUP BY A.name
ORDER BY Nb_of_visits desc
LIMIT 1;

-- Who wa Maisy Smith's first visit? --
SELECT A.name, V.name, VS.date_of_visit
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
JOIN vets V
ON VS.vets_id = V.id
WHERE V.name = 'Maisy Smith' 
ORDER BY VS.date_of_visit asc
LIMIT 1;

-- Details for most recent visit --
SELECT *                               
FROM animals A
JOIN visits VS
ON A.id = VS.animal_id
JOIN vets V
ON VS.vets_id = V.id
ORDER BY VS.date_of_visit asc
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?--
vet_clinic=# SELECT COUNT(MS.Vet_name) AS visits FROM 
(SELECT  Vt.name AS Vet_name, A.name AS animal, Vs.date_of_visit, Sp.name as specialty FROM vets Vt
  LEFT JOIN specializations Sz ON Vt.id = Sz.vets_id
  LEFT JOIN species Sp ON Sz.species_id = Sp.id
  JOIN visits Vs ON Vt.id = Vs.vets_id
  JOIN animals A ON Vs.animal_id = A.id
  WHERE Sp.name IS NULL) as MS;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT S.name AS Species_name, MS2.species_id, MS2.Total_number AS Total_number_of_species FROM species S
JOIN (SELECT MS.species_id, MS.Total_number FROM 
(SELECT A.species_id, COUNT(A.species_id) AS Total_number FROM vets Vt
  LEFT JOIN specializations Sz ON Vt.id = Sz.vets_id
  LEFT JOIN species Sp ON Sz.species_id = Sp.id
  JOIN visits Vs ON Vt.id = Vs.vets_id
  JOIN animals A ON Vs.animal_id = A.id
  WHERE Vt.name = 'Maisy Smith'
  GROUP BY A.species_id) as MS
WHERE MS.Total_number = (SELECT MAX(MS.Total_number) FROM
(SELECT A.species_id, COUNT(A.species_id) AS Total_number FROM vets Vt
  LEFT JOIN specializations Sz ON Vt.id = Sz.vets_id
  LEFT JOIN species Sp ON Sz.species_id = Sp.id
  JOIN visits Vs ON Vt.id = Vs.vets_id
  JOIN animals A ON Vs.animal_id = A.id
  WHERE Vt.name = 'Maisy Smith'
  GROUP BY A.species_id) as MS)) AS MS2
  ON S.id = MS2.species_id; 