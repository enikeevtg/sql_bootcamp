INSERT INTO
	person_discounts
	SELECT
		row_number() OVER () AS id,
		person_id,
		pizzeria_id,
		CASE
			WHEN (amount_of_orders = 1)	THEN 10.5
			WHEN (amount_of_orders = 2)	THEN 22
			ELSE 30
		END AS discount
	FROM
		(SELECT DISTINCT
			person_id,
			menu.pizzeria_id,
			count(*) OVER (PARTITION BY person_id, pizzeria_id) AS amount_of_orders
		 FROM
				person_order AS po
			JOIN
				menu
				ON
					menu.id = po.menu_id
		 ORDER BY
			person_id
		) AS order_count;

/*checking*/
SELECT *
FROM person_discounts;
