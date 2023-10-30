/*index creating*/
CREATE INDEX
	idx_person_name
	ON
		person(UPPER(name));

/*sequential scanning disabling*/
SET	enable_seqscan = OFF;

/*query*/
EXPLAIN ANALYZE
SELECT
	*
FROM
	person
WHERE
	UPPER(name) = 'DMITRIY';
