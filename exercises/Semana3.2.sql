SELECT first_name AS Nome, last_name AS Apelido, email AS email,
CASE
  WHEN LEN(email) > 25 
  THEN LOWER(CONCAT(LEFT(first_name, 1),'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email))))
  ELSE email
END AS 'Novo Email'
FROM sales.customers c;

UPDATE sales.customers
SET email = LOWER(CONCAT(LEFT(first_name,1),'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email))))

UPDATE sales.customers
SET email = LOWER(CONCAT(first_name,'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email))))

SELECT product_name AS Produto, list_price AS 'S/Iva',
CASE
  WHEN list_price > 4000 THEN '50%'
  WHEN list_price > 3000 THEN '23%'
  WHEN list_price > 2000 THEN '13%'
  WHEN list_price > 1000 THEN '6%'
  ELSE '0%'
END AS 'Sem IVA'
FROM production.products p