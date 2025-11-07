# CREAZIONE DEL DATABASE
CREATE DATABASE VendiCose_SpA;
USE VendiCose_SpA;

# CREAZIONE TABELLE

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE magazzino (
    id_magazzino INT AUTO_INCREMENT PRIMARY KEY,
    nome_magazzino VARCHAR(100) NOT NULL,
    citta_magazzino VARCHAR(100)
);

CREATE TABLE prodotto (
    id_prodotto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    prezzo_unitario DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE stock (
    id_prodotto INT,
    id_magazzino INT,
    quantita_iniziale INT NOT NULL,
    quantita_rimanente INT NOT NULL,
    anno INT NOT NULL,
    mese INT NOT NULL,
    PRIMARY KEY (id_prodotto, id_magazzino, anno, mese),
    FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto),
    FOREIGN KEY (id_magazzino) REFERENCES magazzino(id_magazzino)
);

CREATE TABLE negozio (
    id_negozio INT AUTO_INCREMENT PRIMARY KEY,
    nome_negozio VARCHAR(100) NOT NULL,
    citta_negozio VARCHAR(100),
    id_magazzino INT,
    FOREIGN KEY (id_magazzino) REFERENCES magazzino(id_magazzino)
);

CREATE TABLE vendita (
    id_vendita INT AUTO_INCREMENT PRIMARY KEY,
    data_vendita DATE NOT NULL,
    prezzo_totale DECIMAL(10,2) NOT NULL,
    id_negozio INT,
    FOREIGN KEY (id_negozio) REFERENCES negozio(id_negozio)
);

CREATE TABLE dettaglio_vendita (
    id_dettaglio_vendita INT AUTO_INCREMENT PRIMARY KEY,
    quantita INT NOT NULL,
    prezzo_unitario DECIMAL(10,2) NOT NULL,
    id_prodotto INT,
    id_vendita INT,
    FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto),
    FOREIGN KEY (id_vendita) REFERENCES vendita(id_vendita)
);

CREATE TABLE livello_restock (
    id_magazzino INT,
    id_categoria INT,
    id_prodotto INT,
    soglia_restock INT NOT NULL,
    PRIMARY KEY (id_magazzino, id_categoria, id_prodotto),
    FOREIGN KEY (id_magazzino) REFERENCES magazzino(id_magazzino) ON DELETE CASCADE,  #ON DELETE CASCADE (Se elimino un id_magazzino dalla tabella magazzino, in automatico lo elimina anche in livello_restock)
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE CASCADE,
    FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto) ON DELETE CASCADE
);

# POPOLAMENTO DELLE TABELLE

INSERT INTO categoria (nome_categoria) VALUES
('Elettronica'), ('Informatica'), ('Telefonia'), ('Elettrodomestici'),
('Videogiochi'), ('Accessori Casa'), ('Arredamento'), ('Illuminazione'),
('Giardinaggio'), ('Fai da te'), ('Sport'), ('Ciclismo'),
('Fitness'), ('Moda Uomo'), ('Moda Donna'), ('Calzature'),
('Orologi'), ('Gioielli'), ('Bellezza'), ('Profumi');

INSERT INTO magazzino (nome_magazzino, citta_magazzino) VALUES
('Magazzino Centrale Nord', 'Milano'),
('Magazzino Centrale Sud', 'Napoli'),
('Deposito Roma Est', 'Roma'),
('Magazzino Torino', 'Torino'),
('Centro Logistico Bologna', 'Bologna'),
('Hub Genova', 'Genova'),
('Magazzino Bari', 'Bari'),
('Magazzino Palermo', 'Palermo'),
('Magazzino Verona', 'Verona'),
('Deposito Firenze', 'Firenze');

