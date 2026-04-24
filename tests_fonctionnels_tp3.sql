-- ============================================================================
-- tests_fonctionnels_tp3.sql
-- Tests fonctionnels du package GESTION_CINEMA_PKG et des déclencheurs
-- À exécuter avec l'utilisateur caissier01 (role_caissier)
-- SAUF le test 5 (archiver) qui doit être exécuté avec CINE (role_systeme)
-- ============================================================================
-- INSTRUCTIONS :
--   1. Remplacez toutes les valeurs entre [ ] par des IDs réels de votre BD.
--   2. Chaque test contient des ROLLBACK pour ne pas modifier vos données.
--   3. Exécutez les tests UN PAR UN et vérifiez le DBMS_OUTPUT après chaque bloc.
--   4. Désactivez l'auto-commit dans votre IDE (si applicable).
-- ============================================================================

SET SERVEROUTPUT ON;

-- ============================================================================
-- TEST 1 — verifier_disponibilite_fct : séance disponible
-- Attendu : b_dispo = TRUE, message "Disponible", o_date_prochaine IS NULL
-- ============================================================================
-- Trouvez d'abord l'ID d'une séance ayant encore des places libres

DECLARE
    b_dispo       BOOLEAN;
    d_prochaine   DATE;
BEGIN
    b_dispo := cine.gestion_cinema_pkg.verifier_disponibilite_fct(
        i_seance_id      => [ID_SEANCE_AVEC_PLACES],   
        i_nb_sieges      => 2,
        o_date_prochaine => d_prochaine
    );
    IF b_dispo THEN
        DBMS_OUTPUT.PUT_LINE('TEST 1 RÉUSSI : Séance disponible.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST 1 ÉCHOUÉ : Résultat inattendu.');
    END IF;
EXCEPTION
    WHEN cine.gestion_cinema_pkg.e_seance_complete THEN
        DBMS_OUTPUT.PUT_LINE('TEST 1 ÉCHOUÉ : Exception e_seance_complete inattendue.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TEST 1 ERREUR : ' || SQLCODE || ' - ' || SQLERRM);
END;
/


-- ============================================================================
-- TEST 2 — verifier_disponibilite_fct : séance complète
-- Attendu : e_seance_complete levée, o_date_prochaine renseignée (ou NULL si aucune)
-- ============================================================================
-- Trouvez l'ID d'une séance dont toutes les places sont prises et utiliser cette valeur pour ce test 

DECLARE
    b_dispo     BOOLEAN;
    d_prochaine DATE;
BEGIN
    b_dispo := cine.gestion_cinema_pkg.verifier_disponibilite_fct(
        i_seance_id      => [ID_SEANCE_COMPLETE], 
        i_nb_sieges      => 1,
        o_date_prochaine => d_prochaine
    );
    DBMS_OUTPUT.PUT_LINE('TEST 2 ÉCHOUÉ : Aucune exception levée.');
EXCEPTION
    WHEN cine.gestion_cinema_pkg.e_seance_complete THEN
        DBMS_OUTPUT.PUT_LINE('TEST 2 RÉUSSI : e_seance_complete levée.');
        IF d_prochaine IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('  Prochaine séance : ' || TO_CHAR(d_prochaine, 'YYYY-MM-DD HH24:MI'));
        ELSE
            DBMS_OUTPUT.PUT_LINE('  Aucune prochaine séance pour ce film.');
        END IF;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TEST 2 ERREUR : ' || SQLCODE || ' - ' || SQLERRM);
END;
/


-- ============================================================================
-- TEST 3 — annuler_reservation_prc : annulation sans frais (> 24h)
-- Attendu : statut ANNULÉE, frais_annulation = 0, pas de e_annulation_tardive
-- ============================================================================
-- Trouvez une réservation CONFIRMÉE dont la séance est dans > 24h

