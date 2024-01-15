--NVL FUCTIONs
-- NULL값을 변환해서 다른 변수로 나타내줍니다.
--NVL(a,b)--NVL(a,b)

--a- null인지 아닌지 판별할 값

--b- a가 null일 경우 바꿔줄 값
SELECT
    nvl(NULL, 0)
FROM
    dual;

SELECT
    nvl(1, 2)
FROM
    dual;--null이 아닐경우 그대로 나왓다.
SELECT
    first_name,
    nvl(commission_pct, 0)
FROM
    employees;

SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees;

SELECT
    NULL * 3000 + 1000
FROM
    dual;-- NULL
SELECT
    first_name,
    salary,
    nvl(commission_pct, 0),
    salary * commission_pct
FROM
    employees;


--NVL2(a,b,c)
--a Target
--b if Target!= null 
--c if Target== null
SELECT
    nvl2(2, 1, 3)
FROM
    dual;

SELECT
    nvl2(NULL, 1, 2)
FROM
    dual;

SELECT
    nvl2(commission_pct, 'F', 'T')
FROM
    employees;

SELECT
    first_name,
    nvl2(commission_pct, salary +(salary * commission_pct), salary)
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    first_name
    || ' '
    || last_name                                                    AS name,
    nvl2(commission_pct, salary +(salary * commission_pct), salary) AS salary
FROM
    employees
ORDER BY
    salary DESC;
    
--DECODE 함수    

SELECT
    decode(1, 1, 1, 0)
FROM
    dual;

SELECT
    decode(1, 1, 1, 2, 2,
           3, 3, 4, 4, 5,
           5, - 1)
FROM
    dual;

SELECT
    first_name,
    decode(job_id, 'IT_PROG', salary * 1.1, 'AD_VP', salary * 1.2,
           'AD_PRES', salary * 1.34, 'PU_CLERK', salary * 1.05, salary) AS salary
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    first_name,
    decode(department_id, '50', salary * 1.1, '60', salary * 1.2,
           '80', salary * 1.3, '100', salary * 1.4, salary) AS salary
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    concat(first_name, last_name) AS name,
    department_id,
    CASE department_id
        WHEN 60  THEN
            salary * 1.2
        WHEN 80  THEN
            salary * 1.1
        WHEN 100 THEN
            salary * 1.05
        WHEN 50  THEN
            salary * 1.3
        WHEN 30  THEN
            salary * 1.4
        WHEN 10  THEN
            salary * 1.5
        WHEN 110 THEN
            salary * 1.35
        WHEN 90  THEN
            salary * 1.05
        ELSE
            salary
    END                           AS salary
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    first_name,
    CASE
        WHEN job_id = 'AD_VP'   THEN
            salary * 1.1
        WHEN job_id = 'IT_PROG' THEN
            salary * 1.2
        WHEN job_id = 'FIMGR'   THEN
            salary * 1.3
        ELSE
            salary
    END AS payments
FROM
    employees;
                        
-- COALESCE(a,b,c,c..........)NULL이 아닌 첫번째 값을 반환
SELECT
    coalesce(NULL, 3, 2, 3, NULL,
             4, 5, 6, 9)
FROM
    dual;

SELECT
    employee_id                        AS 사원번호,
    concat(concat(first_name, ' '),
           last_name)                  AS 사원명,
    hire_date                          AS 입사일자,
    trunc((sysdate - hire_date) / 365) AS 근속년수,
    manager_id                         AS 관리번호,
    CASE nvl(manager_id, 0)
        WHEN 100 THEN
            '사원'
        WHEN 120 THEN
            '주임'
        WHEN 121 THEN
            '대리'
        WHEN 122 THEN
            '과장'
        ELSE
            '임원'
    END                                AS 직급,
    salary                             AS 급여,
    department_id                      AS 부서명
FROM
    employees
WHERE
        ( sysdate - hire_date ) / 365 >= 10
    AND department_id = 50
    AND manager_id IS NOT NULL
ORDER BY
    근속년수 DESC;

SELECT
    concat(first_name, last_name),
    job_id,
    manager_id,
    CASE manager_id
        WHEN 100 THEN
            '사원'
        WHEN 120 THEN
            '주임'
        WHEN 121 THEN
            '대리'
        WHEN 122 THEN
            '과장'
        ELSE
            '임원'
    END AS 직급,
    salary
FROM
    employees
WHERE
    manager_id >= 50
ORDER BY
    salary DESC;