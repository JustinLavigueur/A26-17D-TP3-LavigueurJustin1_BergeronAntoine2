--------------------------------------------------------
-- === SCRIPT 02_CINE_00_drop.sql ===
-- Ce fichier sql contient les commandes pour la suppression des tables de la base de données CINE en CASCADE (enlève les liens des données dans d'autres tables)
--------------------------------------------------------

DROP TABLE cine.cinemas CASCADE CONSTRAINTS;
DROP TABLE cine.genres CASCADE CONSTRAINTS;
DROP TABLE cine.films CASCADE CONSTRAINTS;
DROP TABLE cine.salles CASCADE CONSTRAINTS;
DROP TABLE cine.seances CASCADE CONSTRAINTS;
DROP TABLE cine.clients CASCADE CONSTRAINTS;
DROP TABLE cine.reservations CASCADE CONSTRAINTS;

DROP SEQUENCE cine.seq_clients;
DROP VIEW cine.dictionnaire_v;
