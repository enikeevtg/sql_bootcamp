/*version 1: generate_subscripts()*/
CREATE OR REPLACE FUNCTION
	func_minimum(VARIADIC arr NUMERIC[])
	RETURNS NUMERIC
	AS
	$BODY$
		SELECT
			MIN(arr[i])
		FROM
			generate_subscripts(arr, 1) AS i;
	$BODY$
	LANGUAGE SQL;

/*version 2: unnest()*/
CREATE OR REPLACE FUNCTION
	func_minimum(VARIADIC arr NUMERIC[])
	RETURNS NUMERIC
	AS
	$BODY$
		SELECT
			MIN(i)
		FROM
			UNNEST(arr) AS i;
	$BODY$
	LANGUAGE SQL;

/*checking*/
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
