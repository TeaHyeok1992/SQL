--���� ������

--UNION ������(�ߺ� ����)/ UnionALL �ߺ��ִ� ������
SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
UNION--���� ������ ��Ȯ�� ��ġ�ؾ� �մϴ�.-- ���� Ÿ�Ե� ���Ʒ��� ��Ȯ�� ��ġ�ؾ��մϴ�.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
UNION ALL--���� ������ ��Ȯ�� ��ġ�ؾ� �մϴ�.-- ���� Ÿ�Ե� ���Ʒ��� ��Ȯ�� ��ġ�ؾ��մϴ�.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

--a. unionALL�� ���� ���̺� ������ ����� �����մϴ�.

SELECT 200, 'HONGMAN' FROM DUAL
UNION ALL
SELECT 400, 'DONGMAN' FROM DUAL
UNION ALL
SELECT 300, 'TONGMAN' FROM DUAL ;


--�м��Լ�
--RANK() ����� �����ִ� �Լ� - �ߺ��� ����մϴ� ex) 1,2,2,2,5,6,7...
--DENSE_RANK() ����� �����ִ� �Լ� - �ߺ��� ������� �ʽ��ϴ�. ex)1,2,2,2,3,4,5,6,7.....
--ROW_NUMBER() ���� ��ȣ�� ���ϴ� �Լ�
-- �Լ� OVER (���� ����[�������� order by]) Alias;

SELECT EMPLOYEE_ID , DEPARTMENT_ID, SALARY,
        RANK()Over (order by SALARY desc) AS Sal_rn,--�ߺ��� ����ϱ� ������ 1,2,2,4,5,6,7,7,9....
        DENSE_RANK() over(order by salary desc) AS sal_dr,--�ߺ��� ������� ���� 1,2,2,3,4,5,6,6.....
        ROW_Number() over(order by salary desc) AS sal_rnn -- ���ȣ
        FROM employees order by sal_rn;
 
SELECT rownum,CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME)AS NAME , NVL(DEPARTMENT_ID,0)AS DEPM, SALARY*NVL2(COMMISSION_PCT,1.5,1) AS SALARY,
            RANK() OVER (order by SALARY desc) AS sal_r,
            DENSE_RANK()over(Order by salary desc) as sal_dr,
            ROW_number()OVer(order by salary desc) as sal_rn-- rownum�� order by �ٿ����Ŷ� ����˴ϴ�.
            FROM employees order by sal_r;














-- INTERSECT - ������ // MINUS - ������
SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
INTERSECT--���� ������ ��Ȯ�� ��ġ�ؾ� �մϴ�.-- ���� Ÿ�Ե� ���Ʒ��� ��Ȯ�� ��ġ�ؾ��մϴ�.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
MINUS--���� ������ ��Ȯ�� ��ġ�ؾ� �մϴ�.-- ���� Ÿ�Ե� ���Ʒ��� ��Ȯ�� ��ġ�ؾ��մϴ�.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;
