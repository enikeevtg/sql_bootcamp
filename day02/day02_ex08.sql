SELECT
	person.name
FROM
		person
	JOIN
		person_order AS po
		ON
			po.person_id = person.id
	JOIN
		menu
		ON
			menu.id = po.menu_id
WHERE
	gender = 'male' AND
	address IN ('Moscow',
				'Samara') AND
	pizza_name IN ('pepperoni pizza',
				   'mushroom pizza')
ORDER BY
	person.name DESC;
