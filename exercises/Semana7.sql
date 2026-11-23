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
--Crie uma função que lista todas as encomendas de um determinado ano (passado como parâmetro).
--Faça o código para chamar a função e verifique o resultado.

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
