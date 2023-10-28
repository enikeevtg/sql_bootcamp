INSERT INTO
	person_order(id, person_id, menu_id, order_date)
SELECT
	(gs + (SELECT MAX(id) FROM person_order)) AS id,
	gs AS person_id,
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
	'2022-02-25' AS order_date
FROM
		person
	JOIN
		generate_series(1, (SELECT count(*) FROM person)) AS gs
		ON gs = person.id
RETURNING *;
