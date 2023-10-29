CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
	SELECT
		pz.name AS pizzeria_name
	FROM
			person_visits AS pv
		JOIN
			person
			ON
				person.id = pv.person_id
		JOIN
			pizzeria AS pz
			ON
				pz.id = pv.pizzeria_id
		JOIN
			menu
			ON
				menu.pizzeria_id = pz.id
	WHERE
		person.name = 'Dmitriy' AND
		pv.visit_date = '2022-01-08' AND
		menu.price < 800;

/*checking*/
SELECT *
FROM mv_dmitriy_visits_and_eats;
	