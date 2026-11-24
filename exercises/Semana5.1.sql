--------------------------1ªResolução----------------------------

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

--------------------------2ªResolução----------------------------

---------------------------Exercício 1: Todos os Nomes de Produtos---------------------------
--Combinar nomes de produtos a partir de duas fontes:

--Produtos que já foram encomendados.
--Produtos atualmente em stock.

SELECT p.product_name AS Produto
FROM production.products p
INNER JOIN sales.order_items oi ON p.product_id = oi.order_id

UNION 

SELECT p.product_name AS Stock
FROM production.products p
INNER JOIN production.stocks s ON p.product_id = s.product_id
WHERE s.quantity > 0

---------------------------Exercício 2: Combinar produtos---------------------------
--Combinar produtos:

--Produtos com stock abaixo de um certo limite (< 10).
--Produtos que não estão presentes em nenhuma encomenda.

SELECT p.product_name AS Produto
FROM production.products p
INNER JOIN production.stocks s ON p.product_id = s.product_id
where s.quantity < 10

UNION

SELECT p.product_name
FROM production.products p
INNER JOIN sales.order_items oi ON p.product_id = oi.product_id
WHERE order_id IS NULL

---------------------------Exercício 3: Obter todos os emails---------------------------
--Para efectuar uma campanha de sensibilização sobre segurança informática, é necessário enviar emails a todos os envolvidos na área comercial.

--Combinar emails de clientes, lojas e staff.

SELECT email FROM sales.customers

UNION

SELECT email FROM sales.stores

UNION

SELECT email FROM sales.staffs

