
-- pour accéder à la console mysql de xampp, il faut entrer cette ligne : mysql _uroot

CREATE DATABSE entreprise; -- créer une base de donée

SHOW DATABASES; -- voir les bases de données

USE entreprise; -- utiliser/selectionner une base de donnée

DROP DATABASE entreprise; -- supprimer une base de donnée

DROP TABLE employes; -- supprimer une table

DESC employes; -- observer la structure de la table ainsi que les champs (DESC pour desribe, description)

--------------------------------------------------------------------------------------------
--  REQUETE DE SELECTION

-- Affichage complet
SELECT id_employes, prenom, nom, sexe, service, date_embauche, salaire FROM employes;
-- SELECT nom_des_champs FROM nom_de_la_table;

----------------------------------------------

SELECT * FROM employes;
-- AFFICHE MOI [* toute les colonnes] DE LA TABLE employes;
-- raccourci * : ALL

----------------------------------------------
--  Affichage de noms et prénoms des employés de l'entreprise
SELECT nom, prenom FROM employes;
-- AFFICHE MOI nom, prenom DE LA TABLE employes;

----------------------------------------------
-- EXO : Afficher les différents services de l'entreprise 
SELECT service FROM employes;

-- DISTINCT : permet d'éliminer les doublons
SELECT DISTINCT service FROM employes;

----------------------------------------------
-- Affichage des employes du sercice informatique
-- condition WHERE
SELECT nom, prenom, service FROM employes WHERE service = 'informatique';
-- AFFICHE MOI nom_des_champs DE LA TABLE nom_de_la_table A CONDITION QUE champs = 'valeur'

----------------------------------------------
-- BETWEEN
-- Affichage de semployes ayant été recrutés entre 2010 et aujourd'hui
SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2018-05-09'; 
-- AFFICHE MOI nom, prenom, date_embauche DE LA TABLE employes A CONDITION QUE date_embauche SOIT COMPRISE ENTRE '2010-01-01' ET '2018-05-09'
-- BETWEEN + AND : entre ... et ...

SELECT CURDATE(); -- revoi la date du jour

SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND CURDATE(); 

------------------------------------------------------------------------------------------------------
-- LIKE: valeur approchante
-- Affichage des employés ayant un prénom commençant par la lettre 's'

SELECT prenom FROM employes WHERE prenom LIKE 's%';

SELECT prenom FROM employes WHERE prenom LIKE '%-%';

-- affichage de tous les employes sauf les informaticiens

SELECT nom, prenom sevice FROM employes WHERE service != 'informatique';

-- Affiche de tous les employés gagnant un salaire supérieur à 3000
SELECT nom, prenom, service, salaire FROM employes Where salaire > 3000;

-- operateurs de comparaison
-- != n'est pas
<= strictement inferieur ou égal à
-- AND et
-- OR ou
--------------------------------------------------------------------------------------------------------
-- ORDER by
-- Affichage des employes dans l'ordre alphabétique
SELECT prenom FROM employes ORDER BY prenom ASC;
-- ORDER BY permet d'effectuer un classement
--  ASC: ascendant, croissant

SELECT prenom FROM employes ORDER BY prenom;
-- par default ORDER BY classe par ordre coissant

SELECT prenom FROM employes ORDER BY prenom DESC;
-----------------------------------------------------------------------------------------

-- LIMIT
-- Affichage DES EMPLOYES 3 PAR 3
SELECT prenom FROM employes ORDER BY prenom LIMIT 0,3;

SELECT prenom FROM employes ORDER BY prenom LIMIT 3,3;

-- LIMIT est utilisé sur un site pour la paggination, soit la separation en plusieurs pages d'une liste de données
--------------------------------------------------------------------------------------------------------------------
-- Affichage des employés avec un salaire annuel
SELECT prenom, salaire*12 FROM employes;
SELECT prenom, salaire*12 AS'salaire annuel' FROM employes;
-- AS: alias
----------------------------------------------------------------------------------------------------------

-- Affichage de la masse salarial de l'entreprise
SELECT SUM(salaire*12) AS 'masse salariale' FROM employes;
-- SUM: fonction prédéfinie en SQL permettant de calculer une somme
----------------------------------------------------------------------------
-- AVG: moyenne
-- Affichage du salaire moyen
SELECT AVG(salaire) AS 'salaire moyen' FROM employes;


-- ROUND: permet d'arrondir (chiffre à arrondir, nombre de décimal après la virgule)
SELECT ROUND(AVG(salaire),2) AS'salaire moyenne' FROM employes;
-- COUNT: permet de compter
-- affichage  de nombre de femm dans l'entreprise
SELECT COUNT(*) AS 'nb de femme' FROM employes WHERE sexe = 'f';
---------------------------------------------------------------------------------------------
-- MIN/ MAX
-- Affichage du salaire minimum/maximum
SELECT MIN(salaire) FROM employes;
SELECT MAX(salaire) FROM EMPLOYES.
------------------------------------------------------------------

SELECT nom, prenom, MIN(salaire) FROM employes; -- /!/ résultat éronné ! le système ne peut tout fairenen même temps,  selectionner
le prenom, le nom et le salaire minimumum

SELECT nom, prenom, salaire FROM employes WHERE salaire= (SELECT MIN(salaire) FROM employes);

-- c'est la requête entre parenthèse qui est executée en premier
-- c'est une requête imbriquée sur la même table
-------------------------------------------------------------------------------
-- IN: Affichage des employés travaillant à la fois dans le service commercial et comptabilité

