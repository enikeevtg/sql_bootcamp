SELECT
	address,
	pz.name,
	COUNT(*) AS count_of_orders
FROM
		person AS p
	JOIN
		person_order AS po
		ON
			po.person_id = p.id
	JOIN
		menu AS m
		ON
			m.id = po.menu_id
	JOIN
		pizzeria AS pz
		ON
			pz.id = m.pizzeria_id
GROUP BY
	address,
	pz.name
ORDER BY
	address,
	pz.name;
