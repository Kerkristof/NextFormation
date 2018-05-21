
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

----------------------------------------------
-- LIKE : valeur approchante
-- Affichage des employés ayant un prénom commençant par la lettre 's'
SELECT prenom FROM employes WHERE prenom LIKE 's%';
-- % : peut importe la suite
SELECT prenom FROM employes WHERE prenom LIKE '%s';

SELECT prenom FROM employes WHERE prenom LIKE '%-%';

-- ID nom   code_postal
-- Appart1  75015
-- Appart2  75008
-- Appart3  75001
-- Appart4  93000

-- SELECT * FROM appartement WHERE code_postal LIKE '75%';

---------------------------------------------
-- Affichage de tous les employes sauf les informatiens
SELECT nom, prenom, service FROM employes WHERE service != 'informatique';
-- != : n'est pas. Permet d'exclure une valeur

---------------------------------------------
-- Affichage de tous les employés gagnant un salaire supérieur à 3000€;
SELECT nom, prenom, service, salaire FROM employes WHERE salaire > 3000;

-- Opérateurs de comparaison
-- < strictement inférieur à
-- > strictement supérieur à
-- <= inférieur ou égal à 
-- >= supérieur ou égal à 
-- != n'est pas
-- AND et
-- OR ou

----------------------------------------------
-- ORDER BY
-- Affichage des employes dans l'ordre alphabétique
SELECT prenom FROM employes ORDER BY prenom ASC;
-- ORDER BY permet d'effectuer un classement
-- ASC : ascendant, croissant
SELECT prenom FROM employes ORDER BY prenom;
-- Par défault ORDER BY classe par ordre croissant

SELECT prenom FROM employes ORDER BY prenom DESC;
-- DESC : descendant, decroissant

----------------------------------------------
-- LIMIT
-- Affichage des employés 3 par 3 
SELECT prenom FROM employes ORDER BY prenom LIMIT 0,3;
SELECT prenom FROM employes ORDER BY prenom LIMIT 3,3;
SELECT prenom FROM employes ORDER BY prenom LIMIT 6,4;
-- LIMIT permet de selectionner une partie du résultat, 
-- LIMIT 0,3 : 0 correspond au point de départ et 3 c'est le nombre d'affichage souhaité
-- LIMIT est utilisé sur un site pour la paggination, soit la séparation en plusieurs pages d'une liste de données.

----------------------------------------------
-- Affichage des employés avec un salaire annuel 
SELECT prenom, salaire*12 FROM employes;
SELECT prenom, salaire*12 AS 'salaire annuel' FROM employes;
-- AS : alias

----------------------------------------------
-- Affichage de la masse salariale de l'entreprise
SELECT SUM(salaire*12) AS 'masse salariale' FROM employes;
-- SUM : fonction prédéfinie en SQL permettant de calculer une somme

----------------------------------------------
-- AVG 
-- Affichage du salaire moyen
SELECT AVG(salaire) AS 'salaire moyen' FROM employes;
-- AVG : moyenne

-- ROUND
SELECT ROUND(AVG(salaire),2) AS 'salaire moyen' FROM employes;
-- ROUND permet d'arrondir
-- ROUND(chiffre à arrondir, nombre de décimal aprés la virgule)

----------------------------------------------
-- COUNT 
-- Affichage du nombre de femme dans l'entreprise
SELECT COUNT(*) AS 'nb de femme' FROM employes WHERE sexe = 'f';
-- COUNT permet de compter

----------------------------------------------
-- MIN / MAX
-- affichage du salaire minimum / maximum
SELECT MIN(salaire) FROM employes;
SELECT MAX(salaire) FROM employes;

-- Exo : afficher le nom, le prénom et le salaire de l'employé gagnant le moins dans l'entreprise
SELECT nom, prenom, MIN(salaire) FROM employes; -- /!\ résultat éronné ! le système ne peut tout faire en même temps, selectionner le prenom, le nom et le salaire minimum
-- nous sommes obligé d'isoler une requête permettant de selectionner le salaire minimum

SELECT nom, prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
-- C'est la requête entre parenthèse qui est executée en premier
-- c'est une requête imbriquée sur la même table

-- Détail requête :
SELECT nom, prenom, salaire FROM employes WHERE salaire = 1390;

----------------------------------------------
-- IN 
-- Affichage des employés travaillant à la fois dans le servie commercial et comptabilité
SELECT nom, prenom, service FROM employes WHERE service IN('commercial','comptabilite');
-- IN permet d'inclure plusieurs valeurs
-- = permet d'inclure une seule valeur

----------------------------------------------
-- NOT IN 
-- Affichage des employes ne faisant pas partie du service informatique et direction
SELECT nom, prenom, service FROM employes WHERE service NOT IN('informatique','direction');
-- NOT IN : permet d'exclure plusieurs valeur
-- != : permet d'exclure une seule valeur

