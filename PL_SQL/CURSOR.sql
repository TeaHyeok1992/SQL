set serveroutput on;
--CURSOR
--��ȯ�Ǵ� ���� �������̱� ������ �Ϲ������� ó���� �Ұ����Ҷ� ����մϴ�.
DECLARE
    NAMEE VARCHAR2(300);
    SALARY NUMBER;
    CURSOR curse is SELECT FIRST_NAME,salary from employees where job_ID='IT_PROG';--Ŀ�� ����
BEGIN
    OPEN CUrse;--Ŀ�� ���� 
    LOOP
        fetch curse into Namee,salary;
        EXIT WHEN CURSE%notfound;--������ ������ ��������
        dbms_output.put_line(namee);
    END LOOP;
    CLOSE curse;--Ŀ�� ����
END;