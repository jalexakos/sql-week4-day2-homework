-- Creating Movies Table
CREATE TABLE movies(
	film_id SERIAL PRIMARY KEY,
	film_name VARCHAR(120),
	ticket_num INTEGER
);

-- Creating Tickets Table
CREATE TABLE tickets(
	ticket_num SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	film_id INTEGER
);

-- Creating Customers Table
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(150),
	ticket_num INTEGER,
	concess_id INTEGER
);

-- Creating Concessions Table
CREATE TABLE concessions(
	concess_id SERIAL PRIMARY KEY,
	name_ VARCHAR(100),
	amount Numeric(4,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- Altering to create foreign keys
ALTER TABLE movies
ADD FOREIGN KEY(ticket_num) REFERENCES tickets(ticket_num);

ALTER TABLE tickets
ADD FOREIGN KEY(film_id) REFERENCES movies(film_id);

ALTER TABLE customers
ADD FOREIGN KEY(ticket_num) REFERENCES tickets(ticket_num);

ALTER TABLE customers
ADD FOREIGN KEY(concess_id) REFERENCES concessions(concess_id);

-- Adding Data
INSERT INTO movies(
	film_id,
	film_name,
	ticket_num
)
VALUES(
	1,
	'Casablanca',
	NULL
);

INSERT INTO tickets(
	ticket_num,
	amount,
	film_id
)
VALUES(
	1,
	15.00,
	1
);
-- Updating movies table to add the ticket_num
UPDATE movies
SET ticket_num = 1
WHERE film_id = 1;

INSERT INTO tickets(
	ticket_num,
	amount,
	film_id
)
VALUES(
	2,
	12.00,
	1
);

INSERT INTO customers(
	customer_id,
	first_name,
	last_name,
	email,
	ticket_num,
	concess_id
)
VALUES(
	1,
	'Humphrey',
	'Bogart',
	'HB@rickscafe.com',
	1,
	NULL
);

INSERT INTO customers(
	customer_id,
	first_name,
	last_name,
	email,
	ticket_num,
	concess_id
)
VALUES(
	2,
	'Ingrid',
	'Bergman',
	'IB@ilsalund.org',
	2,
	NULL
);

INSERT INTO concessions(
	concess_id,
	name_,
	amount,
	customer_id
)
VALUES(
	1,
	'popcorn',
	8.00,
	2
);

UPDATE customers
SET concess_id = 1
WHERE customer_id = 2;

SELECT *
FROM concessions;