set serveroutput on;
--PROCEDURE의 OUT매개변수
--메서드에서의 RETURN값을 대신하는 매개변수
-- OUT매개변수 전달에는 반드시 DECLARE구문에서 사용합니다.
CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000,
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0,
P_RESULT OUT NUMBER--OUT매개변수
)
is
    Cnt NUMBER :=0; 
begin
    SELECT Count(*)
    INTO CNT
    FROM JOBS
    where JOB_ID = P_JOB_ID;
    
    IF cnt=0 then
        Insert INTO JOBS VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,p_MAx_SALARY);--존재하지 않으면 INSERT
        P_RESULT :=0;
    else
        UPDATE JOBS SET JOB_TITLE=P_JOB_TITLE,--존재하면 UPDATE
                        MIN_SALARY=P_MIN_SALARY,
                        MAX_SALARY=P_MAX_SALARY
        where JOB_ID=P_JOB_ID;
        P_RESULT:=cnt;--아웃변수에 값을 대입
    END IF;    
END;

DECLARE
    P_RESULT NUMBER;
BEGIN
    NEW_JOB_PROC('A','B',1000,10000,P_RESUSLT);--매개변수가 5개 //out매개변수 포함
    dbms_output.put_line(P_RESULT);
END;
--------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE TEST_PROC
    (Var1 IN VARCHAR2,
     Var2 OUT VARCHAR2,
     var3 IN OUT VARCHAR2)--IN/OUT이 둘다 가능한 매개변수
is
begin
    dbms_output.put_line(Var1);
    dbms_output.put_line(Var2);--OUT은 매개변수 전달이 안됩니다. 밖으로 출력만 가능
    dbms_output.put_line(Var3);
    --var1 :='Teleport';--IN매개변수는 값의 변경이 불가능합니다.
    var2 :='Successful';
    var3 :='Phoenix';
end;

DECLARE
    A1 VARCHAR2(30);
    A2 VARCHAR2(30);
    A3 VARCHAR2(30);
BEGIN
    TEST_PROC(A1,A2,A3);
    dbms_output.put_line(A1);
    dbms_output.put_line(A2);
    dbms_output.put_line(A3);
    
END;