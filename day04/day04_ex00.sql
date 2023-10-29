/*female view*/
CREATE VIEW v_persons_female
AS
	SELECT *
	FROM person
	WHERE gender = 'female';

/*male view*/
CREATE VIEW v_persons_male
AS
	SELECT *
	FROM person
	WHERE gender = 'male';

/*checking*/
SELECT *
FROM v_persons_female;

SELECT *
FROM v_persons_male;
