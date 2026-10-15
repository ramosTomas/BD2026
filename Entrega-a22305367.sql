
/*EXERCÍCIO 1*/
SELECT *
INTO sales.customers_short
FROM sales.customers
WHERE LEFT(first_name,1) IN ('A','B','C','D','X','Y','Z');

/*---------------------------------------------*/

/*EXERCÍCIO 2*/
GO
CREATE VIEW sales.customers_rich_states AS
SELECT first_name, last_name, email 
FROM sales.customers
WHERE [state] IN('TX','CA') 

/*---------------------------------------------*/

/*EXERCÍCIO 3*/
GO
CREATE VIEW sales.customers_special AS
SELECT last_name, city
FROM sales.customers
WHERE last_name LIKE '[abt]%' AND (city LIKE 'o%' OR city LIKE 'on%')

/*---------------------------------------------*/

/*EXERCÍCIO 4*/

GO
CREATE VIEW sales.last_trimester AS
SELECT order_date 
FROM sales.orders
WHERE MONTH(order_date) = 10 OR MONTH(order_date) = 11 OR MONTH(order_date) = 12;

/*---------------------------------------------*/

/*EXERCÍCIO 5*/
GO
CREATE VIEW sales.second_trimester AS
SELECT order_date, shipped_date
FROM sales.orders
WHERE YEAR(order_date) IN (2016,2018) AND MONTH(order_date) >= 7 AND YEAR(shipped_date) != YEAR(order_date);

/*---------------------------------------------*/

/*EXERCÍCIO 6*/
GO
CREATE VIEW sales.long_emails AS
SELECT *
FROM sales.customers
WHERE LEN(email) > 20;

GO
SELECT * FROM sales.last_trimester
