SELECT *
INTO sales.customers_short
FROM sales.customers
WHERE first_name LIKE '[ABCDXYZ]%'

CREATE VIEW sales.customers_rich_states AS
SELECT first_name, last_name, email 
FROM sales.customers
WHERE state IN ('TX','CA')

CREATE VIEW sales.customers_special AS
SELECT first_name, last_name, city 
FROM sales.customers
WHERE last_name LIKE '[abt]%' AND (city LIKE '%o' OR city LIKE 'on%') 

CREATE VIEW sales.last_trimester AS
SELECT order_id, order_date
FROM sales.orders
WHERE MONTH(order_date) > 9

CREATE VIEW sales.second_semester AS
SELECT order_id, order_date
FROM sales.orders
WHERE MONTH(order_date) > 6 AND YEAR(order_date) != YEAR(shipped_date)

CREATE VIEW sales.long_emails AS
SELECT first_name, last_name, email 
FROM sales.customers
WHERE LEN(email) > 20

