
DROP TABLE IF EXISTS Compte,
Transaction,
Categorie,
Sous_categorie,
Mois;

CREATE TABLE IF NOT EXISTS Compte (
    id_compte SERIAL PRIMARY KEY,
    nom_compte VARCHAR(255) NOT NULL,
    solde DECIMAL(15, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Transaction (
    id_transaction SERIAL PRIMARY KEY,
    type_transaction VARCHAR(50),
    nom VARCHAR(255),
    montant DECIMAL(15, 2),
    date_transaction DATE,
    id_categorie INT REFERENCES Categorie(id_categorie),
    id_sous_categorie INT REFERENCES Sous_categorie(id_sous_categorie)
);

CREATE TABLE IF NOT EXISTS Categorie (
    id_categorie SERIAL PRIMARY KEY,
    nom_categorie VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Sous_categorie (
    id_sous_categorie SERIAL PRIMARY KEY,
    nom_sous_categorie VARCHAR(255) NOT NULL,
    id_categorie INT REFERENCES Categorie(id_categorie)
);

CREATE TABLE IF NOT EXISTS Mois (
    id_mois SERIAL PRIMARY KEY,
    mois VARCHAR(50) NOT NULL,
    annee INT NOT NULL,
    total_depenses DECIMAL(15, 2),
    total_revenus DECIMAL(15, 2),
    total_epargne DECIMAL(15, 2)
);

BEGIN;

INSERT INTO Categorie (nom_categorie)
VALUES
    ('Revenus Principaux'),
    ('Revenus Complémentaires'),
    ('Revenus Indépendants'),
    ('Aides et Subventions'),
    ('Remboursements'),
    ('Pensions et Retraites'),
    ('Autres Revenus'),
    ('Primes et Bonus'),
    ('Transferts'),
    ('Logement'),
    ('Transport'),
    ('Impôts et Taxes'),
    ('Alimentation'),
    ('Santé'),
    ('Loisirs et Divertissements'),
    ('Abonnements'),
    ('Épargne et Investissement');

-- Ajout des sous-catégories pour les Revenus Principaux
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Salaire principal', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Revenus Principaux')),
    ('Salaire secondaire', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Revenus Principaux'));

-- Ajout des sous-catégories pour les Revenus Complémentaires
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Revenus de location', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Revenus Complémentaires')),
    ('Revenus d''investissement (dividendes, intérêts)', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Revenus Complémentaires'));

-- Ajout des sous-catégories pour les Revenus Indépendants
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Revenus freelance', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Revenus Indépendants'));

-- Ajout des sous-catégories pour les Aides et Subventions
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Bourses', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Aides et Subventions')),
    ('Aides gouvernementales', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Aides et Subventions'));

-- Ajout des sous-catégories pour les Remboursements
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Remboursements d''impôts', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Remboursements')),
    ('Remboursements de prêts', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Remboursements'));

-- Ajout des sous-catégories pour les Pensions et Retraites
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Pension de retraite', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Pensions et Retraites')),
    ('Plans de retraite privés', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Pensions et Retraites'));

-- Ajout des sous-catégories pour les Autres Revenus
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Revenus de vente', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Autres Revenus')),
    ('Cadeaux en espèces', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Autres Revenus'));

-- Ajout des sous-catégories pour les Primes et Bonus
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Prime annuelle', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Primes et Bonus')),
    ('Bonus', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Primes et Bonus'));

-- Ajout des sous-catégories pour les Transferts
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Transferts entre comptes', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transferts')),
    ('Transferts de tiers', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transferts'));

-- Ajout des sous-catégories pour les Logement
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Loyer ou hypothèque', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement')),
    ('Charges de copropriété', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement')),
    ('Assurance habitation', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement')),
    ('Eau', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement')),
    ('Électricité', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement')),
    ('Gaz', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Logement'));

-- Ajout des sous-catégories pour les Transport
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Achat Vehicule', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport')),
    ('Énergie (essence, électricité)', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport')),
    ('Entretien de véhicule', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport')),
    ('Transports en commun', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport')),
    ('Covoiturage', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport')),
    ('Assurance auto', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Transport'));

-- Ajout des sous-catégories pour les Impôts et Taxes
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Impôt sur le revenu', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Impôts et Taxes')),
    ('Taxes foncières', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Impôts et Taxes')),
    ('Taxes locales', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Impôts et Taxes'));

-- Ajout des sous-catégories pour les Alimentation
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Courses quotidiennes', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Alimentation')),
    ('Déjeuners extérieurs', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Alimentation')),
    ('Restaurants', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Alimentation')),
    ('Cafés', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Alimentation')),
    ('Distributeurs', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Alimentation'));

-- Ajout des sous-catégories pour les Santé
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Soins médicaux', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Santé')),
    ('Médicaments', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Santé')),
    ('Soins dentaires', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Santé')),
    ('Bien-être', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Santé')),
    ('Assurance', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Santé'));

-- Ajout des sous-catégories pour les Loisirs et Divertissements
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Cinéma', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Loisirs et Divertissements')),
    ('Concerts', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Loisirs et Divertissements')),
    ('Sports', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Loisirs et Divertissements')),
    ('Voyages', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Loisirs et Divertissements'));

-- Ajout des sous-catégories pour les Abonnements
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Internet', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Abonnements')),
    ('Téléphone', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Abonnements')),
    ('Services de streaming (Netflix, Canal+, etc.)', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Abonnements')),
    ('Presse', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Abonnements'));

-- Ajout des sous-catégories pour les Épargne et Investissement
INSERT INTO Sous_categorie (nom_sous_categorie, id_categorie)
VALUES
    ('Épargne d''urgence', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement')),
    ('Épargne retraite', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement')),
    ('Épargne pour les études', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement')),
    ('Investissements', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement')),
    ('Assurance vie', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement')),
    ('Assurance invalidité', (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Épargne et Investissement'));

COMMIT;