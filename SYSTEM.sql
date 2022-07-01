Describe BOOK;
Describe STUDENT;
Describe ISsuE;


CREATE TABLE BOOK(
BOOKID VARCHAR2(10) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
PUBLISHER VARCHAR2(50) NOT NULL,
PRICE VARCHAR2(20) ,
PUBLISERYEAR VARCHAR2(20) ,
CONSTRAINT BOOK_pk PRIMARY KEY(BOOKID));



select * from BOOK;
select * from Student;
select * from issue;

INSERT INTO STUDENT Values ('C191101', 'Sayed Tahsinoor Rahman','mail.tahsin99@gmail.com','CSE');

INSERT INTO ISSUE VALUES(
'6',
'C191101',
'2-03-2021',
'05-07-2021',
'NO');



select * from Issue 
where studentid='C191085' 
and bookid='1' 
and returnbook='NO';

UPDATE ISSUE SET returnbook='YES' 
WHERE studentid='C191085' 
and bookid='1';


select bookid as"Book ID",
name as"Name",
publisher as "Writter" 
from book;



select issue.studentid, student.name , issue.bookid ,book.name as "Book Name",
issue.issuedate, issue.duedate from issue 
inner join book on book.bookid=issue.bookid 
inner join student on student.std_id=issue.studentid and issue.returnbook='YES';

select book.name,book.publisher,(select name from student where student.std_id=issue.studentid)
as "BORROWER NAME", issue.issuedate,issue.duedate ,issue.returnbook 
as "Returned?" from issue RIGHT OUTER JOIN book 
on issue.bookid=book.bookid ;

select STUDENT.name,(select book.name from BOOK where book.bookid=issue.bookid) 
as "Borrowed Book",issue.issuedate,issue.duedate ,issue.returnbook as "Returned?" 
from student left OUTER JOIN issue on issue.studentid=student.std_id  ;          


select * from BOOK where bookid='1';
select * from BOOK where name='Data Structure';
select * from BOOK where publisher='Abdul Bari';
select * from BOOK where price='200';
select * from BOOK where publisheryear='2009';




select std_id as "Student ID",name as "NAME",father_name,course_name,branch_name as "DEPARTMENT" from STUDENT where std_id='C191101';
select std_id as "Student ID",name as "NAME",father_name,course_name,branch_name as "DEPARTMENT" from STUDENT where Name='Sayed Tahsinoor Rahman';
select std_id as "Student ID",name as "NAME",father_name,course_name,branch_name as "DEPARTMENT" from STUDENT where course_name='Masters';
select std_id as "Student ID",name as "NAME",father_name,course_name,branch_name as "DEPARTMENT" from STUDENT where branch_name='CSE';
select std_id as "Student ID",name as "NAME",father_name,course_name,branch_name as "DEPARTMENT" from STUDENT ;


select (select book.bookid from  BOOK where issue.bookid=book.bookid and issue.returnbook!='NO') as "ID",(select name from BOOK where issue.bookid=book.bookid and issue.returnbook!='NO')as "Name",book.publisher as "Writter" from book left outer join issue on book.bookid=issue.bookid;

































