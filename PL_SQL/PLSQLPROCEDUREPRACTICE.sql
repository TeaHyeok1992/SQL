SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE gugu_proc (
    p_num NUMBER
) IS
BEGIN
    FOR i IN 1..9 LOOP
        dbms_output.put_line(p_num
                             || ' x '
                             || i
                             || ' = '
                             || p_num * i);
    END LOOP;
END;

DECLARE BEGIN
    gugu_proc(5);
END;   

--------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE emp_year_proc (
    p_emp_id IN employees.employee_id%TYPE
) IS
    cnt   NUMBER := 0;
    years NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO cnt
    FROM
        employees
    WHERE
        employee_id = p_emp_id;

    IF cnt = 0 THEN
        dbms_output.put_line('NOT EXISTED');
    ELSE
        SELECT
            trunc((sysdate - hire_date) / 365)
        INTO years
        FROM
            employees
        WHERE
            employee_id = p_emp_id;

        dbms_output.put_line(years);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Waring, something wrong with process');
END;

CREATE OR REPLACE PROCEDURE dept_proc (
    p_dept_department_id   IN dept.department_id%TYPE,
    p_dept_department_name IN dept.department_name%TYPE,
    p_flag                 IN VARCHAR2
) IS
BEGIN
    IF p_flag = 'I' THEN
        INSERT INTO dept (
            department_id,
            department_name
        ) VALUES (
            p_dept_department_id,
            p_dept_department_name
        );

    ELSIF p_flag = 'U' THEN
        UPDATE dept
        SET
            dept.department_name = p_dept_department_name
        WHERE
            department_id = p_dept_department_id;

    ELSIF p_flag = 'D' THEN
        DELETE FROM dept
        WHERE
            dept.department_id = p_dept_department_id;

    ELSE
        dbms_output.put_line('Wrong');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;

CREATE OR REPLACE PROCEDURE emp_age_proc (
    p_num IN employees.employee_id%TYPE,
    p_res OUT VARCHAR2
) IS
    cnt NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO cnt
    FROM
        employees
    WHERE
        employees.employee_id = p_num;

    IF cnt = 0 THEN
        dbms_output.put_line('');
    ELSE
        DECLARE
            p_res VARCHAR2(30);
        BEGIN
            SELECT
                ( to_char(sysdate - hire_date, 'YYYY')
                  || '³â' )
            INTO p_res
            FROM
                employees
            WHERE
                employee_id = p_num;

        END;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Nothing Special');
END;

CREATE OR REPLACE PROCEDURE emp_merge_proc (
    p_employee_id IN emps.employee_id%TYPE,
    p_last_name   IN emps.last_name%TYPE,
    p_email       IN emps.email%TYPE,
    p_hire_date   IN emps.hire_date%TYPE,
    p_job_id      IN emps.job_id%TYPE
) IS
BEGIN
    MERGE INTO emps a
    USING (
        SELECT
            emp_merge_proc
        FROM
            emps
    ) ON ( a.employee_id = p_employee_id )
    WHEN MATCHED THEN UPDATE
    SET a.last_name = p_last_name,
        a.email = p_email,
        a.hire_date = p_hire_date,
        a.job_id = p_job_id
    WHEN NOT MATCHED THEN
    INSERT (
        employee_id,
        last_name,
        email,
        hire_date,
        job_id )
    VALUES
        ( p_employee_id,
          p_last_name,
          p_email,
          p_hire_date,
          p_job_id );

END;



CREATE TABLE sales (
    to_day     DATE,
    total_cost NUMBER(10)
);

ALTER TABLE SALES
MODIFY TO_DAY DATE DEFAULT SYSDATE;

INSERT INTO sales (
    to_day,
    total_cost
) VALUES (
    sysdate,
    17000
);

CREATE TABLE day_of_sales (
    total_sum NUMBER(10)
);

CREATE OR REPLACE PROCEDURE sales_proc (
    p_typed IN VARCHAR2
) IS
    p_total NUMBER;
    p_cnt   NUMBER;
BEGIN
    IF p_typed = '¸¶°¨' THEN
        SELECT
            SUM(total_cost)
        INTO p_total
        FROM
            sales
        WHERE
            TO_CHAR(TO_DAY,'YYYY-MM_DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');

        SELECT
            COUNT(*)
        INTO p_cnt
        FROM
            day_of_sales
        WHERE
            total_sum IS NOT NULL;

        IF p_cnt = 0 THEN
            INSERT INTO day_of_sales VALUES ( p_total );

        ELSE
            UPDATE day_of_sales
            SET
                total_sum = p_total;

        END IF;

    END IF;
END;