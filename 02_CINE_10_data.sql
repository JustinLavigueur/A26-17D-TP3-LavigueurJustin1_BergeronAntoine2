-- ============================================================================
-- 02_CINE_10_data.sql - VERSION ENRICHIE
-- ============================================================================

PROMPT ===================================================
PROMPT Insertion des données CINÉMAS
PROMPT ===================================================

INSERT INTO cine.cinemas (nom, adresse, ville, telephone, nb_salles)
  VALUES ('Cinéplex Montréal Downtown', '1000 rue Ste-Catherine Ouest', 'Montréal', '(514)-555-1001', 8);
INSERT INTO cine.cinemas (nom, adresse, ville, telephone, nb_salles)
  VALUES ('Cinéplex Laval', '500 boulevard de la Concorde Est', 'Laval', '(450)-555-2002', 6);
INSERT INTO cine.cinemas (nom, adresse, ville, telephone, nb_salles)
  VALUES ('Cinéma Québec City', '1200 rue de la Cour', 'Québec', '(418)-555-3003', 5);
INSERT INTO cine.cinemas (nom, adresse, ville, telephone, nb_salles)
  VALUES ('Cinéplex Gatineau', '300 boulevard Saint-Joseph', 'Gatineau', '(819)-555-4004', 4);
INSERT INTO cine.cinemas (nom, adresse, ville, telephone, nb_salles)
  VALUES ('Cinéplex Toronto', '500 Bloor Street West', 'Toronto', '(416)-555-5005', 7);
COMMIT;
PROMPT ===================================================
PROMPT Insertion des données GENRES
PROMPT ===================================================

INSERT INTO cine.genres (nom, description) VALUES ('Action', 'Films d''action et d''aventure avec cascades');
INSERT INTO cine.genres (nom, description) VALUES ('Comédie', 'Films comiques et humoristiques');
INSERT INTO cine.genres (nom, description) VALUES ('Drame', 'Films dramatiques et émotionnels');
INSERT INTO cine.genres (nom, description) VALUES ('Horreur', 'Films d''horreur et de suspense');
INSERT INTO cine.genres (nom, description) VALUES ('Science-Fiction', 'Films futuristes et technologiques');
INSERT INTO cine.genres (nom, description) VALUES ('Animation', 'Films d''animation pour tous les âges');
INSERT INTO cine.genres (nom, description) VALUES ('Romantique', 'Films romantiques et sentimentaux');
INSERT INTO cine.genres (nom, description) VALUES ('Thriller', 'Films de suspense et d''intriga');
COMMIT;
PROMPT ===================================================
PROMPT Insertion des données FILMS (60 films)
PROMPT ===================================================

INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Oppenheimer', 1, 'Christopher Nolan', 2023, 180, '13+', 100000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Killers of the Flower Moon', 3, 'Martin Scorsese', 2023, 206, '16+', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Barbie', 2, 'Greta Gerwig', 2023, 114, 'PG', 145000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Super Mario Bros. Movie', 6, 'Aaron Horvahy', 2023, 92, 'G', 100000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Dune: Part Two', 5, 'Denis Villeneuve', 2024, 166, '13+', 250000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Insidious: Chapter 3', 4, 'Leigh Whannell', 2015, 97, '13+', 13000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('La La Land', 7, 'Damien Chazelle', 2016, 128, 'PG', 30000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Shutter Island', 8, 'Martin Scorsese', 2010, 138, '13+', 80000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Avengers', 1, 'Joss Whedon', 2012, 143, 'PG', 220000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Spiderman: Across the Spider-Verse', 5, 'Justin K. Levin', 2023, 140, 'PG', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Incredibles 2', 6, 'Brad Bird', 2018, 118, 'PG', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Deadpool and Wolverine', 2, 'Shawn Levy', 2024, 128, '18+', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Dark Knight Rises', 1, 'Christopher Nolan', 2012, 164, '13+', 250000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Inception', 5, 'Christopher Nolan', 2010, 148, '13+', 160000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Titanic', 7, 'James Cameron', 1997, 194, 'PG', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Parasite', 3, 'Bong Joon-ho', 2019, 132, '16+', 11000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Joker', 3, 'Todd Phillips', 2019, 122, '18+', 55000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Everything Everywhere All at Once', 5, 'Daniel Kwan', 2022, 139, '16+', 25000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('M3GAN', 4, 'Gerard Johnstone', 2023, 102, 'PG', 50000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Brutalist', 3, 'Brady Corbet', 2023, 215, '16+', 100000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Zone of Interest', 3, 'Jonathan Glazer', 2023, 105, '16+', 15000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Past Lives', 7, 'Celine Song', 2023, 109, 'PG', 8000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Anatomy of a Fall', 8, 'Justine Triet', 2023, 150, '16+', 20000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Mission: Impossible – Dead Reckoning Part One', 1, 'Christopher McQuarrie', 2023, 163, 'PG', 300000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Iron Claw', 3, 'Sean Durkin', 2023, 156, 'PG', 50000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('American Fiction', 2, 'Cord Jefferson', 2023, 117, 'PG', 35000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Poor Things', 3, 'Yorgos Lanthimos', 2023, 141, '16+', 35000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Oppenheimer 2', 1, 'New Director', 2024, 185, '13+', 150000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Aquaman and the Lost Kingdom', 1, 'James Wan', 2023, 124, 'PG', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Hunger Games: The Ballad of Songbirds and Snakes', 1, 'Francis Lawrence', 2023, 169, 'PG', 115000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Killers of the Flower Moon 2', 1, 'John Doe', 2024, 210, '16+', 180000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Godzilla Minus One', 1, 'Takashi Yamazaki', 2023, 125, '13+', 15000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Marvels', 1, 'Nia DaCosta', 2023, 111, 'PG', 250000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Fathom', 5, 'Jon M. Chu', 2024, 115, 'PG', 180000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Spaceman', 5, 'Johan Renck', 2024, 140, 'PG', 120000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Dune: Part Three', 5, 'Denis Villeneuve', 2025, 165, '13+', 280000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Avatar: Fire and Ash', 5, 'James Cameron', 2025, 190, 'PG', 350000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Inside Out 2', 6, 'Kelsey Mann', 2024, 96, 'G', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Moana 2', 6, 'David G. DeLeon', 2024, 100, 'G', 150000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Lion King', 6, 'Barry Jenkins', 2024, 118, 'G', 250000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Frozen III', 6, 'Chris Buck', 2024, 110, 'G', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Wish Upon a Star', 7, 'Lily James', 2024, 98, 'G', 75000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Love Again', 7, 'Priyanka Chopra', 2024, 105, 'PG', 40000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Holiday 2', 7, 'Nancy Meyers', 2024, 130, 'PG', 85000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('A Walk to Remember 2', 7, 'Nicholas Sparks', 2024, 102, 'PG', 45000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Nun III', 4, 'Michael Chaves', 2024, 110, '18+', 80000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Smile 2', 4, 'Parker Finn', 2024, 127, '18+', 50000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Conjuring 4', 4, 'Michael Chaves', 2025, 128, '16+', 70000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('A Quiet Place 3', 8, 'Michael Sarnoski', 2024, 99, 'PG', 60000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Heretic', 8, 'Bryan Woods', 2024, 103, '16+', 55000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('The Killing Joke', 8, 'Phil Lord', 2024, 115, '16+', 75000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Madame Web', 5, 'S.J. Clarkson', 2024, 102, 'PG', 80000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Captain America: Brave New World', 1, 'Julius Onah', 2024, 118, 'PG', 320000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Black Widow 2', 1, 'Ali Selim', 2024, 131, 'PG', 250000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Thor: Ragnarok 2', 1, 'Taika Waititi', 2024, 146, 'PG', 280000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Ant-Man: Quantumania 2', 1, 'Jeff Loveness', 2024, 125, 'PG', 200000000);
INSERT INTO cine.films (titre, genre_id, realisateur, annee, duree_min, classification, budget)
  VALUES ('Doctor Strange in the Multiverse 2', 5, 'Sam Raimi', 2024, 138, 'PG', 300000000);
COMMIT;
PROMPT ===================================================
PROMPT Insertion des données SALLES
PROMPT ===================================================

INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 1, 100, 'IMAX');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 2, 80, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 3, 90, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 4, 75, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 5, 110, 'IMAX');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 6, 85, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 7, 95, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (1, 8, 70, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 1, 90, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 2, 80, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 3, 100, 'IMAX');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 4, 75, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 5, 85, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (2, 6, 70, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (3, 1, 95, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (3, 2, 85, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (3, 3, 80, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (3, 4, 100, 'IMAX');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (3, 5, 75, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (4, 1, 90, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (4, 2, 80, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (4, 3, 85, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (4, 4, 95, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 1, 100, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 2, 90, 'IMAX');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 3, 80, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 4, 85, '3D');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 5, 75, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 6, 95, 'Standard');
INSERT INTO cine.salles (cinema_id, numero_salle, nb_sieges, type_ecran)
  VALUES (5, 7, 105, 'IMAX');
COMMIT;
PROMPT ===================================================
PROMPT Insertion des données SEANCES
PROMPT ===================================================

-- Séances variées pour tester les requêtes
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (1, 1, TRUNC(SYSDATE) - 120 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (2, 2, TRUNC(SYSDATE) - 120 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (3, 3, TRUNC(SYSDATE) - 120 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (4, 4, TRUNC(SYSDATE) - 119 + INTERVAL '14' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (5, 5, TRUNC(SYSDATE) - 118 + INTERVAL '18' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (6, 6, TRUNC(SYSDATE) - 117 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (7, 7, TRUNC(SYSDATE) - 116 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (8, 8, TRUNC(SYSDATE) - 115 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (9, 9, TRUNC(SYSDATE) - 114 + INTERVAL '16' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (10, 10, TRUNC(SYSDATE) - 113 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (11, 11, TRUNC(SYSDATE) - 112 + INTERVAL '14' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (12, 12, TRUNC(SYSDATE) - 111 + INTERVAL '21' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (13, 13, TRUNC(SYSDATE) - 110 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (14, 14, TRUNC(SYSDATE) - 109 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (15, 15, TRUNC(SYSDATE) - 108 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (16, 16, TRUNC(SYSDATE) - 107 + INTERVAL '15' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (17, 17, TRUNC(SYSDATE) - 106 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (18, 18, TRUNC(SYSDATE) - 105 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (19, 19, TRUNC(SYSDATE) - 104 + INTERVAL '20' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (20, 20, TRUNC(SYSDATE) - 103 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (1, 21, TRUNC(SYSDATE) - 100 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (2, 22, TRUNC(SYSDATE) - 95 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (3, 23, TRUNC(SYSDATE) - 90 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (4, 24, TRUNC(SYSDATE) - 85 + INTERVAL '14' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (5, 25, TRUNC(SYSDATE) - 80 + INTERVAL '18' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (6, 26, TRUNC(SYSDATE) - 75 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (7, 27, TRUNC(SYSDATE) - 70 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (8, 28, TRUNC(SYSDATE) - 65 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (9, 29, TRUNC(SYSDATE) - 60 + INTERVAL '16' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (10, 30, TRUNC(SYSDATE) - 55 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (11, 1, TRUNC(SYSDATE) - 50 + INTERVAL '14' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (12, 2, TRUNC(SYSDATE) - 45 + INTERVAL '21' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (13, 3, TRUNC(SYSDATE) - 40 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (14, 4, TRUNC(SYSDATE) - 35 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (15, 5, TRUNC(SYSDATE) - 30 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (16, 6, TRUNC(SYSDATE) - 25 + INTERVAL '15' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (17, 7, TRUNC(SYSDATE) - 20 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (18, 8, TRUNC(SYSDATE) - 15 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (19, 9, TRUNC(SYSDATE) - 10 + INTERVAL '20' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (20, 10, TRUNC(SYSDATE) - 5 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (1, 31, TRUNC(SYSDATE) + 1 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (2, 32, TRUNC(SYSDATE) + 2 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (3, 33, TRUNC(SYSDATE) + 3 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (4, 34, TRUNC(SYSDATE) + 4 + INTERVAL '14' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (5, 35, TRUNC(SYSDATE) + 5 + INTERVAL '18' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (6, 36, TRUNC(SYSDATE) + 6 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (7, 37, TRUNC(SYSDATE) + 7 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (8, 38, TRUNC(SYSDATE) + 8 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (9, 39, TRUNC(SYSDATE) + 9 + INTERVAL '16' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (10, 40, TRUNC(SYSDATE) + 10 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (11, 41, TRUNC(SYSDATE) + 11 + INTERVAL '14' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (12, 42, TRUNC(SYSDATE) + 12 + INTERVAL '21' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (13, 43, TRUNC(SYSDATE) + 13 + INTERVAL '19' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (14, 44, TRUNC(SYSDATE) + 14 + INTERVAL '16' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (15, 45, TRUNC(SYSDATE) + 15 + INTERVAL '20' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (16, 46, TRUNC(SYSDATE) + 16 + INTERVAL '15' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (17, 47, TRUNC(SYSDATE) + 17 + INTERVAL '17' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (18, 48, TRUNC(SYSDATE) + 18 + INTERVAL '18' HOUR, 12.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (19, 49, TRUNC(SYSDATE) + 19 + INTERVAL '20' HOUR, 14.99);
INSERT INTO cine.seances (salle_id, film_id, date_heure, prix_ticket) VALUES (20, 50, TRUNC(SYSDATE) + 20 + INTERVAL '19' HOUR, 12.99);
COMMIT;
PROMPT ===================================================
PROMPT Insertion des données CLIENTS (200 clients)
PROMPT ===================================================

-- Insertion de 200 clients avec dates d'inscription variées
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Alice', 'Dupont', 'F', '123 rue des Fleurs', 'Montréal', 'Québec', 'Canada', 'H1A 1A1', '(514)-123-4567', 'alice.dupont@email.com', TRUNC(SYSDATE) - 730, 'GOLD');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Bob', 'Martin', 'M', '456 avenue des Champs', 'Montréal', 'Québec', 'Canada', 'H2B 2B2', '(514)-234-5678', 'bob.martin@email.com', TRUNC(SYSDATE) - 700, 'SILVER');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Christine', 'Moreau', 'F', '789 boulevard Saint-Laurent', 'Montréal', 'Québec', 'Canada', 'H3C 3C3', '(514)-345-6789', 'christine.moreau@email.com', TRUNC(SYSDATE) - 650, 'GOLD');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'David', 'Bernard', 'M', '321 rue du Commerce', 'Laval', 'Québec', 'Canada', 'H4L 4L4', '(450)-456-7890', 'david.bernard@email.com', TRUNC(SYSDATE) - 600, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Eve', 'Garcia', 'F', '654 avenue Laurier', 'Laval', 'Québec', 'Canada', 'H5M 5M5', '(450)-567-8901', 'eve.garcia@email.com', TRUNC(SYSDATE) - 550, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Francois', 'Legrand', 'M', '987 boulevard Montmorency', 'Québec', 'Québec', 'Canada', 'G1R 6R6', '(418)-678-9012', 'francois.legrand@email.com', TRUNC(SYSDATE) - 500, 'SILVER');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Gabrielle', 'Leclerc', 'F', '111 rue des Sapins', 'Québec', 'Québec', 'Canada', 'G2S 7S7', '(418)-789-0123', 'gabrielle.leclerc@email.com', TRUNC(SYSDATE) - 450, 'GOLD');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Henry', 'Fontaine', 'M', '222 avenue des Bois', 'Gatineau', 'Québec', 'Canada', 'J8T 8T8', '(819)-890-1234', 'henry.fontaine@email.com', TRUNC(SYSDATE) - 400, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Isabelle', 'Roy', 'F', '333 rue de la Paix', 'Gatineau', 'Québec', 'Canada', 'J9U 9U9', '(819)-901-2345', 'isabelle.roy@email.com', TRUNC(SYSDATE) - 350, 'SILVER');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Jacques', 'Pelletier', 'M', '444 boulevard Cartier', 'Toronto', 'Ontario', 'Canada', 'M5V 5V5', '(416)-012-3456', 'jacques.pelletier@email.com', TRUNC(SYSDATE) - 300, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Karen', 'Gauthier', 'F', '555 rue Principal', 'Toronto', 'Ontario', 'Canada', 'M6G 6G6', '(416)-123-4567', 'karen.gauthier@email.com', TRUNC(SYSDATE) - 250, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Louis', 'Clement', 'M', '666 avenue Principale', 'Montréal', 'Québec', 'Canada', 'H7A 7A7', '(514)-234-5678', 'louis.clement@email.com', TRUNC(SYSDATE) - 200, 'GOLD');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Marie', 'Rousseau', 'F', '777 rue de l''Église', 'Montréal', 'Québec', 'Canada', 'H8B 8B8', '(514)-345-6789', 'marie.rousseau@email.com', TRUNC(SYSDATE) - 150, 'SILVER');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Nicolas', 'Dubois', 'M', '888 rue du Parc', 'Laval', 'Québec', 'Canada', 'H9C 9C9', '(450)-456-7890', 'nicolas.dubois@email.com', TRUNC(SYSDATE) - 100, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Odette', 'Richard', 'F', '999 rue des Violettes', 'Laval', 'Québec', 'Canada', 'H10D 10D', '(450)-567-8901', 'odette.richard@email.com', TRUNC(SYSDATE) - 80, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Paul', 'Michel', 'M', '1010 boulevard Bourque', 'Québec', 'Québec', 'Canada', 'G3E 11E', '(418)-678-9012', 'paul.michel@email.com', TRUNC(SYSDATE) - 60, 'SILVER');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Quincy', 'Marchand', 'M', '1111 rue du Moulin', 'Québec', 'Québec', 'Canada', 'G4F 12F', '(418)-789-0123', 'quincy.marchand@email.com', TRUNC(SYSDATE) - 40, 'BRONZE');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Rachel', 'Dion', 'F', '1212 avenue des Pins', 'Gatineau', 'Québec', 'Canada', 'J10G 13G', '(819)-890-1234', 'rachel.dion@email.com', TRUNC(SYSDATE) - 25, 'GOLD');
INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
  VALUES (seq_clients.NEXTVAL, 'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'), 'Samuel', 'Levesque', 'M', '1313 rue du Chemin', 'Gatineau', 'Québec', 'Canada', 'J11H 14H', '(819)-901-2345', 'samuel.levesque@email.com', TRUNC(SYSDATE) - 10, 'SILVER');
-- Plus 190 autres clients générés de manière systématique
BEGIN
  FOR i IN 1..190 LOOP
    INSERT INTO cine.clients (id, code, prenom, nom, genre, adresse, ville, province, pays, code_postal, telephone, courriel, date_inscription, programme_fidelite)
      VALUES (
        seq_clients.NEXTVAL,
        'CINE' || LPAD(seq_clients.CURRVAL, 8, '0'),
        CASE MOD(i, 3) WHEN 1 THEN 'Marc' WHEN 2 THEN 'Sophie' ELSE 'Jean' END || i,
        CASE MOD(i, 5) WHEN 1 THEN 'Durand' WHEN 2 THEN 'Lefevre' WHEN 3 THEN 'Robert' WHEN 4 THEN 'Thomas' ELSE 'Simon' END,
        CASE MOD(i, 3) WHEN 0 THEN 'M' WHEN 1 THEN 'F' ELSE 'X' END,  -- M, F, X répartis équitablement
        i || ' rue de la Paix',
        CASE MOD(i, 5) WHEN 0 THEN 'Montréal' WHEN 1 THEN 'Laval' WHEN 2 THEN 'Québec' WHEN 3 THEN 'Gatineau' ELSE 'Toronto' END,
        CASE MOD(i, 2) WHEN 0 THEN 'Québec' ELSE 'Ontario' END,
        'Canada',
        'H' || LPAD(i, 2, '0') || 'A 1A1',
        '(514)-' || LPAD(i, 3, '0') || '-' || LPAD(i*2, 4, '0'),
        'client' || i || '@email.com',
        -- Les 50 premiers clients inscrits en 2023
        -- Les autres inscrits en 2025-2026
        CASE WHEN i <= 50 THEN TO_DATE('2023-01-01', 'YYYY-MM-DD') + MOD(i, 365) ELSE TRUNC(SYSDATE) - MOD(i, 365) END,
        CASE MOD(i, 3) WHEN 0 THEN 'GOLD' WHEN 1 THEN 'SILVER' ELSE 'BRONZE' END
      );
  END LOOP;
  COMMIT;
END;
/


PROMPT ===================================================
PROMPT Insertion des donnees RESERVATIONS
PROMPT ===================================================

DECLARE
    TYPE t_ids IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_client_ids   t_ids;

    v_seance_id    NUMBER;
    v_client_id    NUMBER;
    v_date_resa    DATE;
    v_nb_sieges    NUMBER;
    v_statut       VARCHAR2(15);
    v_sieges       VARCHAR2(500);
    v_prix         NUMBER(8, 2);
    v_mod          NUMBER;
    idx            PLS_INTEGER := 1;

    CURSOR cur_clients IS
        SELECT id FROM cine.clients ORDER BY id;

BEGIN
    FOR rec IN cur_clients LOOP
        v_client_ids(idx) := rec.id;
        idx := idx + 1;
    END LOOP;

    -- PARTIE 1 : 50 reservations sur les 9 premiers clients
    --            Dans les 7 derniers mois (Requete 4 : 4+ reservations)
    FOR i IN 1..50 LOOP
        v_client_id := v_client_ids(MOD(i - 1, 9) + 1);
        v_seance_id := MOD(i - 1, 60) + 1;
        v_date_resa := TRUNC(SYSDATE) - MOD(i, 210);
        v_nb_sieges := MOD(i, 4) + 1;
        v_sieges    := 'SIEGE_' || i;
        v_prix      := 12.99 + (MOD(i, 3) * 2);
        v_mod       := MOD(i, 4);

        IF v_mod = 0 THEN
            v_statut := 'CONFIRMÉE';
        ELSIF v_mod = 1 THEN
            v_statut := 'ANNULÉE';
        ELSE
            v_statut := 'EN_ATTENTE';
        END IF;

        INSERT INTO cine.reservations
            (seance_id, client_id, date_reservation, nb_sieges, statut, sieges_occupes, prix_ticket)
        VALUES
            (v_seance_id, v_client_id, v_date_resa, v_nb_sieges, v_statut, v_sieges, v_prix);
    END LOOP;

    -- PARTIE 2 : 350 reservations pour les 150 premiers clients seulement
    --            Clients au-dela du 150e = aucune reserv. (Requete 6)
    --            Dates variees : moitie en 2024, moitie en 2025-2026
    FOR i IN 51..400 LOOP
        v_client_id := v_client_ids(MOD(i - 1, 150) + 1);
        v_seance_id := MOD(i - 1, 60) + 1;
        v_nb_sieges := MOD(i, 4) + 1;
        v_sieges    := 'SIEGE_' || i;
        v_prix      := 12.99 + (MOD(i, 3) * 2);
        v_mod       := MOD(i, 4);

        IF MOD(i, 2) = 0 THEN
            v_date_resa := TO_DATE('2024-01-01', 'YYYY-MM-DD') + MOD(i, 365);
        ELSE
            v_date_resa := TRUNC(SYSDATE) - MOD(i, 220);
        END IF;

        IF v_mod = 0 THEN
            v_statut := 'CONFIRMÉE';
        ELSIF v_mod = 1 THEN
            v_statut := 'ANNULÉE';
        ELSE
            v_statut := 'EN_ATTENTE';
        END IF;

        INSERT INTO cine.reservations
            (seance_id, client_id, date_reservation, nb_sieges, statut, sieges_occupes, prix_ticket)
        VALUES
            (v_seance_id, v_client_id, v_date_resa, v_nb_sieges, v_statut, v_sieges, v_prix);
    END LOOP;
    INSERT INTO cine.reservations (seance_id, client_id, date_reservation, nb_sieges, statut, sieges_occupes, prix_ticket)
    VALUES (1, v_client_ids(1), TO_DATE('2027-01-01', 'YYYY-MM-DD'),1, 'CONFIRMÉE', 'SIEGE_401,', 25.98);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERREUR : ' || SQLERRM);
        RAISE;
END;
/

SELECT 'RESERVATIONS' AS "Table", COUNT(*) AS "Nombre" FROM cine.reservations;

COMMIT;

PROMPT ===================================================
PROMPT Vérification des données insérées
PROMPT ===================================================

SELECT 'CINÉMAS' AS nom_table, COUNT(*) AS "Nombre" FROM cine.cinemas
UNION ALL
SELECT 'GENRES', COUNT(*) FROM cine.genres
UNION ALL
SELECT 'FILMS', COUNT(*) FROM cine.films
UNION ALL
SELECT 'SALLES', COUNT(*) FROM cine.salles
UNION ALL
SELECT 'SEANCES', COUNT(*) FROM cine.seances
UNION ALL
SELECT 'CLIENTS', COUNT(*) FROM cine.clients
UNION ALL
SELECT 'RESERVATIONS', COUNT(*) FROM cine.reservations
ORDER BY 1;

PROMPT ===================================================
PROMPT Données insérées avec succès
PROMPT ===================================================
