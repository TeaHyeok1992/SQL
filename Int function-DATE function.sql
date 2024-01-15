--숫자 함수

SELECT
    round(45.2789415, 3),
    round(233.23213313, 6)
FROM
    dual;

SELECT
    trunc(45.24988844, 3)
FROM
    dual;

SELECT
    abs(- 4),
    ceil(3.14159),
    floor(3.14159),
    power(2, 3),
    mod(7, 3)
FROM
    dual;


--날짜 함수

SELECT
    sysdate,
    systimestamp
FROM
    dual;

--날짜 연산

SELECT
    first_name,
    trunc((sysdate - hire_date) / 7, 0) AS weeks
FROM
    employees
WHERE
    department_id = 60;

SELECT
    concat(concat(first_name, ' '),
           last_name)                     AS name,
    trunc((sysdate - hire_date) / 365, 0) AS years
FROM
    employees
ORDER BY
    years ASC;

SELECT
    rpad(concat(concat(first_name, ' '),
                last_name),
         20,
         '*')                       AS name,
    trunc((sysdate - hire_date), 0) AS days
FROM
    employees
ORDER BY
    days ASC;
        
--날짜 반올림        
SELECT
    concat(concat(first_name, ' '),
           last_name),
    round(sysdate - hire_date)
FROM
    employees;

SELECT
    round(sysdate, 'Month')
FROM
    dual;

SELECT
    round(sysdate, 'Year')
FROM
    dual;

SELECT
    trunc(sysdate, 'Month')
FROM
    dual;

SELECT
    trunc(sysdate, 'year')
FROM
    dual;