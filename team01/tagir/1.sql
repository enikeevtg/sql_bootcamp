SELECT
	u.name,
	u.lastname,
	b.money * c.rate_to_usd AS currency_in_usd
FROM
		balance AS b
	JOIN
		(SELECT
		 	c.id,		 	
		 	b.updated AS balance_upd,
		 	CASE
		 		WHEN MIN(c.updated) < b.updated
		 		THEN MAX(
							SELECT
								*
							FROM
								c.updated)
		 		ELSE MIN(c.updated)
		 	END AS currency_upd
		 FROM
		 	balance AS b
		 LEFT JOIN
		 	currency AS c
		 	ON
				c.id = b.currency_id
-- 		 WHERE
-- 		 	c.id IS NOT NULL
		 GROUP BY
		 	c.id,
		 	b.user_id,
		 	b.updated) AS upd_calc
		 ON
		 	upd_calc.id = b.currency_id AND
			upd_calc.balance_upd = b.updated
	JOIN
		currency AS c
		ON
			c.id = upd_calc.id AND
			c.updated = upd_calc.currency_upd
	JOIN
		"user" AS u
		ON
			u.id = b.user_id