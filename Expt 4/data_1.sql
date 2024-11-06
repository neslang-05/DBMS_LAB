-- Step 1: Create all tables without foreign keys

-- Create the DEPARTMENT table
CREATE TABLE DEPARTMENT (
    Dname VARCHAR(20),
    Dnumber INT(3) PRIMARY KEY,
    Mgr_ssn INT(10),
    Mgr_start_date DATE
);

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(10),
    Minit CHAR(1),
    Lname VARCHAR(10),
    Ssn INT(10) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR(1),
    Salary DECIMAL(7, 2),
    Super_ssn INT(10),
    Dno INT(3)
);

-- Create the PROJECT table
CREATE TABLE PROJECT (
    Pname VARCHAR(20),
    Pnumber INT(3) PRIMARY KEY,
    Plocation VARCHAR(20),
    Dnum INT(3)
);

-- Create the WORKS_ON table
CREATE TABLE WORKS_ON (
    Essn INT(10),
    Pno INT(3),
    Hours DECIMAL(3, 1),
    PRIMARY KEY (Essn, Pno)
);

-- Create the DEPT_LOCATIONS table
CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT(3),
    Dlocation VARCHAR(20),
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Create the DEPENDENT table
CREATE TABLE DEPENDENT (
    Essn INT(10),
    Dependent_name VARCHAR(20),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(20),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Step 2: Add foreign keys using ALTER TABLE statements

ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_dept_mgr
FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_emp_super
FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn);

ALTER TABLE PROJECT
ADD CONSTRAINT fk_proj_dept
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber);

ALTER TABLE WORKS_ON
ADD CONSTRAINT fk_works_emp
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn);

ALTER TABLE WORKS_ON
ADD CONSTRAINT fk_works_proj
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber);

ALTER TABLE DEPT_LOCATIONS
ADD CONSTRAINT fk_dept_loc
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber);

ALTER TABLE DEPENDENT
ADD CONSTRAINT fk_dep_emp
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn);
