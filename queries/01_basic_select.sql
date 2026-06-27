-- ==========================================
-- 01_basic_select.sql
-- Basic SELECT Queries
-- ==========================================

-------------------------------------------------------
-- Q1. Select all customers
-------------------------------------------------------

SELECT *
FROM customers;

-------------------------------------------------------
-- Q2. Select customer full names using concatenation
-------------------------------------------------------

SELECT
    customer_id,
    first_name || ' ' || last_name AS full_name
FROM customers;

-------------------------------------------------------
-- Q3. Select product names with selling price,
--     cost price and profit per unit
-------------------------------------------------------

SELECT
    product_name,
    unit_price AS selling_price,
    cost_price,
    (unit_price - cost_price) AS profit_per_unit
FROM products;

-------------------------------------------------------
-- Q4. Select unique cities
-------------------------------------------------------

SELECT DISTINCT city
FROM customers;

-------------------------------------------------------
-- Q5. Select unique product categories
-------------------------------------------------------

SELECT DISTINCT category
FROM products;

-------------------------------------------------------
-- Q6. Sort products by highest selling price
-------------------------------------------------------

SELECT
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC;

-------------------------------------------------------
-- Q7. Sort customers by signup date
-------------------------------------------------------

SELECT *
FROM customers
ORDER BY signup_date;

-------------------------------------------------------
-- Q8. Show orders with readable aliases
-------------------------------------------------------

SELECT
    order_id AS "Order ID",
    customer_id AS "Customer ID",
    order_date AS "Order Date",
    order_status AS "Order Status",
    delivery_city AS "Delivery City"
FROM orders;

-------------------------------------------------------
-- End of File
-------------------------------------------------------