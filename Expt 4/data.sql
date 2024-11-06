create table EMPLOYEE(
    Fname varchar(10)
    Minit char(1)
    Lname varchar(10)
    SSn int(10)
    Bdate date
    Address varchar(30)
    Sex char(1)
    Salary decimal(7,2)
    Super_ssn int(10)
    Dno int(3)
);

create table DEPARTMENT(
    Dname varchar(20)
    Dnumber int(3)
    Mgr_ssn int(10)
    Mgr_start_date date
);

create table works_on(
    Essn int(10)
    Pno int(3)
    Hours decimal(3,1)
);

create table Dept_locations(
    Dnumber int(3)
    Dlocation varchar(20)
);

create table Project(
    Pname varchar(20)
    Pnumber int(3)
    Plocation varchar(20)
    Dnum int(3)
);

create table dependent(
    Essn int(10)
    Dependent_name varchar(20)
    Sex char(1)
    Bdate date
    Relationships varchar(20)
)