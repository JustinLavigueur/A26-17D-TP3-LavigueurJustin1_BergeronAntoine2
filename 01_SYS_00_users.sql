--------------------------------------------------------
-- === SCRIPT 01_CINE_00_users.sql ===
-- Ce fichier sql contient les commandes pour la création des utilisateurs de la base de données
--------------------------------------------------------
CREATE USER CINE IDENTIFIED BY garneau;
GRANT dba TO CINE;