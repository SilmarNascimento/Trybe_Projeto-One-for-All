SELECT
	Ar.name AS 'artista',
    CASE
		WHEN COUNT(FS.song_id) >= 5 THEN 'A'
        WHEN COUNT(FS.song_id) IN (3,4) THEN 'B'
        WHEN COUNT(FS.song_id) IN (1,2) THEN 'C'
        ELSE '-'
    END AS 'ranking'
FROM
	Songs AS S INNER JOIN FavoriteSongs AS FS ON S.song_id = FS.song_id
INNER JOIN
	Albums AS A ON A.album_id = S.album_id
RIGHT JOIN
	Artists AS Ar ON A.artist_id = Ar.artist_id
GROUP BY Ar.name
ORDER BY COUNT(FS.song_id) DESC, Ar.name;