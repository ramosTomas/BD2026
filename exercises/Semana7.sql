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

