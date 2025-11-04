# Creazione del Database
CREATE DATABASE VendiCose_SpA;
USE VendiCose_SpA;

# Creazione delle tabelle, partendo dalle tabelle forti, ovvero le tabelle senza le FK
CREATE TABLE categoria (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR (100) NOT NULL
);

CREATE TABLE magazzino (
id_magazzino INT AUTO_INCREMENT PRIMARY KEY,
nome_magazzino VARCHAR (100) NOT NULL,
citta_magazzino VARCHAR (100)
);

CREATE TABLE prodotto (
id_prodotto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
prezzo_unitario DECIMAL (10,2) NOT NULL,
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE stock (
id_prodotto INT,
id_magazzino INT,
quantita_iniziale INT,
quantita_rimanente INT,
PRIMARY KEY (id_prodotto, id_magazzino),
FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto),
FOREIGN KEY (id_magazzino) REFERENCES magazzino(id_magazzino)
);

CREATE TABLE negozio (
id_negozio INT AUTO_INCREMENT PRIMARY KEY,
nome_negozio VARCHAR (100) NOT NULL,
citta_negozio VARCHAR (100),
id_magazzino INT,
FOREIGN KEY (id_magazzino) REFERENCES magazzino(id_magazzino)
);

CREATE TABLE vendita (
id_vendita INT AUTO_INCREMENT PRIMARY KEY,
data_vendita DATE NOT NULL,
prezzo_vendita DECIMAL (10,2) NOT NULL,
id_negozio INT,
FOREIGN KEY (id_negozio) REFERENCES negozio(id_negozio)
);

CREATE TABLE dettaglio_vendita (
id_dettaglio_vendita INT AUTO_INCREMENT PRIMARY KEY,
quantita INT NOT NULL,
prezzo_unitario DECIMAL (10,2) NOT NULL,
id_prodotto INT,
id_vendita INT,
FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto),
FOREIGN KEY (id_vendita) REFERENCES vendita(id_vendita)
);

INSERT INTO categoria (nome_categoria) VALUES
('Elettronica'),
('Informatica'),
('Telefonia'),
('Elettrodomestici'),
('Videogiochi'),
('Accessori Casa'),
('Arredamento'),
('Illuminazione'),
('Giardinaggio'),
('Fai da te'),
('Sport'),
('Ciclismo'),
('Fitness'),
('Moda Uomo'),
('Moda Donna'),
('Calzature'),
('Orologi'),
('Gioielli'),
('Bellezza'),
('Profumi'),
('Salute'),
('Alimentari'),
('Bevande'),
('Animali'),
('Libri'),
('Fumetti'),
('Musica'),
('Film'),
('Strumenti Musicali'),
('Auto'),
('Moto'),
('Accessori Auto'),
('Accessori Moto'),
('Giocattoli'),
('Prima Infanzia'),
('Scuola e Ufficio'),
('Cancelleria'),
('Arte e Creatività'),
('Collezionismo'),
('Casa Smart'),
('Sicurezza Domestica'),
('Domotica'),
('Fotografia'),
('Videocamere'),
('Console e Accessori'),
('Drone e Accessori'),
('Cucina'),
('Pulizia Casa'),
('Bagno'),
('Tessili Casa'),
('Decorazioni');

