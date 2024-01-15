SELECT JOB_ID,TRUNC(AVG(SALARY)) AS AVERAGE ,COUNT(*)
FROM employees
Group by JOB_ID
ORDER by AVERAGE desc;

SELECT to_CHAR(HIRE_DATE,'YY') AS �Ի�⵵, count(*)
from employees
group by to_CHAR(HIRE_DATE,'YY')
order by �Ի�⵵ desc;

SELECT Department_ID, count(*),TRUNC(AVG(SALARY))AS Arage
FROM employees
where salary>=1000
Group by department_id
HAVING TRUNC(AVG(SALARY)) >=2000
order by department_id,Arage desc;

SELECT Department_ID, TRUNC(AVG(SALARY+salary*commission_pct),2)AS ass, SUM(salary), count(*)
from employees
where commission_pct is not null
GROUP by department_id
order by ass desc;

SELECT NVL(JOB_ID,'�հ�'),SUM(SALARY)
FROM employees
GROUP by ROLLUP(job_id)
order by job_ID asc;

SELECT 
        DECODE(GROUPING(department_id),1,'�հ�',department_id) AS department_ID,
        DECODE(GROUPING(JOB_ID),1,'�Ұ�',Job_ID)AS JOB_ID,
        count(*)AS total,sum(salary)AS sum
FROM employees
GROUP BY ROLLUP(DEPARTMENT_ID, job_id)
order by SUM ASC;

