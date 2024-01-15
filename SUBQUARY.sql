--SUB QUARY
--조건식을 SELECT로 일일이 처리하는것을 한번에 처리할수 있는 기능

-- 기본형식은 Where 절에 추가합니다.

--무조건 Sub Quary부터 해석을 합니다.
--필수조건을 반드시 지켜야 됩니다. 
--소괄호로 둘러싸야합니다/ 비교연산자의 오른쪽에 있어야합니다/ ORDER BY절을 포함할수 없습니다. 

--단일행 서브쿼리 - 행의 결과가 1행이여야 합니다
SELECT * From employees
where Salary >=(SELECT SALARY FROM employees where First_Name like 'Nancy');
--다중행 서브쿼리- 행의 결과가 여러개입니다.
--사용되는 연산자가 다릅니다.
--IN -목록의 값과 같은지 확인/ ANY,SOME- 각각의 서브쿼리 값과 비교 해서 하나라도 만족하면 가능 //ALL - 모든 값과 비교해서 모두다 만족해야함

SELECT * FROM employees
where SALARY >ANY(SELECT SALARY FROM employees where First_name = 'David');

SELECT e.first_name,e.salary, d.department_name, d.department_id from employees e
left join departments d on e.department_id=d.department_id
where d.department_name IN (select department_Name from departments
where department_ID>=70);


SELECT e.first_name,  d.department_name, l.city FROM employees e
left join departments d on e.department_id=d.department_id
left join locations l on d.location_id=l.location_id
where l.street_address IN (select Street_address from locations
where location_ID >=2000);


SELECT concat(FIRST_NAME, LAST_NAME),department_id
from employees
WHERE department_ID IN(SELECT department_id
from employees 
where First_name ='Steven') AND FIRST_NAME != 'Steven';

SELECT concat(concat(FIRST_NAME,' '),LAST_NAME) AS NAME,
JOB_ID
FROM employees
where Job_ID IN(SELECT job_ID FROM employees
Where first_name ='Steven'
Union ALL
SELECT job_ID from employees
where first_name = 'David')
order by JOB_ID asc;



