SET SERVEROUTPUT ON; --출력문 사용구문

DECLARE
    V_NUM NUMBER;--변수선언
    V_NUM2 NUMBER := 2**4;

BEGIN
    V_NUM := 30; --변수에 정수 30을 대입
    
    dbms_output.put_line('변수값: '||V_NUM);
    dbms_output.put_line('변숫값: '||V_NUM2);
    
END;    

------------------------------------------------------------------------

DECLARE
    EMP_NAME VARCHAR2(30);
    EMP_SALARY NUMBER;
    EMP_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;--반영할 테이블의 column의 타입을 그대로 사용함
    
BEGIN
    SELECT FIRST_NAME,SALARY,LAST_NAME
    INTO EMP_NAME, EMP_SALARY, EMP_LAST_NAME--변수에 대입
    FROM employees
    where employee_id=100;

    dbms_output.put_line(EMP_NAME);
    dbms_output.put_line(EMP_SALARY);
    dbms_output.put_line(EMP_LAST_NAME);
END;    


--년도별 사원의 급여 합을 구해서 새로운 테이블에 INSERT

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
    dbms_output.put_line('정상처리완료'|| EMP_SUM);
END;


SELECT * FROM EMP_SALL;
