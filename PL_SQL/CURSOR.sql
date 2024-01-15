set serveroutput on;
--CURSOR
--반환되는 행이 여러개이기 때문에 일반적으로 처리가 불가능할때 사용합니다.
DECLARE
    NAMEE VARCHAR2(300);
    SALARY NUMBER;
    CURSOR curse is SELECT FIRST_NAME,salary from employees where job_ID='IT_PROG';--커서 선언
BEGIN
    OPEN CUrse;--커서 열림 
    LOOP
        fetch curse into Namee,salary;
        EXIT WHEN CURSE%notfound;--읽을게 없으면 빠져나옴
        dbms_output.put_line(namee);
    END LOOP;
    CLOSE curse;--커서 닫힘
END;