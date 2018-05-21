--pour interroger une BDD en local , nous utilisons un serveur local , XAMPP ,WAMPP. 
--pour  acceder à la console de mysql de xampp , il faut entrer cette ligne :  mysql -uroot

 CREATE DATABASE entreprise; --- creer une base de donnèes ;
 
 
  SHOW DATABASE ;   -- VOIR LES BASES DE DONNEES ;
  
  USE entreprise;  -- uselec tionner une base de donnée
  
  DROP DATABASE entreprise ; -- supprimer base de donnèes 
  
  DROP TABLE  employes ; -- supprimer une table
  
  
  DESC employes; -- observer la structure fde la table ainsi que les champs (deskc pour description)

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------


--- REQUETE DE SELECTION 

--Affichage ccomplet

 SELECT id_employes , prenom , nom , sexe, date , embauche , salaire FROM employes ;
 -- SELECT nom-des-champs;
 SELECT * FROM employes; 
 -- AFFICHE MOI [ *toutes les colonnes ] DE la table employes 
 SELECT nom , prenom FROM employes;
 
 ------------------------------------------------------------------------------------------------------
 
 -- EXO : Afficher les differents services de l'entreprise
 
 SELECT service FROM employes; 
 
 -- DISTINCT : PERMET d'eliminer les doublons  
 
 SELECT DISTINCT service FROM employes;
 
 -- Afficher les employes des employes service informatique
 
 -- WHERE condition
 SELECT nom , prenom , service  FROM employes WHERE service = "informatique";
 
 -- Affiche moi nom_des_champs DE LA TABLE nom_de_la_table A CONDITION QUE champs = 'valaeur'
 
 
 ----------------------------------------------------------------------------------------------------------

 -- BETWEEN 
 -- AFFICHAGE des employes ayant eté recrutes entre 2010 et aujiurd'hui
 SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2018-05-09';
 
 -- AFFICHE MOI nom , prenom, date_embauche  DE LA TABLE employes A CONDITION QUE date_embauche SOIT COMPRISE ENTRE '2010-01-01' ET '2018-05-09'
 
 SELECT CURDATE(); -- renvoi la date du jour
 SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND CURDATE();
 ----------------------------------------------------------------------------------------------------------------
 
 
 -- LIKE : valeur approchante 
 -- Affichage des employes ayant un prenom commencant par la lettre 'S'
 SELECT prenom FROM employes WHERE prenom LIKE 'S%';
 -- % peut importe la suite 
 
 SELECT prenom FROM employes WHERE prenom LIKE '%S';
  
 SELECT prenom FROM employes WHERE prenom LIKE '%-%';
 -- Affichage de les employes sauf les informaticiens
  
 SELECT nom, prenom, service FROM employes WHERE service != 'informatique';
 -- != : nest pas . Permet d'exclure unevaleur
 
 -------------------------------------------------------------------------------------------------------------
 
 -- Affifachage de tous les employes gagnant un salaire superieur à 3000£
 SELECT nom, prenom, service, salaire FROM employes WHERE salaire > 3000;
 
 
 --Operateurs de comparaison
 -- < strictement inferieur à 
 -- > strictement superieur à
 -- <= inferieur ou egal à
 -- >= superieur ou egal à
 -- !== n'est pas 
 -- AND
 -- OR
 
 -------------------------------------------------------------------------------------------------------------
 
 -- ORDER BY 
 -- Affichage des employes dans l'ordre alphabétique
 SELECT prenom FROM employes ORDER BY prenom ASC ;
 
 -- ORDER BY permet d'effectuer un vclassement
 -- ASC : ascendant , croissant
 SELECT prenom FROM ORDER BY prenom; 
 -- Par défault ORDER BY classe par ordre croissant 
 SELECT prenom FROM  employes ORDER BY prenom DESC; 
 -- DESC : descendant , decroissant
 
 ---------------------------------------------------------------------------------------------------------------
 
 -- LIMIT 
 -- AAFFICHAGE des employes 3 par 3
 SELECT prenom FROM employes ORDER BY prenom LIMIT 0,3; 
 SELECT prenom FROM employes ORDER BY prenom LIMIT 3,3;
 SELECT prenom FROM employes ORDER BY prenom LIMIT 6,4;
 
 -- LIMIT permet de selectionner une parti du resultat,
 -- LIMIT 0,3 : 0 correspond au point de deprt et 3 c'est le nombre d'affichage souhaité
 -- LIMIT est utilisé sur un un site pour la paggination, soit la separation en plusieurs pages d'une liste données.
 ---------------------------------------------------------------------------------------------------------------
 
 SELECT  SUM (salaire*12) AS 'masse salariale' FROM employes;
 
 -- SUM fonction predefini en SQL permettant de calculer une somme (addition, soustraction etc..)
 
 
 -- Affichage des employes avec un salaire annuel 
 SELECT prenom, salaire*12 FROM employes;
 -----------------------------------------------------------------------------------------------------------------
 -- affichage du salaire moyen 
 SELECT AVG(salaire) AS 'salaire moyen' FROM employes;
 
 -- AVG : Moyenne 
 
 -- ROUND  
