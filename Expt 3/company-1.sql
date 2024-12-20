CREATE TABLE EMPLOYEE(
    FNAME VARCHAR(20),
    MINIT CHAR(1),
    LNAME VARCHAR(20),
    SSN CHAR(10) PRIMARY KEY,
    BDATE DATE,
    ADDRESS_EMP VARCHAR(100),
    SEX CHAR(1),
    SALARY DECIMAL(10, 2),
    SUPER_SSN CHAR(9),
    DNO INT,
    FOREIGN KEY (SUPER_SSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNUMBER)
);

CREATE TABLE DEPARTMENT(
    DNAME VARCHAR(20),
    DNUMBER INT PRIMARY KEY,
    MGR_SSN CHAR(9) NOT NULL,
    MGR_START_DATE DATE,
    FOREIGN KEY (MGR_SSN) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE DEPT_LOCATIONS(
    DNUMBER INT,
    DLOCATION VARCHAR(20),
    PRIMARY KEY (DNUMBER, DLOCATION),
    FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENT(DNUMBER)
);

CREATE TABLE PROJECT(
    PNAME VARCHAR(20),
    PNUMBER INT PRIMARY KEY,
    PLOCATION VARCHAR(20),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES DEPARTMENT(DNUMBER)
);

CREATE TABLE WORKS_ON(
    ESSN CHAR(9),
    PNO INT,
    HOURS DECIMAL(3, 1),
    PRIMARY KEY (ESSN, PNO),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY (PNO) REFERENCES PROJECT(PNUMBER)
);

CREATE TABLE DEPENDENT(
    ESSN CHAR(9),
    DEPENDENT_NAME VARCHAR(20),
    SEX CHAR(1),
    BDATE DATE,
    RELATIONSHIP VARCHAR(20),
    PRIMARY KEY (ESSN, DEPENDENT_NAME),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);
