DROP TABLE films;
DROP TABLE customers;
DROP TABLE tickets;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES tickets(id) ON DELETE CASCADE
);