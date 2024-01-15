--PROCEDURE
--SQL처리과정을 집합처럼 묶어서 사용하는 구조
--선언문
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
IS --지역변수 선언

BEGIN
--실행구문
    dbms_output.put_line('Hello world');
END;

--실행문

EXEC NEW_JOB_PROC;--호출시 매개변수 일치 이루어져야함


--프로시저의 매개변수 IN
--프로시저이름을 똑같이 만들경우 덮어쓰기가 됩니다.

CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000, --디폴트 매개변수
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0)
is
begin
    INSERT INTO JOBS_IT VALUES(P_JOB_ID,P_JOB_title,p_max_salary,p_min_salary);
end;

EXEC NEW_JOB_PROC('SS','TT',10000,100000);


------------------------------------------------------------------------------------------------
--프로시저에서는 PL/SQL에서 사용한 모든 문법사용이 가능합니다.
CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000, --디폴트 매개변수
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0)
is
    Cnt NUMBER :=0; --지역변수 선언
begin
    SELECT Count(*)
    INTO CNT
    FROM JOBS
    where JOB_ID = P_JOB_ID;
    
    IF cnt=0 then
        Insert INTO JOBS VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,p_MAx_SALARY);--존재하지 않으면 INSERT
    else
        UPDATE JOBS SET JOB_TITLE=P_JOB_TITLE,--존재하면 UPDATE
                        MIN_SALARY=P_MIN_SALARY,
                        MAX_SALARY=P_MAX_SALARY
        where JOB_ID=P_JOB_ID;
    END IF;    
END;


EXEC NEW_JOB_PROC('A','B',1000,5000);