SELECT
	S.title AS 'cancao',
  COUNT(H.user_id) AS 'reproducoes'   
FROM
	Songs AS S INNER JOIN History AS H ON S.song_id = H.song_id
GROUP BY S.title
ORDER BY reproducoes DESC, S.title
LIMIT 2;