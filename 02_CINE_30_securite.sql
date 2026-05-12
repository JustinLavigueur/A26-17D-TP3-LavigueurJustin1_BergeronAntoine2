-- ============================================================================
-- 02_CINE_30_securite.sql
-- Attribution des privilèges sur les tables aux rôles et aux utilisateurs
-- À exécuter avec l'utilisateur CINE (après la création des tables)
-- ============================================================================

SET SERVEROUTPUT ON;

DECLARE
    TYPE t_tables IS TABLE OF VARCHAR2(30);

    v_tables_caissier t_tables := t_tables('CINEMAS','GENRES','FILMS','SALLES','SEANCES','CLIENTS','RESERVATIONS');

    v_tables_client t_tables := t_tables('FILMS','GENRES','SEANCES','SALLES','CINEMAS');

BEGIN

-- ============================================================================
-- 9) role_caissier
-- ============================================================================
    FOR i IN 1 .. v_tables_caissier.COUNT LOOP
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON cine.' || v_tables_caissier(i) || ' TO role_caissier';
    END LOOP;

    EXECUTE IMMEDIATE 'GRANT EXECUTE ON cine.gestion_cinema_pkg TO role_caissier';

    EXECUTE IMMEDIATE 'GRANT role_caissier TO caissier01';

-- ============================================================================
-- 10) role_client
-- ============================================================================

    FOR i IN 1 .. v_tables_client.COUNT LOOP
        EXECUTE IMMEDIATE 'GRANT SELECT ON cine.' || v_tables_client(i) || ' TO role_client';
    END LOOP;

    EXECUTE IMMEDIATE 'GRANT role_client TO client01';
END;
/
