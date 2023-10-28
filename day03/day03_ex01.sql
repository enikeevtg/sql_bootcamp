/*
FULL JOIN ... WHERE ... IS NULL
*/
SELECT
	menu.id AS menu_id
FROM
		menu
	FULL JOIN
		person_order AS po
		ON
			po.menu_id = menu.id
WHERE
	po.id IS NULL
ORDER BY
	menu.id;

/*
EXCEPT
*/
SELECT
	id AS menu_id
FROM
		menu
EXCEPT
SELECT
	menu_id
FROM
	person_order
ORDER BY
	menu_id;
