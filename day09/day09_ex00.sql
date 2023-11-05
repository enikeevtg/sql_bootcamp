/*person_audit table crating*/
CREATE TABLE
	person_audit
		(created TIMESTAMPTZ DEFAULT NOW() NOT NULL,
		 type_event VARCHAR(1) DEFAULT 'I' NOT NULL,
		 row_id BIGINT,
		 name VARCHAR NOT NULL,
		 age INTEGER NOT NULL,
		 gender VARCHAR NOT NULL DEFAULT 'female',
		 address VARCHAR,
		 CONSTRAINT ch_type_event CHECK(type_event IN ('I', 'U', 'D'))
		);

/*database insert_trigger function creating*/
CREATE OR REPLACE FUNCTION
	fnc_trg_person_insert_audit()
	RETURNS TRIGGER
	AS
	$BODY$
		BEGIN
			INSERT INTO
				person_audit (type_event, row_id, name, age, gender, address)
				VALUES
					('I',
					 NEW.id,
					 NEW.name,
					 NEW.age,
					 NEW.gender,
					 NEW.address
					);
			RETURN NEW;
		END;
	$BODY$
	LANGUAGE plpgsql;

/*database insert_trigger creating*/
CREATE TRIGGER trg_person_insert_audit
	AFTER INSERT ON	person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

/*database insert_trigger functionality checking*/
INSERT INTO
	person(id, name, age, gender, address)
	VALUES
		(10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;
