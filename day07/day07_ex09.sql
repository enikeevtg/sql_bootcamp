SELECT
	*,
	formula > average
FROM
	(SELECT
		address,
		ROUND(MAX(age) - (MIN(age) / MAX(age::numeric)), 2) AS formula,
		ROUND(AVG(age), 2) AS average
	 FROM
		person AS p
	 GROUP BY
	 	address
	 ORDER BY
	 	address
	) AS data;
