/*
LEFT JOIN
*/
SELECT
	name AS pizzeria_name,
	rating
FROM
		pizzeria
	LEFT JOIN
		person_visits AS pv
		ON
			pv.pizzeria_id = pizzeria.id
WHERE
	pizzeria_id IS NULL;

/*
RIGHT JOIN
*/
SELECT
	pizzeria.name  AS pizzeria_name,
	pizzeria.rating
FROM
		person_visits AS pv
	RIGHT JOIN
		pizzeria
		ON
			pv.pizzeria_id = pizzeria.id
WHERE
	pizzeria_id IS NULL;
