--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT employee_id , First_name ||' '||Last_name AS Name, HIre_date ,salary from employees; 
--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
--3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT * FROM employees where department_id=50;
--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name , DEpartment_ID, JOB_ID from employees where Department_ID=50;
--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name ,salary, salary+300 from employees;
--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name, salary from employees where salary>=10000;
--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name, JOB_ID, commission_pct from employees where commission_pct is not null;
--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
SELECT First_name ||' '||Last_name AS Name, hire_date , salary from employees where hire_date between '03/01/01' and '03/12/31';
--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT First_name ||' '||Last_name AS Name, hire_date , salary from employees where hire_date like '03/__/__';
--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���
SELECT First_name ||' '||Last_name AS Name, salary from employees order by salary desc;
--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
SELECT First_name ||' '||Last_name AS Name, salary from employees where department_id=60 order by salary desc;
--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name, JOB_ID from employees where job_id='IT_PROG' OR job_ID='SA_MAN';
--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT First_name ||' '||Last_name||'`s salary is '|| salary ||'$' from employees where First_name ='Steven' and Last_name='King';
--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
SELECT First_name ||' '||Last_name AS Name, JOB_ID from employees where job_ID like '%MAN%';
--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
SELECT First_name ||' '||Last_name AS Name, JOB_ID from employees where job_ID like '%MAN%' order by job_ID asc;
--? ���ѽð� : 30��
--? EMPLOYEES ���̺� �����͸� ����ؾ� �մϴ�.

