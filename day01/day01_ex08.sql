SELECT
	po.order_date,
	(person.name ||
	 ' (age:' ||
	 person.age ||
	 ')') AS person_information
FROM
	person_order AS po
NATURAL JOIN 
	(SELECT
	 	id AS person_id,
	 	name,
	 	age
	 FROM
	 	person) AS person
ORDER BY
	po.order_date ASC,
	person.name ASC;