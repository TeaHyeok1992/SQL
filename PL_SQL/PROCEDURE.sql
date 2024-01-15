--PROCEDURE
--SQLó�������� ����ó�� ��� ����ϴ� ����
--����
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
IS --�������� ����

BEGIN
--���౸��
    dbms_output.put_line('Hello world');
END;

--���๮

EXEC NEW_JOB_PROC;--ȣ��� �Ű����� ��ġ �̷��������


--���ν����� �Ű����� IN
--���ν����̸��� �Ȱ��� ������ ����Ⱑ �˴ϴ�.

CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000, --����Ʈ �Ű�����
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0)
is
begin
    INSERT INTO JOBS_IT VALUES(P_JOB_ID,P_JOB_title,p_max_salary,p_min_salary);
end;

EXEC NEW_JOB_PROC('SS','TT',10000,100000);


------------------------------------------------------------------------------------------------
--���ν��������� PL/SQL���� ����� ��� ��������� �����մϴ�.
CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000, --����Ʈ �Ű�����
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0)
is
    Cnt NUMBER :=0; --�������� ����
begin
    SELECT Count(*)
    INTO CNT
    FROM JOBS
    where JOB_ID = P_JOB_ID;
    
    IF cnt=0 then
        Insert INTO JOBS VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,p_MAx_SALARY);--�������� ������ INSERT
    else
        UPDATE JOBS SET JOB_TITLE=P_JOB_TITLE,--�����ϸ� UPDATE
                        MIN_SALARY=P_MIN_SALARY,
                        MAX_SALARY=P_MAX_SALARY
        where JOB_ID=P_JOB_ID;
    END IF;    
END;


EXEC NEW_JOB_PROC('A','B',1000,5000);