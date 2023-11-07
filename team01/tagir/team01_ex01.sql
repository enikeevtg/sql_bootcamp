INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	c.name AS currency_name,
	extended_balance.money * c.rate_to_usd AS currency_in_usd
FROM
		(SELECT
			user_id,
			money,
			type,
			currency_id,
			updated,
			COALESCE(
					(SELECT
						c.updated
					 FROM
						currency AS c
					 WHERE
						c.id = b.currency_id AND
						c.updated <= b.updated
					 ORDER BY
						c.updated DESC
					 LIMIT 1),
							 (SELECT
								c.updated
							 FROM
								currency AS c
							 WHERE
								c.id = b.currency_id AND
								c.updated > b.updated
							 ORDER BY
								c.updated ASC
							 LIMIT 1)
				) AS currency_upd
		 FROM
				balance AS b) AS extended_balance
	FULL JOIN
		"user" AS u
		ON
			u.id = extended_balance.user_id
	JOIN
		currency AS c
		ON
			c.id = extended_balance.currency_id AND
			c.updated = extended_balance.currency_upd
WHERE
	c.id IS NOT NULL
ORDER BY
	name DESC,
	lastname ASC,
	currency_name ASC;
