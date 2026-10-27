CREATE DATABASE BikeStoresAnalytics;

GO
CREATE SCHEMA metrics;
GO
CREATE SCHEMA events;

GO
CREATE TABLE metrics.indicators (
    id INT NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    category VARCHAR(30) UNIQUE,
    description VARCHAR(50),
    val INT NOT NULL CHECK(val > 20),
    dt DATETIME
)

GO
CREATE TABLE events.messages (
    id INT NOT NULL UNIQUE,
    message VARCHAR(100) DEFAULT 'General Event',
    dt DATETIME
)