INSERT INTO prodotto (nome, prezzo_unitario, id_categoria) VALUES
('Smartphone Samsung Galaxy A35', 289.99, 3),
('iPhone 13 128GB', 699.00, 3),
('Xiaomi Redmi Note 12', 199.99, 3),
('Notebook Lenovo IdeaPad', 649.90, 2),
('MacBook Air M2', 1299.00, 2),
('Monitor LG 27" 4K', 329.00, 2),
('Mouse Logitech MX Master', 89.99, 2),
('Frigorifero Bosch NoFrost', 749.00, 4),
('Lavatrice Samsung 9kg', 449.00, 4),
('Microonde Whirlpool', 129.00, 4),
('PlayStation 5', 549.99, 5),
('Xbox Series X', 499.99, 5),
('Nintendo Switch OLED', 349.99, 5),
('FIFA 24', 69.99, 5),
('Divano 3 posti Grigio', 799.00, 7),
('Sedia Ufficio Ergonomica', 149.00, 7),
('Libreria IKEA Kallax', 89.99, 7),
('Lampada LED Smart Philips Hue', 49.90, 8),
('Lampadario Moderno', 159.00, 8),
('Striscia LED RGB 5m', 29.90, 8),
('Tapis Roulant Elettrico', 599.00, 11),
('Manubri Set 20kg', 79.90, 11),
('Tappetino Yoga Premium', 34.90, 11),
('Felpa Nike Sportswear', 59.99, 14),
('Jeans Levi\'s 501', 89.90, 14),
('Vestito Zara Elegante', 79.90, 15),
('Scarpe Running Nike Pegasus', 129.00, 16),
('Stivali Timberland', 179.00, 16),
('Dior Sauvage 100ml', 109.00, 20),
('Chanel N°5 50ml', 139.00, 20);

# Stock GENNAIO 2025
INSERT INTO stock (id_prodotto, id_magazzino, quantita_iniziale, quantita_rimanente, anno, mese) VALUES
(1, 1, 150, 150, 2025, 1),
(1, 2, 120, 120, 2025, 1),
(1, 3, 100, 100, 2025, 1),
(1, 5, 80, 80, 2025, 1),
(2, 1, 80, 80, 2025, 1),
(2, 3, 60, 60, 2025, 1),
(2, 5, 50, 50, 2025, 1),
(3, 1, 200, 200, 2025, 1),
(3, 2, 180, 180, 2025, 1),
(3, 7, 150, 150, 2025, 1),
(4, 1, 70, 70, 2025, 1),
(4, 3, 50, 50, 2025, 1),
(4, 5, 40, 40, 2025, 1),
(5, 1, 30, 30, 2025, 1),
(5, 3, 25, 25, 2025, 1),
(6, 1, 100, 100, 2025, 1),
(6, 5, 80, 80, 2025, 1),
(6, 9, 60, 60, 2025, 1),
(7, 1, 300, 300, 2025, 1),
(7, 2, 250, 250, 2025, 1),
(7, 5, 200, 200, 2025, 1),
(8, 1, 40, 40, 2025, 1),
(8, 2, 35, 35, 2025, 1),
(8, 3, 30, 30, 2025, 1),
(9, 1, 45, 45, 2025, 1),
(9, 2, 40, 40, 2025, 1),
(9, 7, 30, 30, 2025, 1),
(10, 1, 80, 80, 2025, 1),
(10, 2, 70, 70, 2025, 1),
(10, 5, 60, 60, 2025, 1),
(11, 1, 60, 60, 2025, 1),
(11, 3, 50, 50, 2025, 1),
(11, 5, 40, 40, 2025, 1),
(12, 1, 55, 55, 2025, 1),
(12, 3, 45, 45, 2025, 1),
(13, 1, 90, 90, 2025, 1),
(13, 2, 80, 80, 2025, 1),
(13, 5, 70, 70, 2025, 1),
(14, 1, 150, 150, 2025, 1),
(14, 2, 130, 130, 2025, 1),
(14, 5, 110, 110, 2025, 1),
(15, 1, 25, 25, 2025, 1),
(15, 3, 20, 20, 2025, 1),
(16, 1, 100, 100, 2025, 1),
(16, 5, 80, 80, 2025, 1),
(16, 9, 60, 60, 2025, 1),
(17, 1, 70, 70, 2025, 1),
(17, 5, 60, 60, 2025, 1),
(18, 1, 200, 200, 2025, 1),
(18, 2, 180, 180, 2025, 1),
(18, 5, 150, 150, 2025, 1),
(19, 1, 50, 50, 2025, 1),
(19, 3, 40, 40, 2025, 1),
(20, 1, 300, 300, 2025, 1),
(20, 2, 250, 250, 2025, 1),
(20, 5, 200, 200, 2025, 1),
(21, 1, 30, 30, 2025, 1),
(21, 5, 25, 25, 2025, 1),
(22, 1, 100, 100, 2025, 1),
(22, 2, 90, 90, 2025, 1),
(22, 5, 80, 80, 2025, 1),
(23, 1, 150, 150, 2025, 1),
(23, 2, 130, 130, 2025, 1),
(24, 1, 200, 200, 2025, 1),
(24, 2, 180, 180, 2025, 1),
(24, 5, 150, 150, 2025, 1),
(25, 1, 250, 250, 2025, 1),
(25, 2, 220, 220, 2025, 1),
(26, 1, 150, 150, 2025, 1),
(26, 3, 130, 130, 2025, 1),
(27, 1, 180, 180, 2025, 1),
(27, 2, 160, 160, 2025, 1),
(27, 5, 140, 140, 2025, 1),
(28, 1, 90, 90, 2025, 1),
(28, 3, 80, 80, 2025, 1),
(29, 1, 100, 100, 2025, 1),
(29, 3, 90, 90, 2025, 1),
(29, 5, 80, 80, 2025, 1),
(30, 1, 70, 70, 2025, 1),
(30, 3, 60, 60, 2025, 1);

