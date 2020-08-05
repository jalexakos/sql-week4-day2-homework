-- Create Customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(200)
);

-- Create Brand Table
CREATE TABLE brand(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(150),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);

-- Create Order Table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE,
	amount NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	customer_id INTEGER NOT NULL, -- NOT NULL constraint meaning this can't be empty
	item_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create Product Table
CREATE TABLE product(
	item_id SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	prod_name VARCHAR(100),
	order_id INTEGER NOT NULL,
	seller_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	FOREIGN KEY(seller_id) REFERENCES brand(seller_id)
);

-- Alter Statement to add Foreign Key
ALTER TABLE order_
ADD FOREIGN KEY(item_id) REFERENCES product(item_id);