SELECT ROUND(AVG(salaire),2)  AS 'salaire moyen' FROM employes;

-- ROUND PERMET D4ARRONDIR 
-- ROUND (chiffre à arrondir , nombre de decimal apres la virgule)
-----------------------------------------------------------------------------------------------------------

-- COUNT
-- Affichage du nombre de femme dans l'entreprise
SELECT COUNT(*) AS 'nb de femme ' FROM employes WHERE sexe = 'f';
-- COUNT permet de compter

------------------------------------------------------------------------------------------------------------
 -- MIN  / MAX 
 -- Affichage du salaire minimum / maximum nom, prenom , 
 SELECT MIN (salaire)  FROM employes;
 
  SELECT MAX (salaire)  FROM employes;
  
  -- EXOO : afficher le nom , le prenom et le salaire de l'employé gagnant le moins dans l'entrprise
  

  SELECT nom, prenom, salaire FROM employes WHERE salaire =(SELECT MIN(salaire) FROM employes);
  
  -- C'est la requete entre parenthese qui est executer en premier 
  
  -- c'est une requete imbriqué sur la mm table 
  
  -- DETAILS REQUETE : 
  SELECT nom, prenom, salaire FROM employes WHERE salaire =1390;
  
  --------------------------------------------------------------------------------------------------------------
  
  
  -- IN
  -- Affichage des employes travaillant à la dans le service commercial et comptabilité
  
  SELECT nom, prenom, service FROM employes WHERE service IN ('commercial','comptabilite');
  
  -- IN permet d'inclure plsrs valeurs 
  -- =  permet d' inclure une  seule valeur
  
  ---------------------------------------------------------------------------------------------------------------
  
  -- NOT IN 
  --Affichage des employes ne faisant pas parti du service informatique et direction 
  SELECT nom, prenom, service FROM employes WHERE service NOT IN ('informatique','direction');
  
  -- NOT IN : permet d'exclure plsrs valeurs'
  ---------------------------------------------------------------------------------------------------------------
  
  -- EXO : Affichage des commerciaux gagnant un salaire inferieur ou egal à 2000£
  
  SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND salaire <=2000;
  
  -- AND : et .. condtion complementaire
  
  -- OR 
  -- Affichage des employes  du service commercial pour un salaire de 1900 ou 2300
  
  
  SELECT nom, prenom, service, salaire FROM employes  WHERE service = 'commercial' AND (salaire = 2300 OR salaire = 1900); 
  ------------------------------------------------------------------------------------------------------------
  
  -- GROUP BY  
  SELECT service, COUNT(*) AS 'nombre de service'  FROM employes  GROUP BY service;
  
  -- GROUP BY permet d'effectuer des groupements
  
  
  -------------------------------------------------------------------------------------------------------------
  
  -- REQUETES D'INSERTION
  INSERT INTO employes(prenom, nom, sexe, service, date_embauche, salaire) VALUES ('Grégory','LACROIX','m','informatique','2018-09-05', 15000);
  
  INSERT INTO employes VALUES(NULL,'Greg','LAC','m','info','2018-09-05', 150000);
  
  INSERT INTO employes VALUES(DEFAULT,'Greg','LAC','m','info','2018-09-05', 150000);
  
  -- On peut definir notre clé primaire id_employes
  
  
  ---------------------------------------------------------------------------------------------------------------
  
  -- REQUETE DE MODIFICATION 
  -- MODIFICATION du  salaire de l'employé 350 par 1150
  UPDATE employes SET salaire = 1150, service = 'cuisine' WHERE id_employes = 350;
   INSERT INTO employes(id_employes, prenom, nom, sexe, service, date_embauche, salaire)VALUES (8059, 'Toto','TOTO', 'm', 'informatique','2018-09-05',15000); 

  -- UPDATE table 
  -- SET nom_cilonne_1 = 'nouvelle valaeur'
  -- WHERE condition
  
  REPLACE INTO employes(id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (NULL, 'Test','Test', 'm', 'test','2018-09-05',1500);
  
  REPLACE INTO employes(id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (592, 'Laure','Blanche', 'f', 'cuisine','2018-09-05',1100);
  

  -- Si la clé primaire ( id_employes) n'est pas connu dans la BDD(base de donnes), REPLACE INTO se comporte comme un INSERT ? il na generer une nouvelle ligne et l'insererdans la BDD
  
  -- Si la clé se primaire est connu dans la BDD, REPLACE se comporte comme un UPDATE , il va modifier les donnees de id selectionner
  
  -----------------------------------------------------------------------------------------------------------------------
  -- REQUETE DE SUPPRESSION
  -- DELETE
   -- suppression de l'employé 350
   
   DELETE FROM employes WHERE id_employes = 350;
   
   -- DELETE FROM table WHERE condition complementaire
   
   
   -------------------------------------------------------------------------------------------------------------------
   
  -- EXERCICE :  
  
  -- 1. Afficher la profession de l'employé 547
  
  SELECT service FROM employes Where id_employes = 547;
  -- 2. Afficher la date d'embauche d'Amandine
  SELECT date_embauche FROM employes Where prenom = 'Amandine';
  -- 3. Afficher le nom de famille de Guillaume 
  SELECT  nom FROM employes WHERE prenom = 'Guillaume';
  -- 4. Afficher le nombre de personne ayant un id_employes commencant par le chifre 5 
  SELECT COUNT(*) AS' nb_personne' FROM employes WHERE id_employe LIKE '5%';
  -- Afficher le nombre de commerciaux 
  SELECT service, COUNT(*) AS 'nombre de service'  FROM employes WHERE service = 'commercial';
  -- Afficher le salaire moyen des informaticiens (+ arrondi)
  SELECT AVG(salaire) AS 'salaire moyen' FROM employes WHERE service = 'informatique';
  --  Afficher les 5 premiers employes apres avoir classeés leur nom par ordre alphabetique
  SELECT nom FROM  employes ORDER BY nom DESC LIMIT 0,5; 
  -- Afficher le cout des commerciaux sur une année 
  
  -- Afficher le salaire moyen par service 
  SELECT AVG(salaire) AS 'salaire moyen' FROM employes WHERE service = 'service';
  -- Afficher le nombre de recrutement sur l'année 2010
  SELECT COUNT(*) AS 'nb de recrutement ' FROM employes WHERE date_embauche LIKE = '2010%';
  -- 11. Afficher le salaire moyen appliquer lors des recrutements sur la periode allant de 2005 à 2007
  SELECT AVG(salaire) AS 'salaire moyen' FROM employes WHERE date_embauche BETWEEN'2005-01-01' AND'2007-31-12' ;
  -- 12. Afficher le nombre de service different 
  SELECT DISTINCT service FROM employes;
  -- 13. Afficher conjointement le nombre d'homme de femme dns l'entreprise
  
  SELECT sexe, COUNT(*) AS 'nb homme femme ' FROM employes GROUP BY sexe;
  
  -- 14. Afficher les commerciaux ayant été recrutes avant 2005 de sexe masculin et gagant un salaire superieur à 2500
  
    SELECT sexe, service, salaire FROM employes  WHERE service = 'commercial' AND date_embauche < '2005-01-01'AND sexe = 'm' AND salaire > 2500 ; 

  -- 15. Qui a été embauché en dernier ?
  
  SELECT * FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);
  -- 16. Afficher les informations sur l'employé du service commercial gagnant le salaire le plus elevé
  
  SELECT * FROM employes WHERE service = 'commercial'ORDER BY salaire DESC LIMIT 0,1;
  -- 17. Augmenter chaque employé de 100
  
UPDATE employes SET salaire = salaire + 100;
SELECT prenom, nom, salaire+100 FROM employes;
  -- 18.Supprimer les employesdu servise sécretariat 
  DELETE FROM employes WHERE service = 'secretariat';
  