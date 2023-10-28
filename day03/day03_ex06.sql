WITH pizzas_set AS 
	(SELECT
		pizza_name,
		pz.id AS pizzeria_id,
		pz.name AS pizzeria_name,
		menu.price
	FROM
			menu
		JOIN
			pizzeria AS pz
			ON
				pz.id = menu.pizzeria_id)
SELECT
	ps1.pizza_name,
	ps1.pizzeria_name AS pizzeria_name_1,
	ps2.pizzeria_name AS pizzeria_name_2,
	ps1.price
FROM
		pizzas_set AS ps1
	JOIN
		pizzas_set AS ps2
		ON
			ps2.pizza_name = ps1.pizza_name AND
			ps2.price = ps1.price
WHERE
	ps1.pizzeria_id > ps2.pizzeria_id
ORDER BY
	pizza_name;
