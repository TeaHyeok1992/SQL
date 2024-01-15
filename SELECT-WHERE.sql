-- �ּ�ó�� ����
/*
    ������ �ּ�
*/

SELECT * From employees;-- employees�� ��� column�� ��ȸ
SELECT * FROM departments;
SELECT * FROM jobs;
-- Ư���÷��� �����ϱ�
SELECT Employee_ID, FIRSt_name , EMAIL From employees;
-- Ÿ�� ����, ����, ��¥
SELECT Hire_DAte , Last_Name, Employee_ID FROM employees;
-- ��¥�� ���ڿ��� ������, ���ڿ��� �����ĵǾ��ִ�.

--���ڿ��� column������ �����ϴ�
SELECT salary, salary*1.1 from employees;
SELECT salary*1.1 AS sallar from employees;
--NULL�� ����հų� �����Ҽ� ���ų� ������ �Ұ����ϴٴ� ���Դϴ�.
SELECT commission_PCT, DEPARTMENT_ID from employees;--DEPARTMENT ID �� Foreign KEY.
--���� �̸����� AS
SELECT salary AS salary_Aniversal from employees;

--���ڿ��� �߰��Ҷ� || �� ����մϴ� ���ڿ� ǥ�⿡�� '��' �̷������� ǥ���մϴ�.
SELECT First_name , Last_name , salary from employees;
SELECT first_name || ' ' || last_name || '''s salary is $' || salary AS "EMPLOYEE DEtails" from employees;
select 'like this' from employees;
SELECT * From employees;

-- Column Alias>> column�� ����
SELECT First_name || ' '|| Last_name || Salary as "em" from employees;

--Ű���� DISTINCT �ߺ��� �� ����
SELECT distinct DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM employees;--������������ �ߺ��� ����
--rownum/ rowID
--rowID : �����ͺ��̽����� ���� �ּ�
--rowNum: ��ȸ�� �������  ���� ��ȣ�� ������ݴϴ�.- �������� ������ ���Ҷ� �����ϰ� ����Ѵ�.
SELECT rowid,rownum,FIRST_NAME from employees;
SELECT ROWID, ROWNUM , FIrst_NAMe, LAST_NAME FROM EMPLOYEES;

--WHERE ���� ������, ���ڿ��� ������ �Է��Ͽ� �ش簪�� �ش��ϴ� column�� �����س��ϴ�.
--<> �����ʴ�
--where ������ ���ڿ��� ��¥�� Ȭ����ǥ�� �����־�� �մϴ�.
SELECT FIRST_NAME , LAST_NAME from employees where salary between 10000 and 12000;
-- Firstname lastname ���� salary���� �������� 10000~12000������ ���� ����

SELECT FIRST_NAME,LAST_NAME ,JOB_ID FROM employees where JOB_ID='IT_PROG';

SELECT FIRST_NAME ,LAST_NAME ,JOB_ID FROM EMPLOYEES WHERE salary between 12000 and 15000;
SELECT * from EMPLOYEES where DEPARTMENT_ID !=100;
SELECT*FROM EMPLOYEES where HIRE_Date ='03/06/17';
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEES WHERE salary between 10000 and 13000;
SELECT FIRST_NAME ,LAST_NAME, JOB_ID,EMAIL from employees where salary between 8000 and 12000;
SELECT FIRST_NAME,LAST_NAME,JOB_ID, EMAIL,salary from EMPLOYEES where HIRE_DATE between '03/03/01' and '08/03/01';
SELECT*FROM EMPLOYEES where HIRE_DATE <= '04/01/01';

--IN ������(�������� �Ѱ��� ���ԵȰ��� �����)
SELECT*FROM EMPLOYEES WHERE JOB_ID in('IT_PROG','FI_MGR','AD_VP');
SELECT*FROM EMPLOYEES WHERE DEPARTMENT_ID IN(80,90,100);
--like ������
SELECT * FROM EMPLOYEES WHERE HIRE_DATE like '03%';--03���� �����ϴ� ��簪
select * from employees where hire_date like '%03';--01�� ������ ��簪
select*from employees where hire_date like '%05%';--05���Ե� ��� ��


SELECT *FROM EMPLOYEES WHERE HIRE_DATE like '___05%';
SELECT* FROM employees where EMAIL like '_A%';--EMAILù���ڰ� �����ϰ� �������ڿ� A�� ������ ��� ��


--IS NULL/ IS NOT NULL Ű����

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
