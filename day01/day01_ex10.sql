SELECT
	person.name AS person_name,
	menu.pizza_name AS pizza_name,
	pizzeria.name AS pizzeria_name
FROM
	person_order AS po
JOIN
	person
	ON person.id = po.person_id
JOIN
	menu
	ON menu.id = po.menu_id
JOIN
	pizzeria
	ON pizzeria.id = menu.pizzeria_id
ORDER BY
	person_name ASC,
	pizza_name ASC,
	pizzeria_name ASC;