INSERT INTO magazzino (nome_magazzino, citta_magazzino) VALUES
('Magazzino Centrale Nord', 'Milano'),
('Magazzino Centrale Sud', 'Napoli'),
('Deposito Roma Est', 'Roma'),
('Deposito Roma Ovest', 'Roma'),
('Magazzino Torino Nord', 'Torino'),
('Magazzino Torino Sud', 'Torino'),
('Centro Logistico Bologna', 'Bologna'),
('Centro Logistico Firenze', 'Firenze'),
('Hub Genova Porto', 'Genova'),
('Hub Venezia Marittima', 'Venezia'),
('Magazzino Bari Zona Industriale', 'Bari'),
('Magazzino Palermo Est', 'Palermo'),
('Magazzino Catania Ovest', 'Catania'),
('Magazzino Verona Nord', 'Verona'),
('Magazzino Padova Est', 'Padova'),
('Deposito Lecce Sud', 'Lecce'),
('Magazzino Brescia Centro', 'Brescia'),
('Centro Logistico Bergamo', 'Bergamo'),
('Hub Reggio Emilia', 'Reggio Emilia'),
('Magazzino Parma Est', 'Parma'),
('Deposito Modena Nord', 'Modena'),
('Magazzino Pescara Porto', 'Pescara'),
('Deposito Chieti Scalo', 'Chieti'),
('Magazzino Taranto Sud', 'Taranto'),
('Magazzino Salerno Zona Industriale', 'Salerno'),
('Hub Perugia Est', 'Perugia'),
('Magazzino Ancona Nord', 'Ancona'),
('Deposito Pesaro Urbino', 'Pesaro'),
('Centro Logistico Trieste', 'Trieste'),
('Magazzino Udine Ovest', 'Udine'),
('Deposito Bolzano Sud', 'Bolzano'),
('Magazzino Trento Nord', 'Trento'),
('Centro Logistico Aosta', 'Aosta'),
('Hub Campobasso', 'Campobasso'),
('Magazzino Potenza Sud', 'Potenza'),
('Deposito Matera Ovest', 'Matera'),
('Magazzino Catanzaro Centro', 'Catanzaro'),
('Hub Cosenza Est', 'Cosenza'),
('Deposito Reggio Calabria', 'Reggio Calabria'),
('Magazzino L’Aquila Est', 'L’Aquila'),
('Deposito Teramo Nord', 'Teramo'),
('Magazzino Sassari Sud', 'Sassari'),
('Deposito Cagliari Nord', 'Cagliari'),
('Hub Oristano', 'Oristano'),
('Centro Logistico Pisa', 'Pisa'),
('Magazzino Livorno Porto', 'Livorno'),
('Magazzino Lucca Est', 'Lucca'),
('Deposito Arezzo', 'Arezzo'),
('Magazzino Terni', 'Terni'),
('Centro Logistico Varese', 'Varese');

INSERT INTO prodotto (nome, prezzo_unitario, id_categoria) VALUES
('Smartphone Galaxy A35', 289.99, 3),
('Notebook Lenovo IdeaPad', 649.90, 2),
('TV Samsung 55"', 599.00, 4),
('Frigorifero Bosch NoFrost', 749.00, 4),
('Console PlayStation 5', 549.99, 5),
('Lampada da tavolo LED', 29.90, 8),
('Trapano a percussione Bosch', 119.00, 10),
('Bicicletta da corsa Bianchi', 899.00, 12),
('Tappetino yoga antiscivolo', 24.99, 13),
('Felpa uomo Adidas', 49.99, 14),
('Vestito donna Zara', 59.90, 15),
('Scarpe da ginnastica Nike', 79.90, 16),
('Orologio Casio digitale', 39.99, 17),
('Bracciale Pandora argento', 89.00, 18),
('Profumo Dior Sauvage 100ml', 109.00, 20),
('Integratore multivitaminico', 14.90, 21),
('Pacco pasta Barilla 1kg', 1.79, 22),
('Bottiglia vino Chianti DOCG', 9.99, 23),
('Crocchette cane Royal Canin', 34.90, 24),
('Romanzo “1984” di Orwell', 12.00, 25),
('Fumetto Marvel Spiderman #1', 4.99, 26),
('CD Coldplay - Parachutes', 11.99, 27),
('Blu-ray Inception', 14.99, 28),
('Chitarra acustica Yamaha', 189.00, 29),
('Casco moto AGV', 199.00, 31),
('Tappetini auto universali', 24.99, 32),
('Action figure Batman', 29.90, 34),
('Seggiolino auto Chicco', 89.00, 35),
('Zaino scolastico Invicta', 39.90, 36),
('Penna a sfera Bic', 1.20, 37),
('Set colori acrilici', 14.99, 38),
('Francobollo raro Italia 1960', 39.00, 39),
('Lampadina smart Philips Hue', 19.99, 40),
('Telecamera interna Wi-Fi', 59.90, 41),
('Termostato smart Nest', 129.00, 42),
('Fotocamera Canon EOS 250D', 499.00, 43),
('Videocamera GoPro Hero 11', 429.00, 44),
('Controller Xbox Series', 64.90, 45),
('Drone DJI Mini 2', 449.00, 46),
('Pentola a pressione Lagostina', 79.90, 47),
('Detersivo Dash 3L', 8.49, 48),
('Set asciugamani 3 pezzi', 22.90, 50),
('Specchio da bagno LED', 59.00, 49),
('Tovaglia cotone 6 posti', 17.99, 50),
('Sedia da ufficio ergonomica', 149.00, 7),
('Divano 3 posti beige', 799.00, 7),
('Mensola legno IKEA', 24.99, 6),
('Cacciavite elettrico Xiaomi', 39.00, 10),
('Monitor gaming 27" LG', 229.00, 2),
('Mouse wireless Logitech', 29.99, 2);

