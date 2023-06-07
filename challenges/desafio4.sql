SELECT
	U.name AS 'pessoa_usuaria',
    IF(MAX(YEAR(H.play_date)) >= 2021, 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
FROM
	Users AS U INNER JOIN History AS H ON H.user_id = U.user_id
GROUP BY U.name
ORDER BY U.name;