INSERT INTO negozio (nome_negozio, citta_negozio, id_magazzino) VALUES
('VendiCose Milano Centro', 'Milano', 1),
('VendiCose Napoli Vomero', 'Napoli', 2),
('VendiCose Roma Tiburtina', 'Roma', 3),
('VendiCose Torino Porta Nuova', 'Torino', 4),
('VendiCose Bologna Due Torri', 'Bologna', 5),
('VendiCose Genova Porto', 'Genova', 6),
('VendiCose Bari Centro', 'Bari', 7),
('VendiCose Palermo Politeama', 'Palermo', 8),
('VendiCose Verona Arena', 'Verona', 9),
('VendiCose Firenze Duomo', 'Firenze', 10);

# Vendite GENNAIO e FEBBRAIO 2025
INSERT INTO vendita (data_vendita, prezzo_totale, id_negozio) VALUES
('2025-01-02', 579.98, 1),
('2025-01-03', 699.00, 1),
('2025-01-04', 399.98, 2),
('2025-01-05', 649.90, 3),
('2025-01-06', 1299.00, 1),
('2025-01-07', 329.00, 5),
('2025-01-08', 269.97, 1),
('2025-01-09', 749.00, 2),
('2025-01-10', 449.00, 1),
('2025-01-11', 258.00, 5),
('2025-01-12', 549.99, 3),
('2025-01-13', 499.99, 1),
('2025-01-14', 699.98, 2),
('2025-01-15', 349.95, 5),
('2025-01-16', 799.00, 3),
('2025-01-17', 447.00, 1),
('2025-01-18', 89.99, 5),
('2025-01-19', 249.50, 2),
('2025-01-20', 159.00, 1),
('2025-01-21', 149.50, 5),
('2025-01-22', 599.00, 1),
('2025-01-23', 239.70, 2),
('2025-01-24', 174.50, 1),
('2025-01-25', 299.95, 5),
('2025-01-26', 449.50, 2),
('2025-01-27', 239.70, 3),
('2025-01-28', 387.00, 1),
('2025-01-29', 179.00, 3),
('2025-01-30', 327.00, 5),
('2025-02-01', 1159.96, 1),
('2025-02-02', 1398.00, 3),
('2025-02-03', 599.97, 2),
('2025-02-05', 1299.80, 5),
('2025-02-07', 658.00, 1),
('2025-02-10', 1498.00, 2),
('2025-02-12', 1099.98, 3),
('2025-02-15', 1049.97, 2),
('2025-02-18', 1598.00, 1),
('2025-02-20', 745.00, 5),
('2025-02-22', 499.00, 1),
('2025-02-25', 1198.00, 1);

INSERT INTO dettaglio_vendita (quantita, prezzo_unitario, id_prodotto, id_vendita) VALUES
(2, 289.99, 1, 1),
(1, 699.00, 2, 2),
(2, 199.99, 3, 3),
(1, 649.90, 4, 4),
(1, 1299.00, 5, 5),
(1, 329.00, 6, 6),
(3, 89.99, 7, 7),
(1, 749.00, 8, 8),
(1, 449.00, 9, 9),
(2, 129.00, 10, 10),
(1, 549.99, 11, 11),
(1, 499.99, 12, 12),
(2, 349.99, 13, 13),
(5, 69.99, 14, 14),
(1, 799.00, 15, 15),
(3, 149.00, 16, 16),
(1, 89.99, 17, 17),
(5, 49.90, 18, 18),
(1, 159.00, 19, 19),
(5, 29.90, 20, 20),
(1, 599.00, 21, 21),
(3, 79.90, 22, 22),
(5, 34.90, 23, 23),
(5, 59.99, 24, 24),
(5, 89.90, 25, 25),
(3, 79.90, 26, 26),
(3, 129.00, 27, 27),
(1, 179.00, 28, 28),
(3, 109.00, 29, 29),
(4, 289.99, 1, 30),
(2, 699.00, 2, 31),
(3, 199.99, 3, 32),
(2, 649.90, 4, 33),
(2, 329.00, 6, 34),
(2, 749.00, 8, 35),
(2, 549.99, 11, 36),
(3, 349.99, 13, 37),
(2, 799.00, 15, 38),
(5, 149.00, 16, 39),
(10, 49.90, 18, 40),
(2, 599.00, 21, 41);

