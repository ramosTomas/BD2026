
/*EXERCÍCIO 1*/
SELECT customer_id, first_name, last_name, city, state
INTO sales.AllCustomers
FROM sales.customers

SELECT * FROM sales.AllCustomers

/*------------------------------------------------------*/

/*EXERCÍCIO 2*/
SELECT *
INTO sales.TexasCustomers
FROM sales.customers
WHERE state = 'TX'

SELECT * FROM sales.TexasCustomers

/*------------------------------------------------------*/

/*EXERCÍCIO 3*/
DELETE FROM sales.TexasCustomers
SELECT * FROM sales.TexasCustomers

SET IDENTITY_INSERT sales.TexasCustomers ON;
INSERT INTO sales.TexasCustomers (customer_id, first_name, last_name, phone, email, street, city, [state], zip_code)
SELECT * FROM sales.customers
WHERE state = 'TX'

SELECT * FROM sales.TexasCustomers

/*------------------------------------------------------*/

/*EXERCÍCIO 4*/
sp_helpindex "production.products"

/*------------------------------------------------------*/

/*EXERCÍCIO 5*/

CREATE INDEX idx_lastname ON sales.customers(last_name);
sp_helpindex "sales.customers"

/*------------------------------------------------------*/


