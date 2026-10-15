SELECT * FROM sys.databases;

CREATE DATABASE food;

SELECT * FROM sys.schemas
WHERE name NOT LIKE '%db%'

GO
CREATE SCHEMA "marketing"

GO
CREATE SCHEMA "analytics"

USE BikeStores
CREATE TABLE marketing.products (
    product_id INT,
    product_name VARCHAR (255)
)