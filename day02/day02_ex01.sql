/*
LEFT JOIN
*/
SELECT
	dates_interval.date AS missing_date
FROM
		generate_series('2022-01-01',
						'2022-01-10',
						interval '1 day'
					   ) AS dates_interval
	LEFT JOIN
		(SELECT
			*
		FROM
			person_visits
		WHERE
			person_id IN (1, 2)
		) AS pv
		ON
			pv.visit_date = dates_interval.date
WHERE
	pv.visit_date IS NULL;

/*
RIGHT JOIN
*/
SELECT
	dates_interval.date AS missing_date
FROM
		(SELECT
			*
		FROM
			person_visits
		WHERE
			person_id IN (1, 2)	
		) AS pv
	RIGHT JOIN
			generate_series('2022-01-01',
							'2022-01-10',
							interval '1 day'
						   ) AS dates_interval
		ON
			pv.visit_date = dates_interval.date
WHERE
	pv.visit_date IS NULL;
	
	

	
