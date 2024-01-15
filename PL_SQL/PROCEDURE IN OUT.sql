set serveroutput on;
--PROCEDURE�� OUT�Ű�����
--�޼��忡���� RETURN���� ����ϴ� �Ű�����
-- OUT�Ű����� ���޿��� �ݵ�� DECLARE�������� ����մϴ�.
CREATE OR REPLACE PROCEDURE NEW_joB_PROC
(P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE IN JOBS.JOB_TITLE%type, 
P_MAX_SALARY IN JOBS.MAX_SALARY%type:=1000,
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE:=0,
P_RESULT OUT NUMBER--OUT�Ű�����
)
is
    Cnt NUMBER :=0; 
begin
    SELECT Count(*)
    INTO CNT
    FROM JOBS
    where JOB_ID = P_JOB_ID;
    
    IF cnt=0 then
        Insert INTO JOBS VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,p_MAx_SALARY);--�������� ������ INSERT
        P_RESULT :=0;
    else
        UPDATE JOBS SET JOB_TITLE=P_JOB_TITLE,--�����ϸ� UPDATE
                        MIN_SALARY=P_MIN_SALARY,
                        MAX_SALARY=P_MAX_SALARY
        where JOB_ID=P_JOB_ID;
        P_RESULT:=cnt;--�ƿ������� ���� ����
    END IF;    
END;

DECLARE
    P_RESULT NUMBER;
BEGIN
    NEW_JOB_PROC('A','B',1000,10000,P_RESUSLT);--�Ű������� 5�� //out�Ű����� ����
    dbms_output.put_line(P_RESULT);
END;
--------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE TEST_PROC
    (Var1 IN VARCHAR2,
     Var2 OUT VARCHAR2,
     var3 IN OUT VARCHAR2)--IN/OUT�� �Ѵ� ������ �Ű�����
is
begin
    dbms_output.put_line(Var1);
    dbms_output.put_line(Var2);--OUT�� �Ű����� ������ �ȵ˴ϴ�. ������ ��¸� ����
    dbms_output.put_line(Var3);
    --var1 :='Teleport';--IN�Ű������� ���� ������ �Ұ����մϴ�.
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