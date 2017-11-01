CREATE TABLE users (
	id integer PRIMARY KEY AUTOINCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	created_at timestamp DEFAULT 
		current_timestamp
);


-- CREATE - make a record
-- READ - get the record
-- UPDATE - update a record
-- DELETE - deletes the record

-- CREATE

INSERT INTO users (first_name, last_name) VALUES ('Jim', 'Jones');

-- READ

SELECT * FROM users;
SELECT * FROM users WHERE id = 1;
SELECT first_name FROM users WHERE last_name = 'Jones';

-- UPDATE

UPDATE users SET first_name = 'Joni' WHERE id = 1;
UPDATE users SET last_name = 'Mitchel' WHERE id = 1;
UPDATE users SET last_name = 'Mitchell' WHERE last_name = 'Mitchel';

-- DELETE

DELETE FROM users WHERE id = 1;


