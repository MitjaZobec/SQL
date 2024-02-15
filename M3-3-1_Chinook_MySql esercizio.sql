use `Chinook`;

-- Fate un elenco di tutte le tabelle
show tables;

-- Visualizzate le prime 10 righe della tabella Album.

select * from album 
limit 10;

-- Trovate il numero totale di canzoni della tabella Tracks.

select * from track;

select count(*) from track;

-- Trovate i diversi generi presenti nella tabella Genre.

select distinct Name from Genre;

-- Recuperate il nome di tutte le tracce e del genere associato.

select track.name as trackname, genre.name as genrename 
from track join genre on track.genreid = genre.genreid;

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?

select distinct artist.name 
from artist right join album on album.artistid = artist.artistid;

-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media?

select track.name as trackname, genre.name as genrename, mediatype.name as mediatype from track
join genre on track.genreid=genre.genreid
join mediatype on track.mediatypeid=mediatype.mediatypeid
order by genrename and mediatype

-- Elencate i nomi di tutti gli artisti e dei loro album.

select artist.name as artist_name, album.title as album_title from artist
left join album on artist.artistid=album.artistid
order by artist_name and album_title;

-- individuate la durata delle tracce per ogni album

select album.title as album_title, avg (track.milliseconds)/1000 as avg_track from album
join track on album.albumid=track.albumid
group by album.albumid;


