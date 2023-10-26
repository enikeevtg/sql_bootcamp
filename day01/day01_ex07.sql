SELECT
	po.order_date,
	(person.name ||
	 ' (age:' ||
	 person.age ||
	 ')') AS person_information
FROM
	person_order AS po
JOIN person
	ON person.id = po.person_id
ORDER BY
	po.order_date ASC,
	person.name ASC;
