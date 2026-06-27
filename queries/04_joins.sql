-- ==========================================
-- 04_joins.sql
-- JOIN Queries
-- ==========================================

\echo '\n-------------------------------------------------------'
\echo '-- Q1. Orders with customer names'
\echo '-------------------------------------------------------\n'

SELECT
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_status
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

\echo '\n-------------------------------------------------------'
\echo '-- Q2. Orders with payment details'
\echo '-------------------------------------------------------\n'

SELECT
    o.order_id,
    o.order_date,
    p.payment_method,
    p.payment_status,
    p.payment_amount
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

\echo '\n-------------------------------------------------------'
\echo '-- Q3. Order items with product names and categories'
\echo '-------------------------------------------------------\n'

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

\echo '\n-------------------------------------------------------'
\echo '-- Q4. Full order detail with customer,'
\echo '--     product and payment information'
\echo '-------------------------------------------------------\n'

SELECT
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.product_name,
    pr.payment_method,
    pr.payment_status,
    oi.quantity,
    oi.unit_price,
    pr.payment_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN payments pr
ON o.order_id = pr.order_id;

\echo '\n-------------------------------------------------------'
\echo '-- Q5. Revenue by customer'
\echo '-------------------------------------------------------\n'

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.payment_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.customer_id, customer_name
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q6. Revenue by city'
\echo '-------------------------------------------------------\n'

SELECT
    c.city,
    SUM(p.payment_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.city
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q7. Revenue by product category'
\echo '-------------------------------------------------------\n'

SELECT
    pr.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products pr
JOIN order_items oi
ON pr.product_id = oi.product_id
GROUP BY pr.category
ORDER BY revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q8. Customers who have not placed any orders'
\echo '-------------------------------------------------------\n'

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

\echo '\n-------------------------------------------------------'
\echo '-- Q9. Orders that have payment failures'
\echo '-------------------------------------------------------\n'

SELECT
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.payment_method,
    p.payment_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Failed';

\echo '\n-------------------------------------------------------'
\echo '-- Q10. Customers with completed orders only'
\echo '-------------------------------------------------------\n'

SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN
(
    SELECT customer_id
    FROM orders
    WHERE order_status IN ('Cancelled', 'Returned')
);

\echo '\n-------------------------------------------------------'
\echo '-- Q11. Products that were never ordered'
\echo '-------------------------------------------------------\n'

SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

\echo '\n-------------------------------------------------------'
\echo '-- Q12. Top 5 customers by total successful payment amount'
\echo '-------------------------------------------------------\n'

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.payment_amount) AS total_payment
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.customer_id, customer_name
ORDER BY total_payment DESC
LIMIT 5;

\echo '\n-------------------------------------------------------'
\echo '-- End of File'
\echo '-------------------------------------------------------'