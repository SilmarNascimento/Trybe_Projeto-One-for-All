SELECT
	CASE
		WHEN U.age <= 30 THEN 'Até 30 anos'
    WHEN (U.age >= 31 AND U.age <= 60) THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
  END AS 'faixa_etaria',
  COUNT(DISTINCT U.name) AS 'total_pessoas_usuarias',
  COUNT(FS.song_id) AS 'total_favoritadas'
FROM
	Users AS U LEFT JOIN FavoriteSongs AS FS ON U.user_id = FS.user_id
GROUP BY faixa_etaria;