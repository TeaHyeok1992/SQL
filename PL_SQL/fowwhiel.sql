--�ݺ��� WHILE
--��������
-- LOOP~ END LOOP ������ �����

DECLARE

    cnt number :=1;
    
BEGIN
    WHILE cnt<=9
    LOOP
        dbms_output.put_line(3*cnt);
        
        cnt := cnt+1;
    END LOOP;
END;


--�ݺ��� FOR

DECLARE
    CNT2 NUMBER:=3;
    
BEGIN
for i IN 1..9
LOOP
    dbms_output.put_line(CNT2*i);
END LOOP;
END;

--Ż�⹮ EXIT WHEN ���� // CONTINUE WHEN ����

DECLARE

    cnt number :=1;
    
BEGIN
    WHILE cnt<=9
    LOOP
        dbms_output.put_line(cnt);
        EXIT WHEN CNT=5;
        dbms_output.put_line(cnt||'�� 5�� Ż��');
        cnt := cnt+1;
    END LOOP;
END; 
