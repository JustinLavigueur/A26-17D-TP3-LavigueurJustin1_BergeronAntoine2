-- 1) Combien y a-t-il eu de films par genre? Afficher pour chaque genre: Nom du genre, Nombre de films
-- dans ce genre et Part (%) de ce genre sur le nombre total de films. Trier en ordre décroissant de part
-- et ajoutez un alias de colonne explicite.

SELECT G.NOM AS NOM_GENRE, COUNT(F.ID) AS NB_FILMS,  ROUND((COUNT(F.ID) / (SELECT COUNT(*) FROM cine.FILMS)) * 100, 2) AS PART_POURCENTAGE
FROM cine.GENRES G
LEFT JOIN cine.FILMS F ON F.GENRE_ID = G.ID
GROUP BY G.NOM
ORDER BY PART_POURCENTAGE DESC;



-- 2) Afficher le taux d'occupation par salle. Pour chaque salle, afficher le Cinéma (nom), Numéro de salle,
-- Nombre de sièges, Nombre de sièges réservés et Taux d'occupation (%). Trier par cinéma et numéro
-- de salle.

SELECT C.NOM, S.NUMERO_SALLE, S.NB_SIEGES, NVL(SUM(R.NB_SIEGES), 0) AS SIEGES_RESERVES, ROUND(NVL(SUM(R.NB_SIEGES), 0) / S.NB_SIEGES * 100, 2) AS TAUX_OCCUPATION
FROM cine.CINEMAS C
JOIN cine.SALLES S ON S.CINEMA_ID = C.ID
LEFT JOIN cine.SEANCES SE ON SE.SALLE_ID = S.ID
LEFT JOIN cine.RESERVATIONS R ON R.SEANCE_ID = SE.ID
GROUP BY C.NOM, S.NUMERO_SALLE, S.NB_SIEGES
ORDER BY C.NOM, S.NUMERO_SALLE;

-- 3) Quel est le genre de film le plus populaire auprès de chaque sexe de client? Afficher pour chaque
-- genre de client (M, F, X): Genre du client, Genre de film le plus regardé et Nombre de réservations

SELECT GENRE_CLIENT, GENRE_FILM, NB_RESERVATIONS
FROM (
    SELECT C.GENRE AS GENRE_CLIENT, G.NOM AS GENRE_FILM,
        COUNT(R.ID) AS NB_RESERVATIONS, RANK() OVER
        (PARTITION BY C.GENRE ORDER BY COUNT(R.ID) DESC) AS RANG_GENRE
    FROM cine.CLIENTS C
    JOIN cine.RESERVATIONS R ON R.CLIENT_ID = C.ID
    JOIN cine.SEANCES S ON S.ID = R.SEANCE_ID
    JOIN cine.FILMS F ON F.ID = S.FILM_ID
    JOIN cine.GENRES G ON G.ID = F.GENRE_ID
    GROUP BY C.GENRE, G.NOM
)
WHERE RANG_GENRE = 1
ORDER BY GENRE_CLIENT;

-- 4) Lister les clients qui ont fait plus de 4 réservations au cours des 7 derniers mois. À partir de la plus
-- récente date du jeu de données (vous ne pouvez pas « hard coder » la date). Afficher: CODE du client,
-- Nom complet (PRENOM NOM), Nombre de réservations. Trier en ordre décroissant de nombre de
-- réservations, puis par nom
SELECT C.CODE CODE_CLIENT, C.PRENOM || ' ' || C.NOM NOM_COMPLET, COUNT(R.ID) NB_RESERVATIONS
FROM cine.CLIENTS C
JOIN cine.RESERVATIONS R ON R.CLIENT_ID=C.ID
WHERE R.DATE_RESERVATION>=ADD_MONTHS((SELECT MAX(DATE_RESERVATION) FROM cine.RESERVATIONS),-7)
AND R.DATE_RESERVATION<=(SELECT MAX(DATE_RESERVATION) FROM cine.RESERVATIONS)
GROUP BY C.CODE, C.PRENOM, C.NOM
HAVING COUNT(R.ID) > 4
ORDER BY NB_RESERVATIONS DESC, C.NOM DESC;

-- 5) Afficher la liste des revenus par film (6 derniers mois). Pour chaque film des 6 derniers mois, afficher
-- le : Titre du film, Nombre de réservations, Revenu total, Revenu moyen par salle. Trier en ordre
-- décroissant de revenu total.
SELECT F.TITRE TITRE_FILM, COUNT(R.ID) NOMBRE_RESERVATIONS, SUM(R.MONTANT_CALCULE) REVENU_TOTAL, ROUND(AVG(R.MONTANT_CALCULE),2) REVENU_MOYEN_PAR_SALLE
FROM cine.FILMS F
JOIN cine.SEANCES S ON F.ID=S.FILM_ID
JOIN cine.RESERVATIONS R ON S.ID=R.SEANCE_ID
WHERE R.DATE_RESERVATION>=ADD_MONTHS((SELECT MAX(DATE_RESERVATION) FROM cine.RESERVATIONS),-6)
AND R.DATE_RESERVATION<=(SELECT MAX(DATE_RESERVATION) FROM cine.RESERVATIONS)
GROUP BY F.TITRE
ORDER BY REVENU_TOTAL DESC;

