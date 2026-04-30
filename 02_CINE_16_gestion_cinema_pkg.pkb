--Procédure d'annulation de réservation
CREATE OR REPLACE PACKAGE BODY cine.GESTION_CINEMA_PKG AS

    -- Procédure d'annulation de réservation (MEMBRE 2)
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
            v_frais := ROUND(v_nb_sieges * v_prix_ticket * 0.2, 2);

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
            Dbms_output.PUT_LINE('Client inexistant : ' || SQLERRM);

        WHEN e_annulation_tardive THEN
            Dbms_output.PUT_LINE('Annulation tardive. La séance est dans 24h ou moins (Des frais d''annulation de 20% s''appliquent) : ' || SQLERRM);

        WHEN OTHERS THEN
           Dbms_output.PUT_LINE('Erreur lors de l''annulation : ' || SQLERRM);
    END annuler_reservation_prc;


    -- Fonction qui vérifie si une séance a assez de places disponibles (MEMBRE 1)
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
            DBMS_OUTPUT.PUT_LINE('la séance n`a pas assez de places disponibles');

        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;

        WHEN OTHERS THEN
            RETURN FALSE;

    END verifier_disponibilite_fct;


    -- Procédure generer_rapport_occupation_prc (MEMBRE 1)
    PROCEDURE generer_rapport_occupation_prc(
        i_annee IN NUMBER DEFAULT g_annee_courante,
        o_nb_salles_traitees OUT NUMBER
    ) IS
        CURSOR c_occupation IS
            SELECT s.id AS salle_id,
                COUNT(r.id) AS nb_reservations
            FROM cine.salles s
            LEFT JOIN cine.seances se ON se.salle_id = s.id
            LEFT JOIN cine.reservations r ON r.seance_id = se.id
            WHERE EXTRACT(YEAR FROM se.date_heure) = i_annee
            GROUP BY s.id;
    BEGIN

        o_nb_salles_traitees := 0;

        FOR rec IN c_occupation LOOP
            o_nb_salles_traitees := o_nb_salles_traitees + 1;
            DBMS_OUTPUT.PUT_LINE('Salle ' || rec.salle_id ||' : ' || rec.nb_reservations || ' réservations');
        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erreur dans le rapport');
    END generer_rapport_occupation_prc;

    -- Procédure d'archivage privée de séances pour un mois donnée (MEMBRE 2)
    PROCEDURE archiver_mois_prc(
        p_annee IN NUMBER,
        p_mois  IN NUMBER
    ) IS
    BEGIN
        UPDATE cine.seances
        SET statut = 'ARCHIVÉE'
        WHERE EXTRACT(YEAR FROM date_heure) = p_annee
          AND EXTRACT(MONTH FROM date_heure) = p_mois;

        COMMIT;
    END archiver_mois_prc;

    --fonction d'archivage de séances pour une année donnée (MEMBRE 2)
    FUNCTION archiver_seances_annee_fct(
        p_annee IN NUMBER DEFAULT g_annee_courante
    ) RETURN NUMBER IS

        CURSOR c_mois_eligibles(cp_annee IN NUMBER) IS
            SELECT DISTINCT EXTRACT(MONTH FROM date_heure) AS mois
            FROM cine.seances s
            WHERE EXTRACT(YEAR FROM date_heure) = cp_annee
              AND statut != 'ARCHIVÉE'
              AND NOT EXISTS (
                  SELECT 1
                  FROM cine.reservations r
                  WHERE r.seance_id = s.id
                    AND r.statut = 'EN_ATTENTE'
              )
            ORDER BY mois;

        v_nb_mois NUMBER := 0;

    BEGIN
        FOR rec IN c_mois_eligibles(p_annee) LOOP
            archiver_mois_prc(p_annee, rec.mois);
            v_nb_mois := v_nb_mois + 1;
        END LOOP;

        RETURN v_nb_mois;

    EXCEPTION
        WHEN OTHERS THEN
        Dbms_output.PUT_LINE('Erreur lors de l''archivage : ' || SQLERRM);

    END archiver_seances_annee_fct;



END gestion_cinema_pkg;
/