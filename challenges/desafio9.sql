SELECT
	COUNT(H.song_id) AS 'musicas_no_historico'
FROM
	History AS H INNER JOIN Users AS U ON H.user_id = U.user_id
WHERE U.name = 'Barbara Liskov';