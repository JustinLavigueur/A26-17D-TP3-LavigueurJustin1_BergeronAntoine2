--- Package de gestion du cinéma
CREATE OR REPLACE PACKAGE cine.GESTION_CINEMA_PKG AS

    e_client_inexistant  EXCEPTION;
    e_annulation_tardive EXCEPTION;

    -- Exception levée quand la séance n'a pas assez de places disponibles
    e_seance_complete EXCEPTION;



    PROCEDURE annuler_reservation_prc(
        i_reservation_id IN cine.reservations.id%TYPE
    );

    -- La fonction verifier_disponibilite_fct vérifie si une séance de cinéma a assez de places disponibles.
    -- Elle retourne TRUE si oui et lève l'exception e_seance_complete si non.
    FUNCTION verifier_disponibilite_fct(
        i_seance_id IN NUMBER,
        i_nb_sieges IN NUMBER,
        o_date_prochaine OUT DATE
    ) RETURN BOOLEAN;

    -- Variable globale
    g_annee_courante CONSTANT NUMBER := EXTRACT(YEAR FROM SYSDATE);

    -- La procedure generer_rapport_occupation_prc permet de générer via DBMS_OUTPUT un rapport d'occupation par salle pour une année donnée
    PROCEDURE generer_rapport_occupation_prc(
        i_annee IN NUMBER DEFAULT g_annee_courante,
        o_nb_salles_traitees OUT NUMBER
    );

    FUNCTION archiver_seances_annee_fct(
        i_annee IN NUMBER DEFAULT g_annee_courante
    ) RETURN NUMBER;

END gestion_cinema_pkg;
/