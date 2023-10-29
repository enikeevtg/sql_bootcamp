INSERT INTO
	person_visits(id, person_id, pizzeria_id, visit_date)
VALUES
	(
		(SELECT MAX(id) + 1 FROM person_visits),
		(SELECT id FROM person WHERE name = 'Dmitriy'),
		(SELECT pizzeria_id FROM menu
		 JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
		 LEFT JOIN mv_dmitriy_visits_and_eats AS mv ON pizzeria.name = mv.pizzeria_name
		 WHERE
		 	mv.pizzeria_name IS NULL AND
		 	menu.price < 800
		 ORDER BY pizzeria_id
		 LIMIT 1),
		'2022-01-08'
	);

/*checking*/
SELECT *
FROM person_visits;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

/*checking*/
SELECT *
FROM mv_dmitriy_visits_and_eats;
