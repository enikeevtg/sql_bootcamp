/*sequential scanning disabling*/
SET	enable_seqscan = OFF;

/*query*/
EXPLAIN ANALYZE
SELECT
	menu.pizza_name,
	pz.name AS pizzeria_name
FROM
		pizzeria AS pz
	JOIN
		menu
		ON
			menu.pizzeria_id = pz.id;
