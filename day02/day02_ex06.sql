SELECT
	menu.pizza_name,
	pizzeria.name AS pizzeria_name
FROM
		person_order AS po
	JOIN
		person
		ON
			person.id = po.person_id
	JOIN
		menu
		ON
			menu.id = po.menu_id
	JOIN
		pizzeria
		ON
			pizzeria.id = menu.pizzeria_id
WHERE
	person.name IN ('Anna', 'Denis')
ORDER BY
	pizza_name,
	pizzeria_name;