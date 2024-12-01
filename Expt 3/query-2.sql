-- 9. Procedure to find number of employees in each department along with their average salary
DELIMITER $$
CREATE PROCEDURE dept_count(IN p_dno INT(3), OUT cnt INT(3), OUT avg_sal DECIMAL(10,2))
BEGIN
    SELECT COUNT(*) INTO cnt FROM Employee WHERE Dno = p_dno;
    SELECT AVG(Salary) INTO avg_sal FROM Employee WHERE Dno = p_dno;
    SELECT cnt, avg_sal;
END $$
DELIMITER ;

-- 10. Procedure to find the number of employees under each manager
DELIMITER $$
CREATE PROCEDURE subordinate()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_emp INT;
    DECLARE manager_name VARCHAR(50);
    DECLARE cur CURSOR FOR 
        SELECT COUNT(E.SSn) AS sub_count, M.Fname AS manager_name
        FROM Employee E
        JOIN Employee M ON E.Super_ssn = M.SSn
        GROUP BY M.SSn, M.Fname;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE manager_subordinates (
        manager VARCHAR(50),
        subordinate_count INT
    );

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sub_emp, manager_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO manager_subordinates VALUES (manager_name, sub_emp);
    END LOOP;

    SELECT * FROM manager_subordinates;
    DROP TEMPORARY TABLE manager_subordinates;
    CLOSE cur;
END $$
DELIMITER ;

-- 11. Procedure to update salary
DELIMITER $$
CREATE PROCEDURE update_salary()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_salary DECIMAL(10,2);
    DECLARE current_ssn INTEGER(10);
    DECLARE cur CURSOR FOR SELECT SSn, Salary FROM Employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    update_loop: LOOP
        FETCH cur INTO current_ssn, current_salary;
        IF done THEN
            LEAVE update_loop;
        END IF;

        IF current_salary < 30000 THEN
            UPDATE Employee SET Salary = Salary * 1.15 WHERE SSn = current_ssn;
        ELSEIF current_salary BETWEEN 30000 AND 35000 THEN
            UPDATE Employee SET Salary = Salary * 1.10 WHERE SSn = current_ssn;
        END IF;
    END LOOP;

    CLOSE cur;
END $$
DELIMITER ;

-- 12. Procedure to find whether a number is even or odd
DELIMITER $$
CREATE PROCEDURE EVEN_ODD(IN NUM INT(5))
BEGIN
    IF NUM % 2 = 0 THEN
        SELECT 'Number is even' AS Result;
    ELSE
        SELECT 'Number is odd' AS Result;
    END IF;
END $$
DELIMITER ;

-- 13. Procedure to concatenate two strings and capitalize the first letter of both words
DELIMITER $$
CREATE PROCEDURE str_cat(
    IN STR1 VARCHAR(10), 
    IN STR2 VARCHAR(10), 
    OUT STR3 VARCHAR(20)
)
BEGIN
    SET STR3 = CONCAT(
        CONCAT(UPPER(LEFT(STR1,1)), LOWER(SUBSTRING(STR1,2))),
        CONCAT(UPPER(LEFT(STR2,1)), LOWER(SUBSTRING(STR2,2)))
    );
END $$
DELIMITER ;

-- 14. Procedure to retrieve names of employees above 25 years
DELIMITER $$
CREATE PROCEDURE find_age()
BEGIN
    SELECT 
        Fname, 
        Lname, 
        YEAR(CURDATE()) - YEAR(Bdate) AS Age
    FROM 
        Employee
    WHERE 
        YEAR(CURDATE()) - YEAR(Bdate) > 25;
END $$
DELIMITER ;

-- 15. Trigger to audit changes on Employee table
-- First, create an audit table
CREATE TABLE Audit_Emp (
    Operation VARCHAR(10),
    Op_Time DATETIME,
    Old_Name_Dept VARCHAR(50),
    New_Name_Dept VARCHAR(50)
);

-- Insert Trigger
DELIMITER $$
CREATE TRIGGER emp_insert 
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Emp 
    VALUES ('INSERT', NOW(), NULL, CONCAT(NEW.Fname, ' ', NEW.Lname, ' - Dept ', NEW.Dno));
END $$
DELIMITER ;

-- Update Trigger
DELIMITER $$
CREATE TRIGGER emp_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Emp 
    VALUES (
        'UPDATE', 
        NOW(), 
        CONCAT(OLD.Fname, ' ', OLD.Lname, ' - Dept ', OLD.Dno),
        CONCAT(NEW.Fname, ' ', NEW.Lname, ' - Dept ', NEW.Dno)
    );
END $$
DELIMITER ;

-- Delete Trigger
DELIMITER $$
CREATE TRIGGER emp_delete
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Emp 
    VALUES ('DELETE', NOW(), CONCAT(OLD.Fname, ' ', OLD.Lname, ' - Dept ', OLD.Dno), NULL);
END $$
DELIMITER ;