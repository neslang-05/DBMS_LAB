-- 1. For each employee, retrieve the employee's name, and the name of his or her immediate supervisor
SELECT 
    E.Fname AS Employee_First_Name, 
    E.Lname AS Employee_Last_Name, 
    S.Fname AS Supervisor_First_Name, 
    S.Lname AS Supervisor_Last_Name 
FROM 
    Employee E
JOIN 
    Employee S ON E.Super_ssn = S.SSn;

-- 2. Show the effect of giving all employees who work on the 'ProductX' project a 10% raise
SELECT 
    E.Fname, 
    E.Lname, 
    E.Salary AS Original_Salary, 
    E.Salary * 1.1 AS Raised_Salary
FROM 
    Employee E
JOIN 
    Works_on W ON E.SSn = W.Essn
JOIN 
    Project P ON W.Pno = P.Pnumber
WHERE 
    P.Pname = 'ProductX';

-- 3. For each project on which more than two employees work, retrieve the project number, project name, and the number of employees who work on that project
SELECT 
    P.Pnumber, 
    P.Pname, 
    COUNT(*) AS Employee_Count
FROM 
    Project P
JOIN 
    Works_on W ON P.Pnumber = W.Pno
GROUP BY 
    P.Pnumber, P.Pname
HAVING 
    COUNT(*) > 2;

-- 4. Retrieve the names of all employees who have two or more dependents
SELECT 
    Lname, 
    Fname 
FROM 
    Employee E
WHERE 
    (SELECT COUNT(*) FROM Dependent D WHERE E.SSn = D.Essn) >= 2;

-- 5. Make a list of all project numbers for projects that involve an employee whose last name is 'Smith' 
-- as a worker or as a manager of the department that controls the project
(SELECT 
    P.Pname 
FROM 
    Project P
JOIN 
    Department D ON P.Dnum = D.Dnumber
JOIN 
    Employee E ON D.Mgr_ssn = E.SSn
WHERE 
    E.Lname = 'Smith')
UNION
(SELECT 
    P.Pname 
FROM 
    Project P
JOIN 
    Works_on W ON P.Pnumber = W.Pno
JOIN 
    Employee E ON W.Essn = E.SSn
WHERE 
    E.Lname = 'Smith');

-- 6. Retrieve the name of each employee who has a dependent with the same first name as the employee
SELECT 
    E.Fname, 
    E.Lname 
FROM 
    Employee E
WHERE 
    E.SSn IN (
        SELECT 
            Essn 
        FROM 
            Dependent D 
        WHERE 
            E.SSn = D.Essn AND 
            E.Fname = D.Dependent_name
    );

-- 7. Retrieve those employees who have no dependents
SELECT 
    Fname, 
    Lname 
FROM 
    Employee E
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM 
            Dependent D 
        WHERE 
            D.Essn = E.SSn
    );

-- 8. Produce summary report of each department whether it has employees or not
SELECT 
    D.Dname, 
    CASE WHEN COUNT(E.SSn) > 0 THEN 'Yes' ELSE 'No' END AS Has_Employees
FROM 
    Department D
LEFT JOIN 
    Employee E ON D.Dnumber = E.Dno
GROUP BY 
    D.Dname;