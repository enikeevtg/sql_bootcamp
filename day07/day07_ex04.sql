SELECT
	name,
	COUNT(*) AS count_of_visits
FROM
		person AS p
	JOIN
		person_visits AS pv
		ON
			pv.person_id = p.id
GROUP BY
	name
	HAVING
		COUNT(*) > 3
