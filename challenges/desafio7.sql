SELECT
	Ar.name AS 'artista',
  A.title AS 'album',
  COUNT(FA.user_id) AS 'pessoas_seguidoras'
FROM
	Artists AS Ar INNER JOIN FollowingArtists AS FA ON Ar.artist_id = FA.artist_id
INNER JOIN
	Albums AS A ON FA.artist_id = A.artist_id
GROUP BY A.album_id
ORDER BY pessoas_seguidoras DESC, Ar.name;