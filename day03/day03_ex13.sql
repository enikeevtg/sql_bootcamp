/*person_order*/
DELETE FROM
	person_order
WHERE
	order_date = '2022-02-25';

/*checking*/
SELECT
	*
FROM
	person_order;

/*menu*/
DELETE FROM
	menu
WHERE
	pizza_name = 'greek pizza';

/*checking*/
SELECT
	*
FROM
	menu;
