use chinook;
--  Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”
select * from track
join genre on track.genreid=genre.genreid
where genre.name in ('pop','rock');

select genre.name as genre_name, track.name as track_name from track
join genre on track.genreid=genre.genreid
where genre.name in ('pop','rock')
order by genre_name and track_name;

-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.

select artist.name as artist_name, album.title from artist join
album on artist.artistid=album.artistid
where album.title like 'A%'
or artist.name like 'A%';

select artist.name as artist_name, album.title from artist left join
album on artist.artistid=album.artistid
where album.title like 'A%'
or artist.name like 'A%';

-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.

select track.name as track_name, genre.name as genre_name, track.milliseconds/60000 as durata from track join
genre on track.genreid=genre.genreid
where track.milliseconds/60000<3
or genre.name in ('jazz')

-- Recuperate tutte le tracce più lunghe della durata media.

select track.name as track_name from track 
where track.milliseconds >= (select avg (track.milliseconds) from track)

-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.

select genre.name as genre_name from genre 
join track on genre.genreid=track.genreid
group by genre.name
having avg(track.milliseconds) > 240000

-- Individuate gli artisti che hanno rilasciato più di un album.

select artist.name as artist_name, count(album.albumid) from artist
join album on artist.artistid=album.artistid
group by artist.name
having count(album.albumid)>1

-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.

select album.title as album_title, count(track.trackid) from album
join track on album.albumid=track.albumid
group by album.title
having count(track.trackid)>20;

