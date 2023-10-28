/*
ORDERS FROM MEN ONLY
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
	gender = 'male')
EXCEPT
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
	gender = 'female')

UNION

/*
ORDERS FROM WOMEN ONLY
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
	gender = 'female')
EXCEPT
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
	gender = 'male')

ORDER BY
	pizzeria_name;
