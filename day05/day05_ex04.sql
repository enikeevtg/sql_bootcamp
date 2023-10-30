/*index creating*/
CREATE UNIQUE INDEX
	idx_menu_unique
	ON
		menu(pizzeria_id, pizza_name);

/*sequential scanning disabling*/
SET enable_seqscan = OFF;

/*query*/
EXPLAIN ANALYZE
SELECT
	*
FROM
	menu
WHERE
	pizzeria_id = 4 AND
	pizza_name = 'cheese pizza';
