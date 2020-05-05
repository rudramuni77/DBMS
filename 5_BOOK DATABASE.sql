CREATE DATABASE BOOK;
USE BOOK;

CREATE TABLE AUTHORS(AUTHOR_ID INT,A_NAME VARCHAR(10),CITY VARCHAR(10),COUNTRY VARCHAR(10),PRIMARY KEY(AUTHOR_ID));
CREATE TABLE PUBLISHERS(PUBLISHER_ID INT,P_NAME VARCHAR(10),CITY VARCHAR(20),COUNTRY VARCHAR(10),PRIMARY KEY(PUBLISHER_ID));
CREATE TABLE CATEGORY(CATEGORY_ID INT,DESCRIPTIONS VARCHAR(10),PRIMARY KEY(CATEGORY_ID));
CREATE TABLE CATALOG(BOOK_ID INT,TITLE VARCHAR(10),AUTHOR_ID INT,PUBLISHER_ID INT,CATEGORY_ID INT,P_YEAR INT,PRICE INT,PRIMARY KEY(BOOK_ID),FOREIGN KEY(AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID),FOREIGN KEY(PUBLISHER_ID) REFERENCES PUBLISHERS(PUBLISHER_ID), FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID));
CREATE TABLE ORDER_DETAILS(ORDER_NO INT,BOOK_ID INT,QTY INT,PRIMARY KEY(ORDER_NO),FOREIGN KEY (BOOK_ID) REFERENCES CATALOG(BOOK_ID));

INSERT INTO AUTHORS VALUES(10,'SAM','BLORE','INDIA');
INSERT INTO AUTHORS VALUES(20,'SHAAN','COORG','INDIA');
INSERT INTO AUTHORS VALUES(30,'SARA','CA','USA');
INSERT INTO AUTHORS VALUES(40,'AYMAN','SPAIN','BARCELONA');
INSERT INTO AUTHORS VALUES(50,'TANYA','DELHI','INDIA');
SELECT * FROM AUTHORS;

INSERT INTO PUBLISHERS VALUES(1,'PHI','NY','USA');
INSERT INTO PUBLISHERS VALUES(2,'EEE','LA','USA');
INSERT INTO PUBLISHERS VALUES(3,'SWAPNA','','INDIA');
INSERT INTO PUBLISHERS VALUES(4,'MGH','NY','USA');
INSERT INTO PUBLISHERS VALUES(5,'PEARSON','DELHI','INDIA');
SELECT * FROM PUBLISHERS;

INSERT INTO CATEGORY VALUES(11,'CS');
INSERT INTO CATEGORY VALUES(22,'EC');
INSERT INTO CATEGORY VALUES(33,'OS');
INSERT INTO CATEGORY VALUES(44,'C++');
INSERT INTO CATEGORY VALUES(55,'DBMS');
SELECT * FROM CATEGORY;

INSERT INTO CATALOG VALUES(111,'BASICS',50,2,11,2003,200);
INSERT INTO CATALOG VALUES(222,'PROG',40,5,44,1999,500);
INSERT INTO CATALOG VALUES(333,'MP',50,1,11,2009,900);
INSERT INTO CATALOG VALUES(444,'CIRCUITS',50,2,22,1997,300);
INSERT INTO CATALOG VALUES(555,'DATA',30,3,55,2005,600);
SELECT * FROM CATALOG;

INSERT INTO ORDER_DETAILS VALUES(123,222,100);
INSERT INTO ORDER_DETAILS VALUES(231,111,150);
INSERT INTO ORDER_DETAILS VALUES(143,333,90);
INSERT INTO ORDER_DETAILS VALUES(156,555,200);
INSERT INTO ORDER_DETAILS VALUES(218,444,70);
SELECT * FROM ORDER_DETAILS;

SELECT A.A_NAME,C.TITLE,C.PRICE FROM AUTHORS A,CATALOG C WHERE C.AUTHOR_ID=A.AUTHOR_ID AND C.P_YEAR>=2000 AND A.A_NAME=(SELECT A.A_NAME FROM AUTHORS A,CATALOG C WHERE A.AUTHOR_ID=C.AUTHOR_ID GROUP BY C.AUTHOR_ID HAVING COUNT(*)>=2);

SELECT A.A_NAME FROM AUTHORS A,CATALOG C,ORDER_DETAILS O WHERE O.BOOK_ID=C.BOOK_ID AND A.AUTHOR_ID=C.AUTHOR_ID AND O.BOOK_ID=(SELECT BOOK_ID FROM ORDER_DETAILS WHERE QTY=(SELECT MAX(QTY) FROM ORDER_DETAILS));

UPDATE CATALOG SET PRICE=1.10*PRICE;
SELECT * FROM CATALOG;
