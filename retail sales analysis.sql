-- Retail Sales Analysis
-- Domain: E-Commerce
-- Objective: SQL-driven business analysis covering revenue,
-- customer behavior, product performance, and growth metrics.



-- STEP 1: CREATE THE DATABASE


CREATE DATABASE IF NOT EXISTS retail_sales_db;
USE retail_sales_db;


-- STEP 2: CREATE TABLES


-- Customers Table
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(100) UNIQUE,
    city          VARCHAR(50),
    state         VARCHAR(50),
    age           INT,
    gender        VARCHAR(10),
    joined_date   DATE
);

-- Products Table
CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    brand         VARCHAR(50),
    price         DECIMAL(10,2),
    cost_price    DECIMAL(10,2),
    stock_qty     INT
);

-- Orders Table
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    order_date    DATE,
    status        VARCHAR(20),   -- 'Delivered', 'Cancelled', 'Pending', 'Returned'
    payment_mode  VARCHAR(20),   -- 'Credit Card', 'UPI', 'Cash', 'Debit Card'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    item_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(10,2),
    discount_pct  DECIMAL(5,2) DEFAULT 0,  -- discount percentage e.g. 10 = 10%
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



-- STEP 3: INSERT SAMPLE DATA


-- Insert Customers
INSERT INTO customers (first_name, last_name, email, city, state, age, gender, joined_date) VALUES
('Rahul',    'Sharma',   'rahul.sharma@gmail.com',   'Mumbai',    'Maharashtra', 28, 'Male',   '2021-03-15'),
('Priya',    'Mehta',    'priya.mehta@gmail.com',    'Delhi',     'Delhi',       32, 'Female', '2020-07-22'),
('Arjun',    'Singh',    'arjun.singh@yahoo.com',    'Bangalore', 'Karnataka',   25, 'Male',   '2022-01-10'),
('Sneha',    'Patel',    'sneha.patel@gmail.com',    'Ahmedabad', 'Gujarat',     29, 'Female', '2021-09-05'),
('Karan',    'Verma',    'karan.verma@outlook.com',  'Pune',      'Maharashtra', 35, 'Male',   '2019-11-30'),
('Ananya',   'Nair',     'ananya.nair@gmail.com',    'Chennai',   'Tamil Nadu',  27, 'Female', '2022-04-18'),
('Vikram',   'Gupta',    'vikram.gupta@gmail.com',   'Hyderabad', 'Telangana',   40, 'Male',   '2020-02-28'),
('Pooja',    'Joshi',    'pooja.joshi@yahoo.com',    'Kolkata',   'West Bengal', 22, 'Female', '2023-06-01'),
('Amit',     'Kumar',    'amit.kumar@gmail.com',     'Jaipur',    'Rajasthan',   31, 'Male',   '2021-12-14'),
('Divya',    'Reddy',    'divya.reddy@gmail.com',    'Bangalore', 'Karnataka',   26, 'Female', '2022-08-20'),
('Rohit',    'Agarwal',  'rohit.agarwal@gmail.com',  'Mumbai',    'Maharashtra', 33, 'Male',   '2020-05-07'),
('Meera',    'Pillai',   'meera.pillai@gmail.com',   'Kochi',     'Kerala',      30, 'Female', '2021-01-19'),
('Nikhil',   'Bose',     'nikhil.bose@yahoo.com',    'Kolkata',   'West Bengal', 24, 'Male',   '2023-02-11'),
('Sanya',    'Kapoor',   'sanya.kapoor@gmail.com',   'Delhi',     'Delhi',       38, 'Female', '2019-08-25'),
('Deepak',   'Malhotra', 'deepak.malhotra@gmail.com','Chandigarh','Punjab',      45, 'Male',   '2018-06-30');

