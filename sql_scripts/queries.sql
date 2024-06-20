SELECT departement, COUNT(*) AS quantite_communes
FROM Commune
GROUP BY departement
ORDER BY quantite_communes DESC;

SELECT COUNT(*) AS quantite_actes
FROM Acte A
JOIN Commune C ON A.commune = C.id
WHERE C.nom = 'LUÇON';

SELECT COUNT(*) AS quantite_contrats_mariage
FROM Acte
WHERE type = 'Contrat de mariage' AND date < '1855-01-01';

SELECT C.nom, COUNT(*) AS quantite_publications
FROM Acte A
JOIN Commune C ON A.commune = C.id
WHERE type = 'Publication de mariage'
GROUP BY C.nom
ORDER BY quantite_publications DESC
LIMIT 1;

SELECT MIN(date) AS premiere_date, MAX(date) AS derniere_date
FROM Acte;