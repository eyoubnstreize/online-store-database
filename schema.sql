-- schema.sql
CREATE TABLE Client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    date_inscription DATE DEFAULT CURRENT_DATE
);

CREATE TABLE AdresseLivraison (
    id_adresse SERIAL PRIMARY KEY,
    id_client INT REFERENCES Client(id_client) ON DELETE CASCADE,
    rue VARCHAR(150),
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    pays VARCHAR(50)
);

CREATE TABLE CategorieProduit (
    id_categorie SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    description TEXT
);

CREATE TABLE Produit (
    id_produit SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    prix DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    id_categorie INT REFERENCES CategorieProduit(id_categorie)
);

CREATE TABLE Commande (
    id_commande SERIAL PRIMARY KEY,
    id_client INT REFERENCES Client(id_client),
    date_commande DATE DEFAULT CURRENT_DATE,
    statut VARCHAR(50),
    id_adresse INT REFERENCES AdresseLivraison(id_adresse)
);

CREATE TABLE LigneCommande (
    id_commande INT REFERENCES Commande(id_commande) ON DELETE CASCADE,
    id_produit INT REFERENCES Produit(id_produit),
    quantite INT CHECK (quantite > 0),
    prix_unitaire DECIMAL(10,2),
    PRIMARY KEY (id_commande, id_produit)
);

CREATE TABLE Paiement (
    id_paiement SERIAL PRIMARY KEY,
    id_commande INT REFERENCES Commande(id_commande),
    montant DECIMAL(10,2),
    mode_paiement VARCHAR(50),
    date_paiement DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Livraison (
    id_livraison SERIAL PRIMARY KEY,
    id_commande INT REFERENCES Commande(id_commande),
    transporteur VARCHAR(50),
    date_expedition DATE,
    date_livraison_prevue DATE,
    statut VARCHAR(50)
);
