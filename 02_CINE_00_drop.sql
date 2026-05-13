--------------------------------------------------------
-- === SCRIPT 02_CINE_00_drop.sql ===
-- Ce fichier sql contient les commandes pour la suppression des tables de la base de données CINE en CASCADE (enlève les liens des données dans d'autres tables)
--------------------------------------------------------


--------------------------------------------------------
-- SECTION 1 : SUPPRESSION DES TRIGGERS
--------------------------------------------------------

-- Trigger reservations_capacite_trg
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER cine.reservations_capacite_trg';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- Trigger clients_delete_trg
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER cine.clients_delete_trg';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/



--------------------------------------------------------
-- SECTION 2 : SUPPRESSION DU PACKAGE
--------------------------------------------------------

-- Suppression du body du package
BEGIN
    EXECUTE IMMEDIATE 'DROP PACKAGE BODY cine.gestion_cinema_pkg';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Suppression du package
BEGIN
    EXECUTE IMMEDIATE 'DROP PACKAGE cine.gestion_cinema_pkg';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/



--------------------------------------------------------
-- SECTION 3 : SUPPRESSION DE LA VUE cine.dictionnaire_v
--------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW cine.dictionnaire_v';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/



--------------------------------------------------------
-- SECTION 4 : SUPPRESSION DE LA SEQUENCE cine.seq_clients
--------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE cine.seq_clients';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/



--------------------------------------------------------
-- SECTION 5 : SUPPRESSION DES TABLES
--------------------------------------------------------

-- Table reservations
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.reservations CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table seances
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.seances CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table salles
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.salles CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table films
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.films CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table genres
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.genres CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table acteurs
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.acteurs CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table films_acteurs
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.films_acteurs CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table clients
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.clients CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Table cinemas
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE cine.CINEMAS CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;



