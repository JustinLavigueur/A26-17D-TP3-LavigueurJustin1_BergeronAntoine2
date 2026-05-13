--------------------------------------------------------
-- === SCRIPT 02_CINE_00_drop.sql ===
-- Ce fichier sql contient les commandes pour la suppression des tables de la base de données CINE en CASCADE (enlève les liens des données dans d'autres tables)
--------------------------------------------------------

-- Suppression des déclencheurs (Triggers)
BEGIN
EXECUTE IMMEDIATE 'DROP TRIGGER cine.reservations_capacite_trg';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- Suppression du package cine.GESTION_CINEMA_PKG et son body aussi
BEGIN
EXECUTE IMMEDIATE 'DROP PACKAGE BODY cine.gestion_cinema_pkg';
EXCEPTION WHEN OTHERS THEN NULL;
END;

BEGIN
EXECUTE IMMEDIATE 'DROP PACKAGE cine.gestion_cinema_pkg';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- Suppression de la vue
BEGIN
EXECUTE IMMEDIATE 'DROP VIEW cine.dictionnaire_v';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- Suppression de la séquence
BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE cine.seq_clients';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- Suppression des tables
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.reservations CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.seances CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.salles CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.films CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.genres CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.acteurs CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE cine.films_acteurs CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;



