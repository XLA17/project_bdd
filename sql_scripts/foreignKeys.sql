ALTER TABLE Acte ADD CONSTRAINT Acte_fk1 FOREIGN KEY (personneA) REFERENCES Personne(id);

ALTER TABLE Acte ADD CONSTRAINT Acte_fk2 FOREIGN KEY (personneB) REFERENCES Personne(id);

ALTER TABLE Acte ADD CONSTRAINT Acte_fk3 FOREIGN KEY (commune) REFERENCES Commune(id);