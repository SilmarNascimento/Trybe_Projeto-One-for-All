SELECT
	U.name AS 'pessoa_usuaria',
  COUNT(S.title) AS 'musicas_ouvidas',
  ROUND(SUM(S.duration)/60, 2) AS 'total_minutos'    
FROM
	Songs AS S INNER JOIN History AS H ON S.song_id = H.song_id
INNER JOIN
	Users AS U ON U.user_id = H.user_id
GROUP BY U.name
ORDER BY U.name;