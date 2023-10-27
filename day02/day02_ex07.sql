SELECT
	pizzeria.name AS pizzeria_name
FROM
		person_visits AS pv
	JOIN
		person
		ON
			person.id = pv.person_id
	JOIN
		pizzeria
		ON
			pizzeria.id = pv.pizzeria_id
	JOIN
		menu
		ON
			menu.pizzeria_id = pizzeria.id
WHERE
	person.name = 'Dmitriy' AND
	visit_date = '2022-01-08' AND
	price < 800;