SELECT p.product_name
FROM production.products p 
INNER JOIN sales.order_items oi ON p.product_id = oi.product_id

UNION

SELECT p.product_name
FROM production.stocks s
LEFT JOIN  production.products p ON s.product_id = p.product_id
WHERE s.quantity > 0

------------------------------------------------------------------

SELECT p.product_name
FROM production.products p
INNER JOIN production.stocks s ON p.product_id = s.product_id
WHERE s.quantity < 10

UNION

SELECT p.product_name
FROM production.products p
INNER JOIN sales.order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL

------------------------------------------------------------------

SELECT email
FROM sales.customers

UNION 

SELECT email
FROM sales.stores

UNION

SELECT email
FROM sales.staffs