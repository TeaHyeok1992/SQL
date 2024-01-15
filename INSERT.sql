--DML

--데이터의 삭제, 추가, 변경시에 사용하는 문법

--A. INSERT 데이터의 추가

--테이블 구조 확인 DESC [테이블 명]

-- Insert INTO [테이블(지정할 column)] values (column에 추가할 값들,....) ;


-- INSERT구문에 SUBQUARY도 사용이 가능합니다.


CREATE table empa as (select * FROM employees where 1=2);

SELECT* FROM EMPA;

Insert INto empa (select * FROM employees where job_ID like '%Man');

rollback;

rollback;

INSERT INTO emps (LAST_NAME,EMAIL,HIRE_DATE,Job_ID)
values((SELECT Last_NAME from employees where Manager_ID is null),
'ASKSKS',
SYSDATE,
null
);
rollback;
