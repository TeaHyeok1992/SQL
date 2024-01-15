--RETURN/// EXCEPTION WHEN OTHER THEN(실행오류만)
-- RETURN사용시 PROCEDURE의 종료를 선언함
-- EXCEPTION WHEN OTHER THEN 은 예외처리구문으로써 맨 마지막에 씁니다.

CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
(PJOBID IN JOBS.job_ID%type)

IS
 CNT NUMBER :=0;
 SA_RES NUMBER :=0;
BEGIN
    SELECT COUNT(*)
    INTO CNT
    FROM JOBS
    WHERE JOB_ID like '%'||PJOBID||'%';
    
    IF CNT=0 THEN
     RETURN;--종료
     
    ELSE
        SELECT SUM(MAX_SALARY)
        INTO SA_RES
        from jobs
        where job_ID like '%'||PJOBID||'%';
        dbms_output.put_line(SA_RES);
    END IF;
     dbms_output.put_line('CONTROL TERMINATED');
    EXCEPTION WHEN OTHERS THEN-- 런타임에러 발생시 예외처리할 구문
        dbms_output.put_line('Warning , Hostile Neutralized');
   
END;    