INSERT INTO stock (id_prodotto, id_magazzino, quantita_iniziale, quantita_rimanente) VALUES
(1, 1, 120, 80),
(2, 2, 90, 45),
(3, 3, 60, 55),
(4, 4, 50, 30),
(5, 5, 75, 40),
(6, 6, 200, 180),
(7, 7, 100, 70),
(8, 8, 30, 20),
(9, 9, 150, 110),
(10, 10, 90, 60),
(11, 11, 85, 75),
(12, 12, 70, 50),
(13, 13, 95, 70),
(14, 14, 120, 90),
(15, 15, 80, 45),
(16, 16, 300, 270),
(17, 17, 500, 490),
(18, 18, 180, 150),
(19, 19, 200, 130),
(20, 20, 60, 30),
(21, 21, 70, 55),
(22, 22, 40, 25),
(23, 23, 65, 40),
(24, 24, 40, 35),
(25, 25, 50, 45),
(26, 26, 85, 65),
(27, 27, 100, 95),
(28, 28, 200, 190),
(29, 29, 400, 390),
(30, 30, 300, 250),
(31, 31, 250, 230),
(32, 32, 120, 110),
(33, 33, 140, 130),
(34, 34, 180, 150),
(35, 35, 100, 90),
(36, 36, 90, 70),
(37, 37, 70, 50),
(38, 38, 60, 55),
(39, 39, 80, 75),
(40, 40, 150, 140),
(41, 41, 90, 85),
(42, 42, 100, 60),
(43, 43, 200, 170),
(44, 44, 50, 45),
(45, 45, 60, 40),
(46, 46, 30, 20),
(47, 47, 75, 70),
(48, 48, 150, 130),
(49, 49, 90, 80),
(50, 50, 110, 100);

