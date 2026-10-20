/*EXERCÍCIO 1*/
SELECT * 
FROM sales.stores;

SELECT brand_name 
FROM production.brands;

SELECT customer_id, first_name, last_name 
FROM sales.customers
WHERE city = 'Houston';

SELECT *
FROM sales.customers
WHERE state IN ('TX','CA');

SELECT * 
FROM production.products
WHERE list_price > 1500;

SELECT product_name
FROM production.products
WHERE model_year > 2017 AND list_price < 1000;

SELECT DISTINCT product_name
FROM production.products
WHERE model_year IN ('2017','2018') AND list_price BETWEEN 750 AND 1250;

SELECT MAX(list_price)
FROM production.products;

SELECT AVG(list_price)
FROM production.products;

SELECT COUNT(product_name)
FROM production.products; 

SELECT DISTINCT product_name
FROM production.products;

SELECT COUNT(DISTINCT product_name)
FROM production.products;

/*EXERCÍCIO 2*/
SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores (store_id, store_name, phone, email, street, city, [state], zip_code)
VALUES (4,'Richie Biklas', '', 'richiebiklas@gmail.com', 'Ribeira das Naus', 'Lisboa', 'LX', '25000');
SET IDENTITY_INSERT sales.stores OFF;

SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores (store_id, store_name, phone, email, street, city, [state], zip_code)
VALUES (5, 'Pluto Bikes', '', 'plutobiklas@gmail.com', 'Rua do Porto', 'Porto', 'PT', '20000')
SET IDENTITY_INSERT sales.stores OFF;

SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands (brand_id, brand_name)
VALUES (12, 'Biklas')
SET IDENTITY_INSERT production.brands OFF;

SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands (brand_id, brand_name)
VALUES (13, 'Lx Trotinetes');
SET IDENTITY_INSERT production.brands OFF;

/*EXERCÍCIO 3*/
UPDATE sales.stores
SET phone = '+3512121212121'
WHERE store_id = 5;

UPDATE production.brands
SET brand_name = 'Lx Cycles'
WHERE brand_name = 'Biklas';

UPDATE production.brands
SET brand_name = UPPER('Lx Cycles')
WHERE brand_name = 'Lx Cycles';

/*EXERCÍCIO 4*/
DELETE sales.stores 
WHERE store_id = 4;

DELETE sales.stores
WHERE store_id = 5;

DELETE production.brands
WHERE brand_name LIKE 'Lx%';
