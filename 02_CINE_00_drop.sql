--------------------------------------------------------
-- === SCRIPT 02_CINE_00_drop.sql ===
-- Ce fichier sql contient les commandes pour la suppression des tables de la base de données CINE en CASCADE (enlève les liens des données dans d'autres tables)
--------------------------------------------------------

-- Suppression des déclencheurs (Triggers)
DROP TRIGGER cine.reservations_capacite_trg;

-- Suppression du package cine.GESTION_CINEMA_PKG et son body aussi 
DROP PACKAGE BODY cine.gestion_cinema_pkg;
DROP PACKAGE cine.gestion_cinema_pkg;

-- Suppression de la vue
DROP VIEW cine.dictionnaire_v;

-- Suppression de la séquence
DROP SEQUENCE cine.seq_clients;

-- Suppression des tables
DROP TABLE cine.reservations CASCADE CONSTRAINTS;
DROP TABLE cine.seances CASCADE CONSTRAINTS;
DROP TABLE cine.salles CASCADE CONSTRAINTS;
DROP TABLE cine.films CASCADE CONSTRAINTS;
DROP TABLE cine.genres CASCADE CONSTRAINTS;
DROP TABLE cine.cinemas CASCADE CONSTRAINTS;
DROP TABLE cine.clients CASCADE CONSTRAINTS;



