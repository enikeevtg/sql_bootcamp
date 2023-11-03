SELECT
	pz.name,
	COUNT(*) AS count_of_orders,
	AVG(price) AS average_price,
	MAX(price) AS max_price,
	MIN(price) AS min_price
FROM
		person_order AS po
	JOIN
		menu AS m
		ON
			m.id = po.menu_id
	JOIN
		pizzeria pz
		ON
			pz.id = m.pizzeria_id
GROUP BY
	pz.name
ORDER BY
	name;
