/*Denis*/
INSERT INTO
	person_order(id, person_id, menu_id, order_date)
VALUES
	(
		(SELECT MAX(id) + 1 FROM person_order),
		(SELECT p.id FROM person AS p WHERE p.name = 'Denis'),
		(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24'
	);

/*Irina*/
INSERT INTO
	person_order(id, person_id, menu_id, order_date)
VALUES
	(
		(SELECT MAX(id) + 1 FROM person_order),
		(SELECT p.id FROM person AS p WHERE p.name = 'Irina'),
		(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24'
	);

/*checking*/
SELECT
	*
FROM
	person_order;
