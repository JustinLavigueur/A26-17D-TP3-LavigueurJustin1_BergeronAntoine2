-- ============================================================================
-- transactions.sql
-- Bloc PL/SQL anonyme de simulation de campagnes tarifaires et de frais
-- À exécuter avec l'utilisateur CINE (ou un utilisateur ayant role_systeme)
-- ============================================================================
SET SERVEROUTPUT ON;

DECLARE

BEGIN

    -- ==========================================================================
    -- ÉTUDIANT A — Étapes 1 à 3 : Campagne tarifaire
    -- ==========================================================================

    -- Étape 1 : Faire une mise à jour afin que la colonne PRIX_TICKET soit à 12.99
    --           pour toutes les réservatins CONFIRMÉES.
    -- Étape 2 : Appliquer une réduction de 10 % sur PRIX_TICKET pour les
    --           réservations CONFIRMÉES des clients dont le programme_fidelite = 'GOLD'.
    -- Étape 3 : Vérifier si un MONTANT_CALCULE (colonne virtuelle) est inférieur
    --           à 5,00 $ parmi les réservations CONFIRMÉES.
    --           Si OUI :
    --             - annuler la réduction et appliquer à la place une réduction forfaitaire de 0,50 $
    --               sur PRIX_TICKET pour les mêmes clients
    --           Si NON :
    --             - message de confirmation que les réductions % sont conservées

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
