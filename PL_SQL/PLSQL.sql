SET SERVEROUTPUT ON; --��¹� ��뱸��

DECLARE
    V_NUM NUMBER;--��������
    V_NUM2 NUMBER := 2**4;

BEGIN
    V_NUM := 30; --������ ���� 30�� ����
    
    dbms_output.put_line('������: '||V_NUM);
    dbms_output.put_line('������: '||V_NUM2);
    
END;    

------------------------------------------------------------------------

DECLARE
    EMP_NAME VARCHAR2(30);
    EMP_SALARY NUMBER;
    EMP_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;--�ݿ��� ���̺��� column�� Ÿ���� �״�� �����
    
BEGIN
    SELECT FIRST_NAME,SALARY,LAST_NAME
    INTO EMP_NAME, EMP_SALARY, EMP_LAST_NAME--������ ����
    FROM employees
    where employee_id=100;

    dbms_output.put_line(EMP_NAME);
    dbms_output.put_line(EMP_SALARY);
    dbms_output.put_line(EMP_LAST_NAME);
END;    


--�⵵�� ����� �޿� ���� ���ؼ� ���ο� ���̺� INSERT

CREATE TABLE EMP_SALL(
    EMP_YEARS VARCHAR(30),
    EMP_SALARY NUMBER(10)
);

SELECT SUM(SALARY)FROM employees where TO_CHAR(HIRE_DATE,'YYYY')=2008;

DECLARE
    EMP_SUM EMP_SALL.EMP_SALARY%TYPE;
    EMP_YEARS EMP_SALL.EMP_YEARS%TYPE := 2008;
BEGIN
    SELECT SUM(SALARY)
    INTO EMP_SUM 
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE,'YYYY')= EMP_YEARS;
    
    INSERT INTO EMP_SALL VALUES(EMP_YEARS,EMP_SUM);
    COMMIT;
    dbms_output.put_line('����ó���Ϸ�'|| EMP_SUM);
END;


SELECT * FROM EMP_SALL;
