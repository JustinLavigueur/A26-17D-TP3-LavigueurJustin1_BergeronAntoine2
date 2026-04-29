--Procédure d'annulation de réservation
CREATE OR REPLACE PACKAGE BODY cine.GESTION_CINEMA_PKG AS

    PROCEDURE annuler_reservation_prc(
        p_id_reservation IN cine.reservations.id%TYPE
    ) IS
        v_date_seance      cine.seances.date_heure%TYPE;
        v_prix_ticket      cine.reservations.prix_ticket%TYPE;
        v_nb_sieges        cine.reservations.nb_sieges%TYPE;
        v_heures_restantes NUMBER;
        v_frais            cine.reservations.frais_annulation%TYPE;
    BEGIN
        BEGIN
            SELECT s.date_heure,
                   r.prix_ticket,
                   r.nb_sieges
            INTO v_date_seance,
                 v_prix_ticket,
                 v_nb_sieges
            FROM cine.reservations r
            JOIN cine.seances s ON r.seance_id = s.id
            WHERE r.id = p_id_reservation;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE e_client_inexistant;
        END;

        v_heures_restantes := (CAST(v_date_seance AS DATE) - CAST(SYSTIMESTAMP AS DATE)) * 24;

        IF v_heures_restantes < 24 THEN
            v_frais := ROUND(v_nb_sieges * v_prix_ticket * 0.5, 2);

            UPDATE cine.reservations
            SET statut           = 'ANNULÉE',
                frais_annulation = v_frais
            WHERE id = p_id_reservation;

            COMMIT;
            RAISE e_annulation_tardive;
        END IF;

        UPDATE cine.reservations
        SET statut           = 'ANNULÉE',
            frais_annulation = 0
        WHERE id = p_id_reservation;

        COMMIT;

    EXCEPTION
        WHEN e_client_inexistant THEN
            RAISE;
        WHEN e_annulation_tardive THEN
            RAISE;
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END annuler_reservation_prc;

END GESTION_CINEMA_PKG;
/