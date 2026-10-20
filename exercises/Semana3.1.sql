/*EXERCÍCIO 1*/
SELECT * 
FROM sales.customers
WHERE phone IS NULL AND state = 'TX';

SELECT *
FROM sales.customers
WHERE phone IS NOT NULL AND state = 'CA';

SELECT *
FROM sales.stores
WHERE zip_code IN ('95060','75088');

SELECT *
FROM sales.staffs
WHERE email LIKE '%serrano%';

SELECT *
FROM sales.staffs
WHERE manager_id IS NULL;

SELECT *
FROM sales.staffs
WHERE phone LIKE '%55';

SELECT *
FROM sales.staffs
WHERE first_name LIKE 'M%';

SELECT *
FROM sales.orders
WHERE order_date BETWEEN '2016-01-01' AND '2016-01-15';

SELECT *
FROM sales.orders
WHERE order_id IN (541,1212,1326) AND LEFT(order_date,4) IN (2016,2017);

SELECT CONCAT(first_name,' ',last_name) AS Nome, SUBSTRING(email, CHARINDEX('@', email)+1, LEN(email)) AS Domínio, email AS Email
FROM sales.customers;