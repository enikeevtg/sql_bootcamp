WITH missed_pizza AS (
	SELECT
		id AS menu_id
	FROM
		menu
	EXCEPT
	SELECT
		menu_id
	FROM
		person_order
	ORDER BY
		menu_id)
SELECT
	menu.pizza_name,
	menu.price,
	pz.name AS pizzeria_name
FROM
		missed_pizza AS mp
	LEFT JOIN
		menu
		ON
			menu.id = mp.menu_id
	LEFT JOIN
		pizzeria AS pz
		ON
			pz.id = menu.pizzeria_id
ORDER BY
	pizza_name,
	price;
