use dataia_nancy;

-- -- Création table :
-- DROP TABLE IF EXISTS exo_semaine3;
-- create table exo_semaine3
-- (
--     resilies INT,
--     parcours INT,
--     anciennete INT,
--     demenagement INT,
--     sinistre INT,
--     devis INT,
--     desequip INT,
--     revision INT,
--     satisfaction INT
-- );
-- load data local infile 'C:/Users/brune/OneDrive/Documents/Simplon/Formation Data IA/Base de donnée SQL/BASE1.txt'
-- INTO TABLE exo_semaine3 FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n';


-- -- Exercice 1 :
-- SELECT * FROM exo_semaine3 LIMIT 10;

-- -- Exercice 2 :
-- SELECT count(*) FROM  exo_semaine3;

-- -- Exercice 3 :
-- SELECT DISTINCT count(*) from exo_semaine3;

-- -- Exercice 4 :
-- ALTER TABLE exo_semaine3
-- ADD resilies_char
-- VARCHAR(42);

-- UPDATE exo_semaine3
-- SET resilies_char = (
--     CASE 
--         WHEN resilies = 0 THEN 'Non-Résilié'
--         ELSE 'Résilié'
--     END
-- );

-- SELECT * FROM exo_semaine3 LIMIT 10;

-- -- Exercice 5 :

-- -- Exercice 7 :
-- SELECT anciennete, sinistre
-- FROM exo_semaine3
-- GROUP BY anciennete, sinistre;

-- -- Exercice 8 :
-- SELECT anciennete, sinistre, count(*) AS 'nombre_pers',
-- ROUND(count(*) / (SELECT count(*) FROM exo_semaine3) * 100)
-- AS 'Pourcentage'
-- FROM exo_semaine3
-- GROUP BY anciennete, sinistre
-- ORDER BY Pourcentage DESC;

-- -- Exercice 9 :
-- -- Version 1 :
-- SELECT count(*)
-- FROM exo_semaine3
-- WHERE sinistre > (SELECT AVG(sinistre) FROM exo_semaine3) 
-- AND resilies_char = 'Non-Résilié';

-- -- Version 2 :
-- SELECT COUNT(resilies) AS "Nombre de non resilies", 
-- AVG(sinistre) AS "Moyenne du sinistre",
-- (SELECT COUNT(resilies) FROM exo_semaine3 WHERE resilies=0 AND sinistre > (SELECT AVG(sinistre) FROM exo_semaine3)) AS "Résultat exo"
-- FROM exo_semaine3
-- WHERE resilies = 0;

-- -- Exercice 10 :
-- CREATE TABLE projeta SELECT resilies, parcours, anciennete, demenagement
-- FROM exo_semaine3;
-- ALTER TABLE projeta
-- ADD id INT PRIMARY KEY AUTO_INCREMENT;


-- CREATE TABLE projetb SELECT resilies, parcours, sinistre, devis, revision, satisfaction
-- FROM exo_semaine3;
-- ALTER TABLE projetb
-- ADD id INT PRIMARY KEY AUTO_INCREMENT;

-- CREATE TABLE projetc
-- AS (SELECT * FROM projeta NATURAL JOIN projetb);
-- ALTER TABLE projetc
-- MODIFY COLUMN id INT FIRST;


SELECT * FROM projetb LIMIT 10;