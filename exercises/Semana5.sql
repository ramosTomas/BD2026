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

