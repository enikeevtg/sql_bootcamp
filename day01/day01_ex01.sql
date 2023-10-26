SELECT object_name
FROM (
	(SELECT
		2 AS object_id,
		pizza_name AS object_name
	FROM menu)
	UNION ALL
	(SELECT
		1 AS object_id,
		name AS object_name
	FROM person)
) AS combine_data
ORDER BY
	object_id ASC,
	object_name ASC;
