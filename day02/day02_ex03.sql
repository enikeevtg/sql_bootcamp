WITH dates_interval AS (
	SELECT
		dates_interval::date
	FROM
		generate_series('2022-01-01',
					'2022-01-10',
					interval '1 day'
				   ) AS dates_interval
	)
SELECT
	dates_interval::date AS missing_date
FROM
		dates_interval AS di
	LEFT JOIN
		(SELECT
			visit_date
		FROM
			person_visits
		WHERE
			person_id IN (1, 2)
		) AS pv
		ON
			pv.visit_date = dates_interval
WHERE
	pv.visit_date IS NULL;
