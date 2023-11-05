CREATE OR REPLACE FUNCTION
	fnc_fibonacci(pstop INTEGER DEFAULT 10)
	RETURNS TABLE (fibonacci_numbers BIGINT)
	AS 
	$BODY$
		WITH RECURSIVE r_fib_numbers
		AS
			(
				SELECT
					0 AS fib_number,
					1 AS next_value
				
				UNION
				
				SELECT
					next_value AS fib_number,
					fib_number + next_value AS next_value
				FROM
					r_fib_numbers
				WHERE
					next_value < pstop
			)
		
		SELECT
			fib_number
		FROM
			r_fib_numbers;
	$BODY$
	LANGUAGE SQL;

/*checking*/
SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci();
