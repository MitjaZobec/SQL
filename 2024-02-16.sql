-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.

select genre.name as genre_name, count(*) as numero_tracce from genre join 
track on genre.genreid=track.genreid
group by genre_name
having count(track.trackid)>=10
order by numero_tracce desc;

-- Trovate le tre canzoni più costose.

select track.name as namet, track.unitprice as maxprice
from track
order by maxprice desc
limit 3;

-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.

/*
select artist.name as artist_name from artist
join album on artist.artistid=album.artistid
join track on track.albumid=album.albumid
where track.name in (
select track.name as track_name from track
where track.milliseconds > 360000)
group by artist_name;

select distinct artist.name as artist_name from artist
join album on artist.artistid=album.artistid
join track on track.albumid=album.albumid
where track.name in (
select track.name as track_name from track
where track.milliseconds > 360000)
 non corretto */
 
select artist.name as artist_name from artist
join album on artist.artistid=album.artistid
join track on track.albumid=album.albumid
where  track.milliseconds > 360000
group by artist_name;

-- Individuate la durata media delle tracce per ogni genere.

select genre.name as genre_name, avg (track.milliseconds/60000) as avg_track from genre
join track on track.genreid=genre.genreid
group by genre_name;

-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome

select track.name from track
join genre on track.genreid=genre.genreid
where track.name like '% love %'
order by genre.name and track.name;

-- costo per tipologia di media

select mediatype.name as mediatype, avg (track.unitprice) as avg_price from mediatype
join track on mediatype.mediatypeid=track.mediatypeid
group by mediatype;

-- Individuate il genere con più tracce.

select genre.name as genre_name, count(track.name) from genre 
join track on genre.genreid=track.genreid
group by genre_name
limit 1;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.

select count(*) from album 
join artist on album.artistid=artist.artistid
where artist.name ='The Rolling Stones'

select artist.name as artist_name, count(*) from artist
join album on artist.artistid=album.artistid
where artist.name <>'The Rolling Stones'
group by artist_name
having count(album.albumid)=(select count(*) from album 
join artist on album.artistid=artist.artistid
where artist.name ='The Rolling Stones')


SELECT
  A1.Name
FROM
  Artist A1
  JOIN Album AL1 ON A1.ArtistId = AL1.ArtistId
  JOIN (
    SELECT
      COUNT(*) AS NumAlbums
    FROM
      Album
    WHERE
      ArtistId = (
        SELECT
          ArtistId
        FROM
          Artist
        WHERE
          Name = 'The Rolling Stones'
      )
  ) AS RS ON RS.NumAlbums = (
    SELECT
      COUNT(*) AS NumAlbums
    FROM
      Album
    WHERE
      ArtistId = A1.ArtistId
  )
WHERE
  A1.Name != 'The Rolling Stones'
GROUP BY A1.name;