INSERT INTO negozio (nome_negozio, citta_negozio, id_magazzino) VALUES
('TechWorld Milano', 'Milano', 1),
('ElettroShop Napoli', 'Napoli', 2),
('MediaStore Roma Est', 'Roma', 3),
('MediaStore Roma Ovest', 'Roma', 4),
('Torino TechPoint', 'Torino', 5),
('Torino Casa e Design', 'Torino', 6),
('Bologna SmartShop', 'Bologna', 7),
('Firenze Domotica', 'Firenze', 8),
('Genova Elettronica', 'Genova', 9),
('Venezia Casa Smart', 'Venezia', 10),
('Bari ElettroPoint', 'Bari', 11),
('Palermo Hi-Tech', 'Palermo', 12),
('Catania Connect', 'Catania', 13),
('Verona Digitale', 'Verona', 14),
('Padova Arredo', 'Padova', 15),
('Lecce Store', 'Lecce', 16),
('Brescia Hi-Fi', 'Brescia', 17),
('Bergamo Casa', 'Bergamo', 18),
('Reggio Emilia Outlet', 'Reggio Emilia', 19),
('Parma Electronics', 'Parma', 20),
('Modena Tech Zone', 'Modena', 21),
('Pescara ClickStore', 'Pescara', 22),
('Chieti Domus', 'Chieti', 23),
('Taranto Digital Shop', 'Taranto', 24),
('Salerno Market', 'Salerno', 25),
('Perugia Store', 'Perugia', 26),
('Ancona Retail', 'Ancona', 27),
('Pesaro Urbino Center', 'Pesaro', 28),
('Trieste Point', 'Trieste', 29),
('Udine Store', 'Udine', 30),
('Bolzano TechCity', 'Bolzano', 31),
('Trento Smart', 'Trento', 32),
('Aosta Shop', 'Aosta', 33),
('Campobasso Outlet', 'Campobasso', 34),
('Potenza Store', 'Potenza', 35),
('Matera Domus', 'Matera', 36),
('Catanzaro Digit', 'Catanzaro', 37),
('Cosenza Point', 'Cosenza', 38),
('Reggio Calabria Center', 'Reggio Calabria', 39),
('L’Aquila CityShop', 'L’Aquila', 40),
('Teramo Market', 'Teramo', 41),
('Sassari Click', 'Sassari', 42),
('Cagliari Tech', 'Cagliari', 43),
('Oristano Home', 'Oristano', 44),
('Pisa Hub', 'Pisa', 45),
('Livorno TechStore', 'Livorno', 46),
('Lucca Market', 'Lucca', 47),
('Arezzo Shop', 'Arezzo', 48),
('Terni Digital', 'Terni', 49),
('Varese Point', 'Varese', 50);

INSERT INTO vendita (data_vendita, prezzo_vendita, id_negozio) VALUES
('2025-01-05', 349.99, 1),
('2025-01-07', 89.90, 2),
('2025-01-10', 129.00, 3),
('2025-01-12', 599.00, 4),
('2025-01-15', 49.99, 5),
('2025-01-18', 799.00, 6),
('2025-01-21', 29.90, 7),
('2025-01-23', 449.00, 8),
('2025-01-25', 9.99, 9),
('2025-01-27', 14.99, 10),
('2025-02-01', 59.00, 11),
('2025-02-03', 229.00, 12),
('2025-02-05', 19.99, 13),
('2025-02-07', 39.99, 14),
('2025-02-09', 89.00, 15),
('2025-02-11', 24.99, 16),
('2025-02-13', 499.00, 17),
('2025-02-15', 109.00, 18),
('2025-02-17', 34.90, 19),
('2025-02-19', 12.00, 20),
('2025-02-21', 4.99, 21),
('2025-02-23', 11.99, 22),
('2025-02-25', 14.99, 23),
('2025-02-27', 189.00, 24),
('2025-03-02', 199.00, 25),
('2025-03-04', 24.99, 26),
('2025-03-06', 89.00, 27),
('2025-03-08', 39.90, 28),
('2025-03-10', 1.20, 29),
('2025-03-12', 14.99, 30),
('2025-03-14', 39.00, 31),
('2025-03-16', 19.99, 32),
('2025-03-18', 59.90, 33),
('2025-03-20', 129.00, 34),
('2025-03-22', 499.00, 35),
('2025-03-24', 429.00, 36),
('2025-03-26', 64.90, 37),
('2025-03-28', 449.00, 38),
('2025-03-30', 79.90, 39),
('2025-04-02', 8.49, 40),
('2025-04-04', 22.90, 41),
('2025-04-06', 59.00, 42),
('2025-04-08', 17.99, 43),
('2025-04-10', 149.00, 44),
('2025-04-12', 799.00, 45),
('2025-04-14', 24.99, 46),
('2025-04-16', 39.00, 47),
('2025-04-18', 229.00, 48),
('2025-04-20', 29.99, 49),
('2025-04-22', 289.99, 50);

