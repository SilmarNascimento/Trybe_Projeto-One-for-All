SELECT
	FORMAT(MIN(P.price), 2) AS 'faturamento_minimo',
  FORMAT(MAX(P.price), 2) AS 'faturamento_maximo',
  FORMAT(AVG(P.price), 2) AS 'faturamento_medio',
  FORMAT(SUM(P.price), 2) AS 'faturamento_total'
FROM
	Plans AS P INNER JOIN Users AS U ON U.plan_id = P.plan_id;