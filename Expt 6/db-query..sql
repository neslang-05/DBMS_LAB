--Q1. List the sailors and the dates on which they reserved boats. 
--Query: 
SELECT S.SNAME, R.DAY FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID; 
 
--Q2. Retrieve the names of boats and their colors for all reservations. 
--Query: 
SELECT B.BNAME, B.COLOUR FROM BOATS B JOIN RESERVES R ON B.BID = R.BID;   
--Q3. Find the names of sailors and the IDs of the boats they reserved. 
-- Query: 
SELECT S.SNAME, R.BID FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID;  
--Q4. List the boat names along with the names of sailors who reserved them. 
-- Query: 
SELECT B.BNAME, S.SNAME FROM BOATS B JOIN RESERVES R ON B.BID = R.BID JOIN SAILORS S ON R.SID = S.SID;  
--Q5. Retrieve the details of sailors and boats they reserved. 
-- Query: 
SELECT S.SNAME, S.AGE, B.BNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID;  
--Q6. Retrieve the names of sailors and the colors of boats they have reserved. 
-- Query: 
SELECT S.SNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID;  
--Q7.Find the sailors who reserved white boats. 
-- Query: 
SELECT S.SNAME FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE B.COLOR = 'WHITE';   
--Q8. Retrieve the names of boats along with the total number of reservations made for each. 
-- Query: 
SELECT B.BNAME, COUNT(R.SID) AS TOTAL_RESERVATIONS FROM BOATS B LEFT JOIN RESERVES R ON B.BID = R.BID GROUP BY B.BNAME;  
--Q9. Find sailors older than 30 who reserved red boats. 
-- Query: 
 SELECT S.SNAME FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE S.AGE > 30 AND B.COLOR = 'BLUE';  
--Q10. Retrieve the details of sailors who reserved a boat on '2024-12-03'. 
--Query: 
SELECT S.SNAME, S.RATINGS, B.BNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE R.DAY = '2024-12-03'; 