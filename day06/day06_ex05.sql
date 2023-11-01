COMMENT ON TABLE
	person_discounts
	IS
		'Person discounts table';

COMMENT ON COLUMN
	person_discounts.id
	IS
		'person_discounts table id';

COMMENT ON COLUMN
	person_discounts.person_id
	IS
		'person_discounts table person_id column corresponding to ''person'' table';

COMMENT ON COLUMN
	person_discounts.pizzeria_id
	IS
		'person_discounts table person_id column corresponding to ''pizzeria'' table';

COMMENT ON COLUMN
	person_discounts.discount
	IS
		'person_discounts table person discount values column';

