--------------------------------------------------------
-- === SCRIPT 02_CINE_00_drop.sql ===
-- Ce fichier sql contient les commandes pour la suppression des tables de la base de données CINE en CASCADE (enlève les liens des données dans d'autres tables)
--------------------------------------------------------

DROP SEQUENCE cine.seq_clients;
DROP VIEW cine.dictionnaire_v;

DROP TABLE cine.cinemas CASCADE CONSTRAINTS;
DROP TABLE cine.genres CASCADE CONSTRAINTS;
DROP TABLE cine.films CASCADE CONSTRAINTS;
DROP TABLE cine.salles CASCADE CONSTRAINTS;
DROP TABLE cine.seances CASCADE CONSTRAINTS;
DROP TABLE cine.clients CASCADE CONSTRAINTS;
DROP TABLE cine.reservations CASCADE CONSTRAINTS;

-- Suppresion du package cine.GESTION_CINEMA_PKG et son body aussi 
DROP PACKAGE BODY cine.gestion_cinema_pkg;
DROP PACKAGE cine.gestion_cinema_pkg;

