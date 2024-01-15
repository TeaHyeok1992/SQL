SET SERVEROUTPUT on;





    
DECLARE
    GOO31 NUMBER:=3;
    GOO32 NUMBER:= GOO31 * 2;
    GOO33 NUMBER:= GOO31 * 3;
    GOO34 NUMBER:= GOO31 * 4;
    GOO35 NUMBER:= GOO31 * 5;
    GOO36 NUMBER:= GOO31 * 6;
    GOO37 NUMBER:= GOO31 * 7;
    GOO38 NUMBER:= GOO31 * 8;
    GOO39 NUMBER:= GOO31 * 9;  
    
BEGIN
    dbms_output.put_line(GOO31);
    dbms_output.put_line(GOO32);
    dbms_output.put_line(GOO33);
    dbms_output.put_line(GOO34);
    dbms_output.put_line(GOO35);
    dbms_output.put_line(GOO36);
    dbms_output.put_line(GOO37);
    dbms_output.put_line(GOO38);
    dbms_output.put_line(GOO39);

END;



DECLARE
    EMP_NAME employees.First_NAME%TYPE;
    EMP_EMAIL employees.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME, EMAIL
    INTO EMP_NAME, EMP_EMAIL
    FROM employees
    where Employee_ID =201;
    
    dbms_output.put_line(EMP_NAME||'/////'||EMP_EMAIL);
END;


DECLARE
    EMP_MAX emps.Employee_ID%type;
    
BEGIN
SELECT MAX(EMPLOYEE_ID)
INTO EMP_MAX
FROM employees
where employee_id is not null;

INSERT INTO EMPS(emps.EMPLOYEE_ID,emps.LAST_NAME,emps.EMAIL,emps.HIRE_DATE,emps.JOB_ID)
VALUES(EMP_MAX+1,'Steven','Stevenjobs',SYSDATE,'CEO');

dbms_output.put_line(EMP_MAX);


END;


