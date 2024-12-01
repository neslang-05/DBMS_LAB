-- 1. Retrieve the names of each customer who joined before '2022-03-25'
SELECT cust_name 
FROM cust_tbl 
WHERE join_date < '2022-03-25';

-- 2. List out each order made by "Kim"
SELECT o.* 
FROM ord_tbl o
JOIN cust_tbl c ON o.cust_id = c.cust_id
WHERE c.cust_name = 'Kim';

-- 3. Calculate the number of products in prod_tbl
SELECT COUNT(*) AS total_products 
FROM prod_tbl;

-- 4a. Find the number of orders in ord_tbl
SELECT COUNT(*) AS total_orders 
FROM ord_tbl;

-- 4b. Calculate the average order amount for customers who joined before '2022-03-25'
SELECT AVG(o.ttl_amt) AS avg_order_amount
FROM ord_tbl o
JOIN cust_tbl c ON o.cust_id = c.cust_id
WHERE c.join_date < '2022-03-25';

-- 5. Find the most popular product among customers who joined in April 2022
SELECT p.prod_name, COUNT(*) AS order_count
FROM ord_details_tbl od
JOIN prod_tbl p ON od.prod_id = p.prod_id
JOIN ord_tbl o ON od.ord_id = o.ord_id
JOIN cust_tbl c ON o.cust_id = c.cust_id
WHERE c.join_date BETWEEN '2022-04-01' AND '2022-04-30'
GROUP BY p.prod_name
ORDER BY order_count DESC
LIMIT 1;

-- 6. Calculate total revenue from orders placed in May 2022
SELECT SUM(ttl_amt) AS total_may_revenue 
FROM ord_tbl 
WHERE ord_date BETWEEN '2022-05-01' AND '2022-05-31';

-- 7. Number of orders placed by customers who have spent more than $500
SELECT COUNT(DISTINCT o.ord_id) AS high_spend_orders
FROM ord_tbl o
JOIN cust_tbl c ON o.cust_id = c.cust_id
WHERE c.cust_id IN (
    SELECT cust_id 
    FROM ord_tbl 
    GROUP BY cust_id 
    HAVING SUM(ttl_amt) > 500
);

-- 8. Find customers who have booked more than two orders
SELECT c.cust_name, COUNT(o.ord_id) AS order_count
FROM cust_tbl c
JOIN ord_tbl o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(o.ord_id) > 2;

-- 9. Calculate total amount spent by each customer in April 2022
SELECT c.cust_name, SUM(o.ttl_amt) AS total_april_spend
FROM cust_tbl c
JOIN ord_tbl o ON c.cust_id = o.cust_id
WHERE o.ord_date BETWEEN '2022-04-01' AND '2022-04-30'
GROUP BY c.cust_id, c.cust_name;

-- 10. List products with unit price between $50.00 and $400.00
SELECT prod_name, unit_price 
FROM prod_tbl 
WHERE unit_price BETWEEN 50.00 AND 400.00;

-- 11. Find customers who placed orders in both April and May 2022
SELECT DISTINCT c.cust_name
FROM cust_tbl c
JOIN ord_tbl o ON c.cust_id = o.cust_id
WHERE MONTH(o.ord_date) IN (4, 5) AND YEAR(o.ord_date) = 2022
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(DISTINCT MONTH(o.ord_date)) = 2;

-- 12. Top 5 customers who spent the most in the past 6 months
SELECT c.cust_name, SUM(o.ttl_amt) AS total_spend
FROM cust_tbl c
JOIN ord_tbl o ON c.cust_id = o.cust_id
WHERE o.ord_date >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
GROUP BY c.cust_id, c.cust_name
ORDER BY total_spend DESC
LIMIT 5;

-- 13. Average order amount for customers who purchased a "Laptop"
SELECT AVG(o.ttl_amt) AS avg_laptop_order_amount
FROM ord_tbl o
JOIN ord_details_tbl od ON o.ord_id = od.ord_id
JOIN prod_tbl p ON od.prod_id = p.prod_id
WHERE p.prod_name = 'Laptop';

-- 14. Product with the highest profit margin (assuming margin = unit price)
SELECT prod_name, unit_price AS profit_margin
FROM prod_tbl
ORDER BY unit_price DESC
LIMIT 1;

-- 15. Percentage of customers who have placed more than one order
SELECT 
    (COUNT(DISTINCT multi_order_customers.cust_id) / COUNT(DISTINCT c.cust_id)) * 100 AS percentage_multiple_orders
FROM 
    cust_tbl c
LEFT JOIN (
    SELECT cust_id
    FROM ord_tbl
    GROUP BY cust_id
    HAVING COUNT(ord_id) > 1
) multi_order_customers ON c.cust_id = multi_order_customers.cust_id;

-- 16. Customer who spent the most on a single order
SELECT c.cust_name, o.ttl_amt AS max_single_order_amount
FROM ord_tbl o
JOIN cust_tbl c ON o.cust_id = c.cust_id
ORDER BY o.ttl_amt DESC
LIMIT 1;

-- 17. Products that were not ordered by any customer
SELECT p.prod_name
FROM prod_tbl p
LEFT JOIN ord_details_tbl od ON p.prod_id = od.prod_id
WHERE od.prod_id IS NULL;

-- 18. Average total amount spent by customers in May 2022
SELECT AVG(ttl_amt) AS avg_may_order_amount
FROM ord_tbl
WHERE ord_date BETWEEN '2022-05-01' AND '2022-05-31';

-- 19. Customers who have not placed any orders in May 2022
SELECT c.cust_name
FROM cust_tbl c
WHERE c.cust_id NOT IN (
    SELECT DISTINCT cust_id 
    FROM ord_tbl 
    WHERE ord_date BETWEEN '2022-05-01' AND '2022-05-31'
);

-- 20. Names of all customers with total amount spent, ordered from highest to lowest
SELECT c.cust_name, SUM(o.ttl_amt) AS total_spent
FROM cust_tbl c
LEFT JOIN ord_tbl o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name
ORDER BY total_spent DESC;

-- 21. Customers who placed orders in both April and May 2022 but did not purchase a Laptop
SELECT DISTINCT c.cust_name
FROM cust_tbl c
JOIN ord_tbl o ON c.cust_id = o.cust_id
WHERE MONTH(o.ord_date) IN (4, 5) AND YEAR(o.ord_date) = 2022
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(DISTINCT MONTH(o.ord_date)) = 2
AND c.cust_id NOT IN (
    SELECT DISTINCT o.cust_id
    FROM ord_tbl o
    JOIN ord_details_tbl od ON o.ord_id = od.ord_id
    JOIN prod_tbl p ON od.prod_id = p.prod_id
    WHERE p.prod_name = 'Laptop'
);