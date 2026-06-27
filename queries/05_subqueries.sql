-- ==========================================
-- 05_subqueries.sql
-- Subquery Queries
-- ==========================================

\echo '\n-------------------------------------------------------'
\echo '-- Q1. Customers whose total spend is above'
\echo '--     the average customer spend'
\echo '-------------------------------------------------------\n'

SELECT
    customer_id,
    customer_name,
    total_spend
FROM
(
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        SUM(p.payment_amount) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Successful'
    GROUP BY c.customer_id, customer_name
) t
WHERE total_spend >
(
    SELECT AVG(total_spend)
    FROM
    (
        SELECT
            SUM(p.payment_amount) AS total_spend
        FROM orders o
        JOIN payments p
            ON o.order_id = p.order_id
        WHERE p.payment_status = 'Successful'
        GROUP BY o.customer_id
    ) avg_spend
);

\echo '\n-------------------------------------------------------'
\echo '-- Q2. Products priced above the average product price'
\echo '-------------------------------------------------------\n'

SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price >
(
    SELECT AVG(unit_price)
    FROM products
);

\echo '\n-------------------------------------------------------'
\echo '-- Q3. Orders with value above the average order value'
\echo '-------------------------------------------------------\n'

SELECT
    order_id,
    order_value
FROM
(
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_value
    FROM order_items
    GROUP BY order_id
) t
WHERE order_value >
(
    SELECT AVG(order_value)
    FROM
    (
        SELECT
            SUM(quantity * unit_price) AS order_value
        FROM order_items
        GROUP BY order_id
    ) avg_orders
);

\echo '\n-------------------------------------------------------'
\echo '-- Q4. Customers who placed at least one completed order'
\echo '-------------------------------------------------------\n'

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    WHERE order_status = 'Completed'
);

\echo '\n-------------------------------------------------------'
\echo '-- Q5. Customers who never placed an order'
\echo '-------------------------------------------------------\n'

SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

\echo '\n-------------------------------------------------------'
\echo '-- Q6. Product categories with revenue above'
\echo '--     the average category revenue'
\echo '-------------------------------------------------------\n'

SELECT
    category,
    revenue
FROM
(
    SELECT
        p.category,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.category
) t
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM
    (
        SELECT
            SUM(oi.quantity * oi.unit_price) AS revenue
        FROM products p
        JOIN order_items oi
            ON p.product_id = oi.product_id
        GROUP BY p.category
    ) avg_category
);

\echo '\n-------------------------------------------------------'
\echo '-- Q7. Products that generated revenue above'
\echo '--     the average product revenue'
\echo '-------------------------------------------------------\n'

SELECT
    product_name,
    revenue
FROM
(
    SELECT
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_name
) t
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM
    (
        SELECT
            SUM(oi.quantity * oi.unit_price) AS revenue
        FROM products p
        JOIN order_items oi
            ON p.product_id = oi.product_id
        GROUP BY p.product_name
    ) avg_product
);

\echo '\n-------------------------------------------------------'
\echo '-- Q8. Orders that contain more than one product'
\echo '-------------------------------------------------------\n'

SELECT
    order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(product_id) > 1;

\echo '\n-------------------------------------------------------'
\echo '-- Q9. Customers who purchased from more than'
\echo '--     one category'
\echo '-------------------------------------------------------\n'

SELECT
    customer_id,
    customer_name
FROM
(
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        COUNT(DISTINCT p.category) AS category_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, customer_name
) t
WHERE category_count > 1;

\echo '\n-------------------------------------------------------'
\echo '-- Q10. Cities whose revenue is above the'
\echo '--      average city revenue'
\echo '-------------------------------------------------------\n'

SELECT
    city,
    revenue
FROM
(
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
) t
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM
    (
        SELECT
            SUM(p.payment_amount) AS revenue
        FROM customers c
        JOIN orders o
            ON c.customer_id = o.customer_id
        JOIN payments p
            ON o.order_id = p.order_id
        WHERE p.payment_status = 'Successful'
        GROUP BY c.city
    ) avg_city
);

\echo '\n-------------------------------------------------------'
\echo '-- End of File'
\echo '-------------------------------------------------------'