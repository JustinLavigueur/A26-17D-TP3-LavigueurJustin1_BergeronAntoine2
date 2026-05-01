-- ============================================================================
-- 02_CINE_20_triggers.sql
-- Déclencheurs du schéma CINE
-- À exécuter avec l'utilisateur CINE
-- ============================================================================

SET SERVEROUTPUT ON;

-- ============================================================================
-- DÉCLENCHEUR : reservations_capacite_trg
-- ============================================================================
-- BUT : Vérifier que le nombre de sièges demandés ne dépasse pas la capacité
--       disponible de la salle avant toute insertion ou mise à jour de nb_sieges
--       dans RÉSERVATIONS. Attention : si le nombre de sièges demandés dépasse la capacité,
--       l'exception doit faire planter le système.
--       Faites attention aussi au AUPDATE: on ne veut pas compter deux fois la ligne
--       lorsqu'on est en cours de le modifier.
-- ============================================================================

CREATE OR REPLACE TRIGGER cine.reservations_capacite_trg
BEFORE INSERT OR UPDATE OF nb_sieges ON cine.reservations
FOR EACH ROW
DECLARE
    v_capacite_salle NUMBER;
    v_sieges_deja_reserves NUMBER;
    v_places_disponibles NUMBER;
BEGIN
    SELECT s.nb_sieges
    INTO v_capacite_salle
    FROM cine.seances se
    JOIN cine.salles s ON s.id = se.salle_id
    WHERE se.id = :NEW.seance_id;

    SELECT NVL(SUM(r.nb_sieges), 0)
    INTO v_sieges_deja_reserves
    FROM cine.reservations r
    WHERE r.seance_id = :NEW.seance_id
      AND r.statut <> 'ANNULÉE'
      AND r.id <> NVL(:NEW.id, -1);

    v_places_disponibles := v_capacite_salle - v_sieges_deja_reserves;

    IF :NEW.nb_sieges > v_places_disponibles THEN
        RAISE_APPLICATION_ERROR(-20002,'Capacité de la salle dépassée.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Séance introuvable.');

    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003,'Erreur dans reservations_capacite_trg : ' || SQLERRM);
END reservations_capacite_trg;
/


-- ============================================================================
-- DÉCLENCHEUR : clients_delete_trg
-- ============================================================================
-- BUT : Contrôler la suppression d'un client. Si le client a des réservations 
--       futures, nous ne pouvons pas le supprimer. Attention : si il a des 
--       reservations, l'exception doit faire planter le système.
-- ============================================================================

CREATE OR REPLACE TRIGGER cine.clients_delete_trg
END clients_delete_trg;
/
