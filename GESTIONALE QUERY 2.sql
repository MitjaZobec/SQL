USE GESTIONALE;

SELECT * FROM clienti;

SELECT * FROM Ordini;

SELECT * FROM DettaglioOrdini;

SELECT * FROM prodotti;

-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti.

SELECT * FROM PRODOTTI
WHERE Prezzo > '50';

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti.

SELECT Email FROM clienti
WHERE Nome LIKE 'A%';

-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.

select * from ordini join dettaglioordini on ordini.IDOrdine=DettaglioOrdini.IDordine 
where Ordini.Quantità >'10' or DettaglioOrdini.PrezzoTotale <'100';

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.

SELECT Prezzo FROM prodotti 
WHERE NomeProdotto LIKE '%tech%'

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.

SELECT Nome, Email IS NULL FROM clienti;

select * from Clienti 
where email is null

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.

select NomeProdotto from Prodotti
where NomeProdotto like 'M%'
and NomeProdotto like '%e'

select NomeProdotto from Prodotti
where NomeProdotto like 'M%E'
