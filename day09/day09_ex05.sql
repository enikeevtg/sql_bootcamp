DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION
	fnc_persons(pgender VARCHAR DEFAULT 'female')
	RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
	AS
	$BODY$
		SELECT
			*
		FROM
			person
		WHERE
			gender = pgender
	$BODY$
	LANGUAGE SQL;

/*checking*/
SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();