INSERT INTO livello_restock (id_magazzino, id_categoria, id_prodotto, soglia_restock) VALUES
(1, 3, 1, 45),
(2, 3, 1, 40),
(3, 3, 1, 30),
(1, 3, 2, 25),
(3, 3, 2, 20),
(1, 3, 3, 60),
(2, 3, 3, 55),
(1, 2, 4, 20),
(3, 2, 4, 15),
(1, 2, 5, 10),
(1, 2, 6, 30),
(5, 2, 6, 25),
(1, 2, 7, 90),
(2, 2, 7, 75),
(1, 4, 8, 12),
(2, 4, 8, 10),
(1, 4, 9, 15),
(2, 4, 9, 12),
(1, 4, 10, 25),
(1, 5, 11, 20),
(3, 5, 11, 15),
(1, 5, 12, 18),
(1, 5, 13, 30),
(2, 5, 13, 25),
(1, 5, 14, 45),
(1, 7, 15, 8),
(1, 7, 16, 30),
(5, 7, 16, 25),
(1, 7, 17, 20),
(1, 8, 18, 60),
(2, 8, 18, 55),
(1, 8, 19, 15),
(1, 8, 20, 90),
(1, 11, 21, 10),
(1, 11, 22, 30),
(1, 11, 23, 45),
(1, 14, 24, 60),
(2, 14, 24, 55),
(1, 14, 25, 75),
(1, 15, 26, 45),
(1, 16, 27, 55),
(2, 16, 27, 50),
(1, 16, 28, 30),
(1, 20, 29, 30),
(3, 20, 29, 25),
(1, 20, 30, 20);

# Chiusura gennaio e creazione stock febbraio
INSERT INTO stock (id_prodotto, id_magazzino, quantita_iniziale, quantita_rimanente, anno, mese)
SELECT 
    s.id_prodotto,
    s.id_magazzino,
    s.quantita_rimanente AS quantita_iniziale,                                     # QUANTITA' RIMANENTE DEL MESE PRIMA (GENNAIO)
    s.quantita_rimanente - IFNULL(v.tot_venduto, 0) AS quantita_rimanente,         # QUANTITA' RIMANENTE DI FEBBRAIO
    2025 AS anno,
    2 AS mese
FROM stock s
LEFT JOIN (
    SELECT                                                                         # SUBQUERY CALCOLA VENDITE DI FEBBRAIO
        dv.id_prodotto,
        m.id_magazzino,
        SUM(dv.quantita) AS tot_venduto
    FROM dettaglio_vendita dv
    JOIN vendita vend ON dv.id_vendita = vend.id_vendita
    JOIN negozio n ON vend.id_negozio = n.id_negozio
    JOIN magazzino m ON n.id_magazzino = m.id_magazzino
    WHERE YEAR(vend.data_vendita) = 2025 AND MONTH(vend.data_vendita) = 2
    GROUP BY dv.id_prodotto, m.id_magazzino
) v ON s.id_prodotto = v.id_prodotto AND s.id_magazzino = v.id_magazzino
WHERE s.anno = 2025 AND s.mese = 1;

# CREAZIONE VIEW
/* Questa view mostra le vendite mensili, raggruppate per prodotto e magazzino.
   Serve per confrontare i volumi di vendita tra mesi diversi*/
CREATE VIEW vendite_per_mese AS
SELECT
    p.nome AS prodotto,
    m.nome_magazzino AS magazzino,
    YEAR(v.data_vendita) AS anno,
    MONTH(v.data_vendita) AS mese,
    SUM(dv.quantita) AS tot_venduto
FROM dettaglio_vendita dv
JOIN prodotto p ON dv.id_prodotto = p.id_prodotto
JOIN vendita v ON dv.id_vendita = v.id_vendita
JOIN negozio n ON v.id_negozio = n.id_negozio
JOIN magazzino m ON n.id_magazzino = m.id_magazzino
GROUP BY 
    p.nome,
    m.nome_magazzino,
    YEAR(v.data_vendita),
    MONTH(v.data_vendita)
