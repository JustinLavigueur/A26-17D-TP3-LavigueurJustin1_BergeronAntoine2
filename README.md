# A26-17D-TP3-LavigueurJustin1_BergeronAntoine2
## DESCRIPTION
Ce projet dans le cours de base de données 2 consiste à développer un système de gestion de cinéma en utilisant Oracle et PL/SQL.

L’objectif de ce projet est de :
- Créer un package PL/SQL qui regroupe la logique métier
- Implémenter des déclencheurs (triggers)
- Gérer des transactions
- Mettre en place la sécurité avec des rôles

Le projet repose sur le schéma CINE et permet de gérer les réservations, les annulations, les rapports et les accès utilisateurs.

---

## STRUCTURE DU PROJET

- `01_SYS_00_users.sql` = Création des utilisateurs et rôles
- `02_CINE_00_drop.sql` = Suppression des objets
- `02_CINE_05_objects.sql` = Création des tables (modifié avec frais_annulation)
- `02_CINE_10_data.sql` = Données initiales
- `02_CINE_15_gestion_cinema_pkg.pks` = Spécification du package
- `02_CINE_16_gestion_cinema_pkg.pkb` = Implémentation du package
- `02_CINE_20_triggers.sql` = Déclencheurs
- `02_CINE_30_securite.sql` = Sécurité et rôles
- `transactions.sql` = Gestion des transactions
- `tests_fonctionnels_tp3.sql` = Tests
- `README.md` = Description du projet

---

## ÉQUIPE
Étudiant 1 : Justin Lavigueur
Étudiant 2 : Antoine Bergeron

---

## REPO GITHUB
https://github.com/JustinLavigueur/A26-17D-TP3-LavigueurJustin1_BergeronAntoine2.git

---

## PARTAGE DES TÂCHES

### Étudiant 1
**Partie 0 :**
- Travail en équipe

**Partie 1 : Package**
- Fonction : `verifier_disponibilite_fct`
- Procédure : `generer_rapport_occupation_prc`

**Partie 2 : Déclencheurs et Transactions**
- `reservations_capacite_trg` (validation de capacité)
- Transactions : étapes 1 à 3 (campagne tarifaire)

**Partie 3 : Sécurité**
- rôle `role_caissier` (partagé)
- Attribution à `caissier01`


### Étudiant 2 (Antoine Bergeron)

**Partie 0 :**
- Travail en équipe

**Partie 1 : Package**
- Procédure : `annuler_reservation_prc`
- Fonction : `archiver_seances_annee_fct`

**Partie 2 : Déclencheurs et Transactions**
- `clients_delete_trg` (blocage suppression client)
- Transactions : étapes 4 à 5 (frais d'annulation)

**Partie 3 : Sécurité**
- rôle `role_caissier` (partagé)
- Attribution à `client01`

---

### PARTIE 4 : TESTS FONCTIONNELS
- Les tests sont réalisés en équipe
- Ils permettent de valider les fonctions, procédures, triggers et rôles

---

## COMMENTAIRES
Le projet respecte les consignes du TP3 :
- utilisation de curseurs
- gestion des exceptions
- respect des noms imposés
- scripts exécutables sans erreurs

Des tests ont été réalisés pour valider :
- les fonctions et procédures
- les triggers
- les transactions
- les rôles et permissions

---

## INSTRUCTIONS

### 1. Cloner le dépôt
git clone https://github.com/JustinLavigueur/A26-17D-TP3-LavigueurJustin1_BergeronAntoine2.git

### 2. Se placer dans le dossier du projet
cd A26-17D-TP3-LavigueurJustin1_BergeronAntoine2

### 3. Exécuter les scripts dans l’ordre

1. 01_SYS_00_users.sql  
2. 02_CINE_00_drop.sql  
3. 02_CINE_05_objects.sql  
4. 02_CINE_10_data.sql  
5. 02_CINE_15_gestion_cinema_pkg.pks  
6. 02_CINE_16_gestion_cinema_pkg.pkb  
7. 02_CINE_20_triggers.sql  
8. 02_CINE_30_securite.sql  
9. transactions.sql  
10. tests_fonctionnels_tp3.sql  

### 4. Vérification
- On doit s’assurer qu’aucune erreur n’est affichée lors de l’exécution  
- On vérifie le bon fonctionnement des fonctions, procédures et triggers  
- On teste les rôles (caissier01 et client01)  

### 5. Remise
- Créer une archive .zip du projet (sans le dossier .git)  
- Nom du fichier : H26-17D-TP3-LavigueurJustin1_BergeronAntoine2.zip  
- Déposer le fichier sur LÉA  
