--CTAS CREATE TABLE AS SELECT

CREATE TABLE EMPS2 as select *from employees;
select * FROM emps2;-- employees 전체복사
drop table emps2;--테이블 삭제
drop table empa;

CReate table emps3 as select * FROM employees where 1=2; --where절에 False가 들어감
--employees 테이블의 구조만 복사
select* FROM EMPS3;
drop table emps3;