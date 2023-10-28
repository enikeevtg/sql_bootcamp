SELECT
	menu.pizza_name,
	menu.price,
	pz.name AS pizzeria_name,
	pv.visit_date
FROM
		person_visits AS pv
	JOIN
		person AS p
		ON
			p.id = pv.person_id
	JOIN
		person_order AS po
		ON
			po.person_id = p.id
	JOIN
		menu
		ON
			menu.pizzeria_id = pv.pizzeria_id
	JOIN
		pizzeria AS pz
		ON
			pz.id = pv.pizzeria_id
WHERE
	p.name = 'Kate' AND
	price BETWEEN 800 AND 1000
ORDER BY
	pizza_name,
	price,
	pizzeria_name;
