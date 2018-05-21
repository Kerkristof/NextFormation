-----------------------------------------------
-- Afficher les ID des livres qui n'ont pas été rendu
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
-- un champs NULL se teste toujours avecc IS

-----------------------------------------------
-- REQUETE IMBRIQUEE

-- Titre des livres n'ayant pas été rendu
SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM livre WHERE date_rendu IS NULL);
    
-- 
-- Détail requête :
SELECT titre FROM livre WHERE id_livre IN
    (100,105);
    
-- Affichage de la liste des abonnés n'ayant pas rendu les livres à la bibliothèque
SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE date_rendu IS NULL);

-- Détail requête :
SELECT prenom FROM abonne WHERE id_abonne IN
    (3,2);
    
----------------------------------------------
-- Exo : Nous aimerions connaitre le n° des livre(s) que chloé a emprunté à la bibliothèque
SELECT id_livre FROM emprunt WHERE id_abonne =      (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'); 

-- Détail requête :
SELECT id_livre FROM emprunt WHERE id_abonne =3;

-----------------------------------------------
-- Exo : Afficher les prénoms des abonnées ayant emprunté un livre le 19/12/2014
SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE date_sortie = '2014-12-19');

-- Détail requête :
SELECT prenom FROM abonne WHERE id_abonne IN
    (3,1,4);
    
------------------------------------------------
-- EXO : combien de livre Guillaume a emprunté à la bibliothèque
-- 1ère requête : id de Guillaume 
SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume';

-- 2ème requête : nb d'emprunt par rapport à l'ID
SELECT COUNT(*) AS 'nb emprunt' FROM emprunt WHERE id_abonne = 1;

-- 3ème requête : assemblage requête imbriquée
SELECT COUNT(*) AS 'nb emprunt' FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume'); 

------------------------------------------------
-- Afficher la liste des abonnés ayant déja emprunté un livre d'Alphonse Daudet
-- La liste des abonnés se trouve dans la table abonne
-- Les n° des id des livres écrit par Alphonse Daudet se trouve dans la table livre 
-- la liste des emprunts se triuvent dans la table emprunt
-- Nous ne pouvons pas relier la table abonné avec la table livre (car ces deux tables ne possèdent de champs commun)
-- Nous pouvons relier la table livre avec la table emprunt. Nous pouvons aussi relier la table abonné avec la table emprunt

-- 1ère étape : formuler la requete permettant d'affiche l'ID du livre d'Alphonse Daudet
SELECT id_livre FROM livre WHERE auteur = 'ALPHONSE DAUDET'; -- affiche 103

-- 2ème étape : Formuler la requête permettant d'afficher les ID abonnés ayant emprunté un livre ID 103 (Alphonse Daudet)
SELECT id_abonne FROM emprunt WHERE id_livre = 103; -- affiche 4

-- 3ème étape : formuler la requete permettant d'afficher le prenom de l'ID 4
SELECT PRENOM FROM abonne WHERE id_abonne = 4;

-- 4ème étape : assemblage
SELECT PRENOM FROM abonne WHERE id_abonne IN 
    (SELECT id_abonne FROM emprunt WHERE id_livre IN 
        (SELECT id_livre FROM livre WHERE auteur = 'ALPHONSE DAUDET'));
        
------------------------------------------------
-- Exo : Nous aimerions connaitre le titre des livres que Chloé a emprunté à la bibliothèque

-- 1ère étape : id de chloé
SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'; -- affiche 3 

-- 2ème étape : id des livres empruntés chloé
SELECT id_livre FROM emprunt WHERE id_abonne = 3; -- affiche 100 et 105

-- 3ème étape : titre des livres 
SELECT titre FROM livre WHERE id_livre IN(100,105);

-- 4ème étape : assemblage
SELECT titre FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe';));

------------------------------------------------
-- JOINTURE 

-- Nous aimerions connaitre les dates de sortie et de rendu pour l'abonné Guillaume
SELECT a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e
WHERE a.id_abonne = e.id_abonne
AND a.prenom = 'Guillaume';

-- Faire la même chose en requête imbriquée 
SELECT date_sortie, date_rendu FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

-- Une jointure ete une requete imbriquée permettent de faire des relations entre les différentes tables afin d'avoir des colonnes associés pour former qu'un seul résultat
-- La jointure est possible dans tout les cas
-- Une requete imbriquée est possible seulement dans le cas où le résultat est issu de la même table
-- la requête imbriquée a l'avantage de s'executer plus rapidement

------------------------------------------------
-- Nous aimerion connaitre les mouvement des livres (date_sortie, date_rendu) écrit par ALPHONSE DAUDET
SELECT l.titre, l.auteur, e.date_sortie, e.date_rendu 
FROM emprunt e, livre l
WHERE e.id_livre = l.id_livre
AND l.auteur = 'ALPHONSE DAUDET';

-- SELECT ce que je veux afficher
-- FROM d'ou provenient les données 
-- WHERE jointure des champs commun entre les tables
-- AND condition complémentaire

------------------------------------------------
-- Qui a emprunté le livre "Une vie" sur l'année 2014 ?
SELECT l.titre, a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e, livre l
WHERE a.id_abonne = e.id_abonne
AND e.id_livre = l.id_livre
AND l.titre = 'Une vie'
AND e.date_sortie LIKE '2014%';

-- l.titre : l est un prefixe pour préciser que l'on souhaite afficher le titre de la table 'livre'

-- abonne a : la table 'abonne' se refère au préfixe 'a'





















    

    

