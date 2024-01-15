--Scalar 서브쿼리- select문장에 column절에 들어간 서브쿼리
--JOIN구문 사용시 길어지는 문장을 줄여줄수 있다.
--JOIN해서 단 한개만 값을 가져오는 경우에만 사용이 용이합니다.
--여러개를 가져오는 경우 JOIN이 더 빠릅니다.
--서브 쿼리의 where에 JOIN의 ON구문 뒤의 값이 들어간다.
SELECT First_name, (SELECT l.street_address FROM LOcations l where d.location_id=l.location_id) FROM employees e
left join departments d on e.Department_ID=d.department_ID
order by First_name desc;

SELECT E.FIRST_NAME,(SELECT d.department_NAME from departments d where e.department_id=d.department_id) FROM employees E
order by e.last_name desc;


SELECT FIRST_NAME,(SELECT Department_NAME FROM departments d where d.department_id=e.department_ID)from employees e;


SELECT e.*, 
        (select department_name from departments d where d.department_ID=e.department_ID),
        (select JOB_TITLE from jobs j where J.job_ID=e.job_ID)
FROM employees e;