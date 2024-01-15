--SUB QUARY
--���ǽ��� SELECT�� ������ ó���ϴ°��� �ѹ��� ó���Ҽ� �ִ� ���

-- �⺻������ Where ���� �߰��մϴ�.

--������ Sub Quary���� �ؼ��� �մϴ�.
--�ʼ������� �ݵ�� ���Ѿ� �˴ϴ�. 
--�Ұ�ȣ�� �ѷ��ξ��մϴ�/ �񱳿������� �����ʿ� �־���մϴ�/ ORDER BY���� �����Ҽ� �����ϴ�. 

--������ �������� - ���� ����� 1���̿��� �մϴ�
SELECT * From employees
where Salary >=(SELECT SALARY FROM employees where First_Name like 'Nancy');
--������ ��������- ���� ����� �������Դϴ�.
--���Ǵ� �����ڰ� �ٸ��ϴ�.
--IN -����� ���� ������ Ȯ��/ ANY,SOME- ������ �������� ���� �� �ؼ� �ϳ��� �����ϸ� ���� //ALL - ��� ���� ���ؼ� ��δ� �����ؾ���

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



