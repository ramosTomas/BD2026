-----------------------Exercício 1: Inserir registos com transacções-----------------------

BEGIN TRANSACTION
    SET IDENTITY_INSERT production.categories ON
    INSERT INTO production.categories(category_id, category_name) VALUES(8, 'Manchester United Bikes')
    INSERT INTO production.categories(category_id, category_name) VALUES(9, 'Everton Bikes')
    SET IDENTITY_INSERT production.categories OFF
COMMIT TRANSACTION;

BEGIN TRANSACTION
    SET IDENTITY_INSERT production.brands ON
    INSERT INTO production.brands(brand_id, brand_name) VALUES(10, 'Manchester Bikes')
    INSERT INTO production.brands(brand_id, brand_name) VALUES(11, 'Everton Bikes')
    SET IDENTITY_INSERT production.brands OFF
ROLLBACK TRANSACTION;

SELECT * FROM production.brands

-----------------------Exercício 2: Apagar registos com transacções-----------------------
--Utilize uma transacção para apagar os 2 novos registos inseridos na tabela production.categories e termine com ROLLBACK.
--Faça um SELECT à tabela e veja os resultados.

BEGIN TRANSACTION
    DELETE FROM production.categories WHERE category_id = 8
    DELETE FROM production.categories WHERE category_id = 9
ROLLBACK TRANSACTION;

SELECT * FROM production.categories

-----------------------Exercício 3: Controlo Transaccional-----------------------

BEGIN TRY
    BEGIN TRANSACTION
        SET IDENTITY_INSERT production.categories ON
        INSERT INTO production.categories(category_id, category_name) VALUES(8, 'Manchester United Bikes')
        INSERT INTO production.categories(category_id, category_name) VALUES(9, 'Everton Bikes')
        SET IDENTITY_INSERT production.categories OFF

        SET IDENTITY_INSERT production.brands ON
        INSERT INTO production.brands(brand_id, brand_name) VALUES(12, 'Fulham Bikes')
        INSERT INTO production.brands(brand_id, brand_name) VALUES(12, 'Coventry Bikes')
        SET IDENTITY_INSERT production.brands OFF
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION
END CATCH

SELECT * FROM production.categories;
SELECT * FROM production.brands;

