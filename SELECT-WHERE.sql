-- 주석처리 한줄
/*
    여러줄 주석
*/

SELECT * From employees;-- employees의 모든 column을 조회
SELECT * FROM departments;
SELECT * FROM jobs;
-- 특정컬럼만 지정하기
SELECT Employee_ID, FIRSt_name , EMAIL From employees;
-- 타입 문자, 숫자, 날짜
SELECT Hire_DAte , Last_Name, Employee_ID FROM employees;
-- 날짜와 문자열은 좌정렬, 숫자열은 우정렬되어있다.

--숫자열은 column연산이 가능하다
SELECT salary, salary*1.1 from employees;
SELECT salary*1.1 AS sallar from employees;
--NULL은 비어잇거나 접근할수 없거나 지정이 불가능하다는 뜻입니다.
SELECT commission_PCT, DEPARTMENT_ID from employees;--DEPARTMENT ID 는 Foreign KEY.
--열의 이름변경 AS
SELECT salary AS salary_Aniversal from employees;

--문자열을 추가할땐 || 를 사용합니다 문자열 표기에는 '가' 이런식으로 표기합니다.
SELECT First_name , Last_name , salary from employees;
SELECT first_name || ' ' || last_name || '''s salary is $' || salary AS "EMPLOYEE DEtails" from employees;
select 'like this' from employees;
SELECT * From employees;

-- Column Alias>> column명 변경
SELECT First_name || ' '|| Last_name || Salary as "em" from employees;

--키워드 DISTINCT 중복된 행 제거
SELECT distinct DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM employees;--세개기준으로 중복행 없음
--rownum/ rowID
--rowID : 데이터베이스에서 행의 주소
--rowNum: 조회된 순서대로  행의 번호를 출력해줍니다.- 데이터의 갯수를 구할때 유용하게 사용한다.
SELECT rowid,rownum,FIRST_NAME from employees;
SELECT ROWID, ROWNUM , FIrst_NAMe, LAST_NAME FROM EMPLOYEES;

--WHERE 절은 연산자, 문자열의 조건을 입력하여 해당값에 해당하는 column만 추출해냅니다.
--<> 같지않다
--where 절에서 문자열과 날짜는 홑따옴표로 감싸주어야 합니다.
SELECT FIRST_NAME , LAST_NAME from employees where salary between 10000 and 12000;
-- Firstname lastname 에서 salary값을 기준으로 10000~12000사이의 값만 추출

SELECT FIRST_NAME,LAST_NAME ,JOB_ID FROM employees where JOB_ID='IT_PROG';

SELECT FIRST_NAME ,LAST_NAME ,JOB_ID FROM EMPLOYEES WHERE salary between 12000 and 15000;
SELECT * from EMPLOYEES where DEPARTMENT_ID !=100;
SELECT*FROM EMPLOYEES where HIRE_Date ='03/06/17';
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEES WHERE salary between 10000 and 13000;
SELECT FIRST_NAME ,LAST_NAME, JOB_ID,EMAIL from employees where salary between 8000 and 12000;
SELECT FIRST_NAME,LAST_NAME,JOB_ID, EMAIL,salary from EMPLOYEES where HIRE_DATE between '03/03/01' and '08/03/01';
SELECT*FROM EMPLOYEES where HIRE_DATE <= '04/01/01';

--IN 연산자(여러개중 한개가 포함된것을 다출력)
SELECT*FROM EMPLOYEES WHERE JOB_ID in('IT_PROG','FI_MGR','AD_VP');
SELECT*FROM EMPLOYEES WHERE DEPARTMENT_ID IN(80,90,100);
--like 연산자
SELECT * FROM EMPLOYEES WHERE HIRE_DATE like '03%';--03으로 시작하는 모든값
select * from employees where hire_date like '%03';--01로 끝나는 모든값
select*from employees where hire_date like '%05%';--05포함된 모든 값


SELECT *FROM EMPLOYEES WHERE HIRE_DATE like '___05%';
SELECT* FROM employees where EMAIL like '_A%';--EMAIL첫글자가 존재하고 다음글자에 A가 나오는 모든 값


--IS NULL/ IS NOT NULL 키워드

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL;
SELECT FIRST_NAME, COMMISSION_PCT FROM  EMPLOYEES WHERE COMMISSION_PCT is null;
SELECT FIRST_NAME, COMMISSION_PCT from EMPLOYEES WHERE COMMISSION_PCT is not null;
SELECT * FROM EMPLOYEES WHERE commission_pct is not null;
SELECT * from employees where department_id is null;

--AND OR NOT
SELECT * FROM EMPLOYEES WHERE job_id = 'IT_PROG' OR job_id='FI_MGR';
SELECT FIRST_NAME, LAST_NAME, JOB_ID from employees where job_id='IT_PROG' AND salary>=3000;
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID, Salary from employees where 
  (job_id='IT_PROG' or job_ID='FI_MGR') AND salary>=6000;
SELECT FIRST_NAME, JOB_ID, DEPARTMENT_ID from employees where department_id not in(60,90,100);
SELECT * FROM EMPLOYEES where JOB_ID not like '%IT%';
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID NOT LIKE '__';
  
SELECT*FROM EMPLOYEES where EMAIL like'_A%'ORDER by EMAIL asc;
SELECT*FROM EMPLOYEES WHERE LAST_NAME like'__%' ORDER BY HIRE_DATE asc , salary desc;
SELECT FIRST_NAME ,LAST_NAME ,salary*12 as anniversal from employees order by anniversal desc, LAST_NAME asc;
SELECT* FROM employees ORDER BY Salary asc;
SELECT FIRST_NAME, LAST_NAME, JOB_ID from employees where job_ID like '%IT%' order by FIRST_NAME desc;
SELECT FIRST_NAME ||' ' ||LAST_NAME AS NAME FROM EMPLOYEES order by name asc;
SELECT FIRST_NAME , DEPARTMENT_ID FROM EMPLOYEES order by department_ID asc , FIRST_NAME asc;
