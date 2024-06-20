COPY Personne(id, nom, prenom, prenomPere, nomMere, prenomMere)
FROM '/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/personnes_avec_id.csv'
DELIMITER ',';

COPY Commune(id, nom, departement)
FROM '/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/communes_avec_id.csv'
DELIMITER ',';

COPY Acte(id, type, personneA, personneB, commune, date, numVue)
FROM '/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/actes.csv'
DELIMITER ','
CSV HEADER;