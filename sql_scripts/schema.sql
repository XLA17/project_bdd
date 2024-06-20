CREATE TABLE IF NOT EXISTS Personne (
	id int NOT NULL,
	nom varchar(255) NOT NULL,
	prenom varchar(255) NOT NULL,
	prenomPere varchar(255) DEFAULT '',
	nomMere varchar(255) DEFAULT '',
	prenomMere varchar(255) DEFAULT '',
	PRIMARY KEY (id)
);

CREATE TYPE TypeActe AS ENUM (
    'Certificat de mariage',
    'Contrat de mariage',
    'Divorce',
    'Mariage',
    'Promesse de mariage - fiançailles',
    'Publication de mariage',
    'Rectification de mariage'
);

CREATE TYPE Departement AS ENUM ('44', '49', '79', '85');

CREATE TABLE IF NOT EXISTS Commune (
	id int NOT NULL,
	nom varchar(255) NOT NULL,
	departement Departement NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS Acte (
	id int NOT NULL,
	type TypeActe NOT NULL,
	personneA int NOT NULL,
	personneB int NOT NULL,
	commune int NOT NULL,
	date date,
	numVue varchar(255) NOT NULL,
	PRIMARY KEY (id)
);