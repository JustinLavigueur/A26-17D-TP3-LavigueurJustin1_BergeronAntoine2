--------------------------------------------------------
-- === SCRIPT 01_SYS_00_users.sql ===
-- Ce fichier sql contient les commandes pour la création des utilisateurs de la base de données
--------------------------------------------------------

DECLARE
    --------------------------------------------------------
    -- Collections
    --------------------------------------------------------
    TYPE t_liste IS TABLE OF VARCHAR2(30);

    v_utilisateurs t_liste := t_liste('CINE','CAISSIER01','CLIENT01');

    v_roles t_liste := t_liste('ROLE_SYSTEME','ROLE_CAISSIER','ROLE_CLIENT');

BEGIN
    --------------------------------------------------------
    -- Suppression des utilisateurs
    --------------------------------------------------------
    FOR i IN 1 .. v_utilisateurs.COUNT LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP USER ' || v_utilisateurs(i) || ' CASCADE';
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
    END LOOP;

    --------------------------------------------------------
    -- Suppression des rôles
    --------------------------------------------------------
    FOR i IN 1 .. v_roles.COUNT LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP ROLE ' || v_roles(i);
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
    END LOOP;

    --------------------------------------------------------
    -- Création des utilisateurs
    --------------------------------------------------------
    EXECUTE IMMEDIATE 'CREATE USER CINE IDENTIFIED BY cine';
    EXECUTE IMMEDIATE 'CREATE USER CAISSIER01 IDENTIFIED BY garneau';
    EXECUTE IMMEDIATE 'CREATE USER CLIENT01 IDENTIFIED BY cinema';

    --------------------------------------------------------
    -- Quota pour CINE
    --------------------------------------------------------
    EXECUTE IMMEDIATE 'ALTER USER CINE QUOTA UNLIMITED ON USERS';

    --------------------------------------------------------
    -- Création des rôles
    --------------------------------------------------------
    EXECUTE IMMEDIATE 'CREATE ROLE ROLE_SYSTEME';
    EXECUTE IMMEDIATE 'CREATE ROLE ROLE_CAISSIER';
    EXECUTE IMMEDIATE 'CREATE ROLE ROLE_CLIENT';

    --------------------------------------------------------
    -- Privilèges des rôles
    --------------------------------------------------------
    EXECUTE IMMEDIATE 'GRANT DBA TO ROLE_SYSTEME';
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO ROLE_CAISSIER';
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO ROLE_CLIENT';

    --------------------------------------------------------
    -- Attribution du rôle système à CINE
    --------------------------------------------------------
    EXECUTE IMMEDIATE 'GRANT ROLE_SYSTEME TO CINE';
    EXECUTE IMMEDIATE 'GRANT ROLE_CAISSIER TO CAISSIER01';
    EXECUTE IMMEDIATE 'GRANT ROLE_CLIENT TO CLIENT01';

END;
/