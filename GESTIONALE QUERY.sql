use videogamestoredb

SELECT * FROM impiegato;

select * from servizio_impiegato;

select * from videogioco;

select * from store;

-- Seleziona tutti gli impiegati con una laurea in Economia.
SELECT * FROM impiegato WHERE TitoloSudio = 'Laurea in Informatica'

-- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica.
SELECT * FROM impiegato JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.Carica = "Cassiere"
OR impiegato.TitoloSudio = "Laurea in Informatica";

-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023
SELECT Nome, TitoloSudio  FROM impiegato JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio > '2023-01-01';

-- Seleziona i titoli di studio distinti tra gli impiegati.
SELECT distinct TitoloSudio FROM impiegato;

-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".
SELECT * FROM impiegato WHERE TitoloSudio <> 'Laurea in Economia';

-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi.

Select * from impiegato JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio < '2023-7-01'
AND servizio_impiegato.Carica = "Commesso";

-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020.

select distinct Titolo, Sviluppatore from videogioco where AnnoDistribuzione between '2020-01-01' and '2020-12-31';
select distinct Titolo, Sviluppatore from videogioco where year (AnnoDistribuzione) = '2020';

