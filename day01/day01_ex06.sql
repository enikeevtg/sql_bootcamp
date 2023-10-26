(SELECT
	order_date AS action_date,
 	(SELECT
 		name
 	FROM
 		person
 	WHERE id = po.person_id) AS person_name
FROM person_order AS po)
INTERSECT
(SELECT
	visit_date AS action_date,
 	(SELECT
 		name
 	FROM
 		person
 	WHERE id = pv.person_id) AS person_name
FROM person_visits AS pv)
ORDER BY
	action_date ASC,
	person_name DESC;