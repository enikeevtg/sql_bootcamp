-- INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
-- INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
	*
FROM
		(SELECT
			user_id,
			money,
			currency_id,
			updated,
			COALESCE(
					(SELECT
						c.updated
					 FROM
						currency AS c
					 WHERE
						c.id = b.currency_id AND
						c.updated < b.updated
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
	JOIN
		currency AS c
		ON
			c.id = extended_balance.currency_id AND
			c.updated = extended_balance.currency_upd
	FULL JOIN
		"user" AS u
		ON
			u.id = extended_balance.user_id
WHERE
	c.id IS NOT NULL