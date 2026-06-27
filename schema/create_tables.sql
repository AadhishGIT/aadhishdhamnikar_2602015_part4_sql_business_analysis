-- ==========================================
-- Ecommerce Business Analysis Database
-- create_tables.sql
-- ==========================================

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-------------------------------------------------------
-- Customers
-------------------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    segment VARCHAR(30) NOT NULL,
    signup_date DATE NOT NULL,

    CHECK (
        region IN (
            'North',
            'South',
            'East',
            'West',
            'Central'
        )
    ),

    CHECK (
        segment IN (
            'Regular',
            'Premium',
            'Corporate'
        )
    )
);

-------------------------------------------------------
-- Products
-------------------------------------------------------

CREATE TABLE products (

    product_id INT PRIMARY KEY,

    product_name VARCHAR(100) NOT NULL,

    category VARCHAR(50) NOT NULL,

    unit_price NUMERIC(10,2) NOT NULL,

    cost_price NUMERIC(10,2) NOT NULL,

    CHECK(unit_price > 0),

    CHECK(cost_price > 0)

);

-------------------------------------------------------
-- Orders
-------------------------------------------------------

CREATE TABLE orders (

    order_id INT PRIMARY KEY,

    customer_id INT NOT NULL,

    order_date DATE NOT NULL,

    order_status VARCHAR(20) NOT NULL,

    delivery_city VARCHAR(50) NOT NULL,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id),

    CHECK(
        order_status IN
        (
            'Completed',
            'Cancelled',
            'Returned'
        )
    )

);

-------------------------------------------------------
-- Order Items
-------------------------------------------------------

CREATE TABLE order_items (

    order_item_id INT PRIMARY KEY,

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL,

    unit_price NUMERIC(10,2) NOT NULL,

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
        REFERENCES products(product_id),

    CHECK(quantity>0),

    CHECK(unit_price>0)

);

-------------------------------------------------------
-- Payments
-------------------------------------------------------

CREATE TABLE payments (

    payment_id INT PRIMARY KEY,

    order_id INT UNIQUE NOT NULL,

    payment_method VARCHAR(30) NOT NULL,

    payment_status VARCHAR(20) NOT NULL,

    payment_amount NUMERIC(10,2) NOT NULL,

    payment_date DATE NOT NULL,

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id),

    CHECK(
        payment_method IN
        (
            'UPI',
            'Credit Card',
            'Debit Card',
            'Net Banking',
            'Cash On Delivery'
        )
    ),

    CHECK(
        payment_status IN
        (
            'Successful',
            'Failed'
        )
    ),

    CHECK(payment_amount>=0)

);

-------------------------------------------------------
-- End of Schema
-------------------------------------------------------