SELECT
	visits.name AS name,
	COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM
		(SELECT
			pz.name,
			COUNT(*) AS count
		FROM
				person_order AS po
			JOIN
				menu AS m
				ON
					m.id = po.menu_id
			JOIN
				pizzeria AS pz
				ON
					pz.id = m.pizzeria_id
		GROUP BY
			pz.id) AS orders
	FULL JOIN
		(SELECT
			pz.name AS name,
			COUNT(*) AS count
		FROM
				person_visits AS pv
			JOIN
				pizzeria AS pz
				ON
					pz.id = pv.pizzeria_id
		GROUP BY
			pz.id) AS visits
		ON
			visits.name = orders.name
ORDER BY
	total_count DESC,
	name ASC;
