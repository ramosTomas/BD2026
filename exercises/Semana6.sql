--------------------------1ªResolução----------------------------

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

--------------------------2ªResolução----------------------------

-----------------------Exercício 1: Inserir registos com transacções-----------------------
--Utilize uma transacção para inserir 2 novos registos na tabela production.categories e termine com COMMIT.
--Utilize uma transacção para inserir 2 novos registos na tabela production.brands e termine com ROLLBACK.
--Faça um SELECT às duas tabelas e veja os resultados.

BEGIN TRANSACTION
    SET IDENTITY_INSERT production.categories ON
    INSERT INTO production.categories(category_id, category_name) VALUES(88, 'ManUNT')
    INSERT INTO production.categories(category_id, category_name) VALUES(99, 'ManCITY')
    SET IDENTITY_INSERT production.categories OFF
COMMIT TRANSACTION

SELECT * FROM production.categories

BEGIN TRANSACTION
    SET IDENTITY_INSERT production.brands ON
    INSERT INTO production.brands(brand_id, brand_name) VALUES(1001, 'ManUNT Bikes')
    INSERT INTO production.brands(brand_id, brand_name) VALUES(1002, 'ManCITY Bikes')
    SET IDENTITY_INSERT production.brands ON
ROLLBACK TRANSACTION

SELECT * FROM production.brands

-----------------------Exercício 2: Apagar registos com transacções-----------------------
--Utilize uma transacção para apagar os 2 novos registos inseridos na tabela production.categories e termine com ROLLBACK.
--Faça um SELECT à tabela e veja os resultados.

BEGIN TRANSACTION
    DELETE FROM production.categories
    WHERE category_id IN (88,99)
ROLLBACK TRANSACTION

-----------------------Exercício 3: Controlo Transaccional-----------------------
--Utilize uma transacção para inserir 2 novos registos na tabela production.categories e também 2 novos registos na tabela production.brands.
--Os registos na tabela production.brands devem ter o mesmo identificador.
--Utilize TRY … CATCH para detectar o resultado da execução das inserções, e faça COMMIT se não houver erros e ROLLBACK se algo falhar.
--Faça um SELECT às duas tabelas e veja os resultados. Interprete o que obteve.

BEGIN TRY
    BEGIN TRANSACTION
        SET IDENTITY_INSERT production.categories ON
        INSERT INTO production.categories(category_id, category_name) VALUES(20, 'Super-Hybrid Bikes')
        INSERT INTO production.categories(category_id, category_name) VALUES(30, 'Super-Hybrid Bikes Turbo')
        SET IDENTITY_INSERT production.categories OFF

        SET IDENTITY_INSERT production.brands ON
        INSERT INTO production.brands(brand_id, brand_name) VALUES(20, 'Super-Hybrid Brand')
        INSERT INTO production.brands(brand_id, brand_name) VALUES(20, 'Super-Hybrid Brand Turbo')
        SET IDENTITY_INSERT production.brands OFF
    COMMIT TRANSACTION
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

SELECT * FROM production.categories
SELECT * FROM production.brands