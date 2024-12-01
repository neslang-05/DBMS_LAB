-- Insert Departments first
INSERT INTO Department (Dname, Dnumber, Mgr_start_date) VALUES 
('Research', 5, '1988-05-22'),
('Administration', 4, '1995-01-01'),
('Headquarters', 1, '1981-06-19');

-- Insert Employees (note the circular reference with managers requires careful ordering)
INSERT INTO Employee (Fname, Minit, Lname, SSn, Bdate, Address, Sex, Salary, Dno) VALUES 
('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, 5),
('Alicia', 'J', 'Zelaya', 999887777, '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000.00, 4),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, 4),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, 5);

-- Update Super_ssn after initial insert to avoid circular reference
UPDATE Employee SET Super_ssn = 333445555 WHERE SSn = 123456789;
UPDATE Employee SET Super_ssn = 888665555 WHERE SSn = 333445555;
UPDATE Employee SET Super_ssn = 987654321 WHERE SSn = 999887777;
UPDATE Employee SET Super_ssn = 888665555 WHERE SSn = 987654321;
UPDATE Employee SET Super_ssn = 333445555 WHERE SSn = 666884444;

-- Update Department with manager SSN
UPDATE Department SET Mgr_ssn = 333445555 WHERE Dnumber = 5;
UPDATE Department SET Mgr_ssn = 987654321 WHERE Dnumber = 4;
UPDATE Department SET Mgr_ssn = 888665555 WHERE Dnumber = 1;

-- Insert Projects
INSERT INTO Project (Pname, Pnumber, Plocation, Dnum) VALUES 
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits',30,'Stafford','4');

-- Insert Department Locations
INSERT INTO Dept_Locations (Dnumber, Dlocation) VALUES 
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

-- Insert Works_on (Project Assignments)
INSERT INTO Works_on (Essn, Pno, Hours) VALUES 
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40.0),
(33344555, 2, 10.0),
(999887777, 30, 30.0);

-- Insert Dependents
INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES 
(333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
(333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
(987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');