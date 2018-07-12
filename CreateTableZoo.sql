#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

CREATE DATABASE db_zoopark;
USE db_zoopark;

#------------------------------------------------------------
# Table: ANIMAL
#------------------------------------------------------------

CREATE TABLE ANIMAL(
        id_anim   int (11) Auto_increment  NOT NULL ,
        nom_anim  Varchar (25) NOT NULL ,
        dt_naiss  Date NOT NULL ,
        id_genre  Int NOT NULL ,
        id_pays   Int NOT NULL ,
        id_espece Int NOT NULL ,
        id_enclos Int NOT NULL ,
        PRIMARY KEY (id_anim ) ,
        UNIQUE (nom_anim )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ESPECE
#------------------------------------------------------------

CREATE TABLE ESPECE(
        id_espece   int (11) Auto_increment  NOT NULL ,
        nom_espece  Varchar (25) NOT NULL ,
        estMenace   Bool NOT NULL ,
        desc_espece Varchar (70) NOT NULL ,
        id_regime   Int NOT NULL ,
        PRIMARY KEY (id_espece ) ,
        UNIQUE (nom_espece )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PAYS
#------------------------------------------------------------

CREATE TABLE PAYS(
        id_pays   int (11) Auto_increment  NOT NULL ,
        lib_pays  Varchar (25) NOT NULL ,
        id_region Int NOT NULL ,
        PRIMARY KEY (id_pays ) ,
        UNIQUE (lib_pays )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REGION
#------------------------------------------------------------

CREATE TABLE REGION(
        id_region  int (11) Auto_increment  NOT NULL ,
        lib_region Varchar (25) NOT NULL ,
        PRIMARY KEY (id_region ) ,
        UNIQUE (lib_region )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GENRE
#------------------------------------------------------------

CREATE TABLE GENRE(
        id_genre  int (11) Auto_increment  NOT NULL ,
        lib_genre Varchar (25) NOT NULL ,
        PRIMARY KEY (id_genre ) ,
        UNIQUE (lib_genre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SALARIE
#------------------------------------------------------------

CREATE TABLE SALARIE(
        id_salarie    int (11) Auto_increment  NOT NULL ,
        mat_sala      Varchar (10) NOT NULL ,
        nom_sala      Varchar (25) NOT NULL ,
        prenom_sala   Varchar (25) NOT NULL ,
        adr_sala      Varchar (50) NOT NULL ,
        cp_sala       Int NOT NULL ,
        ville_sala    Varchar (25) NOT NULL ,
        date_emb_sala Date NOT NULL ,
        id_fnct       Int ,
        id_serv       Int NOT NULL ,
        PRIMARY KEY (id_salarie ) ,
        UNIQUE (mat_sala )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REGIME ALIMENTAIRE
#------------------------------------------------------------

CREATE TABLE REGIME_ALIMENTAIRE(
        id_regime  int (11) Auto_increment  NOT NULL ,
        lib_regime Varchar (25) ,
        PRIMARY KEY (id_regime ) ,
        UNIQUE (lib_regime )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FONCTION
#------------------------------------------------------------

CREATE TABLE FONCTION(
        id_fnct  int (11) Auto_increment  NOT NULL ,
        lib_fnct Varchar (25) NOT NULL ,
        PRIMARY KEY (id_fnct ) ,
        UNIQUE (lib_fnct )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SERVICE
#------------------------------------------------------------

CREATE TABLE SERVICE(
        id_serv  int (11) Auto_increment  NOT NULL ,
        lib_serv Varchar (25) NOT NULL ,
        PRIMARY KEY (id_serv ) ,
        UNIQUE (lib_serv )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REPAS
#------------------------------------------------------------

CREATE TABLE REPAS(
        id_repas  int (11) Auto_increment  NOT NULL ,
        nom_repas Varchar (25) NOT NULL ,
        h_deb     Time NOT NULL ,
        h_fin     Time NOT NULL ,
        PRIMARY KEY (id_repas ) ,
        UNIQUE (h_deb ,h_fin )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE DE SOINS
#------------------------------------------------------------

CREATE TABLE TYPE_DE_SOINS(
        id_soins   int (11) Auto_increment  NOT NULL ,
        type_soins Varchar (50) NOT NULL ,
        PRIMARY KEY (id_soins ) ,
        UNIQUE (type_soins )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE OPERATION
#------------------------------------------------------------

CREATE TABLE TYPE_OPERATION(
        id_ope   int (11) Auto_increment  NOT NULL ,
        type_ope Varchar (70) NOT NULL ,
        PRIMARY KEY (id_ope )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ALIMENTS
#------------------------------------------------------------

CREATE TABLE ALIMENTS(
        id_aliment  int (11) Auto_increment  NOT NULL ,
        lib_aliment Varchar (25) NOT NULL ,
        PRIMARY KEY (id_aliment ) ,
        UNIQUE (lib_aliment )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENCLOS
#------------------------------------------------------------

CREATE TABLE ENCLOS(
        id_enclos  int (11) Auto_increment  NOT NULL ,
        lib_enclos Varchar (25) NOT NULL ,
        PRIMARY KEY (id_enclos ) ,
        UNIQUE (lib_enclos )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SAISONNIER
#------------------------------------------------------------

CREATE TABLE SAISONNIER(
        date_fin_contrat Date NOT NULL ,
        id_salarie       Int NOT NULL ,
        PRIMARY KEY (id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MEDICAMENT
#------------------------------------------------------------

CREATE TABLE MEDICAMENT(
        id_medic  int (11) Auto_increment  NOT NULL ,
        lib_medic Varchar (50) ,
        prix_unit DECIMAL (15,3)  NOT NULL ,
        PRIMARY KEY (id_medic ) ,
        UNIQUE (lib_medic )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FOURNISSEUR
#------------------------------------------------------------

CREATE TABLE FOURNISSEUR(
        id_frns    int (11) Auto_increment  NOT NULL ,
        nom_frns   Varchar (25) NOT NULL ,
        adr_frns   Varchar (70) NOT NULL ,
        cp_frns    Int ,
        ville_frns Varchar (25) NOT NULL ,
        PRIMARY KEY (id_frns ) ,
        UNIQUE (nom_frns ,adr_frns )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VETERINAIRE
#------------------------------------------------------------

CREATE TABLE VETERINAIRE(
        lib_diplo_veto Varchar (25) NOT NULL ,
        id_salarie     Int NOT NULL ,
        PRIMARY KEY (id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SOIGNEUR
#------------------------------------------------------------

CREATE TABLE SOIGNEUR(
        echelon_soigneur Varchar (25) NOT NULL ,
        id_salarie       Int NOT NULL ,
        PRIMARY KEY (id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: donne
#------------------------------------------------------------

CREATE TABLE donne(
        cmtaire    Varchar (50) ,
        id_anim    Int NOT NULL ,
        id_soins   Int NOT NULL ,
        id_salarie Int NOT NULL ,
        PRIMARY KEY (id_anim ,id_soins ,id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: opère
#------------------------------------------------------------

CREATE TABLE opere(
        cmtaire    Varchar (50) ,
        dt_ope     Date NOT NULL ,
        h_deb_ope  Time NOT NULL ,
        h_fin_ope  Time NOT NULL ,
        id_anim    Int NOT NULL ,
        id_ope     Int NOT NULL ,
        id_salarie Int NOT NULL ,
        PRIMARY KEY (id_anim ,id_ope ,id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commande
#------------------------------------------------------------

CREATE TABLE commande(
        dt_cmd     Date NOT NULL ,
        qte_cmd    Int NOT NULL ,
        id_frns    Int NOT NULL ,
        id_medic   Int NOT NULL ,
        id_salarie Int NOT NULL ,
        PRIMARY KEY (id_frns ,id_medic ,id_salarie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: prend 
#------------------------------------------------------------

CREATE TABLE prend(
        id_anim  Int NOT NULL ,
        id_repas Int NOT NULL ,
        PRIMARY KEY (id_anim ,id_repas )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: compose
#------------------------------------------------------------

CREATE TABLE compose(
        Qte_aliment Int NOT NULL ,
        id_repas    Int NOT NULL ,
        id_aliment  Int NOT NULL ,
        PRIMARY KEY (id_repas ,id_aliment )
)ENGINE=InnoDB;

ALTER TABLE ANIMAL ADD CONSTRAINT FK_ANIMAL_id_genre FOREIGN KEY (id_genre) REFERENCES GENRE(id_genre);
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ANIMAL_id_pays FOREIGN KEY (id_pays) REFERENCES PAYS(id_pays);
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ANIMAL_id_espece FOREIGN KEY (id_espece) REFERENCES ESPECE(id_espece);
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ANIMAL_id_enclos FOREIGN KEY (id_enclos) REFERENCES ENCLOS(id_enclos);
ALTER TABLE ESPECE ADD CONSTRAINT FK_ESPECE_id_regime FOREIGN KEY (id_regime) REFERENCES REGIME_ALIMENTAIRE(id_regime);
ALTER TABLE PAYS ADD CONSTRAINT FK_PAYS_id_region FOREIGN KEY (id_region) REFERENCES REGION(id_region);
ALTER TABLE SALARIE ADD CONSTRAINT FK_SALARIE_id_fnct FOREIGN KEY (id_fnct) REFERENCES FONCTION(id_fnct);
ALTER TABLE SALARIE ADD CONSTRAINT FK_SALARIE_id_serv FOREIGN KEY (id_serv) REFERENCES SERVICE(id_serv);
ALTER TABLE SAISONNIER ADD CONSTRAINT FK_SAISONNIER_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE VETERINAIRE ADD CONSTRAINT FK_VETERINAIRE_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE SOIGNEUR ADD CONSTRAINT FK_SOIGNEUR_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE donne ADD CONSTRAINT FK_donne_id_anim FOREIGN KEY (id_anim) REFERENCES ANIMAL(id_anim);
ALTER TABLE donne ADD CONSTRAINT FK_donne_id_soins FOREIGN KEY (id_soins) REFERENCES TYPE_DE_SOINS(id_soins);
ALTER TABLE donne ADD CONSTRAINT FK_donne_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE opere ADD CONSTRAINT FK_opere_id_anim FOREIGN KEY (id_anim) REFERENCES ANIMAL(id_anim);
ALTER TABLE opere ADD CONSTRAINT FK_opere_id_ope FOREIGN KEY (id_ope) REFERENCES TYPE_OPERATION(id_ope);
ALTER TABLE opere ADD CONSTRAINT FK_opere_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_frns FOREIGN KEY (id_frns) REFERENCES FOURNISSEUR(id_frns);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_medic FOREIGN KEY (id_medic) REFERENCES MEDICAMENT(id_medic);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_salarie FOREIGN KEY (id_salarie) REFERENCES SALARIE(id_salarie);
ALTER TABLE prend ADD CONSTRAINT FK_prend_id_anim FOREIGN KEY (id_anim) REFERENCES ANIMAL(id_anim);
ALTER TABLE prend ADD CONSTRAINT FK_prend_id_repas FOREIGN KEY (id_repas) REFERENCES REPAS(id_repas);
ALTER TABLE compose ADD CONSTRAINT FK_compose_id_repas FOREIGN KEY (id_repas) REFERENCES REPAS(id_repas);
ALTER TABLE compose ADD CONSTRAINT FK_compose_id_aliment FOREIGN KEY (id_aliment) REFERENCES ALIMENTS(id_aliment);
