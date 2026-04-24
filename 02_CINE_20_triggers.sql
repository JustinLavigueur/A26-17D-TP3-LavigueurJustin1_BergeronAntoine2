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
