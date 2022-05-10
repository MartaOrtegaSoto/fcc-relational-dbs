\-- Rename the weight column to atomic_mass
ALTER TABLE properties RENAME weight TO atomic_mass;

-- You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius;

-- Your melting_point_celsius and boiling_point_celsius columns should not accept null values
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

-- You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER TABLE elements ADD UNIQUE(symbol), ADD UNIQUE(name);

-- Your symbol and name columns should have the NOT NULL constraint
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL, ALTER COLUMN name SET NOT NULL;

-- You should set the atomic_number column from the properties table as a foreign key
-- that referenes the column of the same name in the elements table
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

-- You should create a types table that will store the three types of elements
CREATE TABLE types();

-- Your types table should have a type_id column that is an integer and the primary key
ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY;

-- Your types table should have a type column that's a VARCHAR and cannot be null.
    -- It will store the different types from the type column in the properties table
ALTER TABLE types ADD COLUMN type VARCHAR(30) NOT NULL;

-- You should add three rows to your types table whose values are the three different types from the properties table
INSERT INTO types(type) VALUES ('metal'), ('nonmetal'), ('metalloid');

-- Your properties table should have a type_id foreign key column that references the type_id column from the types table.
-- It should be an INT with the NOT NULL constraint
ALTER TABLE properties ADD COLUMN type_id INT REFERENCES types(type_id);
UPDATE properties p SET type_id = (SELECT type_id FROM types t WHERE t.type = p.type);
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;

-- You should capitalize the first letter of all the symbol values in the elements table.
-- Be careful to only capitalize the letter and not change any others
UPDATE elements SET symbol = CONCAT(UPPER(SUBSTRING(symbol,1,1)),SUBSTRING(symbol,2));

-- You should remove all the trailing zeros after the decimals from each row of the atomic_mass column.
-- You may need to adjust a data type to DECIMAL for this. Be careful not to change the value
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = TRIM(trailing '0' FROM atomic_mass::text)::numeric

-- You should add the element with atomic number 9 to your database.
-- Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
-- You should add the element with atomic number 10 to your database.
-- Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
INSERT INTO elements(atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties (atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES
    (9, 'nonmetal', 18.998, -220, -188.1, 2),
    (10, 'nonmetal', 20.18, -249.6, -246.1, 2);

-- Your properties table should not have a type column
ALTER TABLE properties DROP COLUMN type;

-- You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;