DECLARE
BEGIN
    cine.gestion_cinema_pkg.annuler_reservation_prc(
        i_reservation_id => [ID_RESERVATION_FUTURE]   
    );
    -- Vérifier le résultat :
    FOR r IN (SELECT statut, frais_annulation FROM cine.reservations WHERE id = [ID_RESERVATION_FUTURE]) LOOP
        DBMS_OUTPUT.PUT_LINE('TEST 3 — Statut : ' || r.statut || ' | Frais : ' || r.frais_annulation);
        IF r.statut = 'ANNULÉE' AND r.frais_annulation = 0 THEN
            DBMS_OUTPUT.PUT_LINE('TEST 3 RÉUSSI.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('TEST 3 ÉCHOUÉ.');
        END IF;
    END LOOP;
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('(ROLLBACK effectué)');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('TEST 3 ERREUR : ' || SQLCODE || ' - ' || SQLERRM);
END;
/


-- ============================================================================
-- TEST 4 — annuler_reservation_prc : annulation tardive (< 24h)
-- Attendu : statut ANNULÉE, frais_annulation = 20% du montant, e_annulation_tardive
-- ============================================================================
-- Trouvez une réservation CONFIRMÉE dont la séance est dans < 24h :

DECLARE
BEGIN
    cine.gestion_cinema_pkg.annuler_reservation_prc(
        i_reservation_id => [ID_RESERVATION_DANS_24H]
    );
    FOR r IN (SELECT statut, frais_annulation, montant_calcule FROM cine.reservations WHERE id = [ID_RESERVATION_DANS_24H]) LOOP
        DBMS_OUTPUT.PUT_LINE('TEST 4 — Statut : ' || r.statut || ' | Frais : ' || r.frais_annulation);
        IF r.statut = 'ANNULÉE' AND r.frais_annulation > 0 THEN
            DBMS_OUTPUT.PUT_LINE('TEST 4 RÉUSSI. Frais attendus : ' || ROUND(r.montant_calcule * 0.20, 2));
        ELSE
            DBMS_OUTPUT.PUT_LINE('TEST 4 ÉCHOUÉ.');
        END IF;
    END LOOP;
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('(ROLLBACK effectué)');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('TEST 4 ERREUR : ' || SQLCODE || ' - ' || SQLERRM);
END;
/


-- ============================================================================
-- TEST 5 — archiver_seances_annee_fct
-- À exécuter avec CINE (role_systeme) — nécessite CREATE TABLE
-- Attendu : tables seances_archive_AAAAMM créées, retour = nb mois archivés
-- ============================================================================

DECLARE
    n_mois NUMBER;
BEGIN
    n_mois := cine.gestion_cinema_pkg.archiver_seances_annee_fct(
        i_annee => '[ANNEE]'  
    );
    DBMS_OUTPUT.PUT_LINE('TEST 5 — Mois archivés : ' || n_mois);
    IF n_mois > 0 THEN
        DBMS_OUTPUT.PUT_LINE('TEST 5 RÉUSSI.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST 5 : Aucun mois archivé (vérifiez les données ou les statuts EN_ATTENTE).');
    END IF;
    -- Vérifier que les tables ont été créées :
END;
/


-- ============================================================================
-- TEST 6 — generer_rapport_occupation_prc
-- Attendu : rapport DBMS_OUTPUT par salle, o_nb_salles > 0
-- ============================================================================

DECLARE
    n_salles NUMBER;
BEGIN
    cine.gestion_cinema_pkg.generer_rapport_occupation_prc(
        i_annee     => '[ANNEE]',  
        o_nb_salles => n_salles
    );
    DBMS_OUTPUT.PUT_LINE('TEST 6 — Salles traitées : ' || n_salles);
    IF n_salles > 0 THEN
        DBMS_OUTPUT.PUT_LINE('TEST 6 RÉUSSI.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST 6 : Aucune salle traitée (vérifiez l''année et les données).');
    END IF;
END;
/


-- ============================================================================
-- TEST 7 — Déclencheur A : réservations_capacite_trg
-- Attendu : ORA-20002 si on dépasse la capacité
-- ============================================================================
-- Trouvez une séance presque pleine (1 siège libre), l'ID d'un client valide, 
-- et un nombre de sieges à reserver plus grand que le restant.

BEGIN
    -- Tentative d'insertion dépassant la capacité :
    INSERT INTO cine.reservations (seance_id, client_id, date_reservation, nb_sieges, statut)
    VALUES (
        [ID_SEANCE_PRESQUE_PLEINE],   
        [ID_CLIENT_VALIDE],            
        SYSDATE,
        [NB_SIEGES_SUPERIEUR_RESTANTS], 
        'CONFIRMÉE'
    );
    DBMS_OUTPUT.PUT_LINE('TEST 7 ÉCHOUÉ : Le trigger n''a pas bloqué l''insertion.');
    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -20002 THEN
            DBMS_OUTPUT.PUT_LINE('TEST 7 RÉUSSI : ORA-20002 levé — capacité dépassée bloquée.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('TEST 7 ERREUR INATTENDUE : ' || SQLCODE || ' - ' || SQLERRM);
        END IF;
        ROLLBACK;
END;
/


-- ============================================================================
-- TEST 8A — Déclencheur B : clients_delete_trg — blocage si réservation future
-- Attendu : ORA-20001 empêche la suppression
-- ============================================================================
-- Trouvez un client ayant une réservation CONFIRMÉE dans le futur :

BEGIN
    DELETE FROM cine.clients WHERE id = [ID_CLIENT_AVEC_RESERVATION_FUTURE];  
    DBMS_OUTPUT.PUT_LINE('TEST 8A ÉCHOUÉ : Le trigger n''a pas bloqué la suppression.');
    ROLLBACK;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -20001 THEN
            DBMS_OUTPUT.PUT_LINE('TEST 8A RÉUSSI : ORA-20001 levé — suppression bloquée.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('TEST 8A ERREUR INATTENDUE : ' || SQLCODE || ' - ' || SQLERRM);
        END IF;
        ROLLBACK;
END;
/


-- ============================================================================
-- TEST 8B — Déclencheur B : clients_delete_trg — suppression réussie + cascade
-- Attendu : client supprimé, ses réservations aussi
-- ============================================================================
-- Trouvez un client n'ayant AUCUNE réservation future CONFIRMÉE

DECLARE
    n_reservations NUMBER;
BEGIN
    SELECT COUNT(1) INTO n_reservations
    FROM cine.reservations WHERE client_id = [ID_CLIENT_SANS_RESERVATION_FUTURE]; 

    DELETE FROM cine.clients WHERE id = [ID_CLIENT_SANS_RESERVATION_FUTURE]; 

    DBMS_OUTPUT.PUT_LINE('TEST 8B — Client supprimé. Réservations en cascade : ' || n_reservations);
    DBMS_OUTPUT.PUT_LINE('TEST 8B RÉUSSI.');
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('(ROLLBACK effectué)');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('TEST 8B ÉCHOUÉ : ' || SQLCODE || ' - ' || SQLERRM);
END;
/