ORDER BY anno DESC, mese DESC, tot_venduto DESC;

/* Stock attuale (ultimo mese disponibile)
   Questa invece restituisce lo stock più recente, cioè le quantità aggiornate all’ultimo mese disponibile*/
CREATE VIEW stock_attuale AS
SELECT 
    p.id_prodotto,
    m.id_magazzino,
    p.nome AS prodotto,
    m.nome_magazzino AS magazzino,
    s.quantita_rimanente AS quantita,
    s.anno,
    s.mese
FROM stock s
JOIN prodotto p ON s.id_prodotto = p.id_prodotto
JOIN magazzino m ON s.id_magazzino = m.id_magazzino
WHERE (s.anno, s.mese) = (
    SELECT anno, mese 
    FROM stock 
    ORDER BY anno DESC, mese DESC
    LIMIT 1
);

/* Prodotti sotto soglia di restock
   Qui individuiamo in automatico i prodotti sotto la soglia di restock e calcoliamo quante unità servono per tornare al livello minimo*/
CREATE VIEW prodotti_sotto_soglia AS
SELECT
    sa.prodotto,
    sa.magazzino,
    sa.quantita,
    lr.soglia_restock,
    (lr.soglia_restock - sa.quantita) AS unita_da_ordinare
FROM stock_attuale sa
JOIN livello_restock lr 
    ON sa.id_magazzino = lr.id_magazzino
    AND sa.id_prodotto = lr.id_prodotto
WHERE sa.quantita < lr.soglia_restock
ORDER BY unita_da_ordinare DESC;

/* Prodotto più venduto
   Con questa view otteniamo i prodotti più venduti, utili per capire le categorie più richieste nei diversi magazzini.*/
CREATE VIEW prodotto_piu_venduto AS
SELECT
    p.nome AS prodotto,
    m.nome_magazzino AS magazzino,
    SUM(dv.quantita) AS tot_venduto
FROM dettaglio_vendita dv
JOIN prodotto p ON dv.id_prodotto = p.id_prodotto
JOIN vendita v ON dv.id_vendita = v.id_vendita
JOIN negozio n ON v.id_negozio = n.id_negozio
JOIN magazzino m ON n.id_magazzino = m.id_magazzino
GROUP BY  p.nome,
          m.nome_magazzino
ORDER BY tot_venduto DESC
LIMIT 3;

/* Magazzino con più vendite
   Questa view invece mostra quali magazzini registrano più vendite complessive, utile per analizzare le performance logistiche*/
CREATE VIEW magazzino_con_piu_vendite AS
SELECT
    m.id_magazzino,
    m.nome_magazzino AS magazzino,
    SUM(dv.quantita) AS tot_venduto
FROM dettaglio_vendita dv
JOIN prodotto p ON dv.id_prodotto = p.id_prodotto
JOIN vendita v ON dv.id_vendita = v.id_vendita
JOIN negozio n ON v.id_negozio = n.id_negozio
JOIN magazzino m ON n.id_magazzino = m.id_magazzino
GROUP BY  m.id_magazzino,
          m.nome_magazzino
ORDER BY tot_venduto DESC
LIMIT 4;
SELECT * FROM magazzino;

/* Vendite totali di tutti i magazzini
   Infine, abbiamo una panoramica generale con le vendite totali di tutti i magazzini.
   Da qui possiamo confrontare facilmente l’andamento dell’azienda*/
CREATE VIEW vendite_tutti_magazzini AS
SELECT
	m.id_magazzino,
	m.nome_magazzino,
     SUM(dv.quantita) AS tot_venduto
FROM magazzino m
LEFT JOIN negozio n ON m.id_magazzino = n.id_magazzino
LEFT JOIN vendita v ON n.id_negozio = v.id_negozio
LEFT JOIN dettaglio_vendita dv ON v.id_vendita = dv.id_vendita
LEFT JOIN prodotto p ON dv.id_prodotto = p.id_prodotto
GROUP BY m.id_magazzino,
	     m. nome_magazzino
ORDER BY tot_venduto DESC;

# SELECT per visualizzare gli insights
SELECT * FROM vendite_per_mese;
SELECT * FROM stock_attuale;
SELECT * FROM prodotti_sotto_soglia;
SELECT * FROM prodotto_piu_venduto;
SELECT * FROM magazzino_con_piu_vendite;
SELECT * FROM vendite_tutti_magazzini;
