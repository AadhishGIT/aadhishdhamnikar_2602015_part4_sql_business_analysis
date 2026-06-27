-- ==========================================
-- 03_aggregations.sql
-- Aggregate Functions
-- ==========================================

\echo '\n-------------------------------------------------------'
\echo '-- Q1. Total number of customers'
\echo '-------------------------------------------------------\n'

SELECT COUNT(*) AS total_customers
FROM customers;

\echo '\n-------------------------------------------------------'
\echo '-- Q2. Total number of orders'
\echo '-------------------------------------------------------\n'

SELECT COUNT(*) AS total_orders
FROM orders;

\echo '\n-------------------------------------------------------'
\echo '-- Q3. Total successful payment amount'
\echo '-------------------------------------------------------\n'

SELECT
    SUM(payment_amount) AS total_successful_payment
FROM payments
WHERE payment_status = 'Successful';

\echo '\n-------------------------------------------------------'
\echo '-- Q4. Revenue by product category'
\echo '-------------------------------------------------------\n'

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q5. Revenue by region'
\echo '-------------------------------------------------------\n'

SELECT
    c.region,
    SUM(pay.payment_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments pay
ON o.order_id = pay.order_id
WHERE pay.payment_status = 'Successful'
GROUP BY c.region
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q6. Revenue by customer segment'
\echo '-------------------------------------------------------\n'

SELECT
    c.segment,
    SUM(pay.payment_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments pay
ON o.order_id = pay.order_id
WHERE pay.payment_status = 'Successful'
GROUP BY c.segment
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q7. Average order value'
\echo '-------------------------------------------------------\n'

SELECT
    ROUND(AVG(payment_amount),2) AS average_order_value
FROM payments
WHERE payment_status = 'Successful';

\echo '\n-------------------------------------------------------'
\echo '-- Q8. Average order value by city'
\echo '-------------------------------------------------------\n'

SELECT
    c.city,
    ROUND(AVG(pay.payment_amount),2) AS average_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments pay
ON o.order_id = pay.order_id
WHERE pay.payment_status = 'Successful'
GROUP BY c.city
ORDER BY average_order_value DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q9. Number of orders by payment method'
\echo '-------------------------------------------------------\n'

SELECT
    payment_method,
    COUNT(order_id) AS total_orders
FROM payments
GROUP BY payment_method
ORDER BY total_orders DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q10. Gross profit by product category'
\echo '-------------------------------------------------------\n'

SELECT
    p.category,
    SUM((oi.unit_price - p.cost_price) * oi.quantity) AS gross_profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY gross_profit DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q11. Top 5 products by quantity sold'
\echo '-------------------------------------------------------\n'

SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY quantity_sold DESC
LIMIT 5;

\echo '\n-------------------------------------------------------'
\echo '-- Q12. Product categories having revenue above'
\echo '      a chosen threshold using HAVING'
\echo '-------------------------------------------------------\n'

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * oi.unit_price) > 100000
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- End of File'
\echo '-------------------------------------------------------'