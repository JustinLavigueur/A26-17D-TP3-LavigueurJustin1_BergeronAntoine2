--------------------------------------------------------
-- === SCRIPT 01_CINE_00_users.sql ===
-- Ce fichier sql contient les commandes pour la création des utilisateurs de la base de données
--------------------------------------------------------

-- Suppression des utilisateurs
DROP USER CINE CASCADE;
DROP USER TP2235671 CASCADE;
DROP USER TP22363643 CASCADE;

-- Suppression des rôles
DROP ROLE role_cine;
DROP ROLE role_etudiant;

-- ====================================================================
-- Création des rôles
-- ====================================================================

-- Création des utilisateurs
CREATE USER CINE IDENTIFIED BY garneau;
CREATE USER TP2235671 IDENTIFIED BY garneau;
CREATE USER TP22363643 IDENTIFIED BY garneau;

-- Rôle principal (CINE)
CREATE ROLE role_cine;

GRANT CREATE SESSION TO role_cine;
GRANT CREATE TABLE TO role_cine;
GRANT CREATE VIEW TO role_cine;
GRANT CREATE SEQUENCE TO role_cine;
GRANT CREATE PROCEDURE TO role_cine;

-- Rôle pour étudiants
CREATE ROLE role_etudiant;

GRANT CREATE SESSION TO role_etudiant;

-- ====================================================================
-- Attribution des rôles
-- ====================================================================
GRANT role_cine TO CINE;

GRANT role_etudiant TO TP2235671;
GRANT role_etudiant TO TP22363643;

-- ====================================================================
-- Quota
-- ====================================================================
ALTER USER CINE QUOTA UNLIMITED ON USERS;