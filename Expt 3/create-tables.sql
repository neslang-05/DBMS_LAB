-- Create Department Table First (without foreign key to Employee)
CREATE TABLE Department (
    Dname VARCHAR(20) NOT NULL UNIQUE,
    Dnumber INTEGER(3) PRIMARY KEY,
    Mgr_ssn INTEGER(10),
    Mgr_start_date DATE
);

-- Create Employee Table (without foreign key constraints)
CREATE TABLE Employee (
    Fname VARCHAR(10) NOT NULL,
    Minit VARCHAR(10),
    Lname VARCHAR(10) NOT NULL,
    SSn INTEGER(10) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR(1),
    Salary DECIMAL(7,2),
    Super_ssn INTEGER(10),
    Dno INTEGER(3)
);

-- Create Project Table
CREATE TABLE Project (
    Pname VARCHAR(20) NOT NULL UNIQUE,
    Pnumber INTEGER(3) PRIMARY KEY,
    Plocation VARCHAR(20),
    Dnum INTEGER(3)
);

-- Create Works_on Table
CREATE TABLE Works_on (
    Essn INTEGER(10),
    Pno INTEGER(3),
    Hours DECIMAL(3,1),
    PRIMARY KEY (Essn, Pno)
);

-- Create Dept_Locations Table
CREATE TABLE Dept_Locations (
    Dnumber INTEGER(3),
    Dlocation VARCHAR(20),
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Create Dependent Table
CREATE TABLE Dependent (
    Essn INTEGER(10),
    Dependent_name VARCHAR(20),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(10),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Add Foreign Key Constraints

-- Add Foreign Keys to Department
ALTER TABLE Department 
ADD CONSTRAINT fk_department_manager 
FOREIGN KEY (Mgr_ssn) REFERENCES Employee(SSn);

-- Add Foreign Keys to Employee
ALTER TABLE Employee 
ADD CONSTRAINT fk_employee_supervisor 
FOREIGN KEY (Super_ssn) REFERENCES Employee(SSn),
ADD CONSTRAINT fk_employee_department 
FOREIGN KEY (Dno) REFERENCES Department(Dnumber);

-- Add Foreign Keys to Project
ALTER TABLE Project 
ADD CONSTRAINT fk_project_department 
FOREIGN KEY (Dnum) REFERENCES Department(Dnumber);

-- Add Foreign Keys to Works_on
ALTER TABLE Works_on 
ADD CONSTRAINT fk_works_on_employee 
FOREIGN KEY (Essn) REFERENCES Employee(SSn),
ADD CONSTRAINT fk_works_on_project 
FOREIGN KEY (Pno) REFERENCES Project(Pnumber);

-- Add Foreign Keys to Dept_Locations
ALTER TABLE Dept_Locations 
ADD CONSTRAINT fk_dept_locations_department 
FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

-- Add Foreign Keys to Dependent
ALTER TABLE Dependent 
ADD CONSTRAINT fk_dependent_employee 
FOREIGN KEY (Essn) REFERENCES Employee(SSn);