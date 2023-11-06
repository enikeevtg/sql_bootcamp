CREATE TABLE nodes
	(point1 VARCHAR(1),
	 point2 VARCHAR(1),
	 cost int);

INSERT INTO
	nodes
VALUES
	('a', 'b', 10),
	('b', 'a', 10),
	('a', 'd', 20),
	('d', 'a', 20),
	('a', 'c', 15),
	('c', 'a', 15),
	('d', 'b', 25),
	('b', 'd', 25),
	('d', 'c', 30),
	('c', 'd', 30),
	('b', 'c', 35),
	('c', 'b', 35);

SELECT *
FROM nodes;

WITH tours
AS (
	WITH RECURSIVE r_tours
	AS
		(
			/*base member (anchor member*/
			SELECT
				0 AS total_cost,
				ARRAY['a'] AS tour

			UNION
			
			/*recursive member*/
			SELECT
				total_cost + 
				(SELECT nodes.cost
				FROM nodes
				WHERE
					nodes.point1 = tour[array_length(tour, 1)] AND
					nodes.point2 = gr.point1
				) AS total_cost,
				array_append(tour, gr.point1) AS tour
			FROM
				nodes AS gr
				JOIN
					r_tours
					ON gr.point1 <> ALL(tour)
		)

	SELECT
		total_cost + (SELECT cost
					  FROM nodes
					  WHERE
					  	nodes.point1 = tour[array_length(tour, 1)] AND
					 	nodes.point2 = 'a') AS total_cost,
		array_append(tour, 'a') AS tour
	FROM
		r_tours
	WHERE
		array_length(tour, 1) = 4
	ORDER BY
		total_cost,
		tour
	)

SELECT *
FROM tours
WHERE
	total_cost = (SELECT MIN(total_cost)
				  FROM tours);
