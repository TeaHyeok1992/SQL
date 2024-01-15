--UPDATE
--반드시 WHERE절 붙여줘야합니다.
-- update table set column=value, ..... where 범위
--WHERE가 들어가지않으면 모든값을 다 바꿉니다.

SELECT * FROM emps;

INSERT INTO emps(SELECT*FROM employees where job_ID='IT_PROG');
commit;--해당 데이터를 반영하겠다는 소리입니다. 롤백 이루어 지지 않습니다.

UPDATE emps
set salary=SALARY *1.1 where employee_id=104;--104번 직원의 급여를 10% 인상
--WHERE절 없이 구문을 실행하면 전체테이블에 다 들어가게 됩니다.
--반드시 SELECT로 확인부터 하는 습관을 들이도록 하자
select* FROM emps;
rollback;

--다중 행 업데이트

SELEct * FROM emps;

update emps set salary=1.3*salary , Commission_PCT=0.35, Manager_ID=110
where employee_id=104;
select*FROM emps;


--UPDATE + SUBQUARY

UPDATE EMPS
set (SALARY,FIRST_NAME,LAST_NAME)= (SELECT SALARY, FIRST_NAME,LAST_NAME from employees where EMPLOYEE_ID=114) where COMMISSION_PCT is null;

SELECT * FROM EMPS;
rollback;


UPDATE EMPS
set MANAGER_ID=(select MANAGER_ID from employees where employee_id=201) where Employee_ID =104;
select * FROM emps;
INSERT INTO EMPS
(select * FROM employees where JOB_ID='SA_MAN');

select * FROM EMPS;
UPDATE EMPS
set commission_pct=0.15 where JOB_ID='IT_PROG';

select* FROM EMPS;

UPDATE EMPS
SET salary=salary*1.05 where JOB_ID='IT_PROG';


SELECT * FROM EMPS;

Insert INTO EMPS
(select * FROM employees where JOB_ID='SA_MAN');

SELECT * FROM emps;

UPDATE EMPS
set commission_pct=0.15 where job_ID='IT_PROG';

select * FROM emps;

update emps
set salary = salary+salary*commission_pct;

select * FROM emps;

update emps

set commission_pct=0.2 where first_name='Diana';

rollback;

