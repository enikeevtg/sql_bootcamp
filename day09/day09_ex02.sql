/*database delete_trigger function creating*/
CREATE OR REPLACE FUNCTION
	fnc_trg_person_delete_audit()
	RETURNS TRIGGER
	AS
	$BODY$
		BEGIN
			INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
			VALUES
				('D',
				 OLD.id,
				 OLD.name,
				 OLD.age,
				 OLD.gender,
				 OLD.address
				);
			RETURN OLD;
		END;
	$BODY$
	LANGUAGE plpgsql;

/*database delete_trigger creating*/
CREATE TRIGGER trg_person_delete_audit
	AFTER DELETE ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

/*database delete_trigger functionality checking*/
DELETE FROM person WHERE id = 10;
SELECT * FROM person_audit;
