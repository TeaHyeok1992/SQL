SET SERVEROUTPUT on;

DECLARE
    a2 NUMBER(10):=2;
    a1 NUMBER(10):=1;
BEGIN

while a2<=9
    Loop
    dbms_output.put_line(a2||'단');
        a1:=1;
        while a1<=9
        
        Loop
            dbms_output.put_line(a2||'X'||a1||'='|| a1*a2);
            a1:=a1+1;

   
        END loop;

        a2:=a2+1;
    
    END Loop;
    
END;

DECLARE
    N1 NUMBER :=TRUNC(dbms_random.value(1,13)*10);
    SALARY NUMBER;
BEGIN
    SELECT SALARY
    INTO SALARY
    FROM employees where department_id=N1 AND ROWNUM=1;
    
    
    
    
        IF SALARY >9000 THEN
            dbms_output.put_line('높음');
        ELSIF SALARY >=5000 THEN
            dbms_output.put_line('중간');
        ELSE
            dbms_output.put_line('낮음');
        END IF;    
   
    
    
    
    
    


END;



CREATE TABLE COURSE(
    C_NUM NUMBER(10)NOT NULL,
    C_SUB VARCHAR2 (20),
    C_CON VARCHAR2 (20),
    C_ID NUMBER (10)    
);

CREATE SEQUENCE COURSE_SEQ
    Start with 1
    Increment by 1
    MAXVALUE 101
    NOCACHE
    NOCYCLE;
    
    
DECLARE
    a_ID NUMBER ;
BEGIN
    select C_ID
    INTO a_ID
    from course;
    
    while a_ID>=100
    LOOP
    INSERT INTO COURSE(C_NUM)
    VALUES(COURSE_SEQ.NEXTVAL);
    a_ID:=a_ID+1;
    END LOOP;
END;


DECLARE
    dp_ID NUMBER(10);
    dp_SALSUM NUMBER(10);
    CURSOR curse is select DEPARTMENT_ID, SUM(SALARY) FROM employees GROUP BY Department_ID;

BEGIN
    OPEN curse;
    LOOP
        Fetch curse into dp_ID,dp_SALSUM;
        EXIT WHEN CUrse%notfound;
        dbms_output.put_line(dp_ID||' :'||dp_SALSUM);
    END LOOP;
    CLOSE curse;
END;


SELECT TO_CHAR(HIRE_DATE,'YYYY'),SUM(SALARY)FROM employees GROUP BY TO_CHAR(HIRE_DATE,'YYYY');


DECLARE
    YRR VARCHAR2 (50);
    salary NUMBER;
    CURSOR cus is select TO_CHAR(HIRE_DATE,'YYYY')AS a1,SUM(SALARY)AS a2 FROM employees GROUP BY TO_CHAR(HIRE_DATE,'YYYY');
BEGIN
    for i in cus 
    LOOP
        dbms_output.put_line(i.a1);
         dbms_output.put_line(i.b1);
    END LOOP;
END;
    
    