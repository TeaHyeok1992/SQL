--반복문 WHILE
--변수선언
-- LOOP~ END LOOP 구문을 사용함

DECLARE

    cnt number :=1;
    
BEGIN
    WHILE cnt<=9
    LOOP
        dbms_output.put_line(3*cnt);
        
        cnt := cnt+1;
    END LOOP;
END;


--반복문 FOR

DECLARE
    CNT2 NUMBER:=3;
    
BEGIN
for i IN 1..9
LOOP
    dbms_output.put_line(CNT2*i);
END LOOP;
END;

--탈출문 EXIT WHEN 조건 // CONTINUE WHEN 조건

DECLARE

    cnt number :=1;
    
BEGIN
    WHILE cnt<=9
    LOOP
        dbms_output.put_line(cnt);
        EXIT WHEN CNT=5;
        dbms_output.put_line(cnt||'가 5면 탈출');
        cnt := cnt+1;
    END LOOP;
END; 
