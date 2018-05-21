
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