----------------------------------------------
-- Exo : Affichage des commerciaux gagnant un salaire inférieur ou égal à 2000€
SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND salaire <= 2000;
-- AND : et.. condition complémentaire 

----------------------------------------------
-- OR
-- Affichage des employés du service commercial travaillant pour un salaire de 1900€ ou 2300€

SELECT nom, prenom, service, salaire  FROM employes WHERE service = 'commercial' AND salaire = 2300 OR salaire = 1900; -- /!\ résultat érroné !!

SELECT nom, prenom, service, salaire  FROM employes WHERE service = 'commercial' AND (salaire = 2300 OR salaire = 1900);
-- Grace au parenthèse, on respecte l'oredre de priorité des conditions

----------------------------------------------
-- GROUP BY 
-- Affichage du nombre d'employé par service
SELECT service, COUNT(*) AS 'nombre de service' FROM employes GROUP BY service;
-- GROUP BY va ré-associer les nombres + par service

-- GROUP BY permet d'effectuer des regroupements

----------------------------------------------
-- REQUETE D'INSERTION 
INSERT INTO employes(prenom, nom, sexe, service, date_embauche, salaire) VALUES ('Grégory', 'LACROIX', 'm', 'informatique', '2018-09-05', 15000);

-- Si nous inserons des valeurs dans tout les champs de la table, il faut donner une valeur par défaut pour la clé primaire (id_employes) : NULL, DEFAULT, ''
INSERT INTO employes VALUES(NULL,'Greg', 'LAC', 'm', 'info', '2018-09-05', 150000);

INSERT INTO employes VALUES(DEFAULT, 'Greg', 'LAC', 'm', 'info', '2018-09-05', 150000);

-- on peut définir notre clé primaire id_employes
INSERT INTO employes(id_employes,prenom, nom, sexe, service, date_embauche, salaire) VALUES (8059,'Toto', 'TOTO', 'm', 'informatique', '2018-09-05', 15000);

----------------------------------------------
-- REQUETE DE MODIFICATION
-- Modification su salaire de l'employé 350 par 1150
UPDATE employes SET salaire = 1150, service = 'cuisine' WHERE id_employes = 350;
-- UPDATE table
-- SET nom_colonne_1 = 'nouvelle valeur'
-- WHERE condition

REPLACE INTO employes(id_employes,prenom,nom, sexe,service,date_embauche, salaire) VALUES (NULL, 'test', 'test', 'm', 'test', '2018-09-05', 1500);

REPLACE INTO employes(id_employes,prenom,nom, sexe,service,date_embauche, salaire) VALUES (592, 'Laure', 'Blanche', 'f', 'cuisine', '2018-09-05', 1100);

-- Si la clé primaire (id_employes) n'est pas connu dans la BDD, REPLACE se comporte comme un INSERT, il va générer une nouvelle ligne et insérer dans la base de données

-- Si la clé primaire est connu dans la BDD, REPLACE se comporte comme un UPADTE, il va modifier les données de l'id selectionné

----------------------------------------------
-- REQUETE DE SUPPRESSION
-- DELETE
-- suppression de l'employé 350
DELETE FROM employes WHERE id_employes = 350;
-- DELETE FROM table WHERE condition complémentaire

----------------------------------------------
-- EXERCICE :
-- 1. Afficher la profession de l'employé 547
SELECT service FROM employes WHERE id_employes = 547;
-- 2. Afficher la date d'embauche d'Amandine
SELECT nom, prenom, date_embauche FROM employes WHERE prenom = 'Amandine'; 
-- 3. Afficher le nom de famille de Guillaume 
SELECT nom, prenom FROM employes WHERE prenom = 'Guillaume';
-- 4. Afficher le nombre de personne ayant un id_employes commençant par le chiffre 5
SELECT COUNT(*) AS 'nb_personne' FROM employes WHERE id_employes LIKE '5%';

SELECT SUM(id_employes LIKE '5%') AS 'nb_personne' FROM employes;
-- 5. Afficher le nombre de commerciaux
SELECT COUNT(*) AS 'nombre commerciaux' FROM employes WHERE service = 'commercial';

-- 6. Afficher le salaire moyen des informaticiens (+ arrondi)
SELECT ROUND(AVG(salaire),2) AS 'Salaire moyen' FROM employes WHERE service = 'informatique';
-- 7. Afficher les 5 premiers employés aprés avoir classé leurs nom de famille par ordre alphabétique
SELECT nom FROM employes ORDER BY nom ASC LIMIT 0,5;
-- 8. Afficher le cout des commerciaux sur une année
SELECT SUM(salaire*12) AS 'cout commercial' FROM employes WHERE service = 'commercial';
-- 9. Afficher le salaire moyen par service
SELECT service, ROUND(AVG(salaire),2) AS 'salaire moyen' FROM employes GROUP BY service; 

