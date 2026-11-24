--------------------------1ªResolução----------------------------

SELECT *
--INTO sales.customers_short
FROM sales.customers
WHERE first_name LIKE '[ABCDXYZ]%'

GO
CREATE VIEW sales.customers_rich_states AS
SELECT first_name, last_name, email 
FROM sales.customers
WHERE state IN ('TX','CA')

GO
CREATE VIEW sales.customers_special AS
SELECT first_name, last_name, city 
FROM sales.customers
WHERE last_name LIKE '[abt]%' AND (city LIKE '%o' OR city LIKE 'on%') 

GO
CREATE VIEW sales.last_trimester AS
SELECT order_id, order_date
FROM sales.orders
WHERE MONTH(order_date) > 9

GO
CREATE VIEW sales.second_semester AS
SELECT order_id, order_date
FROM sales.orders
WHERE MONTH(order_date) > 6 AND YEAR(order_date) != YEAR(shipped_date)

GO
CREATE VIEW sales.long_emails AS
SELECT first_name, last_name, email 
FROM sales.customers
WHERE LEN(email) > 20

--------------------------2ªResolução----------------------------

---------------------------Exercício 1---------------------------
--Crie uma nova tabela de nome sales.customers_short baseada nos dados já inseridos na tabela sales.customers 
--contendo apenas os clientes cujo primeiro nome começa por A ou B ou C ou D ou X ou Y ou Z. Faça isto sem utilizar o comando INSERT de forma direta.

GO
SELECT *
INTO sales.customers_short
FROM sales.customers
WHERE first_name LIKE '[ABCDXYZ]%'

SELECT * FROM sales.customers_short

---------------------------Exercício 2---------------------------
--Crie uma View chamada sales.customers_rich_states apenas com o seu primeiro nome, 
--último nome e email, sobre a tabela sales.customers apenas com os seguintes registos:

--Clientes que sejam do Texas ou da Califónia.

GO
CREATE VIEW sales.customers_rich_states AS
SELECT first_name, last_name, email
FROM sales.customers
WHERE state IN ('TX', 'CA')

GO
SELECT * FROM sales.customers_rich_states

---------------------------Exercício 3---------------------------
--Crie uma View chamada sales.customers_special sobre a tabela sales.customers apenas com os seguintes registos:

--Cujo último nome comece por a ou b ou t.
--Cuja nome da cidade termine em o ou on.

GO
CREATE VIEW sales.customers_special AS
SELECT last_name, city
FROM sales.customers
WHERE last_name LIKE '[abt]%' AND (city LIKE '%o'OR city LIKE '%on')

GO
SELECT * FROM sales.customers_special

---------------------------Exercício 4---------------------------
--Crie uma View chamada sales.last_trimester sobre a tabela sales.orders apenas com os seguintes registos:

--Em que a data de encomenda foi feita no último trimestre (Out, Nov, Dez) de qualquer ano.

GO
CREATE VIEW sales.last_trimester AS
SELECT *
FROM sales.orders
WHERE MONTH(order_date) > 9

GO
DROP VIEW sales.last_trimester

GO
SELECT * FROM sales.last_trimester

---------------------------Exercício 5---------------------------
--Crie uma View chamada sales.second_semester sobre a tabela sales.orders apenas com os seguintes registos:

--Em que a data de encomenda foi feita no segundo semestre (Jul, Ago, Set, Out, Nov, Dez) de 2016 ou 2018.
--Em que a data de envio ocorreu num ano diferente do ano da data de encomenda.

GO
CREATE VIEW sales.second_semester AS
SELECT *
FROM sales.orders
WHERE MONTH(order_date) > 5 AND (YEAR(order_date) = 2016 OR YEAR(order_date) = 2018) AND (YEAR(shipped_date) <> YEAR(order_date))

GO
DROP VIEW sales.second_semester

GO
SELECT * FROM sales.second_semester

---------------------------Exercício 6---------------------------
--Crie uma View chamada sales.long_emails sobre a tabela sales.customers apenas com os seguintes registos:

--Clientes cujo endereço de email seja maior que 20 caracteres.

GO
CREATE VIEW sales.long_emails AS
SELECT * 
FROM sales.customers
WHERE LEN(email) > 20

GO
SELECT * FROM sales.long_emails