SELECT 
    COALESCE("user".name, 'not defined') AS name,
	COALESCE("user".lastname, 'not defined') AS lastname,
    select1.type,
    select1.volume,
    COALESCE(select2.name, 'not defined') AS currency_name,
    COALESCE(select2.rate_to_usd, 1) AS last_rate_to_usd,
    CAST(ROUND(select1.volume * COALESCE(select2.rate_to_usd, 1), 6) AS REAL) AS total_volume_in_usd
FROM (SELECT balance.user_id, balance.type, SUM(balance.money) AS volume, balance.currency_id
    FROM balance 
    GROUP BY balance.user_id, balance.type, balance.currency_id) AS select1
LEFT JOIN "user" ON "user".id = select1.user_id
LEFT JOIN (SELECT currency.id, currency.name, currency.rate_to_usd
    FROM currency 
    JOIN (SELECT id, MAX(updated) AS updated 
        FROM currency
        GROUP BY id) AS tmp_table 
	 	ON currency.updated = tmp_table.updated 
	    AND currency.id = tmp_table.id) AS select2 ON select1.currency_id = select2.id
ORDER BY name DESC, lastname ASC, type ASC;