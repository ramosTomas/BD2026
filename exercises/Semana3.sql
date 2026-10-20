/*EXERCÍCIO 2*/
SELECT * FROM production.brands;

SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands (brand_id, brand_name)
VALUES (12, 'Pluto Biklas')
SET IDENTITY_INSERT production.brands OFF;

SELECT * FROM production.categories;

SET IDENTITY_INSERT production.categories ON;
INSERT INTO production.categories (category_id, category_name)
VALUES (11, 'Super Biklas')
SET IDENTITY_INSERT production.categories OFF;

SELECT * FROM sales.customers;

SET IDENTITY_INSERT sales.customers ON;
INSERT INTO sales.customers (customer_id, first_name, last_name, phone, email, street, city, [state], zip_code)
VALUES (1446, 'Leonel', 'Messi', NULL, 'leomessi@gmail.com', 'Rua da Argentina', 'Lisboa', 'LX', '25000')
SET IDENTITY_INSERT sales.customers OFF;

SELECT * FROM sales.stores;

SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores (store_id, store_name, phone, email, street, city, [state], zip_code)
VALUES (4, 'Richie Biklas', NULL, 'richiebiklas@gmail.com', 'Rua das Biklas', 'Lisboa', 'LX', '25000')
SET IDENTITY_INSERT sales.stores OFF;

----------------------------------------------------

/*EXERCÍCIO 3*/
UPDATE production.brands
SET brand_name = 'Pluto Super Biklas'
WHERE brand_id = 12;

UPDATE production.categories
SET category_name = 'Mega Super Biklas'
WHERE category_name = 'Super Biklas';

UPDATE sales.customers
SET first_name = 'Leo'
WHERE customer_id = 1446;

UPDATE sales.stores
SET store_name = 'Richie Super Biklas'
WHERE store_id = 4;

----------------------------------------------------

/*EXERCÍCIO 4*/
DELETE production.brands
WHERE brand_name = 'Pluto Super Biklas';

DELETE production.categories
WHERE category_id = 11;

DELETE sales.stores
WHERE city = 'Lisboa';

