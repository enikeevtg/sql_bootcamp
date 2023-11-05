/*triggers deletion*/
DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

/*trigger functions deletion*/
DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_delete_audit();
TRUNCATE person_audit;
SELECT * FROM person_audit;

/*database trigger function creating*/
CREATE OR REPLACE FUNCTION
	fnc_trg_person_audit()
	RETURNS TRIGGER
	AS
	$BODY$
		BEGIN
			IF (TG_OP = 'INSERT') THEN
				INSERT INTO
					person_audit (type_event, row_id, name, age, gender, address)
					VALUES ('I', NEW.id, NEW.name, NEW.age,	NEW.gender,	NEW.address);
				RETURN NEW;
			END IF;

			IF (TG_OP = 'UPDATE') THEN
				INSERT INTO
					person_audit (type_event, row_id, name, age, gender, address)
					VALUES ('U', OLD.id, OLD.name, OLD.age,	OLD.gender,	OLD.address);
					RETURN OLD;
			END IF;

			IF (TG_OP = 'DELETE') THEN
				INSERT INTO
					person_audit (type_event, row_id, name, age, gender, address)
					VALUES ('D', OLD.id, OLD.name, OLD.age,	OLD.gender,	OLD.address);			
				RETURN OLD;
			END IF;
		END;
	$BODY$
	LANGUAGE plpgsql;

/*database trigger creating*/
CREATE TRIGGER trg_person_audit
	AFTER INSERT OR UPDATE OR DELETE ON person
	FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

/*database trigger functionality checking*/
INSERT INTO
	person(id, name, age, gender, address)
	VALUES
		(10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;
