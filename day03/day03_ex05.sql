/*
ANDREY VISITED
*/
(SELECT
	pz.name AS pizzeria_name
FROM
		person_visits AS pv
	JOIN
		person
		ON
			person.id = pv.person_id
	JOIN
		pizzeria AS pz
		ON
			pz.id = pv.pizzeria_id
WHERE
	person.name = 'Andrey')

EXCEPT

/*
ANDREY ORDERED
*/
(SELECT
	pz.name AS pizzeria_name
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
		pizzeria AS pz
		ON
			pz.id = menu.pizzeria_id
WHERE
	person.name = 'Andrey')

ORDER BY
	pizzeria_name;

