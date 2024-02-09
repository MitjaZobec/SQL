CREATE DATABASE GESTIONALE;

USE GESTIONALE;

-- VARCHAR NUMERO IN BYTE; NVARCHAR N CARATTERI 
CREATE TABLE Prodotti (
IDprodotto INT,
NomeProdotto NVARCHAR (100),
Prezzo DECIMAL (10,2),
primary key (IDprodotto));

describe Prodotti;

INSERT INTO Prodotti(IDprodotto,NomeProdotto,Prezzo) VALUES
(1,'Tablet',300.00),
(2,'Mouse',20.00),
(3,'Tastiera',25.00),
(4,'Monitor',180.00),
(5,'HDD',90.00),
(6,'SSD',200.00),
(7,'RAM',100.00),
(8,'Router',80.00),
(9,'Webcam',45.00),
(10,'GPU',1250.00),
(11,'Trackpad',500.00),
(12,'Techmagazine',5.00),
(13,'Martech',50.00);

CREATE TABLE Clienti (
IDCliente INT,
Nome NVARCHAR (50),
Email NVARCHAR (100),
primary key (IDCliente));

INSERT INTO Clienti (IDCliente,Nome,Email) VALUES
(1,'Antonio',null),
(2,'Battista','battista@mailmail.it'),
(3,'Maria','maria@posta.it'),
(4,'Franca','franca@lettere.it'),
(5,'Ettore',null),
(6,'Arianna','arianna@posta.it'),
(7,'Piero','piero@lavoro.it');

DESCRIBE Clienti;

select * FROM Clienti;

CREATE TABLE Ordini (
IDOrdine INT,
IDProdotto INT,
IDCliente INT,
Quantità INT,
Primary key (IDOrdine),
Foreign key (IDProdotto) REFERENCES Prodotti(IDprodotto),
Foreign key (IDCliente) REFERENCES Clienti (IDCliente));

INSERT INTO Ordini(IDOrdine, IDProdotto, IDCliente, Quantità) VALUES 
(1,2,1,10),
(2,6,2,2),
(3,4,3,5), 
(4,9,1,1), 
(5,11,6,4),
(6,10,2,2),
(7,3,3,3),
(8,1,4,1),
(9,2,5,3),
(10,1,6,2),
(11,2,7,1);

CREATE TABLE DettaglioOrdini (
IDOrdine INT,
IDProdotto INT,
IDCliente INT,
PrezzoTotale FLOAT,
PRIMARY KEY (IDOrdine, IDProdotto,IDCliente),
FOREIGN KEY (IDOrdine) REFERENCES Ordini(IDOrdine) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (IDProdotto) REFERENCES Prodotti (IDprodotto) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (IDCliente) REFERENCES Clienti (IDCliente) ON DELETE RESTRICT ON UPDATE CASCADE);

DROP TABLE DettaglioOrdini;

-- CALCOLO PREZZO TOTALE

INSERT INTO DettaglioOrdini (IDOrdine, IDProdotto, IDCliente, PrezzoTotale) SELECT
ord.IDOrdine,
ord.IDProdotto,
ord.IDCliente,
prd.Prezzo * ord.Quantità as PrezzoTotale
FROM Ordini ord JOIN Prodotti prd ON ord.IDProdotto =prd.IDprodotto;

