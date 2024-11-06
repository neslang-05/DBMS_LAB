--Q1:
SELECT
  E.Fname AS EmployeeFirstName,
  E.Lname AS EmployeeLastName,
  S.Fname AS SupervisorFirstName,
  S.Lname AS SupervisorLastName
FROM
  employee E
JOIN
  employee S ON E.Super_ssn = S.Ssn;

--Q2:
SELECT 
  Fname AS EmployeeFirstName,
  Lname AS EmployeeLastName,
  1.1 * Salary AS NewSalary
FROM
    employee works_on project,
WHERE
    Ssn = Essn,
AND 
    Pno = Pnumber,
AND
    Pname = 'ProductX';