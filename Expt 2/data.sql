show databases;
create database employee_info;
use employee_info;

create table WORKER(
    WORKER_ID int NOT NULL,
    FIRST_NAME char(25) NOT NULL,
    LAST_NAME char(25) NOT NULL,
    SALARY int NOT NULL,
    JOINING_DATE datetime NOT NULL,
    DEPARTMENT char(25) NOT NULL,
    PRIMARY KEY (WORKER_ID),
);

INSERT INTO WORKER(
    WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
)
VALUES(1,"MONIKA","ARORA",100000,"2021-02-20 09:00:00","HR"),
(2,"NIHARIKA","VERMA",80000,"2021-06-11 09:00:00","ADMIN"),
(3,"VISHAL","SINGHAL",300000,"2021-02-20 09:00:00","HR"),
(4,"AMITABH","SINGH",500000,"2021-02-20 09:00:00","ADMIN"),
(5,"VIVEK","BHATI",500000,"2021-06-11 09:00:00","ADMIN"),
(6,"VIPUL","DIWAN",200000,"2021-06-11 09:00:00","ACCOUNT"),
(7,"SATISH","KUMAR",75000,"2021-01-20 09:00:00","ACCOUNT"),
(8,"GEETIKA","CHAUHAN",90000,"2021-04-11 09:00:00","ADMIN");

CREATE TABLE BONUS(
    WORKER_REF_ID int,
    BONUS_DATE datetime,
    BONUS_AMOUNT int,
    FOREIGN KEY FKI (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

INSERT INTO BONUS(
    WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT
)
VALUES(1,"2023-02-20 00:00:00",5000),
(2,"2023-06-11 00:00:00",3000),
(3,"2023-02-20 00:00:00",4000),
(1,"2023-02-20 00:00:00",4500),
(2,"2023-06-11 00:00:00",3500);

CREATE TABLE TITLE(
    WORKER_REF_ID int,
    WORKER_TITLE char(25),
    AFFECTED_FROM datetime,
    FOREIGN KEY FKJ (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);


INSERT INTO TITLE(
    WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM
)
VALUES(1,"Manager","2023-02-20 00:00:00"),
(2,"Executive","2023-06-11 00:00:00"),
(8,"Executive","2023-06-11 00:00:00"),
(5,"Manager","2023-06-11 00:00:00"),
(4,"Asst. Manager","2023-06-11 00:00:00"),
(7,"Executive","2023-06-11 00:00:00"),
(6,"Lead","2023-06-11 00:00:00"),
(3,"Lead","2023-06-11 00:00:00");

