SELECT
	COUNT(S.title) AS cancoes,
  COUNT(DISTINCT Ar.name) AS artistas,
  COUNT(DISTINCT A.title) AS albuns    
FROM
	Songs AS S INNER JOIN Albums AS A ON S.album_id = A.album_id
INNER JOIN
	Artists AS Ar ON A.artist_id = Ar.artist_id;