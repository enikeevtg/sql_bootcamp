CREATE OR REPLACE FUNCTION
	fnc_persons_female()
	RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
	AS
	$BODY$
		SELECT
			*
		FROM
			person
		WHERE
			gender = 'female'
	$BODY$
	LANGUAGE SQL;

CREATE OR REPLACE FUNCTION
	fnc_persons_male()
	RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
	AS
	$BODY$
		SELECT
			*
		FROM
			person
		WHERE
			gender = 'male'
	$BODY$
	LANGUAGE SQL;

/*checking*/
SELECT * FROM fnc_persons_female();

SELECT * FROM fnc_persons_male();
