--------------------------1ªResolução----------------------------

-------------------------Exercício 1: Criar um procedimento-------------------------

CREATE PROCEDURE listAllProcedures
AS
BEGIN
    SELECT
        name as 'Procedure Name',
        SCHEMA_NAME(schema_id) AS 'Schema Name' ,
        create_date,
        modify_date
    FROM sys.objects
    ORDER BY name
END

EXEC listAllProcedures

-------------------------Exercício 2: Criar um procedimento-------------------------

GO
CREATE PROCEDURE listAllDataFromTable @Table_Name VARCHAR(100)
AS
BEGIN 
    DECLARE @NAME VARCHAR(100) = 'SELECT * FROM ' + @Table_Name
    EXEC (@NAME)
END

EXEC listAllDataFromTable 'production.brands'

DROP PROCEDURE listAllDataFromTable;

-------------------------Exercício 3: Criar uma função-------------------------

GO
CREATE FUNCTION listAllFunctions()
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        name AS FunctionName,
        SCHEMA_NAME(schema_id) AS SchemaName,
        type_desc AS FunctionType,
        create_date,
        modify_date
    FROM sys.objects
    WHERE type IN ('FN', 'IF', 'TF')
);

GO
SELECT * FROM listAllFunctions()

-------------------------Exercício 4: Criar uma função-------------------------

GO
CREATE FUNCTION listAllOrdersByYear(@year INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT *
    FROM sales.orders
    WHERE YEAR(order_date) = @year
);

GO
SELECT * FROM listAllOrdersByYear(2017)

-------------------------Exercício 5: Criar uma função-------------------------
--Crie uma função que lista todas as encomendas de uma determinada marca e de um determinado produto (marca e produto passados como parâmetros).
--Faça o código para chamar a função e verifique o resultado.

GO
CREATE FUNCTION listAllOrdersByBrandAndProduct(@marca VARCHAR(100), @produto VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT oi.order_id, b.brand_id, p.product_name
    FROM production.products p
    INNER JOIN production.brands b ON p.brand_id = b.brand_id
    INNER JOIN sales.order_items oi ON p.product_id = oi.order_id
    WHERE b.brand_name LIKE ('%' + @produto +'%')
);

GO
SELECT * FROM production.products
SELECT * FROM production.brands

GO
SELECT * FROM listAllOrdersByBrandAndProduct('Trek', '%Trek%')

--------------------------2ªResolução----------------------------

-----------------------Exercício 1: Criar um procedimento-----------------------
--Crie um procedimento que lista todos os procedimentos existentes.
--Faça o código para chamar o procedimento e verifique o resultado.

GO
CREATE PROCEDURE listAllProcedures
AS
BEGIN
    SELECT name AS 'Procedure Name',
    SCHEMA_ID(schema_id) AS 'Schema Name',
    type_desc AS FunctionType,
    create_date,
    modify_date
    FROM sys.objects
    ORDER BY name
END

EXEC listAllProcedures

-----------------------Exercício 2: Criar um procedimento-----------------------
--Crie um procedimento que lista todos os dados de uma determinada tabela (nome da tabela é passado como parâmetro).
--Faça o código para chamar o procedimento e verifique o resultado.

GO
CREATE PROCEDURE listAllFromTable @table_name VARCHAR(100)
AS
BEGIN
    DECLARE @info VARCHAR(100) = 'SELECT * FROM ' + @table_name
    EXEC(@info)
END

EXEC listAllFromTable "production.products"

-----------------------Exercício 3: Criar uma função-----------------------
--Crie uma função que lista todas as Funções existentes.
--Faça o código para chamar a função e verifique o resultado.

GO
CREATE FUNCTION listAllFunctions2()
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        name AS FunctionName,
        SCHEMA_NAME(schema_id) AS SchemaName,
        type_desc AS FunctionType,
        create_date,
        modify_date
    FROM sys.objects
    WHERE type IN ('FN', 'IF', 'TF')
);

GO
SELECT * FROM listAllFunctions2()

-----------------------Exercício 4: Criar uma função-----------------------
--Crie uma função que lista todas as encomendas de um determinado ano (passado como parâmetro).
--Faça o código para chamar a função e verifique o resultado.

GO
CREATE FUNCTION listAllOrdersByYear2(@year INT)
RETURNS TABLE
AS
RETURN(
    SELECT * 
    FROM sales.orders
    WHERE YEAR(order_date) = @year
);

GO
SELECT * FROM listAllOrdersByYear2(2017)

-----------------------Exercício 5: Criar uma função-----------------------
--Crie uma função que lista todas as encomendas de uma determinada marca e de um determinado produto (marca e produto passados como parâmetros).
--Faça o código para chamar a função e verifique o resultado.

GO
CREATE FUNCTION listAllOrdersByBrandAndProduct2(@brand VARCHAR(100), @product VARCHAR(100))
RETURNS TABLE
AS
RETURN(
    SELECT p.product_name, b.brand_name, oi.order_id
    FROM production.products p 
    INNER JOIN production.brands b ON p.brand_id = b.brand_id
    INNER JOIN sales.order_items oi ON p.product_id = oi.product_id
    WHERE b.brand_name = @brand AND p.product_name LIKE '%' + @product + '%'
);

GO
SELECT * FROM production.products
SELECT * FROM production.brands

GO
SELECT * FROM listAllOrdersByBrandAndProduct2('Trek', 'Trek')
