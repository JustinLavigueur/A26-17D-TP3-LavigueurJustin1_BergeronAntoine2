CREATE OR REPLACE PACKAGE cine.gestion_cinema_pkg AS

    -- Exception levée quand la séance n'a pas assez de places disponibles
    e_seance_complete EXCEPTION;

    -- La fonction verifier_disponibilite_fct vérifie si une séance de cinéma a assez de places disponibles.
    -- Retourne TRUE si oui et lève e_seance_complete si non.
    FUNCTION verifier_disponibilite_fct(
        i_seance_id IN NUMBER,
        i_nb_sieges IN NUMBER,
        o_date_prochaine_seance OUT DATE
    ) RETURN BOOLEAN;

END gestion_cinema_pkg;
/