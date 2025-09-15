-- queries.sql

-- 1. List all clients
SELECT * FROM Client;

-- 2. Orders with client name and status
SELECT c.id_commande, cl.nom, c.statut, c.date_commande
FROM Commande c
JOIN Client cl ON c.id_client = cl.id_client;

-- 3. Products ordered by Alice Dupont
SELECT cl.nom AS client, p.nom AS product, lc.quantite, lc.prix_unitaire
FROM LigneCommande lc
JOIN Commande c ON lc.id_commande = c.id_commande
JOIN Client cl ON c.id_client = cl.id_client
JOIN Produit p ON lc.id_produit = p.id_produit
WHERE cl.nom = 'Alice Dupont';

-- 4. Total spent by each client
SELECT cl.nom, SUM(p.montant) AS total_spent
FROM Paiement p
JOIN Commande c ON p.id_commande = c.id_commande
JOIN Client cl ON c.id_client = cl.id_client
GROUP BY cl.nom;

-- 5. Late deliveries
SELECT l.id_livraison, cl.nom, l.transporteur, l.date_livraison_prevue, l.statut
FROM Livraison l
JOIN Commande c ON l.id_commande = c.id_commande
JOIN Client cl ON c.id_client = cl.id_client
WHERE l.date_livraison_prevue < CURRENT_DATE AND l.statut <> 'Delivered';
