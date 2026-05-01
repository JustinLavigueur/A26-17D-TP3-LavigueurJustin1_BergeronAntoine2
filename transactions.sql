-- ============================================================================
-- transactions.sql
-- Bloc PL/SQL anonyme de simulation de campagnes tarifaires et de frais
-- À exécuter avec l'utilisateur CINE (ou un utilisateur ayant role_systeme)
-- ============================================================================
SET SERVEROUTPUT ON;

DECLARE
    v_nb_lignes NUMBER;
    v_nb_montants_bas NUMBER;

BEGIN

    SAVEPOINT debut_campagne;

    -- ==========================================================================
    -- ÉTUDIANT A — Étapes 1 à 3 : Campagne tarifaire
    -- ==========================================================================

    -- Étape 1 : Faire une mise à jour afin que la colonne PRIX_TICKET soit à 12.99
    --           pour toutes les réservatins CONFIRMÉES.

    UPDATE cine.reservations
    SET prix_ticket = 12.99
    WHERE statut = 'CONFIRMÉE';

    v_nb_lignes := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Étape 1 : ' || v_nb_lignes || ' réservations mises à 12.99');


    -- Étape 2 : Appliquer une réduction de 10 % sur PRIX_TICKET pour les
    --           réservations CONFIRMÉES des clients dont le programme_fidelite = 'GOLD'.

    UPDATE cine.reservations r
    SET prix_ticket = prix_ticket * 0.90
    WHERE statut = 'CONFIRMÉE'
      AND r.client_id IN (
        SELECT id FROM cine.clients
        WHERE programme_fidelite = 'GOLD'
      );

    v_nb_lignes := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Étape 2 : ' || v_nb_lignes || ' réservations GOLD réduites de 10%');

    -- Étape 3 : Vérifier si un MONTANT_CALCULE (colonne virtuelle) est inférieur
    --           à 5,00 $ parmi les réservations CONFIRMÉES.
    --           Si OUI :
    --             - annuler la réduction et appliquer à la place une réduction forfaitaire de 0,50 $
    --               sur PRIX_TICKET pour les mêmes clients
    --           Si NON :
    --             - message de confirmation que les réductions % sont conservées

    SELECT COUNT(*)
    INTO v_nb_montants_bas
    FROM cine.reservations
    WHERE statut = 'CONFIRMÉE' AND montant_calcule < 5;

    IF v_nb_montants_bas > 0 THEN

        ROLLBACK TO debut_campagne;

        DBMS_OUTPUT.PUT_LINE('Montant < 5 détecté → annulation réduction 10%');

        -- reset
        UPDATE cine.reservations
        SET prix_ticket = 12.99
        WHERE statut = 'CONFIRMÉE';

        -- réduction fixe
        UPDATE cine.reservations r
        SET prix_ticket = prix_ticket - 0.50
        WHERE statut = 'CONFIRMÉE'
          AND r.client_id IN (
            SELECT id FROM cine.clients
            WHERE programme_fidelite = 'GOLD'
          );

        DBMS_OUTPUT.PUT_LINE('Réduction forfaitaire de 0.50$ appliquée');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Réduction de 10% conservée');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO debut_campagne;
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);

    -- ==========================================================================
    -- ÉTUDIANT B — Étapes 4 à 5 : Campagne de frais d'annulation
    -- ==========================================================================

    -- Étape 4 : Pour toutes les réservations dont le statut est ANNULÉE
    --           et dont la date_reservation est dans les 30 derniers jours,
    --           calculer des frais d'annulation les enregistrer dans une table dans la BD
    -- Étape 5 : Vérifier si un FRAIS_ANNULATION dépasse 50,00 $.
    --           Si OUI :
    --             - annuler les frais % calculés et plafonner FRAIS_ANNULATION 
    --               à 50,00 $ pour toutes les réservations
    --           Si NON :
    --             - message de confirmation que les frais calculés sont conservés

    -- Étape 6 : Si tout s'est déroulé sans erreur :
    --             - COMMIT, message de confirmation
    --           Si EXCEPTION :
    --             - Retourner au début et afficher un message d'erreur.

END;
/