INSERT INTO dettaglio_vendita (quantita, prezzo_unitario, id_prodotto, id_vendita) VALUES
(2, 289.99, 1, 1),
(1, 649.90, 2, 2),
(1, 599.00, 3, 3),
(1, 749.00, 4, 4),
(1, 549.99, 5, 5),
(3, 29.90, 6, 6),
(1, 119.00, 7, 7),
(1, 899.00, 8, 8),
(2, 24.99, 9, 9),
(1, 49.99, 10, 10),
(1, 59.90, 11, 11),
(2, 79.90, 12, 12),
(1, 39.99, 13, 13),
(1, 89.00, 14, 14),
(1, 109.00, 15, 15),
(3, 14.90, 16, 16),
(10, 1.79, 17, 17),
(2, 9.99, 18, 18),
(1, 34.90, 19, 19),
(1, 12.00, 20, 20),
(1, 4.99, 21, 21),
(1, 11.99, 22, 22),
(1, 14.99, 23, 23),
(1, 189.00, 24, 24),
(1, 199.00, 25, 25),
(2, 24.99, 26, 26),
(1, 89.00, 27, 27),
(1, 39.90, 28, 28),
(5, 1.20, 29, 29),
(1, 14.99, 30, 30),
(1, 39.00, 31, 31),
(2, 19.99, 32, 32),
(1, 59.90, 33, 33),
(1, 129.00, 34, 34),
(1, 499.00, 35, 35),
(1, 429.00, 36, 36),
(1, 64.90, 37, 37),
(1, 449.00, 38, 38),
(2, 79.90, 39, 39),
(3, 8.49, 40, 40),
(2, 22.90, 41, 41),
(1, 59.00, 42, 42),
(2, 17.99, 43, 43),
(1, 149.00, 44, 44),
(1, 799.00, 45, 45),
(2, 24.99, 46, 46),
(1, 39.00, 47, 47),
(1, 229.00, 48, 48),
(1, 29.99, 49, 49),
(1, 289.99, 50, 50);

SELECT * FROM categoria;
SELECT * FROM magazzino;
SELECT * FROM prodotto;
SELECT * FROM stock;
SELECT * FROM negozio;
SELECT * FROM vendita;
SELECT * FROM dettaglio_vendita;

# Ogni qual volta un prodotto viene venduto in un negozio, qual è la query da eseguire per aggiornare le tabelle di riferimento?
# Questa query mi dà il TOTALE VENDUTO per id_prodotto e id_magazzino, quindi creo la VIEW chiamata vendite_totali
CREATE VIEW vendite_totali AS (
SELECT
	dv.id_prodotto,
    m.id_magazzino,
    SUM(dv.quantita) AS tot_venduto
FROM dettaglio_vendita dv
JOIN vendita v ON dv.id_vendita = v.id_vendita
JOIN negozio n ON v.id_negozio = n.id_negozio
JOIN magazzino m ON n.id_magazzino = m.id_magazzino
GROUP BY 
	dv.id_prodotto,
    m.id_magazzino
);

SELECT * FROM vendite_totali;
SHOW TABLES;
DESCRIBE dettaglio_vendita;


#SIMULAZIONE NUOVA VENDITA

START TRANSACTION;
INSERT INTO vendita (data_vendita, prezzo_vendita, id_negozio) 
VALUES 
 ('2025-11-04', 150, 3);
COMMIT;

START TRANSACTION;
INSERT INTO dettaglio_vendita (quantita, prezzo_unitario, id_prodotto, id_vendita) 
VALUES
 (3, 20.00, 2, 5),
 (2, 45.00, 4, 5);
 COMMIT;
 

 