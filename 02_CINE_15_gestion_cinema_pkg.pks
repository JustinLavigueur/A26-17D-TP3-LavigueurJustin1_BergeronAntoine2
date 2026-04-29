--- Package de gestion du cinéma
CREATE OR REPLACE PACKAGE cine.GESTION_CINEMA_PKG AS

    e_client_inexistant  EXCEPTION;
    e_annulation_tardive EXCEPTION;

    PROCEDURE annuler_reservation_prc(
        p_id_reservation IN cine.reservations.id%TYPE
    );

END GESTION_CINEMA_PKG;
/

