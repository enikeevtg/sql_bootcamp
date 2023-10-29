CREATE VIEW v_price_with_discount
AS
	SELECT
		person.name,
		menu.pizza_name,
		menu.price,
		ROUND(menu.price - 0.1 * menu.price) AS discount_price
	FROM
			person_order AS po
		JOIN
			person
			ON
				person.id = po.person_id
		JOIN
			menu
			ON
				menu.id = po.menu_id
	ORDER BY
		person.name,
		menu.pizza_name;

/*checking*/
SELECT *
FROM v_price_with_discount;
