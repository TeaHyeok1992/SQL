--Scalar ��������- select���忡 column���� �� ��������
--JOIN���� ���� ������� ������ �ٿ��ټ� �ִ�.
--JOIN�ؼ� �� �Ѱ��� ���� �������� ��쿡�� ����� �����մϴ�.
--�������� �������� ��� JOIN�� �� �����ϴ�.
--���� ������ where�� JOIN�� ON���� ���� ���� ����.
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