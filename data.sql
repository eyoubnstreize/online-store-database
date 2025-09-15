-- data.sql
INSERT INTO Client (nom, email, telephone) VALUES
('Alice Dupont', 'alice.dupont@example.com', '0612345678'),
('Bob Martin', 'bob.martin@example.com', '0623456789'),
('Claire Durand', 'claire.durand@example.com', '0634567890');

INSERT INTO AdresseLivraison (id_client, rue, ville, code_postal, pays) VALUES
(1, '12 Rue de Paris', 'Lyon', '69000', 'France'),
(2, '34 Avenue de la République', 'Marseille', '13000', 'France'),
(3, '56 Boulevard Saint-Germain', 'Paris', '75005', 'France');

INSERT INTO CategorieProduit (nom, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Books', 'E-books and paper books'),
('Clothing', 'Men and women clothing');

INSERT INTO Produit (nom, description, prix, stock, id_categorie) VALUES
('Smartphone', 'Android smartphone with 128GB storage', 399.99, 50, 1),
('Headphones', 'Bluetooth wireless headphones', 120.00, 80, 1),
('Novel', 'Digital novel in PDF format', 9.99, 500, 2),
('Jeans', 'Denim pants', 49.90, 150, 3);

INSERT INTO Commande (id_client, statut, id_adresse) VALUES
(1, 'Pending', 1),
(2, 'Shipped', 2),
(3, 'Delivered', 3);

INSERT INTO LigneCommande (id_commande, id_produit, quantite, prix_unitaire) VALUES
(1, 1, 1, 399.99),
(2, 2, 2, 120.00),
(3, 3, 3, 9.99);

INSERT INTO Paiement (id_commande, montant, mode_paiement) VALUES
(1, 399.99, 'Credit Card'),
(2, 240.00, 'PayPal'),
(3, 29.97, 'Bank Transfer');

INSERT INTO Livraison (id_commande, transporteur, date_expedition, date_livraison_prevue, statut) VALUES
(1, 'DHL', '2025-09-11', '2025-09-16', 'Pending'),
(2, 'UPS', '2025-09-09', '2025-09-14', 'In Transit'),
(3, 'Chronopost', '2025-09-05', '2025-09-09', 'Delivered');