-- 10. Afficher le nombre de recrutement sur l'année 2010
SELECT COUNT(*) AS 'nb recrutement' FROM employes WHERE date_embauche LIKE '2010%'; 

-- 11. Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2005 à 2007
SELECT ROUND(AVG(salaire),2) AS 'salaire moyen' FROM employes WHERE date_embauche BETWEEN '2005-01-01' AND '2007-12-31';

-- 12. Afficher le nombre de service différent
SELECT COUNT(DISTINCT(service)) AS 'nb de service' FROM employes;

-- 13. Afficher conjoitement le nombre d'homme et de femme dans l'entreprise
SELECT sexe, COUNT(*) AS 'nb homme femme' FROM employes GROUP BY sexe; 

-- 14. Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire supérieur à 2500€
SELECT * FROM employes WHERE service = 'commercial' AND date_embauche < '2005-01-01' AND sexe = 'm' AND salaire > 2500;

-- 15. Qui a été embauché en dernier ?
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 0,1;
SELECT * FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);

-- 16. Afficher les informations sur l'employé du service commercial gagnant le salaire le plus élevé
SELECT * FROM employes WHERE service = 'commercial' AND salaire = (SELECT MAX(salaire) FROM employes WHERE service = 'commercial');
SELECT * FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 0,1;

-- 17. Augmenter chaque employé de 100€
UPDATE employes SET salaire = salaire +100;

-- 18. Supprimer les employés du service secrétariat
DELETE FROM employes WHERE service = 'secretariat';
---------------------------------------------------------------------------------------------------------------------
-- affichage des ID des livres qui n'ont pas été rendu
-- un champs NULL se test avec IS
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
-----------------------------------------------------------------------------------------------------------

-- REQUETE IMBRIQUEE
-- Affichage du titre des livres qui n'ont pas été rendu
SELECT titre FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);
---------------------------------------------------------------------------------------------------

-- Détail requête:
SELECT titre FROM livre WHERE id_livre IN(100,105);

-- Affichage de la liste des abonnés n'ayant pas rendu les livres à la bibliothèque

SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_rendu IS NULL);

-- Détail requête:
SELECT prenom FROM abonne WHERE id_abonne IN(3,2);
------------------------------------------------------------------------------------
-- Le numero des livre que chloé a emprunté à la bibliothèque
SELECT id_livre FROM emprunt WHERE id_abonne = 3;
-- ou
SELECT id_livre FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'chloe');
---------------------------------------------------------------------------------------------------------
-- Afficher les prénom des abonnées ayant emprunté un livre le 19/12/2014

SELECT prenom FROM emprunt WHERE date_sortie = '2014/12/19';

SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_sortie = '2014/12/19' FROM);
----------------------------------------------------------------------------------------------------------------------

Combien de livre Guillaume a emprunté à la bibliothèque

SELECT COUNT(*) AS 'nb livre guillaumme' FROM emprunt where id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');
------------------------------------------------------------------------------------------------------------------

-- Afficher la liste des abonnés ayant déja emprunté un livre d'Alphonse Daudet


SELECT prenom FROM abonne WHERE id_abonne = IN(SELECT id_abonne FROM emprunt WHERE id_livre IN(SELECT id_livre FROM livre WHERE auteur = 'Alphonse Daudet'));
-------------------------------------------------------------------------------------------------------------------------------

-- Connaitre les titres des lilvres que Chloé a emprunté à la bibliothèque

SELECT id_abonne FROM abonne WHERE prenom = 'Chloe';

 SELECT id_livre FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe');

SELECT titre FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));
--------------------------------------------------------------------------------------------------------------------------------------
-- Jointure
-- connaitre les dates de sortie et de rendu pour l'abonné Guillaume
SELECT a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e
WHERE a.id_abonne = e.id_abonne
AND a.prenom = 'Guillaume';

-- En requête imbriqué
SELECT date_sortie, date_rendu FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom='Guillaume');

-- Une jointure ete une requete imbriquée permettent de faire des relations entre les differentes tables afin d'avoir des colonnes associés pour former qu'un seul résultat.

-- Nous aimerons connaitre les mouvement des livres (date_sortie, date_rendu) écrit par Alphonse Daudet    

SELECT l.auteur, e.date_sortie, e.date_rendu
FROM emprunt e,livre l
WHERE e.id_livre= l.id_livre
AND l. auteur = 'Alphonse Daudet';
 
---------------------------------------------------------------------------------------------------------------
-- Qui a emprunté le livre "une vie" 2014

SELECT l.titre, a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e, livre l
WHERE a.id_abonne= e.id_abonne
AND e.id_livre = l.id_livre
AND l.titre = 'une vie'
AND e.date_sortie LIKE '2014%';



SELECT prenom FROM abonne WHERE emprunt = (SELECT titre FROM livre WHERE date_sortie = (SELECT titre FROM livre WHERE titre= 'une vies' ) );







































 


