SELECT nom, prenom, service FROM employes WHERE service IN('commercial','comptabilité');
-- IN permet d'inclure plusieur valeur
-- = permet d'inclure une seule valeur
----------------------------------------------------------------------------
-- NOT in
-- affichage des employes ne faisant pas partie du service informatique et direction
SELECT nom, prenom, service FROM employes WHERE service NOT IN('informatique','direction');
---------------------------------------------------------------------------------------------
-- exo: Affichage des commerciaux gagnant un salaire inferieur ou égal à 2000
SELECT nom, prenom, service, salaire FROM employes WHERE service='commercial' AND salaire<=2000;
-- AND: et.. condition complementaire   
---------------------------------------------------------------------------
-- OR
-- Affiche des employés du service commercialtravaillant pour un salaire de 1900 ou 2300
SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND salaire = 2300 OR salaire = 1900;
-- RESULTAT ERRONE
SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND (salaire = 2300 OR salaire = 1900);
-- Grace au parenthèse , on respecte l'ordre de priorité des conditions
--------------------------------------------------------------------------------------------
-- GROUP BY
-- Affichage du nombre d'employé par service
SELECT service, COUNT(*) AS 'nombre de service' FROM employes GROUP BY service;
-----------------------------------------------------------------------------------------
-- REQUETE D'insertion
INSERT INTO employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES ('Grégory', 'Lacroix', 'm','informatique', '2018-09-05', 15000);


-- si nous inserons des valeur dans tout les champs de la table, il faut donner une valeur par défaut pour la clé primaire (id_employes) : NULL, DEFAULT?..

INSERT INTO employes VALUES (NULL,' Greg', 'lac', 'm', 'info', '2018-09-05', 2000);

-- on peut définir notre clé primaire id_employes
INSERT INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (8059, 'Toto', 'ToTo', 'm', 'information', '2018-09-05', 1800);
--------------------------------------------------------------------------------------------------------------------------------------
-- REQUETE DE MODIFICATION
-- Modification du salaire de l'employé 350 par 1150
UPDATE employes SET salaire= 1150, service= 'cuisine' WHERE id_employes = 350;

-- UPDATE table
-- SET  nom_colonne_1 = 'nouvelle valeur'
-- WHERE Ccondition

REPLACE INTO employes(id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (NULL, 'test','2018-09-05', 1500);

REPLACE INTO employes(id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (592, 'Laure', 'Blanche', 'f', 'cuisine', '2018-09_05', 1100);
-- Si la clé primaire (id_employes) n'est pas connu dans la BDD, RAPLACE se comporte comm un INSERT, il va générer une nouvelle ligne et insérer dans la base se données
-- Si la clé primaire est connu dans la BDD, REPLACE se comporte comme un UPADTE, il va modifier les données de l'id selectionné
----------------------------------------------------------------------------------------------------
-- REQUETTE DE SUPPRESSION
-- DELETE
-- suppression de l'employé 350
DELETE FROM employes WHERE id_employes = 350;
-- DELETE FROM table WHERE condition complémentaire
-------------------------------------------------------------------------------------------------------------------------
-- EXERCICE:
-- 1. Afficher la profession de l'employé 547
SELECT service FROM employes where id_employes = 547;

-- 2. Afficher la date d'embauche d'amandine
SELECT date_embauche FROM employes where prenom = 'Amandine';

-- 3. Afficher le nom de famille de Guillaume
SELECT nom FROM employes where prenom ='Guillaume';

-- 4. Afficher le nombre de personne ayant un id_emplyes commençant par le chiffre 5
SELECT COUNT(*) AS 'nb_personne' FROM employes where id_employes LIKE = '5%';

-- 5. Afficher le nombre de commerciaux
SELECT service, COUNT(*) FROM employes where service= 'commercial';

-- 6. Afficher le salaire moyen des informaticiens (+ arrondi)

-- erreur SELECT salaire FROM employes where service = 'informatique' AND (SELECT ROUND(AVG(salaire))  AS 'salaire moyenne' FROM employes);
SELECT service, ROUND(AVG(salaire),2) FROM employes where service = 'informatique';


-- 7. Afficheer les 5 premier employés après avoir classé leurs nom de famille par ordre alphabétique
SELECT nom FROM employes ORDER BY nom ASC LIMIT 0.5;

-- 8. Afficher le cout des commerciaux sur une année
SELECT SUM(salaire*12) AS 'salaire commercial' FROM employes WHERE SERVICE= 'commercial';

-- 9. Afficher le salaire moyen par service

SELECT service, ROUND(AVG(salaire),2) AS 'salaire moyen' FROM employes GROUP BY service;

-- 10. Afficher le nombre de recrutement sur l'année 2010
    SELECT COUNT(*) AS 'nb recrutement' FROM employes WHERE date_embauche LIKE '2010%';                                
                                    
                                    
-- 11. Afficher le salaire moyen appliqué lors des recrutements sur la periode allant de 2005 à 2007
SELECT ROUND(AVG (salaire),2) AS 'salaire moyen' FROM employes WHERE date_embauche BETWEN
-- 12. Afficher le nombre de service différent
-- 13. Afficher conjoitement le nombre d'homme et femme dans l'entreprise
-- 14. Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire superieur à 2500
-- 15. qui a été embauché en dernier?
-- 16. Afficher les information sur l'employé du servicencommercial gagnant le salaire le plus élevé                                             
        



