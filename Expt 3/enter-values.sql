-- Insert employees without the SUPER_SSN
INSERT INTO EMPLOYEE (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS_EMP, SEX, SALARY, DNO)
VALUES
    ('John', 'B', 'Smith', '123456789', '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000.00, 5),
    ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638-Voss-Houston-TX', 'M', 40000.00, 5),
    ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000.00, 4),
    ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000.00, 4),
    ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000.00, 5);

-- Now update the SUPER_SSN values
UPDATE EMPLOYEE SET SUPER_SSN = '333445555' WHERE SSN = '123456789';
UPDATE EMPLOYEE SET SUPER_SSN = '888665555' WHERE SSN = '333445555';
UPDATE EMPLOYEE SET SUPER_SSN = '987654321' WHERE SSN = '999887777';
UPDATE EMPLOYEE SET SUPER_SSN = '888665555' WHERE SSN = '987654321';
UPDATE EMPLOYEE SET SUPER_SSN = '333445555' WHERE SSN = '666884444';

-- Insert the DEPARTMENT
INSERT INTO DEPARTMENT (DNAME, DNUMBER, MGR_SSN, MGR_START_DATE)
VALUES
    ('Headquarters', 1, '888665555', '1981-06-19'),
    ('Administration', 4, '987654321', '1995-01-01'),
    ('Research', 5, '333445555', '1988-05-22');
    
-- Insert the DEPT_LOCATIONS
INSERT INTO DEPT_LOCATIONS (DNUMBER, DLOCATION)
VALUES
    (1, 'Houston'),
    (4, 'Stafford'),
    (5, 'Bellaire'),
    (5, 'Sugarland'),
    (5, 'Houston');

-- Insert the PROJECT
INSERT INTO PROJECT (PNAME, PNUMBER, PLOCATION, DNUM)
VALUES  
    ('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization',20,'Houston','1')
    ('Newbenefits',30,'Stafford','4');

-- Insert the WORKS_ON
INSERT INTO WORKS_ON (SSN, PNO, HOURS)  
VALUES
    ('123456789', 1, 32.5),
    ('123456789', 2, 7.5),
    ('666884444', 3, 40.0),
    ('333445555', 2, 10.0),
    ('999887777', 30,30.0);

-- Insert the DEPENDENT
INSERT INTO DEPENDENT (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
    ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
    ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');