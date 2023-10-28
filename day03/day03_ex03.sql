((SELECT
	pz.name AS pizzeria_name
FROM
		person_visits AS pv
	LEFT JOIN
		person
		ON
			person.id = pv.person_id
	LEFT JOIN
  		pizzeria AS pz
  		ON
  			pz.id = pv.pizzeria_id
WHERE
	person.gender = 'male')
EXCEPT ALL
(SELECT
	pz.name AS pizzeria_name
FROM
		person_visits AS pv
	LEFT JOIN
		person
		ON
			person.id = pv.person_id
	LEFT JOIN
  		pizzeria AS pz
  		ON
  			pz.id = pv.pizzeria_id
WHERE
	person.gender = 'female')
)
UNION ALL
((SELECT
	pz.name AS pizzeria_name
FROM
		person_visits AS pv
	LEFT JOIN
		person
		ON
			person.id = pv.person_id
	LEFT JOIN
  		pizzeria AS pz
  		ON
  			pz.id = pv.pizzeria_id
WHERE
	person.gender = 'female')
EXCEPT ALL
(SELECT
	pz.name AS pizzeria_name
FROM
		person_visits AS pv
	LEFT JOIN
		person
		ON
			person.id = pv.person_id
	LEFT JOIN
  		pizzeria AS pz
  		ON
  			pz.id = pv.pizzeria_id
WHERE
	person.gender = 'male')
)
ORDER BY
	pizzeria_name;