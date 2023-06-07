SELECT
	A.title AS 'album',
  COUNT(FS.user_id) AS 'favoritadas'
FROM
	Songs AS S INNER JOIN FavoriteSongs AS FS ON S.song_id = FS.song_id
INNER JOIN
	Albums AS A ON A.album_id = S.album_id
GROUP BY A.title
ORDER BY favoritadas DESC, A.title
LIMIT 3;