-- Insert Products
INSERT INTO products (product_name, category, brand, price, cost_price, stock_qty) VALUES
('iPhone 14',           'Electronics',  'Apple',    79999, 65000, 50),
('Samsung Galaxy S23',  'Electronics',  'Samsung',  69999, 55000, 60),
('Laptop HP Pavilion',  'Electronics',  'HP',       55000, 42000, 30),
('Dell Inspiron 15',    'Electronics',  'Dell',     48000, 37000, 25),
('Sony Headphones WH',  'Electronics',  'Sony',      8999,  5500, 100),
('Nike Running Shoes',  'Footwear',     'Nike',      6999,  3500, 150),
('Adidas Ultraboost',   'Footwear',     'Adidas',    9999,  5000, 120),
('Levi\'s Jeans 511',   'Clothing',     'Levi\'s',   3499,  1500, 200),
('Zara Casual Shirt',   'Clothing',     'Zara',      2499,  1000, 180),
('Cooking Pan Set',     'Kitchen',      'Prestige',  2999,  1400, 80),
('Air Purifier',        'Appliances',   'Dyson',    24999, 18000, 40),
('Coffee Maker',        'Kitchen',      'Philips',   4999,  2800, 70),
('Yoga Mat Premium',    'Sports',       'Decathlon', 1499,   600, 200),
('Cricket Bat SG',      'Sports',       'SG',        2999,  1200, 90),
('Novel - Atomic Habits','Books',       'Penguin',    599,   200, 300);

-- Insert Orders
INSERT INTO orders (customer_id, order_date, status, payment_mode) VALUES
(1,  '2024-01-05', 'Delivered',  'Credit Card'),
(2,  '2024-01-08', 'Delivered',  'UPI'),
(3,  '2024-01-10', 'Cancelled',  'Debit Card'),
(4,  '2024-01-12', 'Delivered',  'Credit Card'),
(5,  '2024-01-15', 'Delivered',  'Cash'),
(6,  '2024-01-18', 'Returned',   'UPI'),
(7,  '2024-01-20', 'Delivered',  'Credit Card'),
(8,  '2024-01-22', 'Pending',    'UPI'),
(9,  '2024-01-25', 'Delivered',  'Debit Card'),
(10, '2024-01-28', 'Delivered',  'Credit Card'),
(1,  '2024-02-02', 'Delivered',  'Credit Card'),
(2,  '2024-02-05', 'Delivered',  'UPI'),
(11, '2024-02-08', 'Delivered',  'Credit Card'),
(12, '2024-02-10', 'Delivered',  'UPI'),
(13, '2024-02-14', 'Cancelled',  'Debit Card'),
(3,  '2024-02-18', 'Delivered',  'UPI'),
(14, '2024-02-20', 'Delivered',  'Credit Card'),
(15, '2024-02-22', 'Delivered',  'Cash'),
(4,  '2024-03-01', 'Delivered',  'Credit Card'),
(5,  '2024-03-05', 'Returned',   'Cash'),
(6,  '2024-03-08', 'Delivered',  'UPI'),
(7,  '2024-03-10', 'Delivered',  'Credit Card'),
(8,  '2024-03-15', 'Delivered',  'UPI'),
(9,  '2024-03-18', 'Delivered',  'Debit Card'),
(10, '2024-03-22', 'Delivered',  'Credit Card');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount_pct) VALUES
(1,  1,  1, 79999, 5),
(1,  5,  1,  8999, 0),
(2,  2,  1, 69999, 10),
(3,  3,  1, 55000, 0),
(4,  6,  2,  6999, 5),
(4,  8,  1,  3499, 0),
(5,  4,  1, 48000, 8),
(6,  7,  1,  9999, 15),
(7,  11, 1, 24999, 0),
(8,  13, 2,  1499, 0),
(9,  9,  1,  2999, 5),
(9,  14, 1,  2999, 0),
(10, 15, 3,   599, 0),
(10, 12, 1,  4999, 10),
(11, 1,  1, 79999, 5),
(12, 2,  1, 69999, 0),
(13, 6,  1,  6999, 5),
(14, 10, 1,  2999, 0),
(15, 13, 3,  1499, 0),
(16, 5,  2,  8999, 5),
(17, 3,  1, 55000, 10),
(18, 7,  1,  9999, 0),
(19, 8,  2,  3499, 5),
(20, 4,  1, 48000, 0),
(21, 11, 1, 24999, 5),
(22, 12, 2,  4999, 10),
(23, 9,  1,  2999, 0),
(24, 14, 2,  2999, 5),
(25, 15, 5,   599, 10),
(25, 6,  1,  6999, 0);



-- STEP 4: BASIC QUERIES 


-- Q1: View all customers
SELECT * FROM customers;

-- Q2: View all products
SELECT * FROM products;

-- Q3: View all orders
SELECT * FROM orders;

-- Q4: Select only specific columns
SELECT first_name, last_name, city, state FROM customers;

-- Q5: Find all customers from Maharashtra
SELECT first_name, last_name, city
FROM customers
WHERE state = 'Maharashtra';

-- Q6: Find products under ₹10,000
SELECT product_name, category, price
FROM products
WHERE price < 10000;

-- Q7: Find orders placed in January 2024
SELECT order_id, customer_id, order_date, status
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';

-- Q8: Find all delivered orders
SELECT order_id, order_date, payment_mode
FROM orders
WHERE status = 'Delivered';

-- Q9: Products in Electronics OR Footwear category
SELECT product_name, category, price
FROM products
WHERE category IN ('Electronics', 'Footwear');

-- Q10: Find customers whose name starts with 'A'
SELECT first_name, last_name, email
FROM customers
WHERE first_name LIKE 'A%';



-- STEP 5: AGGREGATE FUNCTIONS 


-- Q11: Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Q12: Total number of orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Q13: Total revenue per product category
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q14: Average order value
SELECT 
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT order_id, SUM(quantity * unit_price * (1 - discount_pct/100)) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_summary;

-- Q15: Most expensive product in each category
SELECT category, MAX(price) AS max_price, MIN(price) AS min_price
FROM products
GROUP BY category;

-- Q16: Top 5 best-selling products by quantity
SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_qty_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_qty_sold DESC
LIMIT 5;

-- Q17: Revenue by payment mode
SELECT 
    o.payment_mode,
    COUNT(o.order_id) AS num_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.payment_mode
ORDER BY total_revenue DESC;

-- Q18: Find categories with total revenue above ₹50,000
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
HAVING total_revenue > 50000
ORDER BY total_revenue DESC;



-- STEP 6: JOINS 


-- Q19: INNER JOIN - Orders with customer details
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    c.city,
    o.order_date,
    o.status,
    o.payment_mode
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- Q20: Full order detail report (multi-table join)
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name)  AS customer_name,
    c.city,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100), 2) AS net_amount,
    o.order_date,
    o.status
FROM orders o
JOIN customers   c  ON o.customer_id  = c.customer_id
JOIN order_items oi ON o.order_id     = oi.order_id
JOIN products    p  ON oi.product_id  = p.product_id
ORDER BY o.order_date;

-- Q21: LEFT JOIN - All customers and their orders (including those with no orders)
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name, c.city
ORDER BY total_orders DESC;

-- Q22: Customers who have NEVER placed an order
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;



-- STEP 7: SUBQUERIES 


-- Q23: Products with price above average price
SELECT product_name, category, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- Q24: Customers who have placed more than 1 order
SELECT 
    CONCAT(first_name, ' ', last_name) AS customer_name,
    city,
    email
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

-- Q25: Most revenue-generating customer
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_spent
FROM customers c
JOIN orders o      ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id   = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, customer_name, c.city
ORDER BY total_spent DESC
LIMIT 1;



-- STEP 8: CASE WHEN 


-- Q26: Categorize customers by age group
SELECT 
    first_name,
    last_name,
    age,
    CASE 
        WHEN age < 25              THEN 'Gen Z (< 25)'
        WHEN age BETWEEN 25 AND 35 THEN 'Millennial (25-35)'
        WHEN age BETWEEN 36 AND 45 THEN 'Gen X (36-45)'
        ELSE                            'Boomer (45+)'
    END AS age_group
FROM customers
ORDER BY age;

-- Q27: Product profitability label
SELECT 
    product_name,
    category,
    price,
    cost_price,
    ROUND(((price - cost_price) / price) * 100, 2) AS profit_margin_pct,
    CASE
        WHEN ((price - cost_price) / price) * 100 >= 40 THEN 'High Margin'
        WHEN ((price - cost_price) / price) * 100 >= 25 THEN 'Medium Margin'
        ELSE                                                  'Low Margin'
    END AS margin_label
FROM products
ORDER BY profit_margin_pct DESC;

-- Q28: Order status summary with readable labels
SELECT 
    order_id,
    order_date,
    status,
    CASE status
        WHEN 'Delivered'  THEN '✅ Successfully Delivered'
        WHEN 'Cancelled'  THEN '❌ Order Cancelled'
        WHEN 'Returned'   THEN '🔄 Customer Returned'
        WHEN 'Pending'    THEN '⏳ Awaiting Processing'
        ELSE                   '❓ Unknown'
    END AS status_description
FROM orders;



-- STEP 9: DATE FUNCTIONS 


-- Q29: Monthly order trend
SELECT 
    YEAR(order_date)  AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    COUNT(order_id)   AS total_orders
FROM orders
GROUP BY year, month, month_name
ORDER BY year, month;

-- Q30: Customer tenure in days
SELECT 
    CONCAT(first_name, ' ', last_name) AS customer_name,
    joined_date,
    DATEDIFF(CURDATE(), joined_date) AS days_since_joined,
    FLOOR(DATEDIFF(CURDATE(), joined_date) / 365) AS years_as_customer
FROM customers
ORDER BY days_since_joined DESC;

-- Q31: Orders placed in last 90 days (from reference date 2024-03-22)
SELECT order_id, customer_id, order_date, status
FROM orders
WHERE order_date >= DATE_SUB('2024-03-22', INTERVAL 90 DAY);



-- STEP 10: STRING FUNCTIONS 


-- Q32: Full name in UPPER CASE and email domain extraction
SELECT 
    UPPER(CONCAT(first_name, ' ', last_name))          AS full_name_upper,
    email,
    SUBSTRING_INDEX(email, '@', -1)                    AS email_domain,
    LENGTH(CONCAT(first_name, ' ', last_name))         AS name_length
FROM customers;

-- Q33: Product names with category prefix
SELECT 
    CONCAT('[', UPPER(category), '] ', product_name)  AS formatted_product,
    price
FROM products
ORDER BY category, price;



-- STEP 11: WINDOW FUNCTIONS (Level 4 - Advanced)


-- Q34: Rank customers by total spending
SELECT 
    CONCAT(c.first_name, ' ', c.last_name)            AS customer_name,
    c.city,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_spent,
    RANK()        OVER (ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) DESC) AS spending_rank,
    DENSE_RANK()  OVER (ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) DESC) AS dense_rank
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, customer_name, c.city
ORDER BY total_spent DESC;

-- Q35: Row number for products within each category (by price)
SELECT 
    product_name,
    category,
    price,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rank_in_category
FROM products;

-- Q36: Running total of revenue by order date
SELECT 
    o.order_date,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS daily_revenue,
    ROUND(SUM(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100))) 
          OVER (ORDER BY o.order_date), 2) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.order_date
ORDER BY o.order_date;

-- Q37: Compare each order's revenue with the previous order (LAG)
SELECT 
    o.order_id,
    o.order_date,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS order_revenue,
    LAG(ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2)) 
        OVER (ORDER BY o.order_date)  AS prev_order_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.order_id, o.order_date
ORDER BY o.order_date;



-- STEP 12: CTEs - Common Table Expressions 


-- Q38: CTE to find high-value orders (above average order value)
WITH order_totals AS (
    SELECT 
        o.order_id,
        o.customer_id,
        o.order_date,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.order_id, o.customer_id, o.order_date
),
avg_order AS (
    SELECT AVG(order_value) AS avg_value FROM order_totals
)
SELECT 
    ot.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ot.order_date,
    ot.order_value,
    ROUND(ao.avg_value, 2) AS avg_order_value,
    ROUND(ot.order_value - ao.avg_value, 2) AS above_avg_by
FROM order_totals ot
JOIN avg_order ao ON 1=1
JOIN customers c ON ot.customer_id = c.customer_id
WHERE ot.order_value > ao.avg_value
ORDER BY ot.order_value DESC;

-- Q39: CTE - Customer RFM Summary (Recency, Frequency, Monetary)
WITH rfm AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name)                    AS customer_name,
        DATEDIFF('2024-03-31', MAX(o.order_date))                  AS recency_days,
        COUNT(DISTINCT o.order_id)                                  AS frequency,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS monetary
    FROM customers c
    JOIN orders o       ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id    = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, customer_name
)
SELECT 
    customer_name,
    recency_days,
    frequency,
    monetary,
    CASE 
        WHEN recency_days <= 30 AND frequency >= 2 AND monetary > 50000 THEN '⭐ Champions'
        WHEN recency_days <= 60 AND frequency >= 2                       THEN '🔵 Loyal Customers'
        WHEN recency_days <= 90                                          THEN '🟡 Potential Loyalist'
        ELSE                                                             '🔴 At Risk'
    END AS customer_segment
FROM rfm
ORDER BY monetary DESC;



-- STEP 13: VIEWS 


-- View 1: Complete Sales Report
CREATE OR REPLACE VIEW vw_sales_report AS
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name)                        AS customer_name,
    c.city,
    c.state,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100), 2) AS net_amount,
    o.order_date,
    MONTHNAME(o.order_date)                                         AS order_month,
    o.status,
    o.payment_mode
FROM orders o
JOIN customers   c  ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products    p  ON oi.product_id = p.product_id;

-- Use the view:
SELECT * FROM vw_sales_report WHERE status = 'Delivered';

-- View 2: Product Performance View
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    p.price,
    p.cost_price,
    ROUND(((p.price - p.cost_price) / p.price) * 100, 2) AS profit_margin_pct,
    COALESCE(SUM(oi.quantity), 0)                         AS total_qty_sold,
    ROUND(COALESCE(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 0), 2) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o       ON oi.order_id  = o.order_id AND o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category, p.brand, p.price, p.cost_price;

-- Use the view:
SELECT * FROM vw_product_performance ORDER BY total_revenue DESC;



-- STEP 14: REAL-WORLD BUSINESS Analyst Scenarios


-- BUSINESS Q1: What is our Month-over-Month revenue growth?
WITH monthly_revenue AS (
    SELECT 
        YEAR(o.order_date)  AS yr,
        MONTH(o.order_date) AS mo,
        MONTHNAME(o.order_date) AS month_name,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY yr, mo, month_name
)
SELECT 
    yr, month_name, revenue,
    LAG(revenue) OVER (ORDER BY yr, mo) AS prev_month_revenue,
    ROUND(((revenue - LAG(revenue) OVER (ORDER BY yr, mo)) 
           / LAG(revenue) OVER (ORDER BY yr, mo)) * 100, 2) AS mom_growth_pct
FROM monthly_revenue;

-- BUSINESS Q2: Which city generates the most revenue?
SELECT 
    c.city,
    c.state,
    COUNT(DISTINCT o.order_id)    AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.city, c.state
ORDER BY total_revenue DESC;

-- BUSINESS Q3: What is the cancellation and return rate?
SELECT 
    status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS pct_of_total
FROM orders
GROUP BY status;

-- BUSINESS Q4: Top 3 products per category by revenue
WITH ranked_products AS (
    SELECT 
        p.category,
        p.product_name,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue,
        DENSE_RANK() OVER (PARTITION BY p.category ORDER BY 
            SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) DESC) AS rnk
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o       ON oi.order_id  = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category, p.product_name
)
SELECT category, product_name, revenue, rnk
FROM ranked_products
WHERE rnk <= 3
ORDER BY category, rnk;

-- BUSINESS Q5: Which gender segment spends more?
SELECT 
    c.gender,
    COUNT(DISTINCT c.customer_id)  AS num_customers,
    COUNT(DISTINCT o.order_id)     AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue,
    ROUND(AVG(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS avg_item_value
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.gender;