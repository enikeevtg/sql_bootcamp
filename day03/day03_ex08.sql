INSERT INTO
	menu(id, pizzeria_id, pizza_name, price)
VALUES
	(
		(SELECT	MAX(id) + 1 FROM menu),
		(SELECT	pz.id FROM pizzeria AS pz WHERE pz.name = 'Dominos'),
		'sicilian pizza',
		900
	)
RETURNING *;