--6) Afficher la liste des clients n'ayant pas encore réservé de billet. Vous devez afficher le CODE du client
--(ex.: CINE00000100), puis son nom complet dans une seule colonne avec le format « Nom, P. »
--(exemple: « Dupont, J »). Cette liste doit s'afficher en ordre alphabétique (croissant) de nom de client
SELECT C.CODE, C.NOM || ', ' || SUBSTR(C.PRENOM,1,1) || '.' AS NOM_COMPLET
FROM TP22363643.CLIENTS C
WHERE NOT EXISTS (
    SELECT 1
    FROM TP22363643.RESERVATIONS R
    WHERE R.CLIENT_ID = C.ID
)
ORDER BY NOM_COMPLET;

--7) Quels sont les 3 films qui ont été réservés le plus souvent en 202X (soit 24, 25 où 26)? On veut voir
--les colonnes suivantes : « Nombre de réservations » (écrit de cette manière et en ordre décroissant)
--et Titre. C’est à vous de choisir l’année.
SELECT F.TITRE, COUNT(R.ID) AS "Nombre de réservations"
FROM cine.FILMS F
JOIN cine.SEANCES S
  ON S.FILM_ID = F.ID
JOIN cine.RESERVATIONS R
  ON S.ID = R.SEANCE_ID
WHERE EXTRACT(YEAR FROM R.DATE_RESERVATION) = 2024
GROUP BY F.TITRE
ORDER BY "Nombre de réservations" DESC
FETCH FIRST 3 ROWS ONLY;

--8) Afficher les revenus par cinéma et par mois. Pour chaque cinéma et chaque mois de l'année
--courante, afficher le : Cinéma (nom), Mois, Revenu total du mois, Nombre de réservations. Trier par
--cinéma et mois.
SELECT C.NOM AS CINEMA, TO_CHAR(R.DATE_RESERVATION, 'YYYY-MM') AS MOIS, SUM(R.montant_calcule) AS REVENU_TOTAL, COUNT(R.ID) AS NOMBRE_RESERVATIONS
FROM cine.CINEMAS C
JOIN cine.SALLES S
  ON S.CINEMA_ID = C.ID
JOIN cine.SEANCES SE
  ON SE.SALLE_ID = S.ID
JOIN cine.RESERVATIONS R
  ON R.SEANCE_ID = SE.ID
WHERE EXTRACT(YEAR FROM R.DATE_RESERVATION) = EXTRACT(YEAR FROM SYSDATE)
GROUP BY C.NOM, TO_CHAR(R.DATE_RESERVATION, 'YYYY-MM')
ORDER BY C.NOM, MOIS;

--9) Quels sont les clients du programme GOLD depuis plus de 2 ans? Afficher: CODE du client, Nom
--complet, Date d'inscription, Nombre de réservations, Créer une vue FILMS_POPULAIRES_V
CREATE OR REPLACE VIEW FILMS_POPULAIRES AS
SELECT C.CODE, C.PRENOM || ' ' || C.NOM AS NOM_COMPLET, C.DATE_INSCRIPTION, COUNT(R.ID) AS NB_RESERVATIONS
FROM cine.CLIENTS C
LEFT JOIN cine.RESERVATIONS R
  ON R.CLIENT_ID = C.ID
WHERE C.PROGRAMME_FIDELITE = 'GOLD'
AND C.DATE_INSCRIPTION <= ADD_MONTHS(SYSDATE, -24)
GROUP BY C.CODE, C.PRENOM, C.NOM, C.DATE_INSCRIPTION
ORDER BY C.DATE_INSCRIPTION ASC;

--Afficher le contenu de la vue FILMS_POPULAIRES_V
SELECT * FROM FILMS_POPULAIRES;

--10) Créer une vue dans le schéma CINE nommée FILMS_POPULAIRES_V qui ferait afficher : Titre du film,
--Genre, Durée (en minutes), Classification, Nombre total de réservations, Revenu total généré, Taux de
--remplissage moyen des salles (%). Trier en ordre décroissant de revenu total. Assurez-vous que
--l'utilisateur CINE a le privilège RESOURCE (grant connect, resource, dba to cine).
CREATE OR REPLACE VIEW FILMS_POPULAIRES_V AS
SELECT F.TITRE, G.NOM AS GENRE, F.DUREE_MIN, F.CLASSIFICATION, COUNT(R.ID) AS NB_RESERVATIONS, SUM(R.montant_calcule) AS REVENU_TOTAL, ROUND(AVG((R.NB_SIEGES / SA.NB_SIEGES) * 100), 2) AS TAUX_REMPLISSAGE
FROM cine.FILMS F
JOIN cine.GENRES G
  ON G.ID = F.GENRE_ID
JOIN cine.SEANCES S
  ON S.FILM_ID = F.ID
  JOIN cine.SALLES SA
  ON SA.ID = S.SALLE_ID
JOIN cine.RESERVATIONS R
  ON R.SEANCE_ID = S.ID
GROUP BY F.TITRE, G.NOM, F.DUREE_MIN, F.CLASSIFICATION
ORDER BY REVENU_TOTAL DESC;

SELECT * FROM FILMS_POPULAIRES_V;

