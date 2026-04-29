CREATE OR REPLACE PACKAGE BODY cine.gestion_cinema_pkg AS

    FUNCTION verifier_disponibilite_fct(
        i_seance_id IN NUMBER,
        i_nb_sieges IN NUMBER,
        o_date_prochaine_seance OUT DATE
    ) RETURN BOOLEAN AS

        v_places_disponibles NUMBER;

    BEGIN
        SELECT s.nb_sieges - NVL(SUM(r.nb_sieges), 0)
        INTO v_places_disponibles FROM cine.seances se
        JOIN cine.salles s ON s.id = se.salle_id
        LEFT JOIN cine.reservations r ON r.seance_id = se.id
            AND r.statut <> 'ANNULÉE'
        WHERE se.id = i_seance_id
        GROUP BY s.nb_sieges;

        IF v_places_disponibles < i_nb_sieges THEN
            RAISE e_seance_complete;
        END IF;

        SELECT MIN(se2.date_heure)
        INTO o_date_prochaine_seance FROM cine.seances se1
        JOIN cine.seances se2 ON se2.film_id = se1.film_id
        WHERE se1.id = i_seance_id
          AND se2.date_heure > se1.date_heure;

        RETURN TRUE;

    EXCEPTION
        WHEN e_seance_complete THEN
            RAISE;

        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;

        WHEN OTHERS THEN
            RETURN FALSE;

    END verifier_disponibilite_fct;

END gestion_cinema_pkg;
/