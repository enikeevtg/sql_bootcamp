/*database update_trigger function creating*/
CREATE OR REPLACE FUNCTION
	fnc_trg_person_update_audit()
	RETURNS TRIGGER
	AS
	$BODY$
		BEGIN
			INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
			VALUES
				('U',
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

/*database update_trigger creating*/
CREATE TRIGGER trg_person_update_audit
	AFTER UPDATE ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

/*database update_trigger functionality checking*/
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
SELECT * FROM person_audit;
