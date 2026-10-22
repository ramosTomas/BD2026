USE BikeStores;

/*EXERCÍCIO 1*/
SELECT p.product_name, b.brand_name
FROM production.products p
INNER JOIN production.brands b ON p.brand_id = b.brand_id;

---------------------------------------------------------------

/*EXERCÍCIO 2*/
SELECT p.product_name, c.category_name, p.list_price
FROM production.products p
INNER JOIN production.categories c ON p.category_id = c.category_id; 

---------------------------------------------------------------

/*EXERCÍCIO 3*/
SELECT p.product_name, SUM(s.quantity) AS Quantidade
FROM production.products p
INNER JOIN sales.order_items s ON p.product_id = s.product_id
GROUP BY p.product_name;

---------------------------------------------------------------

/*EXERCÍCIO 4*/
SELECT DISTINCT c.category_name, p.product_name
FROM production.categories c
INNER JOIN production.products p ON c.category_id = p.category_id
INNER JOIN sales.order_items s ON p.product_id = s.product_id;

---------------------------------------------------------------

/*EXERCÍCIO 5*/
SELECT b.brand_name, AVG(p.list_price) AS 'Preço Médio'
FROM production.brands b
LEFT JOIN production.products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name;