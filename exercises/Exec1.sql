
/*EXERCÍCIO 1*/
SELECT * FROM sales.stores;

/*EXERCÍCIO 2*/
SELECT brand_name FROM production.brands;

/*EXERCÍCIO 3*/
SELECT customer_id, first_name, last_name 
FROM sales.customers 
WHERE city = 'Houston';

/*EXERCÍCIO 4*/
SELECT * FROM sales.customers
WHERE city = 'TX' OR city = 'CA';

/*EXERCÍCIO 5*/
SELECT * FROM production.products
WHERE list_price > 1500;

/*EXERCÍCIO 6*/
SELECT product_name FROM production.products
WHERE model_year > 2017 AND list_price < 1000;

/*EXERCÍCIO 7*/
SELECT DISTINCT product_name FROM production.products
WHERE model_year IN (2017, 2018) AND list_price BETWEEN 750 AND 1250;
