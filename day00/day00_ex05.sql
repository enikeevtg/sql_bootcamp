SELECT
	(SELECT
	 	name
	 FROM person
	 WHERE po.person_id = id
	) AS name
FROM person_order AS po 
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18)
AND order_date = '2022-01-07';
