import pandas as pd

# Charger le fichier 'personnes.csv' dans un DataFrame
personnes_df = pd.read_csv('/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/personnes.csv', header=None, names=['Numéro', 'Nom', 'Prénom', 'PrénomPère', 'NomMère', 'PrénomMère'], keep_default_na=False)
communes_df = pd.read_csv('/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/communes.csv', header=None, names=['Numéro', 'Nom', 'Département'], keep_default_na=False)

# Fonction pour rechercher l'identifiant d'une personne dans 'personnes.csv'
def trouver_id_personne(nom, prenom, prenomPere, nomMere, prenomMere):
    filtre = (personnes_df['Nom'] == nom) & (personnes_df['Prénom'] == prenom) & (personnes_df['PrénomPère'] == prenomPere) & (personnes_df['NomMère'] == nomMere) & (personnes_df['PrénomMère'] == prenomMere)
    resultats = personnes_df[filtre]
    if not resultats.empty:
        return resultats['Numéro'].values[0]
    else:
        return None
    
# Fonction pour rechercher l'identifiant d'une commune dans 'communes.csv'
def trouver_id_commune(nom, departement):
    filtre = (communes_df['Nom'] == nom) & (communes_df['Département'].astype(str) == str(departement)) # pb ici : il ne reconnait aucune commune
    resultats = communes_df[filtre]
    if not resultats.empty:
        return resultats['Numéro'].values[0]
    else:
        return None

with open('/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/mariages_L3_5k.csv', 'r') as f:
    with open('/Users/alexylafosse/Desktop/S6/Modelisation_BD/projet/csv_scripts/actes.csv', 'w') as output_file:
        output_file.write("Identifiant d’acte,Type d’acte,Id Personne A,Id Personne B,Commune,Date,Num Vue\n")
        for line in f:
            mariage_info = line.strip().split(',')
            if len(mariage_info) == 16:
                idPersA = trouver_id_personne(mariage_info[2], mariage_info[3], mariage_info[4], mariage_info[5], mariage_info[6])
                idPersB = trouver_id_personne(mariage_info[7], mariage_info[8], mariage_info[9], mariage_info[10], mariage_info[11])
                commune = trouver_id_commune(mariage_info[12], mariage_info[13])
                temps = mariage_info[14].split('/')
                if len(temps) == 3:
                    mariage_info[14] = temps[2] + '-' + temps[1] + '-' + temps[0]
                else:
                    mariage_info[14] = ''
                if (idPersA is not None and idPersB is not None and commune is not None):
                    output_file.write(f"{mariage_info[0]},{mariage_info[1]},{idPersA},{idPersB},{commune},{mariage_info[14]},{mariage_info[15]}\n")
