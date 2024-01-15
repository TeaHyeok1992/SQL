--조건문 IF
SET SERVEROUTPUT on;
--iF~THEN
--ELSIF~THEN
--ELSE~
--END IF
DECLARE
    num  NUMBER := trunc(dbms_random.value(1, 11));
    num2 NUMBER := 5;
BEGIN
    dbms_output.put_line(num);
    IF num >= num2 THEN
        dbms_output.put_line(num || '이 큰수');
    ELSE
        dbms_output.put_line(num || '이작은수');
    END IF;

END;

DECLARE
    ran NUMBER := trunc(dbms_random.value(1, 101));
BEGIN
    IF ran >= 90 THEN
        dbms_output.put_line('A');
    ELSIF ran >= 80 THEN
        dbms_output.put_line('B');
    ELSIF ran >= 70 THEN
        dbms_output.put_line('C');
    ELSE
        dbms_output.put_line('D');
    END IF;
END;

--조건문 SWITCH
--CASE WHEN 조건 THEN
--WHEN 조건 THEN
--ELSE-END CASE


DECLARE RAN_N number:= TRUNC(dbms_random.value(1,100));
CASE WHEN RAN_N >=90 then dbms_output.put_line('A');
WHEN RAN_N>=80 then dbms_output.put_line('B');
when ran_n>=70 then dbms_output.put_line('c');
else dbms_output.put_line('D');
END CASE;
end;