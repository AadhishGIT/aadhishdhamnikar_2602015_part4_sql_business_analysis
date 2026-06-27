-- ==========================================
-- 02_filtering_and_case.sql
-- Filtering and CASE Queries
-- ==========================================

-------------------------------------------------------
-- Q1. Customers from a selected region
-------------------------------------------------------

SELECT *
FROM customers
WHERE region = 'West';

-------------------------------------------------------
-- Q2. Products above a selected price
-------------------------------------------------------

SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price > 50000;

-------------------------------------------------------
-- Q3. Orders between two dates
-------------------------------------------------------

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31';

-------------------------------------------------------
-- Q4. Customers with Gmail addresses
-------------------------------------------------------

SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

-------------------------------------------------------
-- Q5. Orders with Cancelled or Returned status
-------------------------------------------------------

SELECT *
FROM orders
WHERE order_status IN ('Cancelled', 'Returned');

-------------------------------------------------------
-- Q6. Payments with Failed status
-------------------------------------------------------

SELECT *
FROM payments
WHERE payment_status = 'Failed';

-------------------------------------------------------
-- Q7. Products where selling price is less than cost price
-------------------------------------------------------

SELECT
    product_id,
    product_name,
    unit_price,
    cost_price
FROM products
WHERE unit_price < cost_price;

-------------------------------------------------------
-- Q8. Create an Order Value Category using CASE
-------------------------------------------------------

SELECT
    order_id,
    payment_amount,

    CASE
        WHEN payment_amount >= 100000 THEN 'High Value'
        WHEN payment_amount >= 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category

FROM payments;

-------------------------------------------------------
-- Q9. Create a Customer Segment Label using CASE
-------------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    segment,

    CASE
        WHEN segment = 'Premium' THEN 'High Priority'
        WHEN segment = 'Corporate' THEN 'Business Customer'
        ELSE 'Regular Customer'
    END AS segment_label

FROM customers;

-------------------------------------------------------
-- Q10. Filter Orders from a selected month
-------------------------------------------------------

SELECT *
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 3
  AND EXTRACT(YEAR FROM order_date) = 2024;

-------------------------------------------------------
-- End of File
-------------------------------------------------------