-- Insert data into cust_tbl
INSERT INTO cust_tbl (cust_id, cust_name, email, join_date) VALUES
(1, 'Sam', 'sam@email.com', '2022-01-15'),
(2, 'Kim', 'kim@email.com', '2022-02-20'),
(3, 'Kane', 'kane@email.com', '2022-03-25'),
(4, 'Dave', 'dave@email.com', '2022-04-10');

-- Insert data into prod_tbl
INSERT INTO prod_tbl (prod_id, prod_name, unit_price) VALUES
(1, 'Laptop', 800.00),
(2, 'Phone', 400.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 50.00),
(5, 'Mouse', 15.00),
(6, 'Keyboard', 30.00);

-- Insert data into ord_tbl
INSERT INTO ord_tbl (ord_id, cust_id, ord_date, ttl_amt) VALUES
(101, 1, '2022-04-01', 100.00),
(102, 2, '2022-04-05', 75.50),
(103, 1, '2022-04-10', 45.25),
(104, 3, '2022-05-02', 150.75),
(105, 2, '2022-05-05', 65.00),
(106, 4, '2022-05-10', 200.50);

-- Insert data into ord_details_tbl (example mappings based on the total amounts)
-- Note: These are sample mappings and may not exactly match the original total amounts
INSERT INTO ord_details_tbl (ord_id, prod_id, quantity) VALUES
(101, 4, 2),  -- Headphones
(102, 5, 5),  -- Mouse
(103, 6, 1),  -- Keyboard
(104, 3, 1),  -- Tablet
(105, 2, 1),  -- Phone
(106, 1, 1);  -- Laptop