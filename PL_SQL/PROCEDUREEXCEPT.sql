--RETURN/// EXCEPTION WHEN OTHER THEN(���������)
-- RETURN���� PROCEDURE�� ���Ḧ ������
-- EXCEPTION WHEN OTHER THEN �� ����ó���������ν� �� �������� ���ϴ�.

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
     RETURN;--����
     
    ELSE
        SELECT SUM(MAX_SALARY)
        INTO SA_RES
        from jobs
        where job_ID like '%'||PJOBID||'%';
        dbms_output.put_line(SA_RES);
    END IF;
     dbms_output.put_line('CONTROL TERMINATED');
    EXCEPTION WHEN OTHERS THEN-- ��Ÿ�ӿ��� �߻��� ����ó���� ����
        dbms_output.put_line('Warning , Hostile Neutralized');
   
END;    