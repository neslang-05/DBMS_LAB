-- Create Customer Table
CREATE TABLE cust_tbl (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- Create Product Table
CREATE TABLE prod_tbl (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Create Order Table
CREATE TABLE ord_tbl (
    ord_id INT PRIMARY KEY,
    cust_id INT NOT NULL,
    ord_date DATE NOT NULL,
    ttl_amt DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES cust_tbl(cust_id)
);

-- Create Order Details Table (to establish many-to-many relationship between orders and products)
CREATE TABLE ord_details_tbl (
    ord_id INT,
    prod_id INT,
    quantity INT NOT NULL DEFAULT 1,
    PRIMARY KEY (ord_id, prod_id),
    FOREIGN KEY (ord_id) REFERENCES ord_tbl(ord_id),
    FOREIGN KEY (prod_id) REFERENCES prod_tbl(prod_id)
);

-- Add Additional Constraints

-- Ensure positive prices
ALTER TABLE prod_tbl 
ADD CONSTRAINT chk_positive_price CHECK (unit_price > 0);

-- Ensure total amount is positive
ALTER TABLE ord_tbl 
ADD CONSTRAINT chk_positive_total_amount CHECK (ttl_amt > 0);

-- Ensure join date is not in the future
ALTER TABLE cust_tbl 
ADD CONSTRAINT chk_join_date CHECK (join_date <= CURRENT_DATE);

-- Ensure order date is not in the future
ALTER TABLE ord_tbl 
ADD CONSTRAINT chk_order_date CHECK (ord_date <= CURRENT_DATE);

-- Optional: Add indexes for performance
CREATE INDEX idx_customer_join_date ON cust_tbl(join_date);
CREATE INDEX idx_order_date ON ord_tbl(ord_date);
CREATE INDEX idx_product_price ON prod_tbl(unit_price);