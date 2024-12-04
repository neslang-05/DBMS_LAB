-- Insert data into SAILORS table
INSERT INTO SAILORS (SID, SNAME, RATINGS, AGE) VALUES
('S21', 'HARI', 4, 21),
('S22', 'RAKESH', 5, 24),
('S23', 'VEEERU', 4, 45),
('S24', 'RAHUL', 3, 33),
('S25', 'RAMU', 3, 30);

-- Insert data into BOATS table
INSERT INTO BOATS (BID, BNAME, COLOR) VALUES
('B101', 'B1', 'WHITE'),
('B102', 'B2', 'RED'),
('B103', 'B3', 'WHITE'),
('B104', 'B4', 'BLUE');

-- Insert data into RESERVES table
INSERT INTO RESERVES (SID, BID, DAY) VALUES
('S21', 'B101', '2024-12-03'),
('S24', 'B103', '2024-12-05'),
('S23', 'B104', '2024-12-03'),
('S21', 'B101', '2024-12-10');