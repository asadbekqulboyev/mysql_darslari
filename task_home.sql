-- 1. Awesome Chocolates
USE `awesome chocolates`;
SHOW TABLES;

-- 2. Chinok
USE chinok;
SHOW TABLES;

-- 3. Sakila
USE sakila;
SHOW TABLES;

-- 4. World
USE world;
SHOW TABLES;
SELECT
    s.SCHEMA_NAME AS database_name,
    COUNT(t.TABLE_NAME) AS table_count
FROM INFORMATION_SCHEMA.SCHEMATA s
LEFT JOIN INFORMATION_SCHEMA.TABLES t
    ON s.SCHEMA_NAME = t.TABLE_SCHEMA
WHERE s.SCHEMA_NAME IN (
    'awesome chocolates',
    'chinok',
    'sakila',
    'world'
)

GROUP BY s.SCHEMA_NAME;