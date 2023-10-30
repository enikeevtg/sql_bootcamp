/*index creating*/
CREATE INDEX
	idx_person_order_multi
	ON
		person_order(person_id, menu_id, order_date);

/*sequential scanning disabling*/
SET enable_seqscan = OFF;

/*task query*/
EXPLAIN ANALYZE
SELECT
	person_id,
	menu_id,
	order_date
FROM
	person_order
WHERE
	person_id = 8 AND
	menu_id = 19;

/*query*/
EXPLAIN ANALYZE
SELECT
	person_id,
	menu_id,
	order_date
FROM
	person_order
WHERE
	person_id = 4 AND
	menu_id > 11 AND
	order_date >= '2022-01-07';
