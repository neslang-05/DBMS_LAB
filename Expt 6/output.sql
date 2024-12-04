Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database ship_db;
Query OK, 1 row affected (0.04 sec)

mysql> use ship_db;
Database changed
mysql> CREATE TABLE SAILORS(
    -> SID VARCHAR(10) PRIMARY KEY,
    -> SNAME VARCHAR(50) NOT NULL,
    -> RATINGS INT,
    -> AGE INT);
Query OK, 0 rows affected (0.05 sec)

mysql> DESC SAILORS;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| SID     | varchar(10) | NO   | PRI | NULL    |       |
| SNAME   | varchar(50) | NO   |     | NULL    |       |
| RATINGS | int         | YES  |     | NULL    |       |
| AGE     | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

mysql> CREATE TABLE BOATS(
    -> BID VARCHAR(10) PRIMARY KEY,
    -> BNAME VARCHAR(50) NOT NULL,
    -> COLOR VARCHAR(20));
Query OK, 0 rows affected (0.04 sec)

mysql> DESC BOATS;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| BID   | varchar(10) | NO   | PRI | NULL    |       |
| BNAME | varchar(50) | NO   |     | NULL    |       |
| COLOR | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> CREATE TABLE RESERVES (
    ->     SID VARCHAR(10),
    ->     BID VARCHAR(10),
    ->     DAY DATE,
    ->     PRIMARY KEY (SID, BID, DAY)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> -- Add Foreign Key to RESERVES table
mysql> ALTER TABLE RESERVES
    -> ADD CONSTRAINT FK_RESERVES_SAILORS
    -> FOREIGN KEY (SID) REFERENCES SAILORS(SID);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> ALTER TABLE RESERVES
    -> ADD CONSTRAINT FK_RESERVES_BOATS
    -> FOREIGN KEY (BID) REFERENCES BOATS(BID);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC RESERVES;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| SID   | varchar(10) | NO   | PRI | NULL    |       |
| BID   | varchar(10) | NO   | PRI | NULL    |       |
| DAY   | date        | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> DESC BOATS;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| BID   | varchar(10) | NO   | PRI | NULL    |       |
| BNAME | varchar(50) | NO   |     | NULL    |       |
| COLOR | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> DESC SAILORS;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| SID     | varchar(10) | NO   | PRI | NULL    |       |
| SNAME   | varchar(50) | NO   |     | NULL    |       |
| RATINGS | int         | YES  |     | NULL    |       |
| AGE     | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> -- Insert data into SAILORS table
mysql> INSERT INTO SAILORS (SID, SNAME, RATINGS, AGE) VALUES
    -> ('S21', 'HARI', 4, 21),
    -> ('S22', 'RAKESH', 5, 24),
    -> ('S23', 'VEEERU', 4, 45),
    -> ('S24', 'RAHUL', 3, 33),
    -> ('S25', 'RAMU', 3, 30);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into BOATS table
mysql> INSERT INTO BOATS (BID, BNAME, COLOUR) VALUES
    -> ('B101', 'B1', 'WHITE'),
    -> ('B102', 'B2', 'RED'),
    -> ('B103', 'B3', 'WHITE'),
    -> ('B104', 'B4', 'BLUE');
ERROR 1054 (42S22): Unknown column 'COLOUR' in 'field list'
mysql>
mysql> -- Insert data into RESERVES table
mysql> INSERT INTO RESERVES (SID, BID, DAY) VALUES
    -> ('S21', 'B101', '2024-12-03'),
    -> ('S24', 'B103', '2024-12-05'),
    -> ('S23', 'B104', '2024-12-03'),
    -> ('S21', 'B101', '2024-12-10');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ship_db`.`reserves`, CONSTRAINT `FK_RESERVES_BOATS` FOREIGN KEY (`BID`) REFERENCES `boats` (`BID`))
mysql> SELECT*FROM SAILORS;
+-----+--------+---------+------+
| SID | SNAME  | RATINGS | AGE  |
+-----+--------+---------+------+
| S21 | HARI   |       4 |   21 |
| S22 | RAKESH |       5 |   24 |
| S23 | VEEERU |       4 |   45 |
| S24 | RAHUL  |       3 |   33 |
| S25 | RAMU   |       3 |   30 |
+-----+--------+---------+------+
5 rows in set (0.00 sec)

mysql> SELECT*FROM BOATS;
Empty set (0.00 sec)

mysql> SELECT*FROM RESERVES;
Empty set (0.00 sec)

mysql> DESCRIBE BOATS;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| BID   | varchar(10) | NO   | PRI | NULL    |       |
| BNAME | varchar(50) | NO   |     | NULL    |       |
| COLOR | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> DESCRIBE RESERVES;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| SID   | varchar(10) | NO   | PRI | NULL    |       |
| BID   | varchar(10) | NO   | PRI | NULL    |       |
| DAY   | date        | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> -- Insert data into BOATS table
mysql> INSERT INTO BOATS (BID, BNAME, COLOR) VALUES
    -> ('B101', 'B1', 'WHITE'),
    -> ('B102', 'B2', 'RED'),
    -> ('B103', 'B3', 'WHITE'),
    -> ('B104', 'B4', 'BLUE');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into RESERVES table
mysql> INSERT INTO RESERVES (SID, BID, DAY) VALUES
    -> ('S21', 'B101', '2024-12-03'),
    -> ('S24', 'B103', '2024-12-05'),
    -> ('S23', 'B104', '2024-12-03'),
    -> ('S21', 'B101', '2024-12-10');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT*FROM BOATS;
+------+-------+-------+
| BID  | BNAME | COLOR |
+------+-------+-------+
| B101 | B1    | WHITE |
| B102 | B2    | RED   |
| B103 | B3    | WHITE |
| B104 | B4    | BLUE  |
+------+-------+-------+
4 rows in set (0.00 sec)

mysql> SELECT*FROM RESERVES;
+-----+------+------------+
| SID | BID  | DAY        |
+-----+------+------------+
| S21 | B101 | 2024-12-03 |
| S21 | B101 | 2024-12-10 |
| S24 | B103 | 2024-12-05 |
| S23 | B104 | 2024-12-03 |
+-----+------+------------+
4 rows in set (0.00 sec)

mysql> --Q1. List the sailors and the dates on which they reserved boats.
    -> --Query:
    -> SELECT S.SNAME, R.DAY FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--Q1. List the sailors and the dates on which they reserved boats.
--Query:
SE' at line 1
mysql> --Q1 .
    -> SELECT S.SNAME, R.DAY
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--Q1 .
SELECT S.SNAME, R.DAY
FROM SAILORS S
JOIN RESERVES R ON S.SID = R.SID' at line 1
mysql> SELECT S.SNAME, R.DAY
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID;
+--------+------------+
| SNAME  | DAY        |
+--------+------------+
| HARI   | 2024-12-03 |
| HARI   | 2024-12-10 |
| VEEERU | 2024-12-03 |
| RAHUL  | 2024-12-05 |
+--------+------------+
4 rows in set (0.01 sec)

mysql> #q1;
mysql> SELECT S.SNAME, R.DAY
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID;
+--------+------------+
| SNAME  | DAY        |
+--------+------------+
| HARI   | 2024-12-03 |
| HARI   | 2024-12-10 |
| RAHUL  | 2024-12-05 |
| VEEERU | 2024-12-03 |
+--------+------------+
4 rows in set (0.00 sec)

mysql> #q2.
mysql> SELECT B.BNAME, R.DAY
    -> FROM BOATS B
    -> JOIN RESERVES R ON B.BID = R.BID;
+-------+------------+
| BNAME | DAY        |
+-------+------------+
| B1    | 2024-12-03 |
| B1    | 2024-12-10 |
| B3    | 2024-12-05 |
| B4    | 2024-12-03 |
+-------+------------+
4 rows in set (0.00 sec)

mysql> #Q3. Find the names of sailors and the IDs of the boats they reserved.
mysql> SELECT S.SNAME, R.BID
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID;
+--------+------+
| SNAME  | BID  |
+--------+------+
| HARI   | B101 |
| HARI   | B101 |
| RAHUL  | B103 |
| VEEERU | B104 |
+--------+------+
4 rows in set (0.00 sec)

mysql> #Q4. List the boat names along with the names of sailors who reserved them.
mysql> SELECT B.BNAME, S.SNAME
    -> FROM BOATS B
    -> JOIN RESERVES R ON B.BID = R.BID
    -> JOIN SAILORS S ON R.SID = S.SID;
+-------+--------+
| BNAME | SNAME  |
+-------+--------+
| B1    | HARI   |
| B1    | HARI   |
| B3    | RAHUL  |
| B4    | VEEERU |
+-------+--------+
4 rows in set (0.00 sec)

mysql> #Q5. Retrieve the details of sailors and boats they reserved.
mysql> SELECT S.SNAME, S.AGE, B.BNAME, B.COLOUR
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID
    -> JOIN BOATS B ON R.BID = B.BID;
ERROR 1054 (42S22): Unknown column 'B.COLOUR' in 'field list'
mysql> SELECT S.SNAME, S.AGE, B.BNAME, B.COLOUR
    -> FROM SAILORS S
    -> JOIN RESERVES R ON S.SID = R.SID
    -> JOIN BOATS B ON R.BID = B.BID;
ERROR 1054 (42S22): Unknown column 'B.COLOUR' in 'field list'
mysql> ^C
mysql> SELECT S.SNAME, S.AGE, B.BNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID;
+--------+------+-------+-------+
| SNAME  | AGE  | BNAME | COLOR |
+--------+------+-------+-------+
| HARI   |   21 | B1    | WHITE |
| HARI   |   21 | B1    | WHITE |
| RAHUL  |   33 | B3    | WHITE |
| VEEERU |   45 | B4    | BLUE  |
+--------+------+-------+-------+
4 rows in set (0.00 sec)

mysql> #Q6.
mysql> SELECT S.SNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID;
+--------+-------+
| SNAME  | COLOR |
+--------+-------+
| HARI   | WHITE |
| HARI   | WHITE |
| RAHUL  | WHITE |
| VEEERU | BLUE  |
+--------+-------+
4 rows in set (0.00 sec)

mysql> #Q7.
mysql> SELECT S.SNAME FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE B.COLOUR = 'WHITE';
ERROR 1054 (42S22): Unknown column 'B.COLOUR' in 'where clause'
mysql> SELECT S.SNAME FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE B.COLOR = 'WHITE';
+-------+
| SNAME |
+-------+
| HARI  |
| HARI  |
| RAHUL |
+-------+
3 rows in set (0.01 sec)

mysql> #Q8.
mysql> SELECT B.BNAME, COUNT(R.SID) AS TOTAL_RESERVATIONS FROM BOATS B LEFT JOIN RESERVES R ON B.BID = R.BID GROUP BY B.BNAME;
+-------+--------------------+
| BNAME | TOTAL_RESERVATIONS |
+-------+--------------------+
| B1    |                  2 |
| B2    |                  0 |
| B3    |                  1 |
| B4    |                  1 |
+-------+--------------------+
4 rows in set (0.00 sec)

mysql> #Q9.
mysql> SELECT S.SNAME FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE S.AGE > 30 AND B.COLOR = 'BLUE';
+--------+
| SNAME  |
+--------+
| VEEERU |
+--------+
1 row in set (0.00 sec)

mysql> #Q10.
mysql> SELECT S.SNAME, S.RATINGS, B.BNAME, B.COLOUR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE R.DAY = '2024-12-03';
ERROR 1054 (42S22): Unknown column 'B.COLOUR' in 'field list'
mysql> SELECT S.SNAME, S.RATINGS, B.BNAME, B.COLOR FROM SAILORS S JOIN RESERVES R ON S.SID = R.SID JOIN BOATS B ON R.BID = B.BID WHERE R.DAY = '2024-12-03';
+--------+---------+-------+-------+
| SNAME  | RATINGS | BNAME | COLOR |
+--------+---------+-------+-------+
| HARI   |       4 | B1    | WHITE |
| VEEERU |       4 | B4    | BLUE  |
+--------+---------+-------+-------+
2 rows in set (0.03 sec)

mysql>