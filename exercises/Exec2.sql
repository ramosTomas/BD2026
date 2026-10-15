SELECT * FROM production.products;

SELECT product_name, model_year, list_price FROM production.products;

SELECT * FROM production.categories;

SELECT * FROM sales.stores;

SELECT brand_name FROM production.brands;

SELECT customer_id, first_name, last_name FROM sales.customers
WHERE city = 'Houston';

SELECT * FROM sales.customers
WHERE [state] IN ('TX','CA');

SELECT * FROM production.products
WHERE list_price > 1500;

SELECT product_name FROM production.products
WHERE model_year > 2017 AND list_price < 1000;

SELECT DISTINCT product_name FROM production.products
WHERE model_year IN (2017,2018) AND list_price BETWEEN 750 AND 1250;

SELECT MAX(list_price) FROM production.products;

SELECT AVG(list_price) FROM production.products;

SELECT COUNT(*) FROM production.products;

SELECT DISTINCT product_name FROM production.products;

SET IDEN

SELECT COUNT(DISTINCT product_name) FROM production.products;








