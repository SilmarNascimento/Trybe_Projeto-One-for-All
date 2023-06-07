SELECT
	Ar.name AS 'artista',
  A.title AS 'album'
FROM
	Artists AS Ar INNER JOIN Albums AS A ON Ar.artist_id = A.artist_id
WHERE Ar.name = 'Elis Regina'
ORDER BY A.title;