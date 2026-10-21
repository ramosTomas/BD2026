/*EXERCÍCIO 1*/
CREATE DATABASE BikeStoresAnalytics;

/*EXERCÍCIO 2*/
GO
CREATE SCHEMA metrics;
GO
CREATE SCHEMA events;

/*EXERCÍCIO 3*/
GO
CREATE TABLE metrics.indicators (
    id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(500) UNIQUE,
    description VARCHAR(300),
    val INT CHECK (val > 20),
    dt DATETIME
)

/*EXERCÍCIO 4*/
GO
CREATE TABLE events.messages (
    id INT NOT NULL UNIQUE,
    message VARCHAR(300) DEFAULT 'General Event',
    dt DATETIME
)