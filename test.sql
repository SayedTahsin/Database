describe EMPLOYEES;
select * from EMPLOYEES;
select FIRST_NAME,EMPLOYEE_ID,SALARY from EMPLOYEES;
select FIRST_NAME || ' GETTING SALARY ' || SALARY from EMPLOYEES;
select 2*3 from DUAL;
select FIRST_NAME,SALARY from EMPLOYEES Where SALARY<24000;

select sysdate as "DATE" from DUAL;
select FIRST_NAME,EMPLOYEE_ID,SALARY from EMPLOYEES where EMPLOYEE_ID=100 and FIRST_NAME='Steven';
select FIRST_NAME,EMPLOYEE_ID,SALARY from EMPLOYEES where EMPLOYEE_ID=101 OR FIRST_NAME='Steven';
select FIRST_NAME,EMPLOYEE_ID,SALARY from EMPLOYEES where NOT EMPLOYEE_ID=100 ;

select * from DUAL where NULL=NULL;
select * from DUAL where NULL='@';
select 1+NULL from DUAL;
select * from EMPLOYEES where EMPLOYEE_ID IS NOT NULL;

select UPPER('sayed') from DUAL;
select UPPER(FIRST_NAME) from EMPLOYEES;
select LOWER(FIRST_NAME) from EMPLOYEES;
select INITCAP('sayed tahsin') from DUAL;

select FIRST_NAME ,REVERSE(FIRST_NAME)from EMPLOYEES;
select LENGTH('sayed Tahsin') from DUAL;
select FIRST_NAME,LENGTH(FIRST_NAME)from EMPLOYEES;
select REVERSE(INITCAP(FIRST_NAME)) from EMPLOYEES;

--case: 1   SUBSTR(string,Begenning_Position,substring_length)// (1 based indexing) if you give 0 as postion oracle will consider pos as 1 by default
select SUBSTR('ABCDEFG',0,4) "Substring Output" from DUAL;
--case: 2   for positive (Begenning_Position) value oracle will satrt count from Begenning of String
select SUBSTR('ABCDEFG',2,4) "Substring Output" from DUAL;
--case: 3   for negative (Begenning_Position) value oracle will satrt count from END
select SUBSTR('ABCDEFG',-4,3) "Substring Output" from DUAL;
--case: 4   without (substring_length) param oracle will take all char from Begenning_Position i.e. substring_length is an optional param
select SUBSTR('ABCDEFG',3) "Substring Output" from DUAL;
--case: 5   for Begenning_Position gretter than length of string , oracle will show NULL
select SUBSTR('ABCDEFG',8,4) "Substring Output" from DUAL;
--case: 6   if the substring_length is <=0 orcale will show NULL
select SUBSTR('ABCDEFG',6,-1) "Substring Output" from DUAL;

--INSTR(STRING,SUBSTRING,position,occurance) // last 2 param is optional //postion should be >0 // occuracne should be >=1
select INSTR('Corporate floor','or') as "INSTR OUTPUT" from DUAL;  --it shows the first occuracne of substring
select INSTR('Corporate floor','or',6) as "INSTR OUTPUT" from DUAL; --it shows the first occuracne of substring after postion
select INSTR('Corporate floor','or',3,2) as "INSTR OUTPUT" from DUAL; -- it shows the 2nd occuracne of substring after position

--Subquery(selcet, from, Where, having, insert, update, delete
--select clause
select DEPARTMENT_NAME,(select COUNT(*)FROM EMPLOYEES where DEPARTMENT_ID='20') NO_OF_EMP from DEPARTMENTS where DEPARTMENT_ID='20';

select EMPLOYEE_ID,FIRST_NAME,DEPARTMENT_NAME from EMPLOYEES ,(select DEPARTMENT_NAME from DEPARTMENTS where DEPARTMENT_ID='20')where DEPARTMENT_ID='20';

--where clause
select EMPLOYEE_ID,FIRST_NAME,SALARY from EMPLOYEES where SALARY=(select MIN(SALARY) from EMPLOYEES);

--having clause
select COUNT (EMPLOYEE_ID),DEPARTMENT_NAME ,SALARY from EMPLOYEES,DEPARTMENTS where EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID group by DEPARTMENT_NAME,SALARY HAVING SAlARY =(select MAX(SALARY)from EMPLOYEES);






CREATE TABLE STUDENTS(
ID VARCHAR(10) NOT NULL,
NAME VARCHAR(10)NOT NULL,
CGPA NUMERIC(4,2),
CONSTRAINT STUDENTS_pk PRIMARY KEY(ID));

DESCRIBE STUDENTS;

ALTER TABLE STUDENTS ADD DEPT VARCHAR(10);

INSERT INTO STUDENTS VALUES('C191101','KARIM',3.67,'CSE');
INSERT INTO STUDENTS VALUES('C191102','RAHIM',3.70,'CSE');

SELECT * FROM STUDENTS;

UPDATE STUDENTS SET CGPA=3.8 WHERE ID='C191101';

DELETE FROM STUDENTS WHERE ID='C191102';

ALTER TABLE STUDENTS MODIFY NAME VARCHAR(20);

ALTER TABLE STUDENTS DROP COLUMN DEPT;

DROP TABLE STUDENTS;

Show trigger in test;

CREATE or Replace Trigger std
after insert
on STUDENTS
for each row
BEGIN
    DBMS_OUTPUT.PUT_LINE('RECORD updated');
END;



INSERT INTO STUDENTS VALUES('C191102','RAHIM',3.70,'CSE');

drop trigger STD;






























