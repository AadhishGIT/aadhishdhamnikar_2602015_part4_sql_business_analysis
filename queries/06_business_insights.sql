-- ==========================================
-- 06_business_insights.sql
-- Business Insights
-- ==========================================

\echo '\n-------------------------------------------------------'
\echo '-- Q1. Which customer segment generates the highest revenue?'
\echo '-------------------------------------------------------\n'

SELECT
    c.segment,
    SUM(p.payment_amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.segment
ORDER BY total_revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q2. Which region has the highest successful payment amount?'
\echo '-------------------------------------------------------\n'

SELECT
    c.region,
    SUM(p.payment_amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.region
ORDER BY total_revenue DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q3. Which product category has the highest gross profit?'
\echo '-------------------------------------------------------\n'

SELECT
    pr.category,
    SUM((oi.unit_price - pr.cost_price) * oi.quantity) AS gross_profit
FROM products pr
JOIN order_items oi
    ON pr.product_id = oi.product_id
GROUP BY pr.category
ORDER BY gross_profit DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q4. Which city has the highest number of cancelled orders?'
\echo '-------------------------------------------------------\n'

SELECT
    c.city,
    COUNT(*) AS cancelled_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Cancelled'
GROUP BY c.city
ORDER BY cancelled_orders DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q5. Which payment method has the highest failure rate?'
\echo '-------------------------------------------------------\n'

SELECT
    payment_method,
    COUNT(*) FILTER (WHERE payment_status='Failed') AS failed_payments,
    COUNT(*) AS total_payments,
    ROUND(
        COUNT(*) FILTER (WHERE payment_status='Failed') * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percentage
FROM payments
GROUP BY payment_method
ORDER BY failure_rate_percentage DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q6. Which customers are high value but have not ordered recently?'
\echo '-- Recency Rule:'
\echo '-- Customers whose last order date is before 01-Apr-2024'
\echo '-- and whose total successful payment is above the average'
\echo '-- customer spend.'
\echo '-------------------------------------------------------\n'

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.payment_amount) AS total_spend,
    MAX(o.order_date) AS last_order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status='Successful'
GROUP BY c.customer_id, customer_name
HAVING
    SUM(p.payment_amount) >
    (
        SELECT AVG(total_spend)
        FROM
        (
            SELECT
                SUM(payment_amount) AS total_spend
            FROM orders o
            JOIN payments p
                ON o.order_id=p.order_id
            WHERE payment_status='Successful'
            GROUP BY customer_id
        ) avg_spend
    )
    AND MAX(o.order_date) < '2024-04-01'
ORDER BY total_spend DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q7. Which products sell frequently but generate low profit?'
\echo '-------------------------------------------------------\n'

SELECT
    pr.product_name,
    SUM(oi.quantity) AS quantity_sold,
    SUM((oi.unit_price-pr.cost_price)*oi.quantity) AS total_profit
FROM products pr
JOIN order_items oi
    ON pr.product_id = oi.product_id
GROUP BY pr.product_name
ORDER BY quantity_sold DESC, total_profit ASC;

\echo '\n-------------------------------------------------------'
\echo '-- Q8. Which products generate high profit but low quantity sold?'
\echo '-------------------------------------------------------\n'

SELECT
    pr.product_name,
    SUM((oi.unit_price-pr.cost_price)*oi.quantity) AS total_profit,
    SUM(oi.quantity) AS quantity_sold
FROM products pr
JOIN order_items oi
    ON pr.product_id = oi.product_id
GROUP BY pr.product_name
ORDER BY total_profit DESC, quantity_sold ASC;

\echo '\n-------------------------------------------------------'
\echo '-- Q9. Which customer segment has the highest average order value?'
\echo '-------------------------------------------------------\n'

SELECT
    c.segment,
    ROUND(AVG(p.payment_amount),2) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status='Successful'
GROUP BY c.segment
ORDER BY average_order_value DESC;

\echo '\n-------------------------------------------------------'
\echo '-- Q10. Top 5 actionable insights for the business'
\echo '-------------------------------------------------------\n'

\echo '-- Insight 1'
\echo '-- Customer segment generating highest revenue\n'

SELECT
    segment,
    SUM(payment_amount) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id=o.customer_id
JOIN payments p
    ON o.order_id=p.order_id
WHERE payment_status='Successful'
GROUP BY segment
ORDER BY revenue DESC
LIMIT 1;

\echo '\n-- Insight 2'
\echo '-- Region generating highest revenue\n'

SELECT
    region,
    SUM(payment_amount) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id=o.customer_id
JOIN payments p
    ON o.order_id=p.order_id
WHERE payment_status='Successful'
GROUP BY region
ORDER BY revenue DESC
LIMIT 1;

\echo '\n-- Insight 3'
\echo '-- Most profitable product category\n'

SELECT
    category,
    SUM((oi.unit_price-pr.cost_price)*oi.quantity) AS gross_profit
FROM products pr
JOIN order_items oi
    ON pr.product_id=oi.product_id
GROUP BY category
ORDER BY gross_profit DESC
LIMIT 1;

\echo '\n-- Insight 4'
\echo '-- Payment method with highest failure rate\n'

SELECT
    payment_method,
    ROUND(
        COUNT(*) FILTER (WHERE payment_status='Failed')*100.0/COUNT(*),
        2
    ) AS failure_rate
FROM payments
GROUP BY payment_method
ORDER BY failure_rate DESC
LIMIT 1;

\echo '\n-- Insight 5'
\echo '-- Top revenue generating customer\n'

SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(payment_amount) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id=o.customer_id
JOIN payments p
    ON o.order_id=p.order_id
WHERE payment_status='Successful'
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 1;

\echo '\n-------------------------------------------------------'
\echo '-- End of File'
\echo '-------------------------------------------------------'