--CTAS CREATE TABLE AS SELECT

CREATE TABLE EMPS2 as select *from employees;
select * FROM emps2;-- employees ��ü����
drop table emps2;--���̺� ����
drop table empa;

CReate table emps3 as select * FROM employees where 1=2; --where���� False�� ��
--employees ���̺��� ������ ����
select* FROM EMPS3;
drop